--[[
    Raid Tactics Guide - Tactics tab and Abilities tab renderers
]]

local RTG = RaidTacticsGuide
local UI = RTG.UI

------------------------------------------------------------------------------
-- Tactics tab
------------------------------------------------------------------------------

local T = {}
RTG.TacticsView = T

local CHAT_MODE_TEXT = {
    summary  = "Summary",
    full     = "Full strategy",
    tank     = "Tanks only",
    healer   = "Healers only",
    dps      = "DPS only",
    warnings = "Warnings only",
}
T.CHAT_MODE_TEXT = CHAT_MODE_TEXT

function T:CurrentChatMode()
    local cfg = RTG.config.chat or {}
    local modes = cfg.modes or { "summary" }
    local mode = RTG.db.chatMode or cfg.defaultMode or modes[1]
    for _, m in ipairs(modes) do
        if m == mode then return mode end
    end
    return modes[1] or "summary"
end

function T:BuildToolbar(bar)
    local label = bar:CreateFontString(nil, "OVERLAY")
    label:SetFontObject(UI.fonts.small)
    label:SetPoint("LEFT", 4, 0)
    label:SetText("Share with your raid:")

    local dd = CreateFrame("Frame", "RaidTacticsGuideChatModeDropDown", bar, "UIDropDownMenuTemplate")
    dd:SetPoint("LEFT", label, "RIGHT", -8, -2)
    UIDropDownMenu_SetWidth(dd, 110)
    UIDropDownMenu_Initialize(dd, function(self, level)
        local cfg = RTG.config.chat or {}
        for _, mode in ipairs(cfg.modes or { "summary" }) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = CHAT_MODE_TEXT[mode] or mode
            info.value = mode
            info.checked = (T:CurrentChatMode() == mode)
            info.func = function(button)
                RTG.db.chatMode = button.value
                UIDropDownMenu_SetSelectedValue(dd, button.value)
                UIDropDownMenu_SetText(dd, CHAT_MODE_TEXT[button.value] or button.value)
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)
    self.dropDown = dd

    local send = UI.CreateButton(bar, "Send to Raid Chat", 130, 22)
    send:SetPoint("RIGHT", bar, "RIGHT", -2, 0)
    send:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    send:SetScript("OnClick", function(self, button)
        local boss = RTG.RaidView:Boss()
        if not boss then return end
        if button == "RightButton" then
            RTG:PreviewTactics(boss.key, T:CurrentChatMode())
        else
            RTG:SendTactics(boss.key, T:CurrentChatMode())
        end
    end)
    send:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("Send to Raid Chat", 1, 0.82, 0)
        GameTooltip:AddLine("Left-click: post the selected part of the tactics in /raid.", 1, 1, 1, true)
        GameTooltip:AddLine("Right-click: preview the messages in your own chat window only.", 0.6, 0.9, 0.6, true)
        GameTooltip:AddLine("Long text is split into several messages automatically.", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    send:SetScript("OnLeave", UI.HideTooltip)
    self.sendButton = send
end

function T:UpdateToolbar(boss, tactics)
    local mode = self:CurrentChatMode()
    if self.dropDown then
        UIDropDownMenu_SetSelectedValue(self.dropDown, mode)
        UIDropDownMenu_SetText(self.dropDown, CHAT_MODE_TEXT[mode] or mode)
    end
    if self.sendButton then
        if tactics then self.sendButton:Enable() else self.sendButton:Disable() end
        if RTG.ChatQueueActive and RTG:ChatQueueActive() then
            self.sendButton:SetText("Sending...")
        else
            self.sendButton:SetText("Send to Raid Chat")
        end
    end
end

local BOOK_ICON    = "Interface\\Icons\\INV_Misc_Book_09"
local PREP_ICON    = "Interface\\Icons\\INV_Misc_Note_01"
local WARN_ICON    = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew"
local HEROIC_ICON  = "Interface\\Icons\\Achievement_General"
local ALT_ICON     = "Interface\\Icons\\INV_Misc_Map_01"
local PHASE_ICON   = "Interface\\Icons\\INV_Misc_PocketWatch_01"

local function roleHeading(canvas, title, role)
    canvas:Heading(title, { icon = UI.ROLE_TEXTURE, texCoord = UI.ROLE_COORDS[role] })
end

function T:Render(c, boss, t)
    if not t then
        c:Empty("No tactics have been written for " .. boss.name .. " yet.\n\n" ..
            "Add them to a file in Data\\Tactics\\ with\nRTG:RegisterTactics(\"" .. boss.key .. "\", { ... })")
        return
    end

    -- Key mechanics strip (dangerous abilities first)
    local key = {}
    for _, a in ipairs(t.abilities or {}) do
        if a.danger == "high" then table.insert(key, a) end
    end
    if #key < 3 then
        for _, a in ipairs(t.abilities or {}) do
            if a.danger ~= "high" and #key < 6 then table.insert(key, a) end
        end
    end
    if #key > 0 then
        local list = {}
        for i = 1, math.min(#key, 8) do
            local a = key[i]
            local short = a.name or "?"
            if #short > 11 then short = short:sub(1, 10) .. "." end
            table.insert(list, {
                spellId = a.spellId, icon = a.icon, name = a.name, label = short,
                note = a.response and RTG:ToChatText(a.response) or nil,
            })
        end
        local _, h = c:Text("KEY MECHANICS  (hover for details)", UI.fonts.tiny, 0, nil, UI.colors.muted)
        c.y = c.y + h + 4
        c:IconRow(list, { size = 34, perRow = 8, arrows = false })
        c:Gap(4)
    end

    if t.overview then
        c:Heading("Encounter Overview", { icon = BOOK_ICON })
        c:Rich(t.overview)
        c:Gap(6)
    end
    if t.preparation then
        c:Heading("Preparation", { icon = PREP_ICON })
        c:Rich(t.preparation)
        c:Gap(6)
    end
    for i, phase in ipairs(t.phases or {}) do
        c:Heading(phase.title or ("Phase " .. i), { icon = PHASE_ICON })
        c:Rich(phase.text)
        c:Gap(6)
    end
    if t.tank then
        roleHeading(c, "Tank Instructions", "TANK")
        c:Rich(t.tank)
        c:Gap(6)
    end
    if t.healer then
        roleHeading(c, "Healer Instructions", "HEALER")
        c:Rich(t.healer)
        c:Gap(6)
    end
    if t.dps then
        roleHeading(c, "DPS Instructions", "DPS")
        c:Rich(t.dps)
        c:Gap(6)
    end
    if t.warnings then
        c:Heading("Important Warnings", { icon = WARN_ICON, texCoord = { 0, 1, 0, 1 }, color = UI.colors.red })
        c:Rich(t.warnings)
        c:Gap(6)
    end
    if t.heroic then
        c:Heading(t.heroicTitle or "Heroic Mode", { icon = HEROIC_ICON, color = UI.colors.orange })
        c:Rich(t.heroic)
        c:Gap(6)
    end
    if t.alternatives and #t.alternatives > 0 then
        for _, alt in ipairs(t.alternatives) do
            c:Heading("Alternative: " .. (alt.title or "Strategy"), { icon = ALT_ICON, color = UI.colors.blue })
            c:Rich(alt.text)
            c:Gap(6)
        end
    end
    -- any extra custom sections a guide writer adds: extra = { {title=, text=}, ... }
    for _, extra in ipairs(t.extra or {}) do
        c:Heading(extra.title or "Notes", { icon = PREP_ICON })
        c:Rich(extra.text)
        c:Gap(6)
    end
end

------------------------------------------------------------------------------
-- Abilities tab
------------------------------------------------------------------------------

local A = {}
RTG.AbilitiesView = A

function A:BuildToolbar(bar)
    local x = 4
    local intro = bar:CreateFontString(nil, "OVERLAY")
    intro:SetFontObject(UI.fonts.small)
    intro:SetPoint("LEFT", x, 0)
    intro:SetText("Legend:")
    local anchor = intro
    for _, key in ipairs({ "high", "medium", "low" }) do
        local d = UI.DANGER[key]
        local sq = bar:CreateTexture(nil, "ARTWORK")
        sq:SetWidth(10)
        sq:SetHeight(10)
        sq:SetPoint("LEFT", anchor, "RIGHT", 12, 0)
        sq:SetTexture(d.color[1], d.color[2], d.color[3], 1)
        local fs = bar:CreateFontString(nil, "OVERLAY")
        fs:SetFontObject(UI.fonts.small)
        fs:SetPoint("LEFT", sq, "RIGHT", 4, 0)
        fs:SetText(d.label)
        anchor = fs
    end
    local hint = bar:CreateFontString(nil, "OVERLAY")
    hint:SetFontObject(UI.fonts.tiny)
    hint:SetPoint("RIGHT", bar, "RIGHT", -4, 0)
    hint:SetText("Hover an icon for the spell tooltip")
    hint:SetTextColor(UI.colors.muted[1], UI.colors.muted[2], UI.colors.muted[3])
end

function A:Render(c, boss, t)
    if not t or not t.abilities or #t.abilities == 0 then
        c:Empty("No abilities have been listed for " .. boss.name .. " yet.")
        return
    end
    local iconSize = 40
    local textX = iconSize + 18
    local textW = c.width - textX
    for _, a in ipairs(t.abilities) do
        local danger = UI.DANGER[a.danger or "low"] or UI.DANGER.low
        local top = c.y

        -- card background
        local bg = c:Texture("BACKGROUND")
        bg:SetTexture(danger.color[1], danger.color[2], danger.color[3], a.danger == "high" and 0.10 or 0.05)
        bg:SetPoint("TOPLEFT", c.child, "TOPLEFT", 0, -(top - 4))
        bg:SetWidth(c.width)

        local stripe = c:Texture("BORDER")
        stripe:SetTexture(danger.color[1], danger.color[2], danger.color[3], 0.9)
        stripe:SetWidth(3)
        stripe:SetPoint("TOPLEFT", c.child, "TOPLEFT", 0, -(top - 4))

        local btn = c:IconButton(iconSize, {
            spellId = a.spellId, icon = a.icon, name = a.name,
            note = a.response and RTG:ToChatText(a.response),
        })
        btn:SetPoint("TOPLEFT", c.child, "TOPLEFT", 8, -top)
        btn.border:SetTexture(danger.color[1], danger.color[2], danger.color[3], 1)

        local title = a.name or "?"
        local tags = {}
        if a.danger == "high" then table.insert(tags, "|cffff4030DANGEROUS|r") end
        if a.heroicOnly then table.insert(tags, "|cffff9a20Heroic only|r") end
        if #tags > 0 then title = title .. "   " .. table.concat(tags, "  ") end
        local _, h = c:Text(title, UI.fonts.heading, textX, textW, danger.color)
        c.y = c.y + h + 2

        local meta = {}
        if a.target and a.target ~= "" then table.insert(meta, "|cffb0a080Affects:|r " .. a.target) end
        if a.timing and a.timing ~= "" then table.insert(meta, "|cffb0a080Timing:|r " .. a.timing) end
        if #meta > 0 then
            local _, mh = c:Text(table.concat(meta, "     "), UI.fonts.small, textX, textW)
            c.y = c.y + mh + 3
        end
        if a.description then
            c:Rich(a.description, { indent = textX })
        end
        if a.response then
            local _, rh = c:Text("How to respond:", UI.fonts.small, textX, textW, UI.colors.green)
            c.y = c.y + rh + 1
            c:Rich(a.response, { indent = textX + 6, color = { 0.75, 0.95, 0.70 } })
        end
        if c.y < top + iconSize + 4 then c.y = top + iconSize + 4 end
        bg:SetHeight(c.y - top + 8)
        stripe:SetHeight(c.y - top + 8)
        c.y = c.y + 12
    end
end
