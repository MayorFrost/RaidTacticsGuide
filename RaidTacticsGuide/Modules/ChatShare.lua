--[[
    Raid Tactics Guide - Raid chat sharing
    --------------------------------------
    Turns a boss's tactics into short, numbered chat lines and sends them to
    /raid with a small delay between messages.

    Where the lines come from:
      1. tactics.chat.<mode>  (hand-written, chat-friendly lines - preferred)
      2. otherwise generated from the guide text (bullets and sentences)

    Every message is cleaned of colour codes / textures / "|" characters and
    split on word boundaries so it never exceeds the 3.3.5a limit of 255 bytes.
    What can be sent is configured in Config.lua (chat = { ... }).
]]

local RTG = RaidTacticsGuide

local HARD_LIMIT = 255

local function cfg() return RTG.config.chat or {} end

------------------------------------------------------------------------------
-- Splitting
------------------------------------------------------------------------------

-- Cut a string at most maxBytes long without breaking a UTF-8 character.
local function utf8Cut(s, maxBytes)
    if #s <= maxBytes then return s, "" end
    local cut = maxBytes
    -- step back while the next byte is a UTF-8 continuation byte (10xxxxxx)
    while cut > 0 do
        local nextByte = s:byte(cut + 1)
        if not nextByte or nextByte < 0x80 or nextByte >= 0xC0 then break end
        cut = cut - 1
    end
    return s:sub(1, cut), s:sub(cut + 1)
end

--- Split one line into pieces of at most maxLen bytes, on word boundaries.
function RTG:SplitChatLine(text, maxLen)
    local pieces = {}
    text = text or ""
    if #text <= maxLen then
        pieces[1] = text
        return pieces
    end
    local current = ""
    for word in text:gmatch("%S+") do
        while #word > maxLen do
            -- a single huge "word": hard cut it
            if current ~= "" then
                table.insert(pieces, current)
                current = ""
            end
            local head, tail = utf8Cut(word, maxLen)
            table.insert(pieces, head)
            word = tail
        end
        if current == "" then
            current = word
        elseif #current + 1 + #word <= maxLen then
            current = current .. " " .. word
        else
            table.insert(pieces, current)
            current = word
        end
    end
    if current ~= "" then table.insert(pieces, current) end
    return pieces
end

------------------------------------------------------------------------------
-- Building the message list
------------------------------------------------------------------------------

-- Turn guide text into a list of instruction lines (one per bullet/paragraph sentence group).
local function linesFromText(text, limit)
    local out = {}
    for _, block in ipairs(RTG:ParseBlocks(text or "")) do
        if block.kind == "bullet" or block.kind == "para" then
            local clean = RTG:ToChatText(block.text)
            if clean ~= "" then table.insert(out, clean) end
        end
        if limit and #out >= limit then break end
    end
    return out
end

local function chatLines(t, key, fallbackText, limit)
    if t.chat and type(t.chat[key]) == "table" and #t.chat[key] > 0 then
        local out = {}
        for _, l in ipairs(t.chat[key]) do
            local clean = RTG:ToChatText(l)
            if clean ~= "" then table.insert(out, clean) end
        end
        return out
    end
    return linesFromText(fallbackText, limit)
end

local MODE_TITLE = {
    summary = "Summary", full = "Full strategy", tank = "Tanks",
    healer = "Healers", dps = "DPS", warnings = "Warnings",
}

--- Returns the final list of chat messages (already prefixed, numbered and split).
function RTG:BuildChatMessages(bossKey, mode)
    local boss = self.BossesByKey[bossKey]
    local t = self.Tactics[bossKey]
    if not boss or not t then return {} end
    local c = cfg()
    mode = mode or c.defaultMode or "summary"

    -- groups = { { label = "TANKS", lines = {...} }, ... }
    local groups = {}
    if mode == "summary" then
        table.insert(groups, { lines = chatLines(t, "summary", t.overview, 4) })
    elseif mode == "full" then
        table.insert(groups, { lines = chatLines(t, "summary", t.overview, 4) })
        table.insert(groups, { label = "TANKS", lines = chatLines(t, "tank", t.tank, 3) })
        table.insert(groups, { label = "HEALERS", lines = chatLines(t, "healer", t.healer, 3) })
        table.insert(groups, { label = "DPS", lines = chatLines(t, "dps", t.dps, 3) })
    elseif mode == "tank" then
        table.insert(groups, { label = "TANKS", lines = chatLines(t, "tank", t.tank, 5) })
    elseif mode == "healer" then
        table.insert(groups, { label = "HEALERS", lines = chatLines(t, "healer", t.healer, 5) })
    elseif mode == "dps" then
        table.insert(groups, { label = "DPS", lines = chatLines(t, "dps", t.dps, 5) })
    elseif mode == "warnings" then
        table.insert(groups, { label = "WARNING", lines = chatLines(t, "warnings", t.warnings, 6) })
    end

    local prefix = c.prefix or ""
    if prefix ~= "" then prefix = prefix .. " " end
    local maxLen = math.min(c.maxLength or 240, HARD_LIMIT)
    local messages = {}

    local function add(text)
        -- every message must fit: prefix + text
        local room = maxLen - #prefix
        if room < 40 then room = 40 end
        local pieces = self:SplitChatLine(text, room)
        for i, piece in ipairs(pieces) do
            local msg = prefix .. (i > 1 and "... " or "") .. piece
            if #msg > HARD_LIMIT then msg = (utf8Cut(msg, HARD_LIMIT)) end
            table.insert(messages, msg)
        end
    end

    if c.includeHeader ~= false then
        add("=== " .. boss.name .. " - " .. (MODE_TITLE[mode] or mode) .. " ===")
    end
    local n = 0
    for _, g in ipairs(groups) do
        for _, line in ipairs(g.lines) do
            n = n + 1
            local text = line
            if g.label then text = g.label .. ": " .. text end
            if c.numberLines ~= false then text = n .. ") " .. text end
            add(text)
        end
    end

    local cap = c.maxMessages or 18
    if #messages > cap then
        for i = #messages, cap, -1 do messages[i] = nil end
        table.insert(messages, prefix .. "(more in the Raid Tactics Guide addon)")
    end
    return messages
end

------------------------------------------------------------------------------
-- Sending (throttled queue)
------------------------------------------------------------------------------

local queue = {}
local channelInUse
local sender = CreateFrame("Frame")
sender:Hide()
local waited = 0

local function groupChannel()
    local _, instanceType = IsInInstance()
    if instanceType == "pvp" then
        return nil, "Raid chat is not available in battlegrounds."
    end
    if GetNumRaidMembers() > 0 then
        return cfg().channel or "RAID"
    end
    if cfg().allowPartyFallback and GetNumPartyMembers() > 0 then
        return "PARTY"
    end
    return nil, "You are not in a raid group. Join or form a raid to share tactics (right-click the button to preview them yourself)."
end

sender:SetScript("OnUpdate", function(self, elapsed)
    waited = waited + elapsed
    if waited < (cfg().delay or 0.7) then return end
    waited = 0
    local msg = table.remove(queue, 1)
    if not msg then
        self:Hide()
        if RTG.TacticsView then RTG.TacticsView:UpdateToolbar(RTG.RaidView:Boss(), true) end
        return
    end
    -- stop if we left the group while sending
    local channel = groupChannel()
    local stillValid = (channel == channelInUse)
    if channelInUse == "RAID" or channelInUse == "RAID_WARNING" then
        stillValid = GetNumRaidMembers() > 0
    end
    if not stillValid then
        wipe(queue)
        self:Hide()
        RTG:Notify("Stopped sending raid messages: you are no longer in the group.")
        if RTG.TacticsView then RTG.TacticsView:UpdateToolbar(RTG.RaidView:Boss(), true) end
        return
    end
    SendChatMessage(msg, channelInUse)
end)

function RTG:ChatQueueActive()
    return #queue > 0
end

function RTG:SendTactics(bossKey, mode)
    if #queue > 0 then
        self:Notify("Still sending the previous tactics, please wait.")
        return
    end
    local channel, err = groupChannel()
    if not channel then
        self:Notify(err)
        return
    end
    local messages = self:BuildChatMessages(bossKey, mode)
    if #messages == 0 then
        self:Notify("There are no tactics to share for this boss yet.")
        return
    end
    channelInUse = channel
    for _, m in ipairs(messages) do table.insert(queue, m) end
    waited = cfg().delay or 0.7   -- send the first line immediately
    sender:Show()
    self:Print("Sending " .. #messages .. " message(s) to " .. channel:lower() .. " chat...")
    if self.TacticsView then self.TacticsView:UpdateToolbar(self.RaidView:Boss(), true) end
end

--- Print the messages locally so the player can check them first.
function RTG:PreviewTactics(bossKey, mode)
    local messages = self:BuildChatMessages(bossKey, mode)
    if #messages == 0 then
        self:Print("There are no tactics to share for this boss yet.")
        return
    end
    self:Print("Preview (" .. #messages .. " messages, only you can see this):")
    for _, m in ipairs(messages) do
        DEFAULT_CHAT_FRAME:AddMessage("|cffff7f00" .. m .. "|r")
    end
end

------------------------------------------------------------------------------
-- Raid tool announcements (share the existing, throttled tactics queue).
------------------------------------------------------------------------------

local function warningAllowed()
    if GetNumRaidMembers() == 0 then return false end
    for i = 1, GetNumRaidMembers() do
        local name, rank = GetRaidRosterInfo(i)
        if name and UnitName("player") == name and rank and rank > 0 then
            return true
        end
    end
    return false
end

function RTG:SendRaidLines(lines, preferWarning)
    if GetNumRaidMembers() == 0 then
        self:Notify("You must be in a raid to make announcements.")
        return false
    end
    local channel = preferWarning and warningAllowed() and "RAID_WARNING" or "RAID"
    if #queue > 0 and channelInUse ~= channel then
        -- The queue is sent on a single channel; preserve its ordering and type.
        self:Notify("Wait until the previous raid announcement is sent.")
        return false
    end
    local count = 0
    for _, line in ipairs(lines or {}) do
        if count >= 35 then break end
        local msg = tostring(line or "")
        -- Only the item-link format is allowed to retain WoW hyperlink pipes.
        if msg:find("|", 1, true) then
            local link = msg:match("|c%x%x%x%x%x%x%x%x|Hitem:[^|]+|h%[[^%]]+%]|h|r")
                or msg:match("|Hitem:[^|]+|h%[[^%]]+%]|h")
            if link and #link < 190 then
                local placeholder = "RTGITEMLINKTOKEN"
                msg = msg:gsub("|c%x%x%x%x%x%x%x%x|Hitem:[^|]+|h%[[^%]]+%]|h|r", placeholder, 1)
                msg = msg:gsub("|Hitem:[^|]+|h%[[^%]]+%]|h", placeholder, 1)
                msg = RTG:ToChatText(msg):gsub(placeholder, link)
            else
                msg = RTG:ToChatText(msg)
            end
        else
            msg = RTG:ToChatText(msg)
        end
        if msg ~= "" then
            if #msg > 240 then
                -- A normal sentence may be split; a long item link falls back
                -- to a plain cleaned line rather than emitting a broken link.
                if msg:find("|Hitem:", 1, true) then
                    msg = RTG:ToChatText(msg)
                end
                for _, part in ipairs(self:SplitChatLine(msg, 240)) do
                    table.insert(queue, part)
                    count = count + 1
                end
            else
                table.insert(queue, msg)
                count = count + 1
            end
        end
    end
    if count == 0 then return false end
    channelInUse = channel
    waited = cfg().delay or 0.7
    sender:Show()
    return true
end
