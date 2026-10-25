local RTG = RaidTacticsGuide
local UI, T = RTG.UI, RTG.Tools
local V = T.NewView("rolls", "Raid Roll Manager")

function V:Build(f,L)
    self:BasicBuild(f,L)
    T.Label(self.page,"RAID ROLL MANAGER",12,-12,UI.fonts.heading)
    T.Label(self.page,"Item or Shift-click link",12,-43)
    self.itemInput=T.Edit(self.page,165,-37,L.contentW-192)
    self.itemInput:SetScript("OnTextChanged",function() V:UpdateItemPreview() end)
    self.icon=UI.CreateIcon(self.page,30)
    self.icon:SetPoint("TOPLEFT",12,-65)
    self.itemPreview=T.Label(self.page,"No item selected",50,-72,UI.fonts.sub)
    self.itemPreview:SetWidth(L.contentW-70)
    T.Label(self.page,"Roll Type",12,-107)
    self.rollType=T.Cycle(self.page,92,-102,135,{
        {label="Main Spec",value="MS"},{label="Off Spec",value="OS"},{label="Raid Roll",value="RAID"}
    },function(v) RTG.db.raidRoll.mode=v end)
    T.Label(self.page,"Duration",238,-107)
    self.duration=T.Cycle(self.page,308,-102,96,{"5","10","15","30","Custom"},function() V:UpdateDurationInput() end)
    self.duration:SetValues(self.duration.values, tostring(RTG.db.raidRoll.duration or 10))
    T.Label(self.page,"Custom seconds",12,-142)
    self.customDur=T.Edit(self.page,126,-136,80)
    self.customDur:SetMaxLetters(3)
    T.Button(self.page,"Start Roll",10,-172,111,function() V:Start() end)
    T.Button(self.page,"End Roll",127,-172,97,function() RTG.RollManager:Close() end)
    T.Button(self.page,"Cancel",231,-172,92,function() RTG.RollManager:Cancel() end)
    self.manual=T.Button(self.page,"Confirm: Auto",10,-204,134,function()
        local db=RTG.db.raidRoll
        db.manualConfirm=not db.manualConfirm
        V:Refresh()
    end)
    self.tie=T.Button(self.page,"Tie Reroll",149,-204,102,function() RTG.RollManager:TieReroll() end)
    self.confirm=T.Button(self.page,"Announce Winner",256,-204,143,function()
        RTG.RollManager:Confirm()
    end)
    self.timer=T.Label(self.page,"No roll in progress",12,-240,UI.fonts.sub)
    -- A hardware-click secure target button.  Never target people from
    -- OnUpdate/OnEvent; only an actual user click can trigger the action.
    self.winnerTarget=CreateFrame("Button",UI.NewName("WinnerTarget"),self.page,
        "SecureActionButtonTemplate,UIPanelButtonTemplate")
    self.winnerTarget:SetWidth(276)
    self.winnerTarget:SetHeight(25)
    self.winnerTarget:SetPoint("TOPLEFT",12,-267)
    self.winnerTarget:RegisterForClicks("AnyUp")
    self.winnerTarget:SetText("Target Winner")
    self.winnerTarget:SetScript("OnEnter",function(btn)
        GameTooltip:SetOwner(btn,"ANCHOR_TOP")
        GameTooltip:AddLine("Target the winning player",1,0.82,0)
        GameTooltip:AddLine("Click to select this raid member as your target.",0.93,0.88,0.76,true)
        GameTooltip:Show()
    end)
    self.winnerTarget:SetScript("OnLeave",UI.HideTooltip)
    self.winnerTarget:Hide()
    self.targetHint=T.Label(self.page,"",298,-274,UI.fonts.tiny)
    self.scroll,self.canvas=T.Scroll(self.page,L.contentW-46,-306,7)
    self:HideView()
end

function V:UpdateDurationInput()
    if self.duration:GetChoice()=="Custom" then self.customDur:SetFocus() end
end

function V:ShowItem(item)
    self.icon.icon:SetTexture(item.icon or RTG.QUESTION_ICON)
    self.itemPreview:SetText(item.name)
    local hex=RTG:QualityHex(item.quality)
    local r=tonumber(hex:sub(3,4),16) or 255
    local g=tonumber(hex:sub(5,6),16) or 255
    local b=tonumber(hex:sub(7,8),16) or 255
    self.itemPreview:SetTextColor(r/255,g/255,b/255)
end

function V:UpdateItemPreview()
    if not self.icon or not self.itemPreview or RTG.RollManager.active then return end
    local item=RTG.RollManager:Item(self.itemInput:GetText())
    if item then
        self:ShowItem(item)
    else
        self.icon.icon:SetTexture(RTG.QUESTION_ICON)
        self.itemPreview:SetText("Paste an item link or type its name")
        self.itemPreview:SetTextColor(unpack(UI.colors.parchment))
    end
end

function V:Start()
    local seconds=self.duration:GetChoice()
    if seconds=="Custom" then seconds=tonumber(self.customDur:GetText()) end
    local R=RTG.RollManager
    if R:Start(self.itemInput:GetText(),self.rollType:GetChoice(),seconds) then
        self.historyIndex=nil
    end
end

function V:UpdateCountdown()
    local a=RTG.RollManager.active
    if a then
        local remaining=math.max(0,math.ceil(a.ends-GetTime()))
        self.timer:SetText("ACTIVE ROLL: "..remaining.." seconds remaining  |  "..a.mode)
    end
end

function V:RefreshHistory()
    local h=RTG.db.raidRoll.history
    local c=self.centerCanvas
    c:Clear()
    c:Heading("ROLL HISTORY ("..#h..")")
    if #h==0 then c:Empty("No completed rolls yet.") end
    for i, entry in ipairs(h) do
        local index=i
        T.CanvasButton(c,entry.item.name .. "  " .. entry.roll,self.centerScroll.contentWidth-3,function()
            V.historyIndex=index; V:RenderLeaderboard(); V:UpdateWinnerTarget()
        end)
    end
    c:Finish(true)
end

function V:Refresh()
    if not self.f then return end
    local R=RTG.RollManager
    local db=RTG.db.raidRoll
    local a=R.active
    local lc=self.leftCanvas
    lc:Clear()
    lc:Heading("ROLL OPTIONS")
    T.Line(lc,"MS - Main Spec")
    T.Line(lc,"OS - Off Spec")
    T.Line(lc,"RAID - General")
    lc:Divider()
    T.Line(lc,"Only /roll 1-100 is accepted.")
    T.Line(lc,"One roll per raid member.")
    T.Line(lc,"Duplicates ignored.")
    T.Line(lc,"No automated loot awarding.")
    lc:Divider()
    T.CanvasButton(lc,"Clear History",self.leftScroll.contentWidth-3,function()
        StaticPopup_Show("RTG_CLEAR_ROLL_HISTORY")
    end)
    lc:Finish(true)
    self.f.centerCaption:SetText("RECENT ROLLS")
    self:RefreshHistory()
    self.manual:SetText(db.manualConfirm and "Confirm: Manual" or "Confirm: Auto")
    if db.mode then self.rollType:SetValues(self.rollType.values,db.mode) end
    self.icon.icon:SetTexture(RTG.QUESTION_ICON)
    if a then
        self:ShowItem(a.item)
    elseif R.pending then
        self:ShowItem(R.pending.item)
    elseif R.awaitingTie then
        self:ShowItem(R.awaitingTie.item)
    else
        self:UpdateItemPreview()
    end
    if a then self:UpdateCountdown()
    elseif R.pending then self.timer:SetText("ROLL CLOSED - waiting for winner confirmation")
    elseif R.awaitingTie then self.timer:SetText("TIED ROLL - choose Tie Reroll")
    else self.timer:SetText("No roll in progress") end
    if R.awaitingTie then self.tie:Enable() else self.tie:Disable() end
    if R.pending then self.confirm:Enable() else self.confirm:Disable() end
    self:RenderLeaderboard()
    self:UpdateWinnerTarget()
end

-- Match the winner to an actual raid unit so SecureActionButtonTemplate
-- can target them by a legitimate hardware click (including in combat).
local function unitForWinner(name)
    if not name then return nil end
    for i=1,GetNumRaidMembers() do
        local raidName=GetRaidRosterInfo(i)
        if raidName==name then return "raid"..i end
    end
end

function V:UpdateWinnerTarget()
    if not self.winnerTarget then return end
    local R=RTG.RollManager
    local entry
    if not R.active and not R.pending and not R.awaitingTie then
        entry = (self.historyIndex and RTG.db.raidRoll.history[self.historyIndex])
            or R.lastWinner
    end
    local winner = entry and entry.winner
    local unit=unitForWinner(winner)
    if InCombatLockdown and InCombatLockdown() then
        -- Secure attributes and visibility cannot be changed in combat.
        -- Update after PLAYER_REGEN_ENABLED instead of risking blocked actions.
        self.targetHint:SetText("Target updates after combat")
        return
    end
    if not winner then
        self.winnerTarget:Hide()
        self.targetHint:SetText("")
        return
    end
    self.winnerTarget:SetText("Target Winner: "..winner)
    self.winnerTarget:SetAttribute("type",unit and "target" or nil)
    self.winnerTarget:SetAttribute("unit",unit)
    if unit then
        self.winnerTarget:Enable()
        self.targetHint:SetText("Click to target")
    else
        self.winnerTarget:Disable()
        self.targetHint:SetText("Winner not in raid")
    end
    self.winnerTarget:Show()
end

local winnerTargetEvents=CreateFrame("Frame")
winnerTargetEvents:RegisterEvent("RAID_ROSTER_UPDATE")
winnerTargetEvents:RegisterEvent("PLAYER_REGEN_ENABLED")
winnerTargetEvents:SetScript("OnEvent",function()
    if RTG.views.rolls and RTG.views.rolls.winnerTarget then
        RTG.views.rolls:UpdateWinnerTarget()
    end
end)

function V:RenderLeaderboard()
    local c=self.canvas
    local R=RTG.RollManager
    local a=R.active or R.pending or R.awaitingTie
    c:Clear()
    if a then
        c:Heading(a.item.name,{icon=a.item.icon})
        T.Line(c,"Type: " .. a.mode)
        if R.awaitingTie then
            c:Heading("TIE - REROLL REQUIRED",{color=UI.colors.orange})
        elseif R.pending then
            c:Heading("SELECT / CONFIRM WINNER",{color=UI.colors.green})
        else
            c:Heading("LIVE PLAYER ROLLS")
        end
        local results=R:Sorted()
        if #results==0 then c:Empty("Waiting for valid in-game player /roll results...") end
        for i, entry in ipairs(results) do
            local name=entry.name
            local txt=i .. ".  " .. entry.name .. "   -   " .. entry.roll
            local col=entry.roll == results[1].roll and UI.colors.gold or UI.colors.parchment
            local _,h=c:Text(txt,UI.fonts.body,0,nil,col)
            c.y=c.y+h+3
            if R.pending then
                local pick=T.CanvasButton(c,(R.pending.selected==name and "[SELECTED]" or "Select winner"),122,function()
                    R.pending.selected=name
                    V:RenderLeaderboard()
                end)
                c:Gap(4)
            elseif R.active then
                T.CanvasButton(c,"Remove invalid",104,function() R:Remove(name) end)
            else
                c:Gap(3)
            end
        end
    else
        local h=self.historyIndex and RTG.db.raidRoll.history[self.historyIndex]
        if h then
            c:Heading("ROLL HISTORY")
            T.Line(c,"Item: " .. h.item.name)
            T.Line(c,"Mode: " .. h.mode)
            T.Line(c,"Winner: " .. h.winner .. " (" .. h.roll .. ")",nil,UI.colors.green)
            T.Line(c,"Date: " .. (h.date or "Unknown"))
            c:Divider()
            for i,p in ipairs(h.participants or {}) do
                T.Line(c,i .. ". " .. p.name .. " - " .. p.roll)
            end
        else
            c:Empty("Insert an item, choose MS / OS / Raid Roll, then start the timer. The results appear here.")
        end
    end
    c:Finish(true)
end

-- Retail-only C_Container APIs are not used; legacy chat shift-click hooks
-- insert the clicked link into the raid roll edit box when focused.
if ChatEdit_InsertLink and hooksecurefunc then
    hooksecurefunc("ChatEdit_InsertLink",function(link)
        local edit=V.itemInput
        if edit and edit:HasFocus() and type(link)=="string" and link:find("|Hitem:",1,true) then
            edit:Insert(link)
            edit:ClearFocus()
            if not RTG.RollManager.active then V:Refresh() end
        end
    end)
end
