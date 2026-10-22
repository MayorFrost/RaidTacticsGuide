--[[
    Raid Tactics Guide - Main window
    --------------------------------
    The book frame: header (title, breadcrumb, Back, prev/next arrows,
    minimise, close), the Raids / Class Guide switch and the three body
    panels (left list, centre list, main content) that the views fill.
]]

local RTG = RaidTacticsGuide
local UI = RTG.UI

RTG.views = RTG.views or {}

local HEADER_H = 40
local MARGIN   = 12
local LEFT_W   = 160
local CENTER_W = 178
local GAP      = 6

function RTG:GetLayout()
    local w = self.config.windowWidth or 940
    local h = self.config.windowHeight or 600
    local contentX = MARGIN + LEFT_W + GAP + CENTER_W + GAP
    return {
        width = w, height = h, header = HEADER_H, margin = MARGIN,
        leftW = LEFT_W, centerW = CENTER_W, gap = GAP,
        contentX = contentX,
        contentW = w - contentX - MARGIN,
        bodyH = h - HEADER_H - MARGIN,
    }
end

local function savePosition(frame)
    local point, _, relPoint, x, y = frame:GetPoint(1)
    RTG.db.window.point = { point, relPoint, x, y }
end

function RTG:CreateMainFrame()
    if self.frame then return self.frame end
    if not self.db then self:InitDB() end
    local L = self:GetLayout()

    local f = CreateFrame("Frame", "RaidTacticsGuideFrame", UIParent)
    f:SetWidth(L.width)
    f:SetHeight(L.height)
    f:SetFrameStrata("HIGH")
    f:SetToplevel(true)
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetScale(self.db.window.scale or self.config.windowScale or 1)
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 },
    })
    f:SetBackdropColor(0.25, 0.18, 0.10, 1)

    -- warm leather tint over the dark dialog background
    local tint = f:CreateTexture(nil, "BACKGROUND", nil)
    tint:SetPoint("TOPLEFT", 11, -12)
    tint:SetPoint("BOTTOMRIGHT", -12, 11)
    tint:SetTexture(0.16, 0.10, 0.05, 0.55)

    local p = self.db.window.point
    if p then
        f:SetPoint(p[1], UIParent, p[2], p[3], p[4])
    else
        f:SetPoint("CENTER")
    end
    f:Hide()
    tinsert(UISpecialFrames, "RaidTacticsGuideFrame")

    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        savePosition(self)
    end)
    f:SetScript("OnShow", function()
        if PlaySound then PlaySound("igSpellBookOpen") end
        RTG:RefreshAll()
    end)
    f:SetScript("OnHide", function()
        if PlaySound then PlaySound("igSpellBookClose") end
        if RTG.Editor and RTG.Editor:IsShown() then RTG.Editor:Hide() end
    end)

    self.frame = f
    self:CreateHeader(f, L)
    self:CreateBody(f, L)

    for _, view in pairs(self.views) do
        if view.Build then view:Build(f, L) end
    end
    self:SetMode(self.db.mode or "raids", true)
    return f
end

------------------------------------------------------------------------------
-- Header
------------------------------------------------------------------------------

function RTG:CreateHeader(f, L)
    local header = CreateFrame("Frame", nil, f)
    header:SetPoint("TOPLEFT", 12, -10)
    header:SetPoint("TOPRIGHT", -12, -10)
    header:SetHeight(L.header - 8)
    header:EnableMouse(true)
    header:RegisterForDrag("LeftButton")
    header:SetScript("OnDragStart", function() f:StartMoving() end)
    header:SetScript("OnDragStop", function()
        f:StopMovingOrSizing()
        savePosition(f)
    end)
    f.header = header

    local book = header:CreateTexture(nil, "ARTWORK")
    book:SetWidth(24)
    book:SetHeight(24)
    book:SetPoint("LEFT", 4, 0)
    book:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    book:SetTexCoord(0.07, 0.93, 0.07, 0.93)

    local title = header:CreateFontString(nil, "OVERLAY")
    title:SetFontObject(UI.fonts.title)
    title:SetPoint("LEFT", book, "RIGHT", 8, 0)
    title:SetText(self.config.title or "Raid Tactics Guide")
    f.titleText = title

    -- Close
    local close = CreateFrame("Button", "RaidTacticsGuideFrameClose", f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -4, -4)
    close:SetScript("OnClick", function() f:Hide() end)

    -- Minimise
    local mini = UI.CreateButton(f, "-", 24, 20)
    mini:SetPoint("RIGHT", close, "LEFT", -2, 0)
    mini:SetScript("OnClick", function() RTG:ToggleMinimized() end)
    mini:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(RTG.minimized and "Expand" or "Minimise")
        GameTooltip:Show()
    end)
    mini:SetScript("OnLeave", UI.HideTooltip)
    f.miniButton = mini

    -- Next / Prev arrows
    local function arrow(dir)
        local b = CreateFrame("Button", nil, header)
        b:SetWidth(26)
        b:SetHeight(26)
        local base = "Interface\\Buttons\\UI-SpellbookIcon-" .. dir .. "Page-"
        b:SetNormalTexture(base .. "Up")
        b:SetPushedTexture(base .. "Down")
        b:SetDisabledTexture(base .. "Disabled")
        b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
        return b
    end
    local nextB = arrow("Next")
    nextB:SetPoint("RIGHT", mini, "LEFT", -26, 0)
    nextB:SetScript("OnClick", function() RTG:NavigateStep(1) end)
    nextB:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(self.tip or "Next")
        GameTooltip:Show()
    end)
    nextB:SetScript("OnLeave", UI.HideTooltip)
    local prevB = arrow("Prev")
    prevB:SetPoint("RIGHT", nextB, "LEFT", -2, 0)
    prevB:SetScript("OnClick", function() RTG:NavigateStep(-1) end)
    prevB:SetScript("OnEnter", nextB:GetScript("OnEnter"))
    prevB:SetScript("OnLeave", UI.HideTooltip)
    f.nextButton, f.prevButton = nextB, prevB

    local back = UI.CreateButton(header, "< Back", 70, 22)
    back:SetPoint("RIGHT", prevB, "LEFT", -6, 0)
    back:SetScript("OnClick", function() RTG:NavigateBack() end)
    f.backButton = back

    local crumb = header:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    crumb:SetPoint("LEFT", title, "RIGHT", 18, -1)
    crumb:SetPoint("RIGHT", back, "LEFT", -10, 0)
    crumb:SetJustifyH("LEFT")
    f.crumb = crumb

    local line = UI.Divider(f, "ARTWORK")
    line:SetPoint("TOPLEFT", 14, -L.header - 2)
    line:SetPoint("TOPRIGHT", -14, -L.header - 2)
end

------------------------------------------------------------------------------
-- Body panels
------------------------------------------------------------------------------

function RTG:CreateBody(f, L)
    local body = CreateFrame("Frame", nil, f)
    body:SetPoint("TOPLEFT", 0, -L.header - 6)
    body:SetPoint("BOTTOMRIGHT", 0, 0)
    f.body = body

    local bodyH = L.height - L.header - 6 - L.margin

    local left = UI.CreatePanel(body, true)
    left:SetPoint("TOPLEFT", L.margin, 0)
    left:SetWidth(L.leftW)
    left:SetHeight(bodyH)
    f.left = left

    local center = UI.CreatePanel(body, true)
    center:SetPoint("TOPLEFT", left, "TOPRIGHT", L.gap, 0)
    center:SetWidth(L.centerW)
    center:SetHeight(bodyH)
    f.center = center

    local content = UI.CreatePanel(body, false)
    content:SetPoint("TOPLEFT", center, "TOPRIGHT", L.gap, 0)
    content:SetWidth(L.contentW)
    content:SetHeight(bodyH)
    f.content = content

    -- subtle parchment grain on the reading area (falls back to plain colour)
    local grain = content:CreateTexture(nil, "BACKGROUND", nil)
    grain:SetPoint("TOPLEFT", 4, -4)
    grain:SetPoint("BOTTOMRIGHT", -4, 4)
    grain:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal")
    grain:SetVertexColor(0.35, 0.28, 0.20)
    grain:SetAlpha(0.18)

    -- Mode switch at the top of the left panel
    local tabW = math.floor((L.leftW - 12) / 2)
    local raidsTab = UI.CreateTab(left, "Raids", tabW, 24)
    raidsTab:SetPoint("TOPLEFT", 5, -5)
    raidsTab:SetScript("OnClick", function() RTG:SetMode("raids") end)
    local classTab = UI.CreateTab(left, "Class Guide", tabW, 24)
    classTab:SetPoint("LEFT", raidsTab, "RIGHT", 2, 0)
    classTab:SetScript("OnClick", function() RTG:SetMode("classes") end)
    f.modeTabs = { raids = raidsTab, classes = classTab }

    -- Column captions
    local function caption(parent, y)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs:SetPoint("TOPLEFT", 10, y)
        fs:SetJustifyH("LEFT")
        return fs
    end
    f.leftCaption = caption(left, -36)
    f.centerCaption = caption(center, -10)

    f.listTop = 52     -- y offset where lists start inside the left panel
    f.centerTop = 26   -- y offset where lists start inside the centre panel
    f.bodyH = bodyH
end

------------------------------------------------------------------------------
-- Modes, navigation, header refresh
------------------------------------------------------------------------------

function RTG:CurrentView()
    return self.views[self.mode or "raids"]
end

function RTG:SetMode(mode, silent)
    if not self.views[mode] then mode = "raids" end
    if not self.frame then
        self.db.mode = mode
        return
    end
    self.mode = mode
    self.db.mode = mode
    for key, view in pairs(self.views) do
        if key == mode then
            if view.ShowView then view:ShowView() end
        else
            if view.HideView then view:HideView() end
        end
    end
    for key, tab in pairs(self.frame.modeTabs) do
        tab:SetSelected(key == mode)
    end
    if not silent and PlaySound then PlaySound("igAbiliityPageTurn") end
    self:UpdateHeader()
end

function RTG:RefreshAll()
    local view = self:CurrentView()
    if view and view.Refresh then view:Refresh() end
    self:UpdateHeader()
end

function RTG:UpdateHeader()
    local f = self.frame
    if not f then return end
    local view = self:CurrentView()
    if not view then return end
    f.crumb:SetText(view.Breadcrumb and view:Breadcrumb() or "")
    if view.CanGoBack and view:CanGoBack() then
        f.backButton:Enable()
    else
        f.backButton:Disable()
    end
    local canPrev, canNext, prevTip, nextTip = false, false, nil, nil
    if view.StepInfo then
        canPrev, canNext, prevTip, nextTip = view:StepInfo()
    end
    if canPrev then f.prevButton:Enable() else f.prevButton:Disable() end
    if canNext then f.nextButton:Enable() else f.nextButton:Disable() end
    f.prevButton.tip = prevTip or "Previous"
    f.nextButton.tip = nextTip or "Next"
end

function RTG:NavigateBack()
    local view = self:CurrentView()
    if view and view.Back then view:Back() end
    self:UpdateHeader()
end

function RTG:NavigateStep(delta)
    local view = self:CurrentView()
    if view and view.Step then view:Step(delta) end
    self:UpdateHeader()
end

function RTG:ToggleMinimized()
    local f = self.frame
    if not f then return end
    self.minimized = not self.minimized
    -- keep the top edge in place while the height changes
    local left, top = f:GetLeft(), f:GetTop()
    if left and top then
        f:ClearAllPoints()
        f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
        savePosition(f)
    end
    if self.minimized then
        f.body:Hide()
        f:SetHeight(self:GetLayout().header + 16)
        f.miniButton:SetText("+")
    else
        f.body:Show()
        f:SetHeight(self:GetLayout().height)
        f.miniButton:SetText("-")
    end
end
