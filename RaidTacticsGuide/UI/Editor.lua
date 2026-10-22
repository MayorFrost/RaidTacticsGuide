--[[
    Raid Tactics Guide - Text editor popup and export window
    --------------------------------------------------------
    RTG:OpenEditor({ title, text, titleText, onSave(text, title), onReset, onDelete, readOnly })
    RTG:ShowExport()  -- shows in-game Class Guide edits as a Lua data file
]]

local RTG = RaidTacticsGuide
local UI = RTG.UI

local editor

local function createEditor()
    local f = CreateFrame("Frame", "RaidTacticsGuideEditor", UIParent)
    f:SetWidth(520)
    f:SetHeight(400)
    f:SetPoint("CENTER", 0, 40)
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:SetClampedToScreen(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 },
    })
    f:Hide()
    tinsert(UISpecialFrames, "RaidTacticsGuideEditor")

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -18)
    f.title = title

    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -6, -6)

    -- optional title input (for custom notes)
    local nameLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameLabel:SetPoint("TOPLEFT", 24, -48)
    nameLabel:SetText("Title:")
    f.nameLabel = nameLabel
    local nameBox = CreateFrame("EditBox", "RaidTacticsGuideEditorTitle", f, "InputBoxTemplate")
    nameBox:SetWidth(300)
    nameBox:SetHeight(20)
    nameBox:SetPoint("LEFT", nameLabel, "RIGHT", 12, 0)
    nameBox:SetAutoFocus(false)
    nameBox:SetMaxLetters(60)
    f.nameBox = nameBox

    -- text area
    local area = CreateFrame("Frame", nil, f)
    UI.StylePanel(area, true)
    f.area = area

    local sf = CreateFrame("ScrollFrame", "RaidTacticsGuideEditorScroll", area, "UIPanelScrollFrameTemplate")
    sf:SetPoint("TOPLEFT", 8, -8)
    sf:SetPoint("BOTTOMRIGHT", -28, 8)

    local eb = CreateFrame("EditBox", "RaidTacticsGuideEditorText", sf)
    eb:SetMultiLine(true)
    eb:SetAutoFocus(false)
    eb:SetFontObject(ChatFontNormal)
    eb:SetWidth(440)
    eb:SetHeight(200)
    eb:SetMaxLetters(0)
    eb:SetTextInsets(2, 2, 2, 2)
    eb:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    if ScrollingEdit_OnTextChanged then
        eb:SetScript("OnTextChanged", function(self, ...) ScrollingEdit_OnTextChanged(self, sf) end)
    end
    if ScrollingEdit_OnCursorChanged then
        eb:SetScript("OnCursorChanged", ScrollingEdit_OnCursorChanged)
    end
    if ScrollingEdit_OnUpdate then
        eb:SetScript("OnUpdate", function(self, elapsed) ScrollingEdit_OnUpdate(self, elapsed, sf) end)
    end
    sf:SetScrollChild(eb)
    area:EnableMouse(true)
    area:SetScript("OnMouseDown", function() eb:SetFocus() end)
    f.editBox = eb
    f.scroll = sf

    local help = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    help:SetPoint("BOTTOMLEFT", 24, 46)
    help:SetPoint("RIGHT", f, "RIGHT", -24, 0)
    help:SetJustifyH("LEFT")
    help:SetTextColor(0.7, 0.7, 0.7)
    help:SetText("Start a line with \"- \" for a bullet point or \"# \" for a sub-heading. Line breaks are kept. Empty text hides the section.")
    f.help = help

    local save = UI.CreateButton(f, "Save", 90, 22)
    save:SetPoint("BOTTOMRIGHT", -24, 18)
    f.saveButton = save
    local cancel = UI.CreateButton(f, "Cancel", 90, 22)
    cancel:SetPoint("RIGHT", save, "LEFT", -6, 0)
    cancel:SetScript("OnClick", function() f:Hide() end)
    f.cancelButton = cancel
    local reset = UI.CreateButton(f, "Reset to default", 130, 22)
    reset:SetPoint("BOTTOMLEFT", 24, 18)
    f.resetButton = reset
    local delete = UI.CreateButton(f, "Delete note", 110, 22)
    delete:SetPoint("LEFT", reset, "RIGHT", 6, 0)
    f.deleteButton = delete

    return f
end

function RTG:OpenEditor(opts)
    if not editor then editor = createEditor() end
    local f = editor
    self.Editor = f
    opts = opts or {}
    f.title:SetText(opts.title or "Edit text")

    local top = -46
    if opts.titleText then
        f.nameLabel:Show()
        f.nameBox:Show()
        f.nameBox:SetText(opts.titleText)
        top = -76
    else
        f.nameLabel:Hide()
        f.nameBox:Hide()
    end
    f.area:ClearAllPoints()
    f.area:SetPoint("TOPLEFT", 20, top)
    f.area:SetPoint("BOTTOMRIGHT", -20, 66)

    f.editBox:SetText(opts.text or "")
    f.editBox:SetCursorPosition(0)
    f.scroll:SetVerticalScroll(0)

    if opts.readOnly then
        f.saveButton:Hide()
        f.cancelButton:SetText("Close")
        f.help:SetText("Press Ctrl+A then Ctrl+C to copy. Save it as a .lua file in Data\\Rotations\\ and add it to RaidTacticsGuide.toc.")
    else
        f.saveButton:Show()
        f.cancelButton:SetText("Cancel")
        f.help:SetText("Start a line with \"- \" for a bullet point or \"# \" for a sub-heading. Line breaks are kept. Empty text hides the section.")
        f.saveButton:SetScript("OnClick", function()
            local text = f.editBox:GetText() or ""
            text = text:gsub("||", "|")   -- edit boxes escape typed pipes; keep colour codes working
            local titleText = opts.titleText and f.nameBox:GetText() or nil
            f:Hide()
            if opts.onSave then opts.onSave(text, titleText) end
        end)
    end

    if opts.onReset then
        f.resetButton:Show()
        f.resetButton:SetScript("OnClick", function()
            f:Hide()
            opts.onReset()
        end)
    else
        f.resetButton:Hide()
    end
    if opts.onDelete then
        f.deleteButton:Show()
        f.deleteButton:ClearAllPoints()
        if opts.onReset then
            f.deleteButton:SetPoint("LEFT", f.resetButton, "RIGHT", 6, 0)
        else
            f.deleteButton:SetPoint("BOTTOMLEFT", 24, 18)
        end
        f.deleteButton:SetScript("OnClick", function()
            f:Hide()
            opts.onDelete()
        end)
    else
        f.deleteButton:Hide()
    end

    f:Show()
    if not opts.readOnly then f.editBox:SetFocus() end
end

------------------------------------------------------------------------------
-- Export
------------------------------------------------------------------------------

local function longString(text)
    local level = ""
    while text:find("]" .. level .. "]", 1, true) do
        level = level .. "="
    end
    return "[" .. level .. "[\n" .. text .. "]" .. level .. "]"
end

function RTG:BuildExport()
    local lines = {
        "-- Raid Tactics Guide: in-game Class Guide edits",
        "-- Save as Data\\Rotations\\MyEdits.lua and list it in RaidTacticsGuide.toc",
        "-- (after the other Rotations files). Then you can reset your in-game edits.",
        "local RTG = RaidTacticsGuide",
        "RTG:ApplyTextOverrides({",
    }
    local any = false
    local classes = {}
    for classKey in pairs(self.db.overrides) do classes[classKey] = true end
    for classKey in pairs(self.db.customNotes) do classes[classKey] = true end
    for classKey in pairs(classes) do
        local specs = {}
        for specKey in pairs(self.db.overrides[classKey] or {}) do specs[specKey] = true end
        for specKey in pairs(self.db.customNotes[classKey] or {}) do specs[specKey] = true end
        local classLines = {}
        for specKey in pairs(specs) do
            local specLines = {}
            for key, text in pairs((self.db.overrides[classKey] or {})[specKey] or {}) do
                table.insert(specLines, string.format("            [%q] = %s,", key, longString(text)))
            end
            local custom = (self.db.customNotes[classKey] or {})[specKey]
            if custom and #custom > 0 then
                table.insert(specLines, "            _custom = {")
                for _, n in ipairs(custom) do
                    table.insert(specLines, string.format("                { title = %q, text = %s },", n.title or "My note", longString(n.text or "")))
                end
                table.insert(specLines, "            },")
            end
            if #specLines > 0 then
                table.insert(classLines, string.format("        [%q] = {", specKey))
                for _, l in ipairs(specLines) do table.insert(classLines, l) end
                table.insert(classLines, "        },")
            end
        end
        if #classLines > 0 then
            any = true
            table.insert(lines, string.format("    [%q] = {", classKey))
            for _, l in ipairs(classLines) do table.insert(lines, l) end
            table.insert(lines, "    },")
        end
    end
    table.insert(lines, "})")
    if not any then return nil end
    return table.concat(lines, "\n")
end

function RTG:ShowExport()
    local text = self:BuildExport()
    if not text then
        self:Print("You have no in-game Class Guide edits to export.")
        return
    end
    self:OpenEditor({ title = "Export your edits", text = text, readOnly = true })
    editor.editBox:HighlightText()
    editor.editBox:SetFocus()
end
