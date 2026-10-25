--[[
    Raid Tactics Guide - Core
    -------------------------
    Namespace, data registration API, saved variables, shared helpers
    and slash commands. Contains no content: all raids, tactics, loot,
    classes and rotations live in the Data\ folder and are registered
    through the RTG:Register* functions below.

    Target client: World of Warcraft 3.3.5a (Lua 5.1, interface 30300).
]]

RaidTacticsGuide = RaidTacticsGuide or {}
local RTG = RaidTacticsGuide

RTG.version   = "1.7.0"
RTG.config    = RaidTacticsGuideConfig or {}

-- Registries -----------------------------------------------------------------
RTG.Raids        = {}   -- ordered list of raid definitions
RTG.RaidsByKey   = {}
RTG.BossesByKey  = {}   -- bossKey -> boss definition (with .raid back-reference)
RTG.Tactics      = {}   -- bossKey -> tactics table
RTG.Loot         = {}   -- bossKey -> loot table
RTG.Classes      = {}   -- ordered list of class definitions
RTG.ClassesByKey = {}
RTG.Specs        = {}   -- classKey -> specKey -> rotation data
RTG.loadWarnings = {}
RTG.views        = {}   -- UI views (raids, classes), filled by the UI files

local function warn(msg)
    table.insert(RTG.loadWarnings, msg)
end
RTG.Warn = warn

------------------------------------------------------------------------------
-- Registration API (used by the files in Data\)
------------------------------------------------------------------------------

--- Register a raid and its encounter list.
-- def = { key, name, short, tier, icon, iconSpell, sizes = {10,25}, hasHeroic,
--         heroicLabel, description, bosses = { {key, name, npc, iconSpell, icon, area}, ... } }
function RTG:RegisterRaid(def)
    if type(def) ~= "table" or not def.key then
        warn("RegisterRaid called without a key")
        return
    end
    if self.RaidsByKey[def.key] then
        warn("Raid registered twice: " .. def.key)
        return
    end
    def.bosses = def.bosses or {}
    def.sizes = def.sizes or { 10, 25 }
    for index, boss in ipairs(def.bosses) do
        boss.raid  = def
        boss.index = index
        if boss.key then
            self.BossesByKey[boss.key] = boss
        else
            warn("Boss without key in raid " .. def.key)
        end
    end
    table.insert(self.Raids, def)
    self.RaidsByKey[def.key] = def
end

--- Register (or replace) the tactics guide of one boss.
function RTG:RegisterTactics(bossKey, data)
    if type(bossKey) ~= "string" or type(data) ~= "table" then
        warn("RegisterTactics: bad arguments")
        return
    end
    if not self.BossesByKey[bossKey] then
        warn("Tactics for unknown boss key: " .. bossKey)
    end
    self.Tactics[bossKey] = data
end

--- Register (or replace) the loot of one boss.
-- data = { ["10N"] = {...}, ["10H"] = ..., ["25N"] = ..., ["25H"] = ... }
-- or, for faction-specific loot, { Alliance = { ["10N"] = ... }, Horde = { ... } }
-- Each list entry: { id, "Name", quality, "Slot / type" } or { header = "Hard Mode" }
function RTG:RegisterLoot(bossKey, data)
    if type(bossKey) ~= "string" or type(data) ~= "table" then
        warn("RegisterLoot: bad arguments")
        return
    end
    self.Loot[bossKey] = data
end

--- Register a class. def = { key = "PALADIN", name = "Paladin", specs = { {key, name, role, iconSpell, icon}, ... } }
function RTG:RegisterClass(def)
    if type(def) ~= "table" or not def.key then
        warn("RegisterClass called without a key")
        return
    end
    def.specs = def.specs or {}
    if not self.ClassesByKey[def.key] then
        table.insert(self.Classes, def)
    end
    self.ClassesByKey[def.key] = def
    self.Specs[def.key] = self.Specs[def.key] or {}
end

--- Register the rotation guide of one specialization.
function RTG:RegisterSpec(classKey, specKey, data)
    if type(classKey) ~= "string" or type(specKey) ~= "string" or type(data) ~= "table" then
        warn("RegisterSpec: bad arguments")
        return
    end
    self.Specs[classKey] = self.Specs[classKey] or {}
    self.Specs[classKey][specKey] = data
    local class = self.ClassesByKey[classKey]
    if not class then
        warn("Rotation for unknown class: " .. classKey)
        return
    end
    local found = false
    for _, spec in ipairs(class.specs) do
        if spec.key == specKey then found = true break end
    end
    if not found then
        -- A brand new specialization added purely from a data file.
        table.insert(class.specs, { key = specKey, name = data.name or specKey, role = data.role })
    end
end

------------------------------------------------------------------------------
-- Lookup helpers
------------------------------------------------------------------------------

function RTG:GetRaid(key)       return self.RaidsByKey[key] end
function RTG:GetBoss(key)       return self.BossesByKey[key] end
function RTG:GetTactics(key)    return self.Tactics[key] end
function RTG:GetLoot(key)       return self.Loot[key] end
function RTG:GetClass(key)      return self.ClassesByKey[key] end

function RTG:GetSpec(classKey, specKey)
    return self.Specs[classKey] and self.Specs[classKey][specKey]
end

function RTG:GetSpecInfo(classKey, specKey)
    local class = self.ClassesByKey[classKey]
    if not class then return nil end
    for _, spec in ipairs(class.specs) do
        if spec.key == specKey then return spec end
    end
end

------------------------------------------------------------------------------
-- Messages
------------------------------------------------------------------------------

local CHAT_PREFIX = "|cffd4a017Raid Tactics Guide:|r "

function RTG:Print(msg)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage(CHAT_PREFIX .. tostring(msg))
    end
end

function RTG:Notify(msg)
    self:Print(msg)
    if UIErrorsFrame then
        UIErrorsFrame:AddMessage(msg, 1.0, 0.82, 0.0, 1.0, 4)
    end
end

------------------------------------------------------------------------------
-- Spell / texture helpers
------------------------------------------------------------------------------

RTG.QUESTION_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"

local spellCache = {}

--- Returns name, icon for a spell id (cached). Either may be nil.
function RTG:SpellInfo(spellId)
    if not spellId then return nil end
    local cached = spellCache[spellId]
    if cached then return cached[1], cached[2] end
    local name, _, icon = GetSpellInfo(spellId)
    if name then
        spellCache[spellId] = { name, icon }
    end
    return name, icon
end

--- Resolve name and icon for a data entry that may contain id/spellId, name and icon.
-- Priority for the icon: explicit icon path > icon of the spell id > icon of the
-- spell name (only works for spells the player knows) > question mark.
function RTG:ResolveSpell(entry)
    if type(entry) ~= "table" then return "?", self.QUESTION_ICON end
    local id = entry.id or entry.spellId
    local sName, sIcon = self:SpellInfo(id)
    local name = entry.name or sName or "?"
    local icon = entry.icon
    if not icon then
        icon = sIcon
        if not icon and entry.name then
            local _, _, byName = GetSpellInfo(entry.name)
            icon = byName
        end
    end
    return name, icon or self.QUESTION_ICON, id
end

-- In 3.3.5a Texture:SetTexture(path) returns 1 when the file exists and nil
-- when it does not. We only trust a nil once we've seen the API return a
-- success value, so this keeps working on clients that return nothing.
local setTextureReturnsValues = false
local probed = false

local function probeSetTexture()
    probed = true
    local f = CreateFrame("Frame")
    local t = f:CreateTexture()
    if t:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") then
        setTextureReturnsValues = true
    end
    f:Hide()
end

--- Set the first texture path that exists. Arguments after tex are candidates.
function RTG:SetTextureSafe(tex, ...)
    if not probed then probeSetTexture() end
    for i = 1, select("#", ...) do
        local path = select(i, ...)
        if type(path) == "string" and path ~= "" then
            local ok = tex:SetTexture(path)
            if ok then
                setTextureReturnsValues = true
                return path
            elseif not setTextureReturnsValues then
                return path   -- cannot tell; assume it worked
            end
        end
    end
    tex:SetTexture(self.QUESTION_ICON)
    return self.QUESTION_ICON
end

--- Icon candidates for a raid or boss definition ({ icon = path, iconSpell = id }).
-- Returns the explicit path first and the spell's icon as a fallback;
-- pass both to SetTextureSafe.
function RTG:DefIcon(def)
    if not def then return self.QUESTION_ICON end
    local _, spellIcon = self:SpellInfo(def.iconSpell)
    if def.icon then return def.icon, spellIcon end
    return spellIcon
end

------------------------------------------------------------------------------
-- Text helpers
------------------------------------------------------------------------------

--- Expand {spell:12345} tokens into an inline icon + coloured spell name.
function RTG:ExpandTokens(text)
    if type(text) ~= "string" then return "" end
    return (text:gsub("{spell:(%d+)}", function(id)
        local name, icon = RTG:SpellInfo(tonumber(id))
        if not name then return "|cff71d5ff[spell " .. id .. "]|r" end
        return "|T" .. icon .. ":14:14:0:0|t|cff71d5ff" .. name .. "|r"
    end))
end

--- Strip anything that must not be sent through SendChatMessage.
-- (Raw "|" characters in chat can disconnect the client in 3.3.5a.)
function RTG:ToChatText(text)
    if type(text) ~= "string" then return "" end
    text = text:gsub("{spell:(%d+)}", function(id)
        local name = RTG:SpellInfo(tonumber(id))
        return name or ""
    end)
    text = text:gsub("|c%x%x%x%x%x%x%x%x", "")
    text = text:gsub("|r", "")
    text = text:gsub("|T.-|t", "")
    text = text:gsub("|", "/")
    text = text:gsub("[\r\n\t]+", " ")
    text = text:gsub("%s%s+", " ")
    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    return text
end

--- Split a block of text (with "- " bullets, "# " headings and blank lines)
-- into a list of { kind = "heading"|"bullet"|"para"|"gap", text = "..." }.
function RTG:ParseBlocks(text)
    local blocks = {}
    if type(text) ~= "string" or text == "" then return blocks end
    text = text:gsub("\r\n", "\n")
    local para
    local function flush()
        if para then
            table.insert(blocks, { kind = "para", text = para })
            para = nil
        end
    end
    for line in (text .. "\n"):gmatch("(.-)\n") do
        local trimmed = line:gsub("^%s+", ""):gsub("%s+$", "")
        if trimmed == "" then
            flush()
            if #blocks > 0 and blocks[#blocks].kind ~= "gap" then
                table.insert(blocks, { kind = "gap" })
            end
        elseif trimmed:match("^#%s") then
            flush()
            table.insert(blocks, { kind = "heading", text = trimmed:gsub("^#%s+", "") })
        elseif trimmed:match("^[-*]%s") then
            flush()
            table.insert(blocks, { kind = "bullet", text = trimmed:gsub("^[-*]%s+", "") })
        else
            para = para and (para .. "\n" .. trimmed) or trimmed
        end
    end
    flush()
    while #blocks > 0 and blocks[#blocks].kind == "gap" do
        table.remove(blocks)
    end
    return blocks
end

-- Item quality colours (3.3.5a has ITEM_QUALITY_COLORS, but we keep a copy so
-- uncached items still show the right colour).
RTG.QUALITY_COLORS = {
    [0] = "ff9d9d9d", [1] = "ffffffff", [2] = "ff1eff00", [3] = "ff0070dd",
    [4] = "ffa335ee", [5] = "ffff8000", [6] = "ffe6cc80", [7] = "ffe6cc80",
}

function RTG:QualityHex(q)
    return self.QUALITY_COLORS[q or 1] or "ffffffff"
end

------------------------------------------------------------------------------
-- Saved variables
------------------------------------------------------------------------------

local DB_DEFAULTS = {
    minimap   = { angle = 215, hide = false },
    window    = { scale = nil, point = nil },
    mode      = "raids",      -- raids, classes, professions or rolls
    raid      = nil,
    boss      = nil,
    tab       = nil,
    collapsed = {},           -- tier headers collapsed in the raid list
    loot      = { size = nil, heroic = nil, faction = nil },
    chatMode  = nil,
    class     = nil,
    spec      = nil,
    category  = {},           -- classKey.specKey -> category index
    overrides = {},           -- in-game edits of class guide text
    customNotes = {},         -- notes added in-game
    raidRoll = { duration = 10, mode = "MS", manualConfirm = false, history = {} },
    professions = { selected = "tailoring", tab = "guide", ranges = {}, collected = {} },
}

local function copyDefaults(dst, src)
    for k, v in pairs(src) do
        if type(v) == "table" then
            if type(dst[k]) ~= "table" then dst[k] = {} end
            copyDefaults(dst[k], v)
        elseif dst[k] == nil then
            dst[k] = v
        end
    end
end

function RTG:InitDB()
    if type(RaidTacticsGuideDB) ~= "table" then
        RaidTacticsGuideDB = {}
    end
    copyDefaults(RaidTacticsGuideDB, DB_DEFAULTS)
    self.db = RaidTacticsGuideDB
    -- Retire removed buff pages and their saved settings.
    self.db.buffCaller = nil
    self.db.buffTracker = nil
    if self.db.mode == "caller" or self.db.mode == "buffs" then self.db.mode = "raids" end
    if self.db.mode == "dungeons" then self.db.mode = "raids" end
    -- Forget selections that point to content that no longer exists.
    if self.db.raid and not self.RaidsByKey[self.db.raid] then self.db.raid = nil end
    if self.db.boss and not self.BossesByKey[self.db.boss] then self.db.boss = nil end
    if self.db.class and not self.ClassesByKey[self.db.class] then
        self.db.class, self.db.spec = nil, nil
    end
end

------------------------------------------------------------------------------
-- Data validation (/rtg verify)
------------------------------------------------------------------------------

local function normalize(s)
    return (tostring(s or ""):lower():gsub("[^%w]", ""))
end

local function checkSpellList(list, where, problems)
    if type(list) ~= "table" then return end
    for _, e in ipairs(list) do
        local id = type(e) == "table" and (e.id or e.spellId)
        if id then
            local name = GetSpellInfo(id)
            if not name then
                table.insert(problems, where .. ": spell id " .. id .. " (" .. tostring(e.name) .. ") does not exist")
            elseif e.name and normalize(name) ~= normalize(e.name) then
                table.insert(problems, where .. ": id " .. id .. " is '" .. name .. "', data says '" .. e.name .. "'")
            end
        end
    end
end

function RTG:VerifyData()
    local problems = {}
    for _, w in ipairs(self.loadWarnings) do table.insert(problems, "Load: " .. w) end
    for bossKey, t in pairs(self.Tactics) do
        checkSpellList(t.abilities, bossKey, problems)
    end
    for classKey, specs in pairs(self.Specs) do
        for specKey, data in pairs(specs) do
            local where = classKey .. "/" .. specKey
            for _, cat in ipairs(data.categories or {}) do
                for _, sec in ipairs(cat.sections or {}) do
                    checkSpellList(sec.spells, where, problems)
                end
            end
            for _, note in ipairs(data.notes or {}) do
                checkSpellList(note.spells, where, problems)
            end
        end
    end
    local bossesWithoutTactics = 0
    for key in pairs(self.BossesByKey) do
        if not self.Tactics[key] then bossesWithoutTactics = bossesWithoutTactics + 1 end
    end
    if #problems == 0 then
        self:Print("Data check passed. No problems found.")
    else
        self:Print(#problems .. " possible problem(s):")
        for i = 1, math.min(#problems, 40) do
            self:Print("  " .. problems[i])
        end
        if #problems > 40 then self:Print("  ... and " .. (#problems - 40) .. " more.") end
    end
    if bossesWithoutTactics > 0 then
        self:Print(bossesWithoutTactics .. " boss(es) have no tactics written yet.")
    end
end

------------------------------------------------------------------------------
-- Slash commands
------------------------------------------------------------------------------

local function slashHandler(input)
    local cmd, rest = (input or ""):match("^%s*(%S*)%s*(.-)%s*$")
    cmd = (cmd or ""):lower()
    if cmd == "" or cmd == "show" or cmd == "toggle" then
        RTG:Toggle()
    elseif cmd == "minimap" then
        RTG.db.minimap.hide = not RTG.db.minimap.hide
        if RTG.UpdateMinimapButton then RTG:UpdateMinimapButton() end
        RTG:Print("Minimap button " .. (RTG.db.minimap.hide and "hidden." or "shown."))
    elseif cmd == "scale" then
        local s = tonumber(rest)
        if s and s >= 0.6 and s <= 1.4 then
            RTG.db.window.scale = s
            if RTG.frame then RTG.frame:SetScale(s) end
            RTG:Print("Window scale set to " .. s)
        else
            RTG:Print("Usage: /rtg scale 0.6 - 1.4")
        end
    elseif cmd == "reset" then
        RTG.db.window.point = nil
        RTG.db.window.scale = nil
        if RTG.frame then
            RTG.frame:ClearAllPoints()
            RTG.frame:SetPoint("CENTER")
            RTG.frame:SetScale(RTG.config.windowScale or 1)
        end
        RTG:Print("Window position and scale reset.")
    elseif cmd == "verify" or cmd == "check" then
        RTG:VerifyData()
    elseif cmd == "export" then
        if RTG.ShowExport then RTG:ShowExport() end
    elseif cmd == "classes" or cmd == "class" then
        RTG:Open("classes")
    elseif cmd == "raids" or cmd == "raid" then
        RTG:Open("raids")
    elseif cmd == "professions" or cmd == "profession" or cmd == "prof" then
        RTG:Open("professions")
    elseif cmd == "rolls" or cmd == "roll" then
        RTG:Open("rolls")
    else
        RTG:Print("Commands:")
        RTG:Print("  /rtg - open or close the guidebook")
        RTG:Print("  /rtg raids | classes | professions | rolls - open a section")
        RTG:Print("  /rtg minimap - show/hide the minimap button")
        RTG:Print("  /rtg scale <0.6-1.4> - window size")
        RTG:Print("  /rtg reset - reset window position")
        RTG:Print("  /rtg verify - check spell ids in the data files")
        RTG:Print("  /rtg export - copy your in-game class guide edits as Lua")
    end
end

SLASH_RAIDTACTICSGUIDE1 = "/rtg"
SLASH_RAIDTACTICSGUIDE2 = "/raidtactics"
SlashCmdList["RAIDTACTICSGUIDE"] = slashHandler

------------------------------------------------------------------------------
-- Open / close
------------------------------------------------------------------------------

function RTG:Toggle()
    if not self.frame then self:CreateMainFrame() end
    if self.frame:IsShown() then
        self.frame:Hide()
    else
        self.frame:Show()
    end
end

function RTG:Open(mode)
    if not self.frame then self:CreateMainFrame() end
    self.frame:Show()
    if mode and self.SetMode then self:SetMode(mode) end
end

------------------------------------------------------------------------------
-- Startup
------------------------------------------------------------------------------

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "RaidTacticsGuide" then
        RTG:InitDB()
        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_LOGIN" then
        if not RTG.db then RTG:InitDB() end
        if RTG.CreateMinimapButton then RTG:CreateMinimapButton() end
        if #RTG.loadWarnings > 0 then
            RTG:Print(#RTG.loadWarnings .. " data warning(s). Type /rtg verify for details.")
        end
    end
end)
