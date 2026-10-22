--[[
    Raid Tactics Guide - Class Guide view
    -------------------------------------
    Left: the ten classes.  Centre: specializations of the selected class.
    Right: class picker -> spec picker -> icon-based rotation guide.

    All content comes from Data\Classes.lua and Data\Rotations\*.lua.
    Text sections can be edited in-game (Edit Mode); edits are stored in
    SavedVariables and can be exported back into a data file (/rtg export).
]]

local RTG = RaidTacticsGuide
local UI = RTG.UI

local V = {}
RTG.views.classes = V
RTG.ClassView = V

local HEADER_H = 74

------------------------------------------------------------------------------
-- Override storage (in-game edits)
------------------------------------------------------------------------------

local function overrideTable(classKey, specKey, create)
    local o = RTG.db.overrides
    if not o[classKey] then
        if not create then return nil end
        o[classKey] = {}
    end
    if not o[classKey][specKey] then
        if not create then return nil end
        o[classKey][specKey] = {}
    end
    return o[classKey][specKey]
end

function RTG:GetSpecText(classKey, specKey, key, default)
    local o = overrideTable(classKey, specKey, false)
    if o and o[key] ~= nil then return o[key], true end
    return default, false
end

function RTG:SetSpecText(classKey, specKey, key, text)
    local o = overrideTable(classKey, specKey, true)
    o[key] = text
end

function RTG:ResetSpecText(classKey, specKey, key)
    local o = overrideTable(classKey, specKey, false)
    if o then o[key] = nil end
end

function RTG:GetCustomNotes(classKey, specKey, create)
    local c = RTG.db.customNotes
    if not c[classKey] then
        if not create then return nil end
        c[classKey] = {}
    end
    if not c[classKey][specKey] then
        if not create then return nil end
        c[classKey][specKey] = {}
    end
    return c[classKey][specKey]
end

--- Apply text edits from a data file (this is what /rtg export produces).
-- edits = { PALADIN = { Holy = { notes = "text", important = "text",
--           _custom = { { title = "My note", text = "..." } } } } }
function RTG:ApplyTextOverrides(edits)
    for classKey, specs in pairs(edits or {}) do
        for specKey, keys in pairs(specs) do
            local data = self:GetSpec(classKey, specKey)
            if data then
                for key, text in pairs(keys) do
                    if key == "_custom" then
                        data.notes = data.notes or {}
                        for i, n in ipairs(text) do
                            table.insert(data.notes, { key = "custom" .. i, title = n.title, text = n.text })
                        end
                    else
                        local found = false
                        for ci, cat in ipairs(data.categories or {}) do
                            for si, sec in ipairs(cat.sections or {}) do
                                if (sec.key or ("c" .. ci .. "s" .. si)) == key then
                                    sec.text = text
                                    found = true
                                end
                            end
                        end
                        for _, note in ipairs(data.notes or {}) do
                            if note.key == key then
                                note.text = text
                                found = true
                            end
                        end
                        if not found then
                            self.Warn("Text override for unknown key " .. classKey .. "/" .. specKey .. "/" .. key)
                        end
                    end
                end
            else
                self.Warn("Text overrides for unknown spec " .. classKey .. "/" .. specKey)
            end
        end
    end
end

------------------------------------------------------------------------------
-- State
------------------------------------------------------------------------------

function V:Class()
    return RTG.db.class and RTG.ClassesByKey[RTG.db.class]
end

function V:SpecInfo()
    local class = self:Class()
    if not class or not RTG.db.spec then return nil end
    return RTG:GetSpecInfo(class.key, RTG.db.spec)
end

function V:CategoryIndex(data)
    local key = RTG.db.class .. "." .. RTG.db.spec
    local idx = RTG.db.category[key] or 1
    if not data.categories or not data.categories[idx] then idx = 1 end
    return idx
end

------------------------------------------------------------------------------
-- Build
------------------------------------------------------------------------------

function V:Build(f, L)
    self.f = f
    self.L = L

    -- LEFT: classes
    local leftScroll = UI.CreateScrollArea(f.left, L.leftW - 30)
    leftScroll:SetPoint("TOPLEFT", 4, -f.listTop)
    leftScroll:SetPoint("BOTTOMRIGHT", -26, 6)
    self.leftScroll = leftScroll
    self.classRows = {}
    local y = 0
    for _, class in ipairs(RTG.Classes) do
        local row = UI.CreateListButton(leftScroll.child, leftScroll.contentWidth, 30)
        row.class = class
        row:SetClassIcon(class.key)
        row:SetData("|c" .. UI.ClassColorHex(class.key) .. class.name .. "|r")
        row:SetPoint("TOPLEFT", leftScroll.child, "TOPLEFT", 0, -y)
        row:SetScript("OnClick", function(self) V:SelectClass(self.class.key) end)
        self.classRows[class.key] = row
        y = y + 31
    end
    leftScroll.child:SetHeight(math.max(y, 1))

    -- CENTRE: specs
    local centerScroll = UI.CreateScrollArea(f.center, L.centerW - 30)
    centerScroll:SetPoint("TOPLEFT", 4, -f.centerTop)
    centerScroll:SetPoint("BOTTOMRIGHT", -26, 6)
    self.centerScroll = centerScroll
    self.specRows = {}

    -- CONTENT: picker (class grid / spec cards)
    local picker = CreateFrame("Frame", nil, f.content)
    picker:SetAllPoints()
    local pScroll = UI.CreateScrollArea(picker, L.contentW - 46)
    pScroll:SetPoint("TOPLEFT", 12, -12)
    pScroll:SetPoint("BOTTOMRIGHT", -30, 8)
    self.picker = picker
    self.pickerCanvas = UI.NewCanvas(pScroll)

    -- CONTENT: spec page
    local page = CreateFrame("Frame", nil, f.content)
    page:SetAllPoints()
    self.page = page
    self:BuildSpecHeader(page, L)

    self.catTabs = {}
    local sScroll = UI.CreateScrollArea(page, L.contentW - 46)
    self.specScroll = sScroll
    self.specCanvas = UI.NewCanvas(sScroll)

    self:HideView()
end

function V:BuildSpecHeader(page, L)
    local iconHolder = UI.CreateIcon(page, 52)
    iconHolder:SetPoint("TOPLEFT", 12, -10)
    iconHolder.border:SetTexture(1, 0.82, 0, 0.9)
    self.specIcon = iconHolder.icon

    local classIcon = page:CreateTexture(nil, "OVERLAY")
    classIcon:SetWidth(22)
    classIcon:SetHeight(22)
    classIcon:SetPoint("BOTTOMRIGHT", iconHolder, "BOTTOMRIGHT", 6, -6)
    classIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
    self.classIcon = classIcon

    local line1 = page:CreateFontString(nil, "OVERLAY")
    line1:SetFontObject(UI.fonts.small)
    line1:SetPoint("TOPLEFT", iconHolder, "TOPRIGHT", 12, -1)
    self.classLine = line1

    local line2 = page:CreateFontString(nil, "OVERLAY")
    line2:SetFontObject(UI.fonts.bossName)
    line2:SetPoint("TOPLEFT", line1, "BOTTOMLEFT", 0, -2)
    self.specLine = line2

    local roleIcon = page:CreateTexture(nil, "OVERLAY")
    roleIcon:SetWidth(16)
    roleIcon:SetHeight(16)
    roleIcon:SetTexture(UI.ROLE_TEXTURE)
    roleIcon:SetPoint("TOPLEFT", line2, "BOTTOMLEFT", 0, -3)
    self.roleIcon = roleIcon

    local role = page:CreateFontString(nil, "OVERLAY")
    role:SetFontObject(UI.fonts.small)
    role:SetPoint("LEFT", roleIcon, "RIGHT", 4, 0)
    role:SetJustifyH("LEFT")
    self.roleText = role

    -- Edit mode toggle
    if RTG.config.classGuide == nil or RTG.config.classGuide.allowInGameEditing ~= false then
        local cb = CreateFrame("CheckButton", "RaidTacticsGuideEditModeCheck", page, "UICheckButtonTemplate")
        cb:SetWidth(24)
        cb:SetHeight(24)
        cb:SetPoint("TOPRIGHT", page, "TOPRIGHT", -86, -8)
        local label = _G["RaidTacticsGuideEditModeCheckText"]
        if label then
            label:SetText("Edit Mode")
            label:SetFontObject(GameFontNormalSmall)
        end
        cb:SetScript("OnClick", function(self)
            V.editMode = self:GetChecked() and true or false
            V:RenderSpec()
        end)
        cb:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_LEFT")
            GameTooltip:AddLine("Edit Mode", 1, 0.82, 0)
            GameTooltip:AddLine("Shows Edit buttons on every text section so you can change, clear or add notes in-game.", 1, 1, 1, true)
            GameTooltip:AddLine("Edits are saved per character account (SavedVariables). Use /rtg export to copy them into a data file.", 0.7, 0.7, 0.7, true)
            GameTooltip:Show()
        end)
        cb:SetScript("OnLeave", UI.HideTooltip)
        self.editCheck = cb
    end
end

------------------------------------------------------------------------------
-- Lists
------------------------------------------------------------------------------

function V:LayoutClassList()
    local current = RTG.db.class
    for key, row in pairs(self.classRows) do
        row:SetSelected(key == current)
    end
end

function V:LayoutSpecList()
    for _, row in ipairs(self.specRows) do row:Hide() end
    local class = self:Class()
    if not class then
        self.f.centerCaption:SetText("SPECIALIZATIONS")
        return
    end
    self.f.centerCaption:SetText(string.upper(class.name))
    local child = self.centerScroll.child
    local y = 0
    for i, spec in ipairs(class.specs) do
        local row = self.specRows[i]
        if not row then
            row = UI.CreateListButton(child, self.centerScroll.contentWidth, 34)
            row:SetScript("OnClick", function(self) V:SelectSpec(self.spec.key) end)
            self.specRows[i] = row
        end
        row.spec = spec
        row:SetIconTexture(RTG:DefIcon(spec))
        local has = RTG:GetSpec(class.key, spec.key) ~= nil
        row:SetData(spec.name, UI.RoleText(spec.role) .. (has and "" or "  |cff888888(no guide)|r"))
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -y)
        row:SetSelected(RTG.db.spec == spec.key)
        row:Show()
        y = y + 35
    end
    child:SetHeight(math.max(y, 1))
    self.centerScroll:UpdateScrollChildRect()
end

------------------------------------------------------------------------------
-- Selection / navigation
------------------------------------------------------------------------------

function V:SelectClass(key)
    if RTG.db.class ~= key then
        RTG.db.class = key
        RTG.db.spec = nil
    end
    if PlaySound then PlaySound("igMainMenuOptionCheckBoxOn") end
    self:Refresh()
    RTG:UpdateHeader()
end

function V:SelectSpec(key)
    RTG.db.spec = key
    if PlaySound then PlaySound("igAbiliityPageTurn") end
    self:Refresh()
    RTG:UpdateHeader()
end

function V:Breadcrumb()
    local class = self:Class()
    local s = "|cffd4a017Class Guide|r"
    if class then
        s = s .. "  >  |c" .. UI.ClassColorHex(class.key) .. class.name .. "|r"
        local spec = self:SpecInfo()
        if spec then s = s .. "  >  " .. spec.name end
    end
    return s
end

function V:CanGoBack()
    return RTG.db.class ~= nil
end

function V:Back()
    if RTG.db.spec then
        RTG.db.spec = nil
    elseif RTG.db.class then
        RTG.db.class = nil
    end
    self:Refresh()
end

function V:StepInfo()
    local class = self:Class()
    if not class then return false, false end
    if not RTG.db.spec then
        -- step through classes
        local idx
        for i, c in ipairs(RTG.Classes) do if c == class then idx = i end end
        local p, n = RTG.Classes[(idx or 0) - 1], RTG.Classes[(idx or 0) + 1]
        return p ~= nil, n ~= nil, p and ("Previous class: " .. p.name), n and ("Next class: " .. n.name)
    end
    local idx
    for i, s in ipairs(class.specs) do if s.key == RTG.db.spec then idx = i end end
    local p, n = class.specs[(idx or 0) - 1], class.specs[(idx or 0) + 1]
    return p ~= nil, n ~= nil, p and ("Previous spec: " .. p.name), n and ("Next spec: " .. n.name)
end

function V:Step(delta)
    local class = self:Class()
    if not class then return end
    if not RTG.db.spec then
        for i, c in ipairs(RTG.Classes) do
            if c == class and RTG.Classes[i + delta] then
                self:SelectClass(RTG.Classes[i + delta].key)
                return
            end
        end
        return
    end
    for i, s in ipairs(class.specs) do
        if s.key == RTG.db.spec and class.specs[i + delta] then
            self:SelectSpec(class.specs[i + delta].key)
            return
        end
    end
end

------------------------------------------------------------------------------
-- Show / refresh
------------------------------------------------------------------------------

function V:ShowView()
    self.f.leftCaption:SetText("CLASSES")
    self.leftScroll:Show()
    self.centerScroll:Show()
    self:Refresh()
end

function V:HideView()
    self.leftScroll:Hide()
    self.centerScroll:Hide()
    self.picker:Hide()
    self.page:Hide()
end

function V:Refresh()
    if not self.f then return end
    self:LayoutClassList()
    self:LayoutSpecList()
    if self:SpecInfo() then
        self.picker:Hide()
        self.page:Show()
        self:RenderSpec()
    else
        self.page:Hide()
        self.picker:Show()
        self:RenderPicker()
    end
end

------------------------------------------------------------------------------
-- Picker screens
------------------------------------------------------------------------------

local function createCard(parent)
    local b = CreateFrame("Button", nil, parent)
    b:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    b:SetBackdropColor(0.12, 0.08, 0.04, 0.95)
    b:SetBackdropBorderColor(UI.colors.bronze[1], UI.colors.bronze[2], UI.colors.bronze[3], 0.9)
    local hl = b:CreateTexture(nil, "HIGHLIGHT")
    hl:SetPoint("TOPLEFT", 3, -3)
    hl:SetPoint("BOTTOMRIGHT", -3, 3)
    hl:SetTexture(1, 0.85, 0.4, 0.15)
    local icon = UI.CreateIcon(b, 40)
    b.iconFrame = icon
    b.icon = icon.icon
    local name = b:CreateFontString(nil, "OVERLAY")
    name:SetFontObject(UI.fonts.heading)
    b.name = name
    local sub = b:CreateFontString(nil, "OVERLAY")
    sub:SetFontObject(UI.fonts.small)
    sub:SetJustifyH("LEFT")
    sub:SetJustifyV("TOP")
    b.sub = sub
    return b
end

function V:RenderPicker()
    local c = self.pickerCanvas
    c:Clear()
    local class = self:Class()
    if not class then
        c:Heading("Class Guide", { icon = "Interface\\Icons\\INV_Misc_Book_09", font = UI.fonts.title })
        c:Rich("Choose a class to see its specializations and visual rotation guides. Every guide shows the abilities in the order you should use them - hover an icon to see the spell tooltip.")
        c:Gap(8)
        local cols = 5
        local cardW = math.floor((c.width - (cols - 1) * 8) / cols)
        local cardH = 78
        for i, cl in ipairs(RTG.Classes) do
            local card = c:_acquire("classcard", createCard)
            local col = (i - 1) % cols
            local row = math.floor((i - 1) / cols)
            card:SetWidth(cardW)
            card:SetHeight(cardH)
            card:SetPoint("TOPLEFT", c.child, "TOPLEFT", col * (cardW + 8), -(c.y + row * (cardH + 8)))
            card.iconFrame:ClearAllPoints()
            card.iconFrame:SetPoint("TOP", 0, -8)
            card.icon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
            local tc = CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[cl.key]
            if tc then card.icon:SetTexCoord(tc[1] + 0.015, tc[2] - 0.015, tc[3] + 0.015, tc[4] - 0.015) end
            card.name:ClearAllPoints()
            card.name:SetPoint("BOTTOM", 0, 8)
            card.name:SetText("|c" .. UI.ClassColorHex(cl.key) .. cl.name .. "|r")
            card.sub:Hide()
            card.classKey = cl.key
            card:SetScript("OnClick", function(self) V:SelectClass(self.classKey) end)
        end
        local rows = math.ceil(#RTG.Classes / cols)
        c.y = c.y + rows * (cardH + 8)
        c:Finish()
        return
    end

    -- spec selection for a class
    local r, g, b = UI.ClassColor(class.key)
    c:Heading(class.name, { font = UI.fonts.title, color = { r, g, b } })
    c:Rich("Choose a specialization:")
    c:Gap(4)
    for _, spec in ipairs(class.specs) do
        local data = RTG:GetSpec(class.key, spec.key)
        local card = c:_acquire("speccard", createCard)
        card:SetWidth(c.width)
        card:SetHeight(64)
        card:SetPoint("TOPLEFT", c.child, "TOPLEFT", 0, -c.y)
        card.iconFrame:ClearAllPoints()
        card.iconFrame:SetPoint("LEFT", 12, 0)
        RTG:SetTextureSafe(card.icon, RTG:DefIcon(spec))
        card.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        card.name:ClearAllPoints()
        card.name:SetPoint("TOPLEFT", card.iconFrame, "TOPRIGHT", 12, -1)
        card.name:SetText(spec.name .. "   |cffb0a080" .. UI.RoleText(spec.role) .. "|r")
        card.sub:ClearAllPoints()
        card.sub:SetPoint("TOPLEFT", card.name, "BOTTOMLEFT", 0, -4)
        card.sub:SetWidth(c.width - 80)
        card.sub:SetHeight(28)
        card.sub:SetText(data and data.summary or "|cff888888No rotation guide has been written for this specialization yet.|r")
        card.sub:Show()
        card.specKey = spec.key
        card:SetScript("OnClick", function(self) V:SelectSpec(self.specKey) end)
        c.y = c.y + 70
    end
    c:Finish()
end

------------------------------------------------------------------------------
-- Rotation page
------------------------------------------------------------------------------

local NOTE_STYLE = {
    notes       = { color = UI.colors.gold,   icon = "Interface\\Icons\\INV_Misc_Note_01" },
    important   = { color = UI.colors.red,    icon = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew", texCoord = { 0, 1, 0, 1 } },
    cooldowns   = { color = UI.colors.blue,   icon = "Interface\\Icons\\INV_Misc_PocketWatch_01" },
    situational = { color = UI.colors.orange, icon = "Interface\\Icons\\INV_Misc_QuestionMark" },
}

function V:UpdateSpecHeader(class, spec, data)
    RTG:SetTextureSafe(self.specIcon, RTG:DefIcon(spec))
    self.specIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    local tc = CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[class.key]
    if tc then self.classIcon:SetTexCoord(tc[1], tc[2], tc[3], tc[4]) end
    self.classLine:SetText("CLASS: |c" .. UI.ClassColorHex(class.key) .. string.upper(class.name) .. "|r")
    self.specLine:SetText("Specialization: " .. spec.name)
    local firstRole = tostring(spec.role or "DPS"):match("^[^/]+")
    local coords = UI.ROLE_COORDS[firstRole] or UI.ROLE_COORDS.DPS
    self.roleIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
    self.roleText:SetText(UI.RoleText(spec.role))
end

function V:LayoutCategoryTabs(data)
    for _, t in ipairs(self.catTabs) do t:Hide() end
    local cats = data and data.categories or {}
    local top = -HEADER_H
    if #cats > 1 then
        local current = self:CategoryIndex(data)
        local x = 12
        for i, cat in ipairs(cats) do
            local tab = self.catTabs[i]
            if not tab then
                tab = UI.CreateTab(self.page, "", 100, 22)
                tab:SetScript("OnClick", function(self)
                    RTG.db.category[RTG.db.class .. "." .. RTG.db.spec] = self.index
                    if PlaySound then PlaySound("igCharacterInfoTab") end
                    V:RenderSpec()
                end)
                self.catTabs[i] = tab
            end
            tab.index = i
            tab.text:SetText(cat.name or ("Rotation " .. i))
            local w = math.max(80, tab.text:GetStringWidth() + 24)
            tab:SetWidth(w)
            tab:ClearAllPoints()
            tab:SetPoint("TOPLEFT", self.page, "TOPLEFT", x, top)
            tab:SetSelected(i == current)
            tab:Show()
            x = x + w + 4
        end
        top = top - 28
    end
    self.specScroll:ClearAllPoints()
    self.specScroll:SetPoint("TOPLEFT", self.page, "TOPLEFT", 12, top - 4)
    self.specScroll:SetPoint("BOTTOMRIGHT", self.page, "BOTTOMRIGHT", -30, 8)
end

local function editButton(text, onClick)
    if not V.editMode then return nil end
    return { text = text or "Edit", onClick = onClick }
end

function V:OpenTextEditor(title, key, default, isNote)
    local classKey, specKey = RTG.db.class, RTG.db.spec
    local current, overridden = RTG:GetSpecText(classKey, specKey, key, default)
    RTG:OpenEditor({
        title = "Edit: " .. (title or key),
        text = current or "",
        onSave = function(text)
            RTG:SetSpecText(classKey, specKey, key, text)
            V:RenderSpec(true)
        end,
        onReset = overridden and function()
            RTG:ResetSpecText(classKey, specKey, key)
            V:RenderSpec(true)
        end or nil,
    })
end

function V:RenderSpec(keepScroll)
    local class = self:Class()
    local spec = self:SpecInfo()
    if not class or not spec then return end
    local data = RTG:GetSpec(class.key, spec.key)
    self:UpdateSpecHeader(class, spec, data)
    self:LayoutCategoryTabs(data)
    if self.editCheck then self.editCheck:SetChecked(self.editMode and 1 or nil) end

    local c = self.specCanvas
    c:Clear()
    if not data then
        c:Empty("No rotation guide has been written for " .. spec.name .. " " .. class.name .. " yet.\n\n" ..
            "Add one in Data\\Rotations\\ with\nRTG:RegisterSpec(\"" .. class.key .. "\", \"" .. spec.key .. "\", { ... })")
        c:Finish()
        return
    end
    local ok, err = pcall(self.RenderSpecContent, self, c, class, spec, data)
    if not ok then
        c:Clear()
        c:Empty("This guide could not be displayed because its data contains an error.\n\n|cffff5050" .. tostring(err) .. "|r")
        RTG:Print("Error showing " .. class.key .. "/" .. spec.key .. ": " .. tostring(err))
    end
    c:Finish(keepScroll)
end

function V:RenderSpecContent(c, class, spec, data)
    local cfg = RTG.config.classGuide or {}
    local iconSize = cfg.iconSize or 36
    local perRow = cfg.iconsPerRow or 7
    local catIndex = self:CategoryIndex(data)
    local cat = data.categories and data.categories[catIndex]
    local classKey, specKey = class.key, spec.key

    if data.summary and data.summary ~= "" then
        local _, sh = c:Text(RTG:ExpandTokens(data.summary), UI.fonts.body, 0, nil, UI.colors.parchment)
        c.y = c.y + sh + 8
    end

    if self.editMode then
        local _, h = c:Text("|cff40ff40Edit Mode is on.|r Click Edit next to a section to change its text. Clearing a text hides it. Icons are changed in the data files.",
            UI.fonts.small, 0, nil)
        c.y = c.y + h + 8
    end

    if cat then
        for si, sec in ipairs(cat.sections or {}) do
            local key = sec.key or ("c" .. catIndex .. "s" .. si)
            local text = RTG:GetSpecText(classKey, specKey, key, sec.text)
            local hasText = text and text ~= ""
            local showSection = sec.type ~= "text" or hasText or self.editMode
            if showSection then
                if sec.title or self.editMode then
                    local secTitle = sec.title or (sec.type == "text" and "Notes" or "")
                    c:Heading(secTitle, {
                        button = editButton("Edit", function()
                            V:OpenTextEditor(secTitle, key, sec.text)
                        end),
                    })
                end
                if hasText then
                    c:Rich(text)
                    c:Gap(2)
                elseif self.editMode then
                    c:Rich("", { empty = "(no text - click Edit to add some)" })
                end
                if sec.type == "rotation" then
                    c:IconRow(sec.spells, { size = iconSize, perRow = perRow, arrows = true })
                elseif sec.type == "icons" then
                    c:IconRow(sec.spells, { size = iconSize, perRow = perRow + 2, arrows = false })
                elseif sec.type == "priority" then
                    self:RenderPriority(c, sec.spells, iconSize)
                end
                if sec.footer and sec.footer ~= "" then
                    c:Rich(sec.footer, { color = UI.colors.muted })
                end
                c:Gap(10)
            end
        end
    end

    -- Notes (shared by all categories)
    local hadDivider = false
    for _, note in ipairs(data.notes or {}) do
        local key = note.key or note.title
        local text = RTG:GetSpecText(classKey, specKey, key, note.text)
        local hasText = text and text ~= ""
        local hasSpells = note.spells and #note.spells > 0
        if hasText or hasSpells or self.editMode then
            if not hadDivider then
                c:Divider(4)
                hadDivider = true
            end
            local style = NOTE_STYLE[key] or NOTE_STYLE.notes
            c:Heading(string.upper(note.title or key), {
                color = style.color, icon = style.icon, texCoord = style.texCoord,
                button = editButton("Edit", function() V:OpenTextEditor(note.title, key, note.text, true) end),
            })
            if hasSpells then
                c:IconRow(note.spells, { size = 32, perRow = perRow + 3, arrows = false })
            end
            if hasText then
                c:Rich(text)
            elseif self.editMode then
                c:Rich("", { empty = "(empty - click Edit to add text)" })
            end
            c:Gap(10)
        end
    end

    -- Notes added in-game
    local custom = RTG:GetCustomNotes(classKey, specKey, false)
    if custom then
        for i, note in ipairs(custom) do
            c:Heading(string.upper(note.title or "My note"), {
                color = UI.colors.green, icon = "Interface\\Icons\\INV_Misc_Note_05",
                button = editButton("Edit", function()
                    RTG:OpenEditor({
                        title = "Edit your note",
                        titleText = note.title or "",
                        text = note.text or "",
                        onSave = function(text, title)
                            note.text = text
                            note.title = (title and title ~= "") and title or "My note"
                            V:RenderSpec(true)
                        end,
                        onDelete = function()
                            table.remove(custom, i)
                            V:RenderSpec(true)
                        end,
                    })
                end),
            })
            c:Rich(note.text or "", { empty = "(empty note)" })
            c:Gap(10)
        end
    end

    if self.editMode then
        local add = c:SmallButton("+ Add your own note", 150)
        add:SetHeight(22)
        add:SetPoint("TOPLEFT", c.child, "TOPLEFT", 0, -c.y)
        add:SetScript("OnClick", function()
            RTG:OpenEditor({
                title = "Add a note",
                titleText = "My note",
                text = "",
                onSave = function(text, title)
                    local list = RTG:GetCustomNotes(classKey, specKey, true)
                    table.insert(list, { title = (title and title ~= "") and title or "My note", text = text })
                    V:RenderSpec(true)
                end,
            })
        end)
        c.y = c.y + 28
    end
end

--- Numbered priority list: "1. [icon] Name - note"
function V:RenderPriority(c, spells, iconSize)
    local size = math.min(iconSize, 32)
    local n = 0
    for _, entry in ipairs(spells or {}) do
        if not entry.rowBreak then
            n = n + 1
            local top = c.y
            c:Text(n .. ".", UI.fonts.heading, 0, 22, UI.colors.gold, "RIGHT")
            local b = c:IconButton(size, entry)
            b:SetPoint("TOPLEFT", c.child, "TOPLEFT", 28, -top)
            local name = (RTG:ResolveSpell(entry))
            local textX = 28 + size + 8
            local _, h1 = c:Text(name, UI.fonts.heading, textX, c.width - textX, UI.colors.gold)
            c.y = c.y + h1 + 1
            if entry.note and entry.note ~= "" then
                local _, h2 = c:Text(RTG:ExpandTokens(entry.note), UI.fonts.body, textX, c.width - textX)
                c.y = c.y + h2
            end
            if c.y < top + size then c.y = top + size end
            c.y = c.y + 6
        end
    end
end
