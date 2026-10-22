--[[
    Raid Tactics Guide - Minimap button
    -----------------------------------
    Left-click: open/close the guidebook.  Right-click: open the Class Guide.
    Drag: move the button around the minimap (position is saved).
]]

local RTG = RaidTacticsGuide

local RADIUS = 80

local function updatePosition(button)
    local angle = math.rad(RTG.db.minimap.angle or 215)
    local x = math.cos(angle) * RADIUS
    local y = math.sin(angle) * RADIUS
    button:ClearAllPoints()
    button:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

local function onDragUpdate(self)
    local mx, my = Minimap:GetCenter()
    local cx, cy = GetCursorPosition()
    local scale = Minimap:GetEffectiveScale()
    cx, cy = cx / scale, cy / scale
    RTG.db.minimap.angle = math.deg(math.atan2(cy - my, cx - mx)) % 360
    updatePosition(self)
end

function RTG:CreateMinimapButton()
    if self.minimapButton then return end
    if self.config.showMinimapButton == false then return end

    local b = CreateFrame("Button", "RaidTacticsGuideMinimapButton", Minimap)
    b:SetWidth(31)
    b:SetHeight(31)
    b:SetFrameStrata("MEDIUM")
    b:SetFrameLevel(8)
    b:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    b:RegisterForDrag("LeftButton")

    local overlay = b:CreateTexture(nil, "OVERLAY")
    overlay:SetWidth(53)
    overlay:SetHeight(53)
    overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    overlay:SetPoint("TOPLEFT")

    local bg = b:CreateTexture(nil, "BACKGROUND")
    bg:SetWidth(20)
    bg:SetHeight(20)
    bg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
    bg:SetPoint("TOPLEFT", 7, -5)

    local icon = b:CreateTexture(nil, "ARTWORK")
    icon:SetWidth(20)
    icon:SetHeight(20)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
    icon:SetPoint("TOPLEFT", 7, -5)
    b.icon = icon

    b:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            RTG:Open("classes")
        else
            RTG:Toggle()
        end
    end)
    b:SetScript("OnDragStart", function(self)
        self:LockHighlight()
        self:SetScript("OnUpdate", onDragUpdate)
    end)
    b:SetScript("OnDragStop", function(self)
        self:UnlockHighlight()
        self:SetScript("OnUpdate", nil)
    end)
    b:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("Raid Tactics Guide", 1, 0.82, 0)
        GameTooltip:AddLine("Left-click: open / close the guidebook", 1, 1, 1)
        GameTooltip:AddLine("Right-click: Class Guide", 1, 1, 1)
        GameTooltip:AddLine("Drag: move this button", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)

    self.minimapButton = b
    updatePosition(b)
    self:UpdateMinimapButton()
end

function RTG:UpdateMinimapButton()
    if not self.minimapButton then
        if not self.db.minimap.hide then self:CreateMinimapButton() end
        return
    end
    if self.db.minimap.hide then
        self.minimapButton:Hide()
    else
        self.minimapButton:Show()
        updatePosition(self.minimapButton)
    end
end
