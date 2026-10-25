-- Shared lightweight controls for the raid management pages.
-- Uses the exact same UI font, tabs, panels and scroll widgets as the guide.
local RTG = RaidTacticsGuide
local UI = RTG.UI
RTG.Tools = {}
local T = RTG.Tools

function T.Label(parent, title, x, y, font)
    local f = parent:CreateFontString(nil, "OVERLAY")
    f:SetFontObject(font or UI.fonts.small)
    f:SetPoint("TOPLEFT", x, y)
    f:SetText(title or "")
    return f
end

function T.Button(parent, title, x, y, width, callback, height)
    local b = UI.CreateButton(parent, title, width or 90, height or 22)
    b:SetPoint("TOPLEFT", x, y)
    if callback then b:SetScript("OnClick", callback) end
    return b
end

function T.Edit(parent, x, y, width, onEnter)
    local b = CreateFrame("EditBox", UI.NewName("Edit"), parent, "InputBoxTemplate")
    b:SetWidth(width or 140)
    b:SetHeight(24)
    b:SetAutoFocus(false)
    b:SetPoint("TOPLEFT", x + 6, y)
    b:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    b:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        if onEnter then onEnter(self:GetText()) end
    end)
    return b
end

function T.Cycle(parent, x, y, width, values, onChange)
    local b = UI.CreateTab(parent, "", width, 23)
    b:SetPoint("TOPLEFT", x, y)
    b.values = values or {}
    b.index = 1
    function b:SetValues(v, selected)
        self.values = v or {}
        self.index = 1
        if selected then
            for i, item in ipairs(self.values) do
                if item.value == selected or item == selected then self.index = i break end
            end
        end
        self:UpdateLabel()
    end
    function b:GetChoice()
        local item = self.values[self.index]
        return type(item) == "table" and item.value or item
    end
    function b:UpdateLabel()
        local item = self.values[self.index]
        local label = type(item) == "table" and item.label or item
        self.text:SetText((label or "--") .. "  v")
    end
    b:SetScript("OnClick", function(self)
        if #self.values == 0 then return end
        self.index = self.index % #self.values + 1
        self:UpdateLabel()
        if onChange then onChange(self:GetChoice()) end
    end)
    b:UpdateLabel()
    return b
end

function T.Scroll(parent, width, top, bottom)
    local sc = UI.CreateScrollArea(parent, width)
    sc:SetPoint("TOPLEFT", 9, top or -12)
    sc:SetPoint("BOTTOMRIGHT", -27, bottom or 7)
    return sc, UI.NewCanvas(sc)
end

function T.Line(canvas, title, value, color)
    local text = title .. (value and ("  " .. value) or "")
    local _, h = canvas:Text(text, UI.fonts.small, 0, nil, color)
    canvas.y = canvas.y + h + 6
end

function T.CanvasButton(canvas, title, width, onClick)
    local b = canvas:SmallButton(title, width or 75)
    b:SetPoint("TOPLEFT", canvas.child, "TOPLEFT", 0, -canvas.y)
    b:SetScript("OnClick", onClick)
    canvas.y = canvas.y + 22
    return b
end

function T.RaidName(name)
    return tostring(name or ""):match("^[^-]+") or ""
end

function T.Roster()
    local members = {}
    for i = 1, GetNumRaidMembers() do
        local name, rank, group, level, class, classKey = GetRaidRosterInfo(i)
        if name then
            table.insert(members, {
                name = name, class = classKey or class or "", group = group or 1,
                unit = "raid" .. i, rank = rank or 0,
            })
        end
    end
    table.sort(members, function(a, b)
        if a.group ~= b.group then return a.group < b.group end
        return a.name < b.name
    end)
    return members
end

function T.FindInRaid(name, members)
    for _, p in ipairs(members or T.Roster()) do
        if p.name == name or T.RaidName(p.name) == T.RaidName(name) then return p end
    end
end

function T.NewView(name, title)
    local V = { title = title }
    RTG.views[name] = V
    function V:BasicBuild(f, L)
        self.f, self.L = f, L
        self.leftScroll, self.leftCanvas = T.Scroll(f.left, L.leftW - 30, -f.listTop, 6)
        self.centerScroll, self.centerCanvas = T.Scroll(f.center, L.centerW - 30, -f.centerTop, 6)
        self.page = CreateFrame("Frame", nil, f.content)
        self.page:SetAllPoints()
        self.leftScroll:Hide()
        self.centerScroll:Hide()
        self.page:Hide()
    end
    function V:ShowView()
        self.f.leftCaption:SetText(self.title:upper())
        self.f.centerCaption:SetText("RAID MEMBERS")
        self.leftScroll:Show()
        self.centerScroll:Show()
        self.page:Show()
        self:Refresh()
    end
    function V:HideView()
        self.leftScroll:Hide()
        self.centerScroll:Hide()
        self.page:Hide()
    end
    function V:Breadcrumb() return self.title end
    return V
end
