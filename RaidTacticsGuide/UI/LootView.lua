--[[
    Raid Tactics Guide - Loot tab
    -----------------------------
    A simple AtlasLoot-style grid. Size (10/25), difficulty (Normal/Heroic)
    and, for faction-specific raids, Alliance/Horde can be switched without
    leaving the boss. Items not yet in the client's item cache are requested
    from the server a few at a time and the grid refreshes as they arrive.

    Hover: item tooltip.  Click: pinned item tooltip.
    Shift-click: link in chat.  Ctrl-click: preview in the dressing room.
]]

local RTG = RaidTacticsGuide
local UI = RTG.UI

local LV = {}
RTG.LootView = LV

local ROW_H = 38

------------------------------------------------------------------------------
-- Settings helpers
------------------------------------------------------------------------------

local function lootCfg() return RTG.config.loot or {} end

function LV:Size()
    local s = RTG.db.loot.size or lootCfg().defaultSize or 25
    if s ~= 10 and s ~= 25 then s = 25 end
    return s
end

function LV:Heroic()
    local h = RTG.db.loot.heroic
    if h == nil then h = lootCfg().defaultHeroic or false end
    return h
end

function LV:Faction()
    local f = RTG.db.loot.faction
    if f ~= "Alliance" and f ~= "Horde" then
        f = UnitFactionGroup("player")
        if f ~= "Alliance" and f ~= "Horde" then f = "Alliance" end
    end
    return f
end

--- Returns the item list for a boss with the current settings, plus a label.
function LV:GetList(boss)
    local data = RTG.Loot[boss.key]
    if not data then return nil, nil end
    if data.Alliance or data.Horde then
        data = data[self:Faction()] or data.Alliance or data.Horde
    end
    local heroic = self:Heroic() and boss.raid.hasHeroic
    local key = self:Size() .. (heroic and "H" or "N")
    return data[key], key, data
end

------------------------------------------------------------------------------
-- Toolbar
------------------------------------------------------------------------------

function LV:BuildToolbar(bar)
    local sizeLabel = bar:CreateFontString(nil, "OVERLAY")
    sizeLabel:SetFontObject(UI.fonts.small)
    sizeLabel:SetPoint("LEFT", 4, 0)
    sizeLabel:SetText("Size:")

    local b10 = UI.CreateTab(bar, "10 Player", 74, 22)
    b10:SetPoint("LEFT", sizeLabel, "RIGHT", 6, 0)
    local b25 = UI.CreateTab(bar, "25 Player", 74, 22)
    b25:SetPoint("LEFT", b10, "RIGHT", 2, 0)
    b10:SetScript("OnClick", function() RTG.db.loot.size = 10; LV:Changed() end)
    b25:SetScript("OnClick", function() RTG.db.loot.size = 25; LV:Changed() end)

    local diffLabel = bar:CreateFontString(nil, "OVERLAY")
    diffLabel:SetFontObject(UI.fonts.small)
    diffLabel:SetPoint("LEFT", b25, "RIGHT", 14, 0)
    diffLabel:SetText("Difficulty:")

    local bN = UI.CreateTab(bar, "Normal", 66, 22)
    bN:SetPoint("LEFT", diffLabel, "RIGHT", 6, 0)
    local bH = UI.CreateTab(bar, "Heroic", 66, 22)
    bH:SetPoint("LEFT", bN, "RIGHT", 2, 0)
    bN:SetScript("OnClick", function() RTG.db.loot.heroic = false; LV:Changed() end)
    bH:SetScript("OnClick", function() RTG.db.loot.heroic = true; LV:Changed() end)
    bH:SetScript("OnEnter", function(self)
        if self.disabledState then
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText("This raid has no Heroic mode.", 1, 1, 1)
            GameTooltip:Show()
        end
    end)
    bH:SetScript("OnLeave", UI.HideTooltip)
    if bH.SetMotionScriptsWhileDisabled then bH:SetMotionScriptsWhileDisabled(true) end

    local fac = UI.CreateTab(bar, "Alliance", 70, 22)
    fac:SetPoint("RIGHT", bar, "RIGHT", -2, 0)
    fac:SetScript("OnClick", function()
        RTG.db.loot.faction = (LV:Faction() == "Alliance") and "Horde" or "Alliance"
        LV:Changed()
    end)
    fac:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("Loot differs by faction in this raid. Click to switch.", 1, 1, 1, 1, true)
        GameTooltip:Show()
    end)
    fac:SetScript("OnLeave", UI.HideTooltip)

    self.b10, self.b25, self.bN, self.bH, self.fac = b10, b25, bN, bH, fac
end

function LV:UpdateToolbar(boss)
    if not self.b10 then return end
    local size, heroic = self:Size(), self:Heroic()
    local raid = boss.raid
    self.b10:SetSelected(size == 10)
    self.b25:SetSelected(size == 25)
    if raid.hasHeroic then
        self.bH:SetEnabledState(true)
        self.bH:SetSelected(heroic)
        self.bN:SetSelected(not heroic)
    else
        self.bH:SetEnabledState(false)
        self.bH:SetSelected(false)
        self.bN:SetSelected(true)
    end
    local data = RTG.Loot[boss.key]
    if data and (data.Alliance or data.Horde) then
        self.fac.text:SetText(self:Faction())
        self.fac:Show()
    else
        self.fac:Hide()
    end
end

function LV:Changed()
    if PlaySound then PlaySound("igMainMenuOptionCheckBoxOn") end
    local boss = RTG.RaidView:Boss()
    if boss then
        self:UpdateToolbar(boss)
        RTG.RaidView:RefreshContent()
    end
end

------------------------------------------------------------------------------
-- Item cache queries (3.3.5a has no GET_ITEM_INFO_RECEIVED event)
------------------------------------------------------------------------------

local queue, queued = {}, {}
local scanTip
local elapsedQ, elapsedR, refreshUntil = 0, 0, 0

local function ensureScanTip()
    if not scanTip then
        scanTip = CreateFrame("GameTooltip", "RaidTacticsGuideScanTooltip", UIParent, "GameTooltipTemplate")
        scanTip:SetOwner(WorldFrame, "ANCHOR_NONE")
    end
    return scanTip
end

local ticker = CreateFrame("Frame")
ticker:Hide()
ticker:SetScript("OnUpdate", function(self, elapsed)
    elapsedQ = elapsedQ + elapsed
    elapsedR = elapsedR + elapsed
    if elapsedQ >= 0.2 and #queue > 0 then
        elapsedQ = 0
        local tip = ensureScanTip()
        for _ = 1, (lootCfg().queryPerTick or 4) do
            local id = table.remove(queue, 1)
            if not id then break end
            if not GetItemInfo(id) then
                tip:SetOwner(WorldFrame, "ANCHOR_NONE")
                tip:SetHyperlink("item:" .. id .. ":0:0:0:0:0:0:0")
                tip:Hide()
            end
        end
    end
    if elapsedR >= 1.0 then
        elapsedR = 0
        if LV.pending and LV.pending > 0 and RTG.frame and RTG.frame:IsShown()
            and RTG.mode == "raids" and RTG.RaidView:Tab() == "loot" then
            RTG.RaidView:RefreshContent(true)
        end
        if GetTime() > refreshUntil and #queue == 0 then
            self:Hide()
        end
    end
end)

local function requestItem(id)
    if lootCfg().queryUncached == false or queued[id] then return end
    queued[id] = true
    table.insert(queue, id)
    refreshUntil = GetTime() + 12
    ticker:Show()
end

------------------------------------------------------------------------------
-- Item buttons
------------------------------------------------------------------------------

local function itemLink(id)
    local _, link = GetItemInfo(id)
    return link
end

local function item_OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetHyperlink("item:" .. self.itemId .. ":0:0:0:0:0:0:0")
    if self.dropText then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Raid Tactics Guide: " .. self.dropText, 0.6, 0.6, 0.6)
    end
    GameTooltip:AddLine("Shift-click: link in chat   Ctrl-click: preview", 0.5, 0.5, 0.5)
    GameTooltip:Show()
end

local function item_OnClick(self)
    local link = itemLink(self.itemId)
    if link and HandleModifiedItemClick and IsModifiedClick
        and (IsModifiedClick("CHATLINK") or IsModifiedClick("DRESSUP")) then
        HandleModifiedItemClick(link)
        return
    end
    if IsShiftKeyDown() then
        if link and ChatEdit_InsertLink then
            ChatEdit_InsertLink(link)
        elseif not link then
            RTG:Print("That item is still loading - try again in a second.")
        end
        return
    end
    if IsControlKeyDown() then
        if link and DressUpItemLink then DressUpItemLink(link) end
        return
    end
    -- pinned tooltip
    if ItemRefTooltip then
        ShowUIPanel(ItemRefTooltip)
        if not ItemRefTooltip:IsShown() then
            ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
        end
        ItemRefTooltip:SetHyperlink("item:" .. self.itemId .. ":0:0:0:0:0:0:0")
    end
end

local function createItemButton(parent)
    local b = CreateFrame("Button", nil, parent)
    b:SetHeight(ROW_H - 2)
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    local hl = b:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetTexture(1, 0.85, 0.4, 0.12)

    local border = b:CreateTexture(nil, "BACKGROUND")
    border:SetWidth(34)
    border:SetHeight(34)
    border:SetPoint("LEFT", 1, 0)
    b.border = border

    local icon = b:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", border, "TOPLEFT", 2, -2)
    icon:SetPoint("BOTTOMRIGHT", border, "BOTTOMRIGHT", -2, 2)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    b.icon = icon

    local name = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    name:SetPoint("TOPLEFT", border, "TOPRIGHT", 6, -2)
    name:SetPoint("RIGHT", b, "RIGHT", -2, 0)
    name:SetJustifyH("LEFT")
    name:SetHeight(14)
    b.name = name

    local info = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    info:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -2)
    info:SetPoint("RIGHT", b, "RIGHT", -2, 0)
    info:SetJustifyH("LEFT")
    info:SetHeight(12)
    info:SetTextColor(0.75, 0.72, 0.62)
    b.info = info

    b:SetScript("OnEnter", item_OnEnter)
    b:SetScript("OnLeave", UI.HideTooltip)
    b:SetScript("OnClick", item_OnClick)
    return b
end

local function hexToRGB(hex)
    local r = tonumber(hex:sub(3, 4), 16) / 255
    local g = tonumber(hex:sub(5, 6), 16) / 255
    local b = tonumber(hex:sub(7, 8), 16) / 255
    return r, g, b
end

------------------------------------------------------------------------------
-- Render
------------------------------------------------------------------------------

local SIZE_TEXT = { ["10N"] = "10 Player", ["10H"] = "10 Player Heroic", ["25N"] = "25 Player", ["25H"] = "25 Player Heroic" }

function LV:Render(c, boss)
    self.pending = 0
    local list, key, data = self:GetList(boss)
    if not data then
        c:Empty(boss.lootNote or ("No loot is listed for " .. boss.name .. "."))
        return
    end
    if not list or #list == 0 then
        local available = {}
        for _, k in ipairs({ "10N", "10H", "25N", "25H" }) do
            if data[k] then table.insert(available, SIZE_TEXT[k]) end
        end
        c:Empty("No loot data for " .. (SIZE_TEXT[key] or key) .. ".\n\nAvailable: " ..
            (#available > 0 and table.concat(available, ", ") or "none"))
        return
    end

    local count = 0
    for _, e in ipairs(list) do if e[1] then count = count + 1 end end
    local title = boss.name .. "  -  " .. (SIZE_TEXT[key] or key)
    if data ~= RTG.Loot[boss.key] then title = title .. "  (" .. self:Faction() .. ")" end
    local _, h = c:Text(title .. "   |cff999999" .. count .. " items|r", UI.fonts.small, 0, nil, UI.colors.bronze)
    c.y = c.y + h + 6

    local colW = math.floor((c.width - 8) / 2)
    local col = 0
    for _, e in ipairs(list) do
        if e.header then
            if col == 1 then c.y = c.y + ROW_H; col = 0 end
            c:Gap(4)
            local _, hh = c:Text(e.header, UI.fonts.sub, 2, nil, UI.colors.gold)
            c.y = c.y + hh + 2
            local line = c:Texture("ARTWORK")
            line:SetTexture(1, 0.82, 0, 0.25)
            line:SetHeight(1)
            line:SetWidth(c.width)
            line:SetPoint("TOPLEFT", c.child, "TOPLEFT", 0, -c.y)
            c.y = c.y + 4
        elseif e[1] then
            local id = e[1]
            local b = c:_acquire("lootbtn", createItemButton)
            b:SetWidth(colW)
            b:SetPoint("TOPLEFT", c.child, "TOPLEFT", col * (colW + 8), -c.y)
            b.itemId = id
            b.dropText = e[5] and ("listed drop chance " .. e[5]) or nil

            local name, _, quality, iLevel, _, _, subType, _, equipLoc, texture = GetItemInfo(id)
            if not name then
                self.pending = self.pending + 1
                requestItem(id)
                quality = e[3]
                name = e[2] or ("item " .. id)
            end
            local hex = RTG:QualityHex(quality)
            b.name:SetText("|c" .. hex .. (name or "?") .. "|r")
            local r, g, bl = hexToRGB(hex)
            b.border:SetTexture(r, g, bl, 0.9)
            texture = texture or (GetItemIcon and GetItemIcon(id)) or RTG.QUESTION_ICON
            b.icon:SetTexture(texture)

            local parts = {}
            if iLevel and iLevel > 1 then table.insert(parts, "iLvl " .. iLevel) end
            if e[4] and e[4] ~= "" then table.insert(parts, e[4]) end
            if not GetItemInfo(id) then table.insert(parts, "|cff808080(loading)|r") end
            b.info:SetText(table.concat(parts, "  -  "))

            col = col + 1
            if col >= 2 then
                col = 0
                c.y = c.y + ROW_H
            end
        end
    end
    if col == 1 then c.y = c.y + ROW_H end
    c:Gap(8)
    local _, fh = c:Text("Hover for details. Click to pin the tooltip, Shift-click to link, Ctrl-click to preview.",
        UI.fonts.tiny, 0, nil, UI.colors.muted)
    c.y = c.y + fh
end
