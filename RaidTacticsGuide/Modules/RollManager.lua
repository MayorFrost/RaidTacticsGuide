-- Raid Roll Manager for WoW 3.3.5a. Never generates a roll itself and never
-- awards loot. Only the local addon owner sees the session and records it.
local RTG = RaidTacticsGuide
local T = RTG.Tools
local R = { active=nil, pending=nil, awaitingTie=nil }
RTG.RollManager = R

local function copyResults(results)
    local rows={}
    for _,p in pairs(results or {}) do
        table.insert(rows,{name=p.name,roll=p.roll})
    end
    table.sort(rows,function(a,b)
        if a.roll~=b.roll then return a.roll>b.roll end
        return a.name<b.name
    end)
    return rows
end

function R:Sorted()
    if self.active then return copyResults(self.active.results) end
    if self.pending then return copyResults(self.pending.results) end
    if self.awaitingTie then return copyResults(self.awaitingTie.results) end
    return {}
end

-- Accept cached item links and manually entered names. For uncached item
-- names GetItemInfo will return nil, but they can still be announced as text.
function R:Item(text)
    text = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if #text==0 then return nil end
    local link = text:match("|c%x%x%x%x%x%x%x%x|Hitem:[^|]+|h%[[^%]]+%]|h|r")
        or text:match("|Hitem:[^|]+|h%[[^%]]+%]|h")
    local query = link or text
    local name, realLink, quality, _, _, _, _, _, _, icon = GetItemInfo(query)
    if link then
        name = name or link:match("|h%[(.-)%]|h")
        -- Reuse the real item link if cached; otherwise preserve the pasted link.
        realLink = realLink or link
    end
    name = name or RTG:ToChatText(text):sub(1,90)
    if name=="" then return nil end
    return {name=name,link=realLink,quality=quality,icon=icon or RTG.QUESTION_ICON}
end

function R:Start(itemText, rollType, seconds, allowed)
    if self.active or self.pending or self.awaitingTie then
        RTG:Notify("Finish the current roll, confirm its winner, or cancel it first.")
        return false
    end
    local item = type(itemText)=="table" and itemText or self:Item(itemText)
    if not item then RTG:Notify("Enter a valid item or item link."); return false end
    if GetNumRaidMembers()<=0 then RTG:Notify("You must be in a raid to start a roll."); return false end
    local duration=tonumber(seconds)
    if not duration or duration<3 or duration>180 then RTG:Notify("Roll duration must be 3 to 180 seconds."); return false end
    -- Especially for five-second rolls, waiting behind a previous chat queue
    -- could mean the announcement arrives after the roll is already closed.
    if RTG:ChatQueueActive() then
        RTG:Notify("Finish sending the previous raid announcement before starting a roll.")
        return false
    end
    rollType = rollType == "OS" and "OS" or rollType == "RAID" and "RAID" or "MS"
    local typeLabel = rollType=="MS" and "MAIN SPEC" or rollType=="OS" and "OFF SPEC" or "RAID"
    local label = item.link or RTG:ToChatText(item.name)
    local announce={"[RTG] "..typeLabel.." ROLL: "..label,
        "[RTG] /roll 1-100 - " .. duration .. " seconds"}
    if allowed then table.insert(announce,"[RTG] TIE REROLL: Only the previously tied players may roll.") end
    if not RTG:SendRaidLines(announce,true) then
        RTG:Notify("Roll not started because the announcement could not be sent.")
        return false
    end
    self.pending=nil
    self.awaitingTie=nil
    self.lastWinner=nil
    if RTG.views.rolls then RTG.views.rolls.historyIndex=nil end
    local startTime = GetTime()
    local session = {
        item=item, mode=rollType, duration=duration, started=startTime,
        ends=startTime+duration, results={}, allowed=allowed,
    }
    self.active=session
    RTG.db.raidRoll.duration=duration
    RTG.db.raidRoll.mode=rollType
    self:Redraw()
    return true
end

function R:Accept(name,value,minimum,maximum)
    local a=self.active
    if not a or GetTime()<a.started or GetTime()>=a.ends then return false end
    if minimum~=1 or maximum~=100 or value<1 or value>100 then return false end
    local raidMember=T.FindInRaid(name)
    if not raidMember then return false end
    name=raidMember.name
    if a.allowed and not a.allowed[name] then return false end
    if a.results[name] then return false end
    a.results[name]={name=name,roll=value}
    self:Redraw()
    return true
end

function R:Remove(name)
    if not self.active then return end
    self.active.results[name]=nil
    self:Redraw()
end

function R:Redraw()
    if RTG.mode=="rolls" and RTG.views.rolls then RTG.views.rolls:Refresh() end
end

function R:AnnounceWinner(name)
    local a=self.pending
    if not a or not a.results[name] then RTG:Notify("Select a valid participant first."); return end
    local p=a.results[name]
    local item=a.item
    local label=item.link or RTG:ToChatText(item.name)
    if not RTG:SendRaidLines({"[RTG] ROLL CLOSED: "..label,
        "[RTG] WINNER: "..name.." - "..p.roll.." ("..a.mode..")"},true) then
        RTG:Notify("Winner not announced. Try Announce Winner after the current chat queue clears.")
        return false
    end
    local history=RTG.db.raidRoll.history
    table.insert(history,1,{item=item,mode=a.mode,winner=name,roll=p.roll,
        date=date("%Y-%m-%d %H:%M"),participants=copyResults(a.results)})
    while #history>60 do table.remove(history) end
    self.pending=nil
    self.lastWinner = history[1]
    if RTG.views.rolls then RTG.views.rolls.historyIndex=1 end
    self:Redraw()
    return true
end

function R:Close()
    local a=self.active
    if not a then return end
    self.active=nil
    local results=copyResults(a.results)
    if #results==0 then
        RTG:SendRaidLines({"[RTG] ROLL CLOSED: No valid rolls for " .. (a.item.link or a.item.name)},true)
        self.pending=nil
        self.awaitingTie=nil
        self.lastWinner=nil
        if RTG.views.rolls then RTG.views.rolls.historyIndex=nil end
        self:Redraw()
        return
    end
    local tied={}
    for _,p in ipairs(results) do
        if p.roll==results[1].roll then tied[p.name]=true end
    end
    local tieNames={}
    for name in pairs(tied) do table.insert(tieNames,name) end
    table.sort(tieNames)
    if #tieNames>1 then
        self.awaitingTie = a
        self.awaitingTie.tied = tied
        RTG:SendRaidLines({"[RTG] TIE: "..table.concat(tieNames,", ") .. " rolled " .. results[1].roll,
            "[RTG] Reroll required."},true)
    else
        self.pending=a
        self.pending.selected=results[1].name
        if not RTG.db.raidRoll.manualConfirm then
            self:AnnounceWinner(results[1].name)
        end
    end
    self:Redraw()
end

function R:TieReroll()
    if not self.awaitingTie then return end
    local a=self.awaitingTie
    -- Start() disallows concurrent sessions, so temporarily clear the tie.
    -- If the raid changed or its chat queue is busy, restore the tied round.
    self.awaitingTie=nil
    if not self:Start(a.item,a.mode,a.duration,a.tied) then
        self.awaitingTie=a
        self:Redraw()
    end
end

function R:Cancel()
    self.active=nil; self.pending=nil; self.awaitingTie=nil; self.lastWinner=nil
    if RTG.views.rolls then RTG.views.rolls.historyIndex=nil end
    RTG:Print("Roll cancelled. No winner announced.")
    self:Redraw()
end

function R:Confirm(name)
    if self.active then self:Close() end
    if not self.pending then return end
    self:AnnounceWinner(name or self.pending.selected)
end

local function rollPattern()
    local fmt=RANDOM_ROLL_RESULT or "%s rolls %d (%d-%d)"
    return "^" .. fmt:gsub("%(","%%("):gsub("%)","%%)"):gsub("%-","%%-")
        :gsub("%%s","(.+)"):gsub("%%d","(%%d+)") .. "%.?$"
end

local eventFrame=CreateFrame("Frame")
eventFrame:RegisterEvent("CHAT_MSG_SYSTEM")
eventFrame:SetScript("OnEvent",function(self,event,msg)
    if not R.active then return end
    local name,roll,low,high = tostring(msg or ""):match(rollPattern())
    if name and roll and low and high then
        R:Accept(name,tonumber(roll),tonumber(low),tonumber(high))
    end
end)
local accumulator=0
eventFrame:SetScript("OnUpdate",function(self,elapsed)
    if not R.active then return end
    accumulator=accumulator+elapsed
    if accumulator<0.1 then return end
    accumulator=0
    if GetTime()>=R.active.ends then
        R:Close()
    elseif RTG.mode=="rolls" and RTG.views.rolls then
        RTG.views.rolls:UpdateCountdown()
    end
end)

StaticPopupDialogs["RTG_CLEAR_ROLL_HISTORY"]={
    text="Clear all saved RTG item roll history?",
    button1=YES,button2=NO,timeout=0,whileDead=1,hideOnEscape=1,
    OnAccept=function()
        RTG.db.raidRoll.history={}
        if RTG.views.rolls then RTG.views.rolls:Refresh() end
    end,
}
