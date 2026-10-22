--[[
    Raid Tactics Guide - Raid view
    ------------------------------
    Left: raids grouped by tier (collapsible).  Centre: bosses of the
    selected raid.  Right: raid overview, or the boss page with the
    Tactics / Abilities / Loot tabs.  The tab contents are drawn by
    UI\TacticsView.lua, UI\AbilitiesView.lua and UI\LootView.lua.
]]

local RTG = RaidTacticsGuide
local UI = RTG.UI

local V = {}
RTG.views.raids = V
RTG.RaidView = V

local TABS = {
    { key = "tactics",   text = "Tactics" },
    { key = "abilities", text = "Abilities" },
    { key = "loot",      text = "Loot" },
}

local BOSS_HEADER_H = 84

------------------------------------------------------------------------------
-- State helpers
------------------------------------------------------------------------------

function V:Raid()
    local key = RTG.db.raid
    if not key or not RTG.RaidsByKey[key] then
        key = RTG.config.defaultRaid
        if not RTG.RaidsByKey[key] then key = RTG.Raids[1] and RTG.Raids[1].key end
        RTG.db.raid = key
    end
    return key and RTG.RaidsByKey[key]
end

function V:Boss()
    local boss = RTG.db.boss and RTG.BossesByKey[RTG.db.boss]
    local raid = self:Raid()
    if boss and raid and boss.raid ~= raid then
        RTG.db.boss = nil
        return nil
    end
    return boss
end

function V:Tab()
    local t = RTG.db.tab or RTG.config.defaultTab or "tactics"
    if t ~= "tactics" and t ~= "abilities" and t ~= "loot" then t = "tactics" end
    return t
end

------------------------------------------------------------------------------
-- Build
------------------------------------------------------------------------------

function V:Build(f, L)
    self.f = f
    self.L = L

    -- LEFT: raid list -------------------------------------------------------
    local leftScroll = UI.CreateScrollArea(f.left, L.leftW - 30)
    leftScroll:SetPoint("TOPLEFT", 4, -f.listTop)
    leftScroll:SetPoint("BOTTOMRIGHT", -26, 6)
    self.leftScroll = leftScroll
    self.raidRows = {}
    self.tierRows = {}

    -- CENTRE: boss list -----------------------------------------------------
    local centerScroll = UI.CreateScrollArea(f.center, L.centerW - 30)
    centerScroll:SetPoint("TOPLEFT", 4, -f.centerTop)
    centerScroll:SetPoint("BOTTOMRIGHT", -26, 6)
    self.centerScroll = centerScroll
    self.bossRows = {}

    -- CONTENT: raid overview ------------------------------------------------
    local overview = CreateFrame("Frame", nil, f.content)
    overview:SetAllPoints()
    local ovScroll = UI.CreateScrollArea(overview, L.contentW - 46)
    ovScroll:SetPoint("TOPLEFT", 12, -12)
    ovScroll:SetPoint("BOTTOMRIGHT", -30, 8)
    self.overview = overview
    self.overviewCanvas = UI.NewCanvas(ovScroll)

    -- CONTENT: boss page ----------------------------------------------------
    local page = CreateFrame("Frame", nil, f.content)
    page:SetAllPoints()
    self.page = page
    self:BuildBossHeader(page, L)

    -- tabs
    self.tabButtons = {}
    local prev
    for _, t in ipairs(TABS) do
        local b = UI.CreateTab(page, t.text, 96, 24)
        if prev then
            b:SetPoint("LEFT", prev, "RIGHT", 4, 0)
        else
            b:SetPoint("TOPLEFT", 12, -BOSS_HEADER_H)
        end
        b:SetScript("OnClick", function()
            RTG.db.tab = t.key
            if PlaySound then PlaySound("igCharacterInfoTab") end
            V:RefreshContent()
        end)
        self.tabButtons[t.key] = b
        prev = b
    end

    local line = UI.Divider(page)
    line:SetPoint("TOPLEFT", 10, -BOSS_HEADER_H - 27)
    line:SetPoint("TOPRIGHT", -10, -BOSS_HEADER_H - 27)

    -- per-tab toolbars (fixed, not scrolled)
    local toolbarY = -BOSS_HEADER_H - 31
    self.toolbars = {}
    for _, t in ipairs(TABS) do
        local bar = CreateFrame("Frame", nil, page)
        bar:SetPoint("TOPLEFT", 10, toolbarY)
        bar:SetPoint("TOPRIGHT", -10, toolbarY)
        bar:SetHeight(26)
        bar:Hide()
        self.toolbars[t.key] = bar
    end
    if RTG.TacticsView then RTG.TacticsView:BuildToolbar(self.toolbars.tactics) end
    if RTG.AbilitiesView then RTG.AbilitiesView:BuildToolbar(self.toolbars.abilities) end
    if RTG.LootView then RTG.LootView:BuildToolbar(self.toolbars.loot) end

    local pageScroll = UI.CreateScrollArea(page, L.contentW - 46)
    pageScroll:SetPoint("TOPLEFT", 12, toolbarY - 30)
    pageScroll:SetPoint("BOTTOMRIGHT", -30, 8)
    self.pageScroll = pageScroll
    self.pageCanvas = UI.NewCanvas(pageScroll)

    self:BuildRaidList()
    self:HideView()
end

function V:BuildBossHeader(page, L)
    local holder = CreateFrame("Frame", nil, page)
    holder:SetPoint("TOPLEFT", 10, -8)
    holder:SetWidth(68)
    holder:SetHeight(68)
    holder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    holder:SetBackdropColor(0, 0, 0, 0.9)
    holder:SetBackdropBorderColor(1, 0.82, 0, 0.9)

    local icon = holder:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", 4, -4)
    icon:SetPoint("BOTTOMRIGHT", -4, 4)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    self.portraitIcon = icon

    if RTG.config.showBossModels ~= false then
        local ok, model = pcall(CreateFrame, "PlayerModel", nil, holder)
        if ok and model then
            model:SetPoint("TOPLEFT", 4, -4)
            model:SetPoint("BOTTOMRIGHT", -4, 4)
            self.portraitModel = model
        end
    end

    local name = page:CreateFontString(nil, "OVERLAY")
    name:SetFontObject(UI.fonts.bossName)
    name:SetPoint("TOPLEFT", holder, "TOPRIGHT", 12, -2)
    name:SetPoint("RIGHT", page, "RIGHT", -12, 0)
    name:SetJustifyH("LEFT")
    self.bossName = name

    local sub = page:CreateFontString(nil, "OVERLAY")
    sub:SetFontObject(UI.fonts.small)
    sub:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -3)
    sub:SetPoint("RIGHT", page, "RIGHT", -12, 0)
    sub:SetJustifyH("LEFT")
    self.bossSub = sub

    local summary = page:CreateFontString(nil, "OVERLAY")
    summary:SetFontObject(UI.fonts.small)
    summary:SetTextColor(UI.colors.parchment[1], UI.colors.parchment[2], UI.colors.parchment[3])
    summary:SetPoint("TOPLEFT", sub, "BOTTOMLEFT", 0, -4)
    summary:SetPoint("RIGHT", page, "RIGHT", -12, 0)
    summary:SetHeight(26)
    summary:SetJustifyH("LEFT")
    summary:SetJustifyV("TOP")
    self.bossSummary = summary
end

------------------------------------------------------------------------------
-- Raid list (left)
------------------------------------------------------------------------------

local function tierOrder()
    local tiers, seen = {}, {}
    for _, raid in ipairs(RTG.Raids) do
        local t = raid.tier or "Other"
        if not seen[t] then
            seen[t] = true
            table.insert(tiers, t)
        end
    end
    return tiers
end

function V:BuildRaidList()
    local child = self.leftScroll.child
    local width = self.leftScroll.contentWidth
    for _, tier in ipairs(tierOrder()) do
        local hb = CreateFrame("Button", nil, child)
        hb:SetWidth(width)
        hb:SetHeight(18)
        local fs = hb:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs:SetPoint("LEFT", 4, 0)
        fs:SetJustifyH("LEFT")
        hb.text = fs
        local hl = hb:CreateTexture(nil, "HIGHLIGHT")
        hl:SetAllPoints()
        hl:SetTexture(1, 0.85, 0.4, 0.1)
        hb.tier = tier
        hb:SetScript("OnClick", function(self)
            RTG.db.collapsed[self.tier] = not RTG.db.collapsed[self.tier]
            V:LayoutRaidList()
        end)
        table.insert(self.tierRows, hb)
    end
    for _, raid in ipairs(RTG.Raids) do
        local row = UI.CreateListButton(child, width, 32)
        row.raid = raid
        row:SetIconTexture(RTG:DefIcon(raid))
        row:SetData(raid.name)
        row:SetScript("OnClick", function(self)
            V:SelectRaid(self.raid.key)
        end)
        row:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(self.raid.name, 1, 0.82, 0)
            GameTooltip:AddLine(self.raid.tier or "", 0.7, 0.7, 0.7)
            GameTooltip:AddLine(#self.raid.bosses .. " encounters", 1, 1, 1)
            if self.raid.description then
                GameTooltip:AddLine(self.raid.description, 0.9, 0.85, 0.7, true)
            end
            GameTooltip:Show()
        end)
        row:SetScript("OnLeave", UI.HideTooltip)
        self.raidRows[raid.key] = row
    end
    self:LayoutRaidList()
end

function V:LayoutRaidList()
    local child = self.leftScroll.child
    local y = 0
    local selected = self:Raid()
    for _, hb in ipairs(self.tierRows) do
        local collapsed = RTG.db.collapsed[hb.tier]
        hb.text:SetText((collapsed and "[+] " or "[-] ") .. hb.tier)
        hb:ClearAllPoints()
        hb:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -y)
        y = y + 20
        for _, raid in ipairs(RTG.Raids) do
            if (raid.tier or "Other") == hb.tier then
                local row = self.raidRows[raid.key]
                row:ClearAllPoints()
                -- the selected raid stays visible even inside a collapsed tier
                if collapsed and raid ~= selected then
                    row:Hide()
                else
                    row:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -y)
                    row:Show()
                    y = y + 33
                end
                row:SetSelected(raid == selected)
            end
        end
        y = y + 4
    end
    child:SetHeight(math.max(y, 1))
    self.leftScroll:UpdateScrollChildRect()
end

------------------------------------------------------------------------------
-- Boss list (centre)
------------------------------------------------------------------------------

function V:LayoutBossList()
    local raid = self:Raid()
    local child = self.centerScroll.child
    local width = self.centerScroll.contentWidth
    for _, row in ipairs(self.bossRows) do row:Hide() end
    if not raid then return end
    self.f.centerCaption:SetText(string.upper(raid.short or raid.name) .. " - BOSSES")
    local current = self:Boss()
    local y = 0
    local lastArea
    local areaHeaders = self.areaHeaders or {}
    self.areaHeaders = areaHeaders
    for _, h in ipairs(areaHeaders) do h:Hide() end
    local areaIndex = 0
    for i, boss in ipairs(raid.bosses) do
        if boss.area and boss.area ~= lastArea and boss.area ~= raid.name then
            areaIndex = areaIndex + 1
            local h = areaHeaders[areaIndex]
            if not h then
                h = child:CreateFontString(nil, "OVERLAY")
                h:SetFontObject(UI.fonts.tiny)
                h:SetTextColor(UI.colors.muted[1], UI.colors.muted[2], UI.colors.muted[3])
                h:SetJustifyH("LEFT")
                areaHeaders[areaIndex] = h
            end
            h:ClearAllPoints()
            h:SetPoint("TOPLEFT", child, "TOPLEFT", 4, -(y + 3))
            h:SetText(string.upper(boss.area))
            h:Show()
            y = y + 16
        end
        lastArea = boss.area
        local row = self.bossRows[i]
        if not row then
            row = UI.CreateListButton(child, width, 32)
            row:SetScript("OnClick", function(self) V:SelectBoss(self.boss.key) end)
            self.bossRows[i] = row
        end
        row.boss = boss
        row:SetIconTexture(RTG:DefIcon(boss))
        local hasGuide = RTG.Tactics[boss.key] ~= nil
        row:SetData(boss.name)
        if hasGuide then
            row.title:SetTextColor(0.95, 0.90, 0.80)
        else
            row.title:SetTextColor(0.6, 0.6, 0.6)
        end
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -y)
        row:SetSelected(current == boss)
        row:Show()
        y = y + 33
    end
    child:SetHeight(math.max(y, 1))
    self.centerScroll:UpdateScrollChildRect()
end

------------------------------------------------------------------------------
-- Selection
------------------------------------------------------------------------------

function V:SelectRaid(key)
    if RTG.db.raid ~= key then
        RTG.db.raid = key
        RTG.db.boss = nil
        if PlaySound then PlaySound("igMainMenuOptionCheckBoxOn") end
    end
    self:Refresh()
    RTG:UpdateHeader()
end

function V:SelectBoss(key)
    local boss = RTG.BossesByKey[key]
    if not boss then return end
    RTG.db.raid = boss.raid.key
    RTG.db.boss = key
    if PlaySound then PlaySound("igAbiliityPageTurn") end
    self:Refresh()
    RTG:UpdateHeader()
end

------------------------------------------------------------------------------
-- Content
------------------------------------------------------------------------------

function V:ShowView()
    self.f.leftCaption:SetText("RAIDS")
    self.leftScroll:Show()
    self.centerScroll:Show()
    self:Refresh()
end

function V:HideView()
    self.leftScroll:Hide()
    self.centerScroll:Hide()
    self.overview:Hide()
    self.page:Hide()
end

function V:Refresh()
    if not self.f then return end
    self:LayoutRaidList()
    self:LayoutBossList()
    if self:Boss() then
        self.overview:Hide()
        self.page:Show()
        self:RefreshBossHeader()
        self:RefreshContent()
    else
        self.page:Hide()
        self.overview:Show()
        self:RenderOverview()
    end
end

function V:RefreshBossHeader()
    local boss = self:Boss()
    if not boss then return end
    local raid = boss.raid
    local tactics = RTG.Tactics[boss.key]
    self.bossName:SetText(boss.name)
    local sub = raid.name
    if boss.area and boss.area ~= raid.name then sub = sub .. "  -  " .. boss.area end
    sub = sub .. "  -  Encounter " .. boss.index .. " of " .. #raid.bosses
    self.bossSub:SetText(sub)
    self.bossSummary:SetText(tactics and tactics.summary and RTG:ExpandTokens(tactics.summary) or "")

    RTG:SetTextureSafe(self.portraitIcon, RTG:DefIcon(boss))
    local model = self.portraitModel
    if model then
        model:Hide()
        if boss.npc and model.SetCreature then
            local ok = pcall(model.SetCreature, model, boss.npc)
            if ok then
                if model.SetCamera then pcall(model.SetCamera, model, 0) end
                model:Show()
            end
        end
    end
end

function V:RefreshContent(keepScroll)
    local boss = self:Boss()
    if not boss then return end
    local tab = self:Tab()
    for key, b in pairs(self.tabButtons) do
        b:SetSelected(key == tab)
    end
    for key, bar in pairs(self.toolbars) do
        if key == tab then bar:Show() else bar:Hide() end
    end
    local canvas = self.pageCanvas
    canvas:Clear()
    local tactics = RTG.Tactics[boss.key]
    local ok, err
    if tab == "tactics" then
        RTG.TacticsView:UpdateToolbar(boss, tactics)
        ok, err = pcall(RTG.TacticsView.Render, RTG.TacticsView, canvas, boss, tactics)
    elseif tab == "abilities" then
        ok, err = pcall(RTG.AbilitiesView.Render, RTG.AbilitiesView, canvas, boss, tactics)
    else
        RTG.LootView:UpdateToolbar(boss)
        ok, err = pcall(RTG.LootView.Render, RTG.LootView, canvas, boss)
    end
    if not ok then
        canvas:Clear()
        canvas:Empty("This page could not be displayed because its data contains an error.\n\n|cffff5050" .. tostring(err) .. "|r")
        RTG:Print("Error showing " .. boss.key .. " (" .. tab .. "): " .. tostring(err))
    end
    canvas:Finish(keepScroll)
end

--- Raid overview page (no boss selected).
function V:RenderOverview()
    local raid = self:Raid()
    local c = self.overviewCanvas
    c:Clear()
    if not raid then
        c:Empty("No raids are installed. Add one in Data\\Raids.lua.")
        c:Finish()
        return
    end
    c:Heading(raid.name, { icon = { RTG:DefIcon(raid) }, font = UI.fonts.title })
    local _, h = c:Text(raid.tier or "", UI.fonts.small, 0, nil, UI.colors.muted)
    c.y = c.y + h + 6
    c:Rich(raid.description or "")
    local sizes = {}
    for _, s in ipairs(raid.sizes or {}) do table.insert(sizes, s .. "-player") end
    local info = table.concat(sizes, " / ")
    if raid.hasHeroic then info = info .. "  -  Normal and Heroic" end
    if raid.heroicLabel then info = info .. "  -  " .. raid.heroicLabel .. " available" end
    local _, h2 = c:Text(info, UI.fonts.small, 0, nil, UI.colors.bronze)
    c.y = c.y + h2 + 10

    c:Heading("Encounters")
    for _, boss in ipairs(raid.bosses) do
        local row = c:_acquire("bossrow", function(parent)
            local r = UI.CreateListButton(parent, c.width, 34)
            r:SetScript("OnClick", function(self) V:SelectBoss(self.boss.key) end)
            return r
        end)
        row.boss = boss
        row:SetPoint("TOPLEFT", c.child, "TOPLEFT", 0, -c.y)
        row:SetIconTexture(RTG:DefIcon(boss))
        local t = RTG.Tactics[boss.key]
        local subText = (boss.area and boss.area ~= raid.name and (boss.area .. "  -  ") or "")
        subText = subText .. (t and (t.summary or "Guide available") or "|cff999999No guide written yet|r")
        if #subText > 95 then subText = subText:sub(1, 92) .. "..." end
        row:SetData(boss.index .. ". " .. boss.name, subText)
        row:SetSelected(false)
        c.y = c.y + 36
    end
    c:Gap(8)
    local _, h3 = c:Text("Select a boss to read its tactics, abilities and loot.", UI.fonts.small, 0, nil, UI.colors.muted)
    c.y = c.y + h3
    c:Finish()
end

------------------------------------------------------------------------------
-- Header integration
------------------------------------------------------------------------------

function V:Breadcrumb()
    local raid = self:Raid()
    local boss = self:Boss()
    if boss then
        return "|cffd4a017" .. raid.name .. "|r  >  " .. boss.name
    elseif raid then
        return "|cffd4a017" .. raid.name .. "|r"
    end
    return ""
end

function V:CanGoBack()
    return self:Boss() ~= nil
end

function V:Back()
    if self:Boss() then
        RTG.db.boss = nil
        self:Refresh()
    end
end

function V:StepInfo()
    local raid = self:Raid()
    if not raid then return false, false end
    local boss = self:Boss()
    local idx = boss and boss.index or 0
    local prevB = raid.bosses[idx - 1]
    local nextB = raid.bosses[idx + 1]
    return prevB ~= nil, nextB ~= nil,
        prevB and ("Previous: " .. prevB.name), nextB and ("Next: " .. nextB.name)
end

function V:Step(delta)
    local raid = self:Raid()
    if not raid then return end
    local boss = self:Boss()
    local idx = (boss and boss.index or 0) + delta
    local target = raid.bosses[idx]
    if target then self:SelectBoss(target.key) end
end
