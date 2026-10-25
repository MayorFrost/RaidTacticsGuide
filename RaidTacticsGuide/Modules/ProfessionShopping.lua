-- Published Warmane Forum quantities. Intersecting brackets stay visible;
-- wider brackets are labeled, and quantities are never divided by realm rate.
local RTG = RaidTacticsGuide
local M = {}
RTG.ProfessionShopping = M

local function clamp(value, low, high)
    local n = math.floor(tonumber(value) or low)
    if n < low then return low end
    if n > high then return high end
    return n
end

function M:Storage()
    RTG.db.professions = RTG.db.professions or {}
    local db = RTG.db.professions
    db.ranges = db.ranges or {}
    db.collected = db.collected or {}
    if not RTG.ProfessionsByKey[db.selected or ""] then db.selected = "tailoring" end
    if db.tab ~= "shopping" then db.tab = "guide" end
    return db
end

function M:GetRange(key)
    local db = self:Storage()
    local p = db.ranges[key]
    if type(p) ~= "table" then
        p = { low = 1, high = 450 }
        db.ranges[key] = p
    end
    p.low = clamp(p.low, 1, 449)
    p.high = clamp(p.high, p.low + 1, 450)
    return p.low, p.high
end

function M:SetRange(key, from, to)
    local db = self:Storage()
    local low = clamp(from, 1, 449)
    local high = clamp(to, low + 1, 450)
    db.ranges[key] = { low = low, high = high }
    return low, high
end

function M:SetCollected(prof, material, amount)
    local db = self:Storage()
    db.collected[prof] = db.collected[prof] or {}
    db.collected[prof][material] = clamp(amount, 0, 999999)
end

function M:GetCollected(prof, material)
    local db = self:Storage()
    local value = db.collected[prof] and db.collected[prof][material]
    return clamp(value, 0, 999999)
end

function M:BuildList(prof, low, high)
    local required = {}
    local segments = {}
    local info = { wider = false, partial = false, standard = prof.rate == 'standard' }
    for _, group in ipairs(prof.groups or {}) do
        if group.high > low and group.low < high then
            table.insert(segments, { group.low, group.high })
            if group.low < low or group.high > high then info.wider = true end
            if group.partial then info.partial = true end
            for _, entry in ipairs(group.items or {}) do
                required[entry[1]] = (required[entry[1]] or 0) + entry[2]
            end
        end
    end
    table.sort(segments, function(a,b) return a[1] < b[1] end)
    local reached = low
    for _, segment in ipairs(segments) do
        if segment[1] <= reached then
            if segment[2] > reached then reached = segment[2] end
        end
    end
    info.missing = reached < high or (prof.coverage or 450) < high
    if prof.stones and low < 427 and high > 424 then
        local selected = self:Storage().alchemyStone
        for _, stone in ipairs(prof.stones) do
            if stone.key == selected then
                info.stone = stone.label
                for _, entry in ipairs(stone.items) do
                    required[entry[1]] = (required[entry[1]] or 0) + entry[2]
                end
                break
            end
        end
        if not info.stone then info.partial = true; info.chooseStone = true end
    end
    local rows = {}
    for name, quantity in pairs(required) do
        table.insert(rows, {name=name, id=RTG.MaterialIDs[name], required=quantity,
            collected=self:GetCollected(prof.key,name)})
    end
    -- Only show unknown materials when their published route intersects the range.
    if #segments > 0 then
        for _, name in ipairs(prof.unquantifiedMaterials or {}) do
            info.partial = true
            if required[name] == nil then
                table.insert(rows, {name=name, id=RTG.MaterialIDs[name], required=nil,
                    collected=self:GetCollected(prof.key,name)})
            end
        end
    end
    for _, group in ipairs(prof.unknownGroups or {}) do
        if group.high > low and group.low < high then
            info.partial = true
            for _, name in ipairs(group.names) do
                if required[name] == nil then
                    rows[#rows+1] = {name=name, id=RTG.MaterialIDs[name],
                        collected=self:GetCollected(prof.key,name)}
                end
            end
        end
    end
    table.sort(rows,function(a,b) return a.name < b.name end)
    local full = not info.partial and not info.missing and not info.wider
    return rows, full, segments, info
end

function M:Progress(rows)
    local have, needed = 0, 0
    for _, row in ipairs(rows) do
        if row.required then
            needed = needed + row.required
            have = have + math.min(row.required, row.collected or 0)
        end
    end
    return have, needed, needed > 0 and math.floor(have * 100 / needed + .5) or nil
end
