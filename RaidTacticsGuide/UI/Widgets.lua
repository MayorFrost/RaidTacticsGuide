--[[
    Raid Tactics Guide - Shared UI widgets
    --------------------------------------
    Small, reusable building blocks (fonts, panels, buttons, scroll areas)
    and the "Canvas": a vertical layout engine that renders headings,
    paragraphs, bullet lists and icon rows into a scroll frame, re-using
    its regions between pages so browsing never leaks frames.

    Only WoW 3.3.5a API is used (SetBackdrop, UIPanelScrollFrameTemplate,
    SetTexture(r,g,b,a) for solid colours, etc.).
]]

local RTG = RaidTacticsGuide
local UI = {}
RTG.UI = UI

------------------------------------------------------------------------------
-- Theme
------------------------------------------------------------------------------

UI.colors = {
    gold      = { 1.00, 0.82, 0.00 },
    bronze    = { 0.72, 0.56, 0.30 },
    parchment = { 0.93, 0.88, 0.76 },
    muted     = { 0.62, 0.58, 0.50 },
    red       = { 1.00, 0.30, 0.25 },
    orange    = { 1.00, 0.60, 0.15 },
    green     = { 0.45, 0.90, 0.40 },
    blue      = { 0.45, 0.75, 1.00 },
    panel     = { 0.09, 0.065, 0.04, 0.92 },
    panelDark = { 0.05, 0.035, 0.02, 0.95 },
    selected  = { 0.85, 0.65, 0.20, 0.30 },
    hover     = { 1.00, 0.85, 0.40, 0.15 },
}

UI.DANGER = {
    high   = { color = { 1.00, 0.25, 0.20 }, label = "DANGEROUS" },
    medium = { color = { 1.00, 0.62, 0.15 }, label = "Important" },
    low    = { color = { 0.60, 0.60, 0.60 }, label = "Minor" },
}

local fontPath = STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
local function makeFont(name, path, size, flags, r, g, b)
    local f = _G[name] or CreateFont(name)
    f:SetFont(path, size, flags or "")
    f:SetTextColor(r or 1, g or 1, b or 1)
    f:SetShadowColor(0, 0, 0, 1)
    f:SetShadowOffset(1, -1)
    return f
end

-- Morpheus is the classic "book" font; titles are English data text so it is safe.
UI.fonts = {
    title    = makeFont("RTGFontTitle",    "Fonts\\MORPHEUS.ttf", 20, nil, 1.0, 0.82, 0.0),
    bossName = makeFont("RTGFontBossName", "Fonts\\MORPHEUS.ttf", 22, nil, 1.0, 0.82, 0.0),
    heading  = makeFont("RTGFontHeading",  fontPath, 14, nil, 1.0, 0.82, 0.0),
    sub      = makeFont("RTGFontSub",      fontPath, 13, nil, 0.95, 0.75, 0.35),
    body     = makeFont("RTGFontBody",     fontPath, 12, nil, 0.93, 0.88, 0.76),
    small    = makeFont("RTGFontSmall",    fontPath, 11, nil, 0.80, 0.76, 0.66),
    tiny     = makeFont("RTGFontTiny",     fontPath, 10, nil, 0.80, 0.76, 0.66),
    list     = makeFont("RTGFontList",     fontPath, 12, nil, 0.95, 0.90, 0.80),
}

------------------------------------------------------------------------------
-- Naming (templates in 3.3.5a need named frames for $parent children)
------------------------------------------------------------------------------

local nameCounter = 0
function UI.NewName(prefix)
    nameCounter = nameCounter + 1
    return "RTG" .. (prefix or "Frame") .. nameCounter
end

------------------------------------------------------------------------------
-- Panels and textures
------------------------------------------------------------------------------

local PANEL_BACKDROP = {
    bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 14,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
}

function UI.StylePanel(frame, dark)
    frame:SetBackdrop(PANEL_BACKDROP)
    local c = dark and UI.colors.panelDark or UI.colors.panel
    frame:SetBackdropColor(c[1], c[2], c[3], c[4])
    local b = UI.colors.bronze
    frame:SetBackdropBorderColor(b[1], b[2], b[3], 0.9)
end

function UI.CreatePanel(parent, dark)
    local f = CreateFrame("Frame", nil, parent)
    UI.StylePanel(f, dark)
    return f
end

--- Solid colour texture (SetTexture(r,g,b,a) is the 3.3.5a way).
function UI.ColorTexture(parent, layer, r, g, b, a)
    local t = parent:CreateTexture(nil, layer or "BACKGROUND")
    t:SetTexture(r, g, b, a or 1)
    return t
end

--- Thin horizontal divider.
function UI.Divider(parent, layer)
    local t = parent:CreateTexture(nil, layer or "ARTWORK")
    t:SetTexture(UI.colors.bronze[1], UI.colors.bronze[2], UI.colors.bronze[3], 0.45)
    t:SetHeight(1)
    return t
end

--- An icon with a thin dark border, the standard "icon square" look.
function UI.CreateIcon(parent, size, layer)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetWidth(size)
    holder:SetHeight(size)
    local border = holder:CreateTexture(nil, "BACKGROUND")
    border:SetAllPoints()
    border:SetTexture(0, 0, 0, 1)
    holder.border = border
    local icon = holder:CreateTexture(nil, layer or "ARTWORK")
    icon:SetPoint("TOPLEFT", 1, -1)
    icon:SetPoint("BOTTOMRIGHT", -1, 1)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    holder.icon = icon
    return holder
end

--- Down arrow / right arrow built from the spellbook page arrow (rotated via tex coords).
function UI.SetArrow(tex, direction)
    tex:SetTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
    if direction == "down" then
        -- rotate 90 degrees clockwise: (ULx,ULy, LLx,LLy, URx,URy, LRx,LRy)
        tex:SetTexCoord(0, 1, 1, 1, 0, 0, 1, 0)
    else
        tex:SetTexCoord(0, 1, 0, 1)
    end
end

------------------------------------------------------------------------------
-- Buttons
------------------------------------------------------------------------------

--- Standard red WoW panel button.
function UI.CreateButton(parent, text, width, height)
    local b = CreateFrame("Button", UI.NewName("Button"), parent, "UIPanelButtonTemplate")
    b:SetWidth(width or 100)
    b:SetHeight(height or 22)
    b:SetText(text or "")
    return b
end

--- Flat "tab" style button with selected state.
function UI.CreateTab(parent, text, width, height)
    local b = CreateFrame("Button", nil, parent)
    b:SetWidth(width or 90)
    b:SetHeight(height or 24)
    b:SetBackdrop(PANEL_BACKDROP)
    b:SetBackdropColor(0.12, 0.09, 0.05, 0.95)
    b:SetBackdropBorderColor(UI.colors.bronze[1], UI.colors.bronze[2], UI.colors.bronze[3], 0.8)
    local fs = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    fs:SetPoint("CENTER", 0, 0)
    fs:SetText(text or "")
    b.text = fs
    local hl = b:CreateTexture(nil, "HIGHLIGHT")
    hl:SetPoint("TOPLEFT", 3, -3)
    hl:SetPoint("BOTTOMRIGHT", -3, 3)
    hl:SetTexture(1, 0.85, 0.4, 0.12)
    function b:SetSelected(sel)
        self.selected = sel
        if sel then
            self:SetBackdropColor(0.35, 0.24, 0.08, 0.95)
            self:SetBackdropBorderColor(1, 0.82, 0.0, 1)
            self.text:SetTextColor(1, 1, 1)
        else
            self:SetBackdropColor(0.12, 0.09, 0.05, 0.95)
            self:SetBackdropBorderColor(UI.colors.bronze[1], UI.colors.bronze[2], UI.colors.bronze[3], 0.8)
            self.text:SetTextColor(1, 0.82, 0)
        end
    end
    function b:SetEnabledState(enabled)
        self.disabledState = not enabled
        if enabled then
            self:Enable()
            self:SetAlpha(1)
        else
            self:Disable()
            self:SetAlpha(0.4)
        end
    end
    b:SetSelected(false)
    return b
end

--- A list row with an icon, a title and an optional sub-line. Used by raid,
-- boss, class and spec lists.
function UI.CreateListButton(parent, width, height)
    height = height or 30
    local b = CreateFrame("Button", nil, parent)
    b:SetWidth(width)
    b:SetHeight(height)

    local sel = b:CreateTexture(nil, "BACKGROUND")
    sel:SetAllPoints()
    sel:SetTexture(UI.colors.selected[1], UI.colors.selected[2], UI.colors.selected[3], UI.colors.selected[4])
    sel:Hide()
    b.selTex = sel

    local selBar = b:CreateTexture(nil, "BORDER")
    selBar:SetPoint("TOPLEFT")
    selBar:SetPoint("BOTTOMLEFT")
    selBar:SetWidth(3)
    selBar:SetTexture(1, 0.82, 0, 1)
    selBar:Hide()
    b.selBar = selBar

    local hl = b:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetTexture(UI.colors.hover[1], UI.colors.hover[2], UI.colors.hover[3], UI.colors.hover[4])

    local iconSize = height - 6
    local icon = UI.CreateIcon(b, iconSize)
    icon:SetPoint("LEFT", 6, 0)
    b.iconFrame = icon
    b.icon = icon.icon

    local title = b:CreateFontString(nil, "OVERLAY")
    title:SetFontObject(UI.fonts.list)
    title:SetJustifyH("LEFT")
    title:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    title:SetPoint("RIGHT", b, "RIGHT", -4, 0)
    b.title = title

    local sub = b:CreateFontString(nil, "OVERLAY")
    sub:SetFontObject(UI.fonts.tiny)
    sub:SetJustifyH("LEFT")
    sub:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -1)
    sub:SetPoint("RIGHT", b, "RIGHT", -4, 0)
    sub:Hide()
    b.sub = sub

    function b:SetData(text, subText)
        self.title:SetText(text or "")
        self.title:ClearAllPoints()
        if subText and subText ~= "" then
            self.title:SetPoint("TOPLEFT", self.iconFrame, "TOPRIGHT", 6, -1)
            self.title:SetPoint("RIGHT", self, "RIGHT", -4, 0)
            self.sub:SetText(subText)
            self.sub:Show()
        else
            self.title:SetPoint("LEFT", self.iconFrame, "RIGHT", 6, 0)
            self.title:SetPoint("RIGHT", self, "RIGHT", -4, 0)
            self.sub:Hide()
        end
    end

    function b:SetSelected(selected)
        if selected then
            self.selTex:Show()
            self.selBar:Show()
        else
            self.selTex:Hide()
            self.selBar:Hide()
        end
    end

    function b:SetIconTexture(...)
        self.iconFrame:Show()
        RTG:SetTextureSafe(self.icon, ...)
        self.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    end

    function b:SetClassIcon(classKey)
        self.icon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
        local c = CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[classKey]
        if c then
            self.icon:SetTexCoord(c[1] + 0.015, c[2] - 0.015, c[3] + 0.015, c[4] - 0.015)
        end
    end

    return b
end

------------------------------------------------------------------------------
-- Scroll areas
------------------------------------------------------------------------------

--- Creates a named UIPanelScrollFrameTemplate scroll frame with a scroll child.
-- The scroll bar sits inside the given area (we leave 22px on the right).
function UI.CreateScrollArea(parent, width)
    local name = UI.NewName("Scroll")
    local sf = CreateFrame("ScrollFrame", name, parent, "UIPanelScrollFrameTemplate")
    local child = CreateFrame("Frame", nil, sf)
    child:SetWidth(width)
    child:SetHeight(1)
    sf:SetScrollChild(child)
    sf.child = child
    sf.contentWidth = width
    sf.scrollBar = _G[name .. "ScrollBar"]
    sf:EnableMouseWheel(true)
    sf:SetScript("OnMouseWheel", function(self, delta)
        local bar = self.scrollBar
        if not bar then return end
        local step = 40
        local value = bar:GetValue() - delta * step
        local _, maxV = bar:GetMinMaxValues()
        if value < 0 then value = 0 end
        if value > maxV then value = maxV end
        bar:SetValue(value)
    end)
    return sf
end

------------------------------------------------------------------------------
-- Canvas: vertical layout renderer with pooled regions
------------------------------------------------------------------------------

local Canvas = {}
Canvas.__index = Canvas

function UI.NewCanvas(scrollFrame)
    local c = setmetatable({}, Canvas)
    c.scroll = scrollFrame
    c.child  = scrollFrame.child
    c.width  = scrollFrame.contentWidth
    c.y      = 0
    c.pools  = {}
    return c
end

function Canvas:_acquire(kind, create)
    local pool = self.pools[kind]
    if not pool then
        pool = { free = {}, used = {} }
        self.pools[kind] = pool
    end
    local obj = table.remove(pool.free)
    if not obj then obj = create(self.child) end
    table.insert(pool.used, obj)
    obj:ClearAllPoints()
    obj:Show()
    return obj
end

--- Hide everything and start again at the top.
function Canvas:Clear()
    for _, pool in pairs(self.pools) do
        for i = #pool.used, 1, -1 do
            local obj = pool.used[i]
            obj:Hide()
            if obj.Reset then obj:Reset() end
            table.insert(pool.free, obj)
            pool.used[i] = nil
        end
    end
    self.y = 0
end

function Canvas:Gap(h)
    self.y = self.y + (h or 8)
end

--- Place a font string; returns it and its height.
function Canvas:Text(text, font, x, width, color, justify, poolKind)
    local fs = self:_acquire(poolKind or "fs", function(parent)
        local f = parent:CreateFontString(nil, "OVERLAY")
        f:SetJustifyV("TOP")
        if f.SetNonSpaceWrap then f:SetNonSpaceWrap(true) end
        return f
    end)
    fs:SetFontObject(font or UI.fonts.body)
    fs:SetJustifyH(justify or "LEFT")
    x = x or 0
    width = width or (self.width - x)
    fs:SetWidth(width)
    fs:SetPoint("TOPLEFT", self.child, "TOPLEFT", x, -self.y)
    if color then
        fs:SetTextColor(color[1], color[2], color[3])
    else
        local r, g, b = (font or UI.fonts.body):GetTextColor()
        fs:SetTextColor(r, g, b)
    end
    fs:SetText(text or "")
    local h = fs:GetStringHeight()
    local h2 = fs:GetHeight()
    if h2 and h2 > h then h = h2 end
    if h < 1 then h = 12 end
    return fs, h
end

function Canvas:Texture(layer)
    return self:_acquire("tex" .. (layer or "ARTWORK"), function(parent)
        local t = parent:CreateTexture(nil, layer or "ARTWORK")
        t.Reset = function(s) s:SetTexCoord(0, 1, 0, 1); s:SetVertexColor(1, 1, 1, 1); s:SetAlpha(1) end
        return t
    end)
end

function Canvas:Divider(pad)
    pad = pad or 6
    self.y = self.y + pad
    local t = self:Texture("ARTWORK")
    t:SetTexture(UI.colors.bronze[1], UI.colors.bronze[2], UI.colors.bronze[3], 0.45)
    t:SetHeight(1)
    t:SetPoint("TOPLEFT", self.child, "TOPLEFT", 0, -self.y)
    t:SetPoint("TOPRIGHT", self.child, "TOPRIGHT", 0, -self.y)
    self.y = self.y + 1 + pad
end

--- Section heading with optional icon (opts.icon = path, opts.texCoord = {..}),
-- opts.color, opts.font, opts.button = { text=, onClick= } (small button on the right).
function Canvas:Heading(text, opts)
    opts = opts or {}
    local x = 0
    local lineH = 18
    if opts.icon then
        local t = self:Texture("ARTWORK")
        t:SetWidth(18)
        t:SetHeight(18)
        t:SetPoint("TOPLEFT", self.child, "TOPLEFT", 0, -self.y)
        if type(opts.icon) == "table" then
            RTG:SetTextureSafe(t, unpack(opts.icon))
        else
            RTG:SetTextureSafe(t, opts.icon)
        end
        if opts.texCoord then
            t:SetTexCoord(unpack(opts.texCoord))
        else
            t:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        end
        x = 24
    end
    local rightPad = opts.button and 70 or 0
    local fs, h = self:Text(text, opts.font or UI.fonts.heading, x, self.width - x - rightPad, opts.color)
    fs:SetPoint("TOPLEFT", self.child, "TOPLEFT", x, -(self.y + 2))
    if opts.button then
        local b = self:SmallButton(opts.button.text, 60)
        b:SetPoint("TOPRIGHT", self.child, "TOPRIGHT", 0, -self.y)
        b:SetScript("OnClick", opts.button.onClick)
    end
    if h < lineH then h = lineH end
    self.y = self.y + h + 2
    -- gold underline
    local line = self:Texture("ARTWORK")
    local c = opts.color or UI.colors.gold
    line:SetTexture(c[1], c[2], c[3], 0.35)
    line:SetHeight(1)
    line:SetPoint("TOPLEFT", self.child, "TOPLEFT", 0, -self.y)
    line:SetPoint("TOPRIGHT", self.child, "TOPRIGHT", 0, -self.y)
    self.y = self.y + 5
end

--- Render marked-up text (paragraphs, "- " bullets, "# " sub-headings).
-- opts.indent, opts.font, opts.color, opts.empty (text shown when empty)
function Canvas:Rich(text, opts)
    opts = opts or {}
    local indent = opts.indent or 0
    local blocks = RTG:ParseBlocks(text)
    if #blocks == 0 then
        if opts.empty then
            local _, h = self:Text(opts.empty, UI.fonts.small, indent, nil, UI.colors.muted)
            self.y = self.y + h + 4
        end
        return
    end
    for _, block in ipairs(blocks) do
        if block.kind == "gap" then
            self.y = self.y + 6
        elseif block.kind == "heading" then
            self.y = self.y + 2
            local _, h = self:Text(RTG:ExpandTokens(block.text), UI.fonts.sub, indent)
            self.y = self.y + h + 3
        elseif block.kind == "bullet" then
            local dot = self:Texture("ARTWORK")
            dot:SetTexture("Interface\\QuestFrame\\UI-Quest-BulletPoint")
            dot:SetWidth(12)
            dot:SetHeight(12)
            dot:SetPoint("TOPLEFT", self.child, "TOPLEFT", indent + 2, -(self.y))
            local _, h = self:Text(RTG:ExpandTokens(block.text), opts.font, indent + 16, nil, opts.color)
            self.y = self.y + h + 3
        else
            local _, h = self:Text(RTG:ExpandTokens(block.text), opts.font, indent, nil, opts.color)
            self.y = self.y + h + 4
        end
    end
end

--- Small text button (UIPanelButtonTemplate) placed by the caller.
function Canvas:SmallButton(text, width)
    local b = self:_acquire("smallbtn", function(parent)
        local btn = CreateFrame("Button", UI.NewName("CanvasBtn"), parent, "UIPanelButtonTemplate")
        btn:SetHeight(18)
        btn.Reset = function(s) s:SetScript("OnClick", nil); s:Enable() end
        return btn
    end)
    b:SetWidth(width or 60)
    b:SetText(text)
    return b
end

--- Icon button with tooltip support. data = { id/spellId, name, icon, note } (spell)
-- or pass kind = "item". Returns the button; caller positions it.
function Canvas:IconButton(size, data, kind)
    local b = self:_acquire("iconbtn", function(parent)
        local btn = CreateFrame("Button", nil, parent)
        local border = btn:CreateTexture(nil, "BACKGROUND")
        border:SetAllPoints()
        border:SetTexture(0, 0, 0, 1)
        btn.border = border
        local ic = btn:CreateTexture(nil, "ARTWORK")
        ic:SetPoint("TOPLEFT", 2, -2)
        ic:SetPoint("BOTTOMRIGHT", -2, 2)
        ic:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        btn.icon = ic
        local hl = btn:CreateTexture(nil, "HIGHLIGHT")
        hl:SetAllPoints(ic)
        hl:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
        hl:SetBlendMode("ADD")
        btn:SetScript("OnEnter", UI.IconButton_OnEnter)
        btn:SetScript("OnLeave", UI.HideTooltip)
        btn.Reset = function(s) s.data = nil; s.kind = nil; s.border:SetTexture(0, 0, 0, 1) end
        return btn
    end)
    b:SetWidth(size)
    b:SetHeight(size)
    b.data = data
    b.kind = kind or "spell"
    local _, icon = RTG:ResolveSpell(data)
    if b.kind == "spell" then
        RTG:SetTextureSafe(b.icon, data and data.icon, icon)
    end
    return b
end

function UI.HideTooltip()
    GameTooltip:Hide()
end

--- Spell tooltip: real spell tooltip from the id, plus our note underneath.
function UI.IconButton_OnEnter(self)
    local d = self.data
    if not d then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    local id = d.id or d.spellId
    local shown = false
    if id and GetSpellInfo(id) then
        GameTooltip:SetHyperlink("spell:" .. id)
        shown = true
    end
    if not shown then
        GameTooltip:AddLine(d.name or "?", 1, 0.82, 0)
    end
    if d.note and d.note ~= "" then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine(d.note, 0.45, 0.9, 0.4, true)
    end
    if d.extra and d.extra ~= "" then
        GameTooltip:AddLine(d.extra, 0.8, 0.8, 0.8, true)
    end
    GameTooltip:Show()
end

--- Lay out a row (or wrapped rows) of spell icons.
-- opts: size, perRow, arrows (draw arrows between icons), labels (show label/name under icons),
--       x (left offset)
function Canvas:IconRow(spells, opts)
    opts = opts or {}
    local size = opts.size or 36
    local perRow = opts.perRow or 7
    local arrows = opts.arrows
    local showLabels = opts.labels ~= false
    local x0 = opts.x or 0
    local gap = arrows and 22 or 10
    local labelH = showLabels and 14 or 0
    local rowH = size + labelH + 6
    local col = 0
    local startY = self.y
    local rowY = self.y
    local anyLabel = false

    -- fit as many as possible into the width
    local maxPerRow = math.floor((self.width - x0 + gap) / (size + gap))
    if perRow > maxPerRow then perRow = math.max(1, maxPerRow) end

    local function newRow(withDownArrow)
        rowY = rowY + rowH
        if withDownArrow then
            local t = self:Texture("ARTWORK")
            UI.SetArrow(t, "down")
            t:SetWidth(22)
            t:SetHeight(22)
            t:SetPoint("TOPLEFT", self.child, "TOPLEFT", x0 + (size - 22) / 2, -(rowY - 2))
            rowY = rowY + 20
        end
        col = 0
    end

    for i, entry in ipairs(spells or {}) do
        if entry.rowBreak then
            if col > 0 then newRow(arrows) end
        else
            if col >= perRow then newRow(arrows) end
            local x = x0 + col * (size + gap)
            if arrows and col > 0 then
                local t = self:Texture("ARTWORK")
                UI.SetArrow(t, "right")
                t:SetWidth(20)
                t:SetHeight(20)
                t:SetPoint("TOPLEFT", self.child, "TOPLEFT", x - gap + 1, -(rowY + (size - 20) / 2))
            end
            local b = self:IconButton(size, entry)
            b:SetPoint("TOPLEFT", self.child, "TOPLEFT", x, -rowY)
            if showLabels then
                local label = entry.label
                if not label then
                    label = (RTG:ResolveSpell(entry))
                end
                if label and label ~= "" then
                    anyLabel = true
                    -- labels use their own pool because they get a fixed one-line height
                    local fs = self:Text(label, UI.fonts.tiny, x - gap / 2 + 1, size + gap - 2, nil, "CENTER", "label")
                    fs:SetPoint("TOPLEFT", self.child, "TOPLEFT", x - gap / 2 + 1, -(rowY + size + 2))
                    fs:SetHeight(12)
                end
            end
            col = col + 1
        end
    end
    if col > 0 or rowY > startY then
        self.y = rowY + size + (anyLabel and labelH or 0) + 6
    end
end

--- Must be called after adding content.
function Canvas:Finish(keepScroll)
    local h = self.y + 10
    if h < 1 then h = 1 end
    self.child:SetHeight(h)
    self.scroll:UpdateScrollChildRect()
    if not keepScroll then
        self.scroll:SetVerticalScroll(0)
        if self.scroll.scrollBar then self.scroll.scrollBar:SetValue(0) end
    end
end

--- Placeholder message for missing content.
function Canvas:Empty(text)
    self:Gap(20)
    local _, h = self:Text(text, UI.fonts.body, 10, self.width - 20, UI.colors.muted, "CENTER")
    self.y = self.y + h + 10
end

------------------------------------------------------------------------------
-- Role icons (LFG portrait roles exist since 3.3)
------------------------------------------------------------------------------

UI.ROLE_TEXTURE = "Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES"
UI.ROLE_COORDS = {
    TANK   = { 0, 19 / 64, 22 / 64, 41 / 64 },
    HEALER = { 20 / 64, 39 / 64, 1 / 64, 20 / 64 },
    DPS    = { 20 / 64, 39 / 64, 22 / 64, 41 / 64 },
}
UI.ROLE_COORDS.MELEE = UI.ROLE_COORDS.DPS
UI.ROLE_COORDS.RANGED = UI.ROLE_COORDS.DPS

function UI.RoleText(role)
    if not role then return "" end
    local map = { TANK = "Tank", HEALER = "Healer", MELEE = "Melee DPS", RANGED = "Ranged DPS", DPS = "DPS" }
    local out = {}
    for part in tostring(role):gmatch("[^/]+") do
        table.insert(out, map[part] or part)
    end
    return table.concat(out, " / ")
end

function UI.ClassColor(classKey)
    local c = RAID_CLASS_COLORS and RAID_CLASS_COLORS[classKey]
    if c then return c.r, c.g, c.b end
    return 1, 1, 1
end

function UI.ClassColorHex(classKey)
    local r, g, b = UI.ClassColor(classKey)
    return string.format("ff%02x%02x%02x", math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5))
end
