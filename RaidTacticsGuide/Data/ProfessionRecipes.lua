-- Display-only recipe hints. 3x routes and shopping totals are defined in
-- Professions.lua; we do not derive a shopping total from guessed craft counts.
local RTG = RaidTacticsGuide

-- These are WotLK 3.3.5 profession spell IDs. GetSpellInfo returns their
-- original client icon, avoiding blank/black step icons.
local skillIcons = {
 tailoring=3908, blacksmithing=2018, jewelcrafting=25229,
 engineering=4036, enchanting=7411, alchemy=2259,
 inscription=45357, leatherworking=2108, cooking=2550,
 firstaid=3273, mining=2575, herbalism=2366,
 skinning=8613, fishing=7620,
}
for _, p in ipairs(RTG.Professions) do p.skillSpellID=skillIcons[p.key] end

-- Names below indicate materials used in the shown recipe (not quantities).
-- The shopping totals themselves remain separate source-derived numbers.
local names = {
 tailoring = {
  [1]="Linen Cloth", [2]="Linen Cloth, Fine Thread", [3]="Wool Cloth",
  [4]="Wool Cloth, Gray Dye, Fine Thread",[5]="Silk Cloth",
  [6]="Silk Cloth, Blue Dye, Fine Thread", [7]="Silk Cloth, Fine Thread",
  [8]="Silk Cloth, Bleach, Fine Thread",[9]="Mageweave Cloth",
  [10]="Silk Cloth, Red Dye, Silken Thread",[11]="Silk Cloth, Red Dye, Silken Thread",
  [12]="Mageweave Cloth, Heavy Silken Thread",[13]="Mageweave Cloth, Heavy Silken Thread",
  [14]="Mageweave Cloth, Heavy Silken Thread",[15]="Runecloth",
  [16]="Runecloth, Rune Thread",[17]="Runecloth, Rune Thread",
  [18]="Runecloth, Rune Thread",[19]="Netherweave Cloth",
  [20]="Netherweave, Arcane Dust",[21]="Netherweave, Knothide Leather",
  [22]="Netherweave, Rune Thread",[23]="Frostweave Cloth",
  [24]="Frostweave, Eternium Thread",[25]="Frostweave, Eternium Thread",
  [26]="Frostweave, Eternium Thread",[27]="Frostweave, Eternium Thread",
  [28]="Frostweave, Infinite Dust",[29]="Frostweave, Eternium Thread",
  [30]="Frostweave, Eternium Thread",[31]="Frostweave, Eternium Thread",
  [32]="Frostweave, Eternium Thread",[33]="Frostweave, Infinite Dust, Ebonweave",
 },
 blacksmithing = {
  [1]="Rough Stone",[2]="Rough Stone",[3]="Copper Bar",[4]="Copper Bar",
  [5]="Bronze Bar",[6]="Iron Bar",[7]="Iron Bar, Green Dye",
  [8]="Iron Bar, Green Dye",[9]="Steel Bar",[10]="Mithril Bar",
  [11]="Mithril Bar",[12]="Mithril Bar",[13]="Mithril Bar",
  [14]="Dense Stone",[15]="Mithril Bar",[16]="Thorium Bar",
  [17]="Thorium Bar",[18]="Thorium Bar",[19]="Fel Iron Bar",
  [20]="Fel Iron Bar",[21]="Fel Iron Bar",[22]="Fel Iron Bar",
  [23]="Fel Iron Bar",[24]="Adamantite Bar, Primal Fire",
  [25]="Adamantite Bar, Primal Earth",[26]="Cobalt Bar",
  [27]="Cobalt Bar",[28]="Cobalt Bar",[29]="Cobalt Bar",
  [30]="Cobalt Bar",[31]="Cobalt Bar",[32]="Saronite Bar",
  [33]="Saronite Bar",[34]="Saronite Bar",[35]="Saronite Bar",
  [36]="Saronite Bar",[37]="Saronite Bar, Eternal Earth",
  [38]="Saronite Bar, Eternal Earth",
 },
 jewelcrafting = {
  [1]="Copper Bar",[2]="Malachite, Copper Wire",[3]="Bronze Bar",
  [4]="Silver Bar",[5]="Heavy Stone",[6]="Shadowgem",
  [7]="Jade, Bronze Setting",[8]="Gold Bar",[9]="Mithril Bar",
  [10]="Truesilver Bar",[11]="Citrine",[12]="Aquamarine",
  [13]="Aquamarine",[14]="Thorium Bar",[15]="Star Ruby",
  [16]="Truesilver Bar",[17]="Azerothian Diamond",
  [18]="Blue Sapphire",[19]="Huge Emerald",[20]="Black Diamond",
  [21]="Fel Iron Bar, Blood Garnet",[22]="Azure Moonstone",
  [23]="Adamantite Powder, Primal Earth",[24]="Adamantite Bar",
  [25]="Dark Jade",[26]="Shadow Crystal",[27]="Chalcedony",
  [28]="Dark Jade, Eternal Earth",[29]="Sky Sapphire",
  [30]="Titanium Bar, Forest Emerald",[31]="Twilight Opal",
  [32]="Forest Emerald",[33]="Frozen Orb",[34]="Earthsiege Diamond",
 },
 engineering = {
  [1]="Rough Stone",[2]="Rough Powder, Linen Cloth",[3]="Copper Bar",
  [4]="Copper Bar, Weak Flux",[5]="Coarse Stone",[6]="Silver Bar",
  [7]="Heavy Stone",[8]="Bronze Bar, Heavy Powder, Silver Contact",
  [9]="Gold Bar",[10]="Steel Bar",[11]="Solid Stone",
  [12]="Mithril Bar",[13]="Mithril Bar, Mageweave, Solid Powder",
  [14]="Mithril Bar, Solid Powder",[15]="Thick Leather, Star Ruby",
  [16]="Dense Stone",[17]="Mithril Bar, Solid Powder",
  [18]="Thorium Bar, Runecloth",[19]="Thorium Bar, Dense Powder",
  [20]="Mote of Fire, Mote of Earth",[21]="Fel Iron Casing, Fel Iron Bolts",
  [22]="Adamantite Bar, Fel Iron Bolts",[23]="Elemental Powder, Netherweave, Green Dye",
  [24]="Cobalt Bar",[25]="Cobalt Bar",[26]="Frostweave, Blasting Trigger",
  [27]="Cobalt Bar, Crystallized Water",[28]="Froststeel Tube, Cobalt Bolts",
  [29]="Saronite Bar, Blasting Trigger",[30]="Saronite Bar, Blasting Trigger",
  [31]="Saronite Bar, Crystallized Water",[32]="Saronite Bar, Eternal Air",
  [33]="Saronite Bar, Twilight Opal",[34]="Saronite Bar, Mining Pick, Skinning Knife",
  [35]="Titanium Bar, Eternal Air/Fire/Water/Shadow",
 },
}

-- Engineering: exact names, chosen craft quantities, and bracket endpoints
-- taken from https://forum.warmane.com/showthread.php?t=416597 .
local eng = RTG.ProfessionsByKey.engineering
eng.steps = {
 {1,40,"Rough Blasting Powder",20},
 {40,55,"Rough Dynamite",5},
 {55,58,"Arclight Spanner",1},
 {58,85,"Copper Tube","9-10"},
 {85,97,"Coarse Blasting Powder",20},
 {97,127,"Silver Contact",15},
 {127,145,"Heavy Blasting Powder",20},
 {145,151,"Big Bronze Bomb","2-4"},
 {151,175,"Gold Power Core",20},
 {175,178,"Gyromatic Micro-Adjustor",1},
 {178,196,"Solid Blasting Powder",40},
 {196,202,"Mithril Tube",2},
 {202,220,"Unstable Trigger",8},
 {220,232,"Hi-Impact Mithril Slugs",7},
 {232,250,"Spellpower Goggles Xtreme","6-7"},
 {250,262,"Dense Blasting Powder",20},
 {262,277,"Mithril Gyro-Shot",10},
 {277,292,"Thorium Widget",6},
 {292,300,"Thorium Shell",3},
 {300,321,"Elemental Blasting Powder","15-20"},
 {321,327,"Fel Iron Bomb",2},
 {327,336,"Adamantite Grenade",3},
 {336,357,"Green Smoke Flare",20},
 {357,378,"Handful of Cobalt Bolts",10},
 {378,387,"Hammer Pick",3},
 {387,393,"Explosive Decoy",4},
 {393,402,"Froststeel Tube",3},
 {402,408,"Diamond-cut Refractor Scope",3},
 {408,411,"Box of Bombs",2},
 {411,417,"Mammoth Cutters",5},
 {417,426,"Mana Injector Kit",3},
 {426,432,"MOLL-E",2},
 {432,438,"Heartseeker Scope",2},
 {438,447,"Gnomish Army Knife",3},
 {447,450,"Wormhole Generator: Northrend",1},
}
-- Restore the explicit engineering total list as actually published by that
-- 3x source, rather than mixing two different revision totals.
eng.groups = {{low=1, high=450, items={
 {"Rough Stone",20},{"Linen Cloth",10},{"Copper Bar",26},{"Weak Flux",10},
 {"Coarse Stone",20},{"Silver Bar",15},{"Heavy Stone",20},{"Bronze Bar",12},
 {"Gold Bar",20},{"Steel Bar",4},{"Solid Stone",80},{"Mithril Bar",41},
 {"Mageweave Cloth",8},{"Thick Leather",28},{"Star Ruby",14},
 {"Dense Stone",40},{"Thorium Bar",24},{"Runecloth",6},
 {"Mote of Fire",35},{"Mote of Earth",70},{"Fel Iron Casing",2},
 {"Handful of Fel Iron Bolts",10},{"Adamantite Bar",12},
 {"Green Dye",20},{"Cobalt Bar",59},{"Frostweave Cloth",4},
 {"Volatile Blasting Trigger",19},{"Crystallized Water",9},
 {"Saronite Bar",117},{"Eternal Air",18},{"Eternal Shadow",2},
 {"Eternal Fire",2},{"Eternal Water",2},{"Twilight Opal",4},
 {"Titanium Bar",8},{"Mining Pick",3},{"Skinning Knife",3},
 {"Blacksmith Hammer",3},
}}}
eng.note = "Warmane Forum x3 route. Extra crafts may be needed if yellow skills fail. Some listed components can be purchased or crafted."

-- Explicit craft counts appear only when the guide supplied them.
-- Unknown recipe counts are shown as '?', never invented as skill-span / 3.
local function parse(step)
    local name = step[3] or ""
    local count = step[4]
    if not count then
        local bracket = name:match("%(([^)]*)%)")
        if bracket then
            count = bracket:match("^(%d+%-%d+)") or bracket:match("^(%d+)")
                or bracket:match("make%s+(%d+)")
        end
    end
    -- The last Tailoring bracket states alternative crafts with no unique qty.
    name = name:gsub("%s*%b()", "")
    return name, count
end
for _, p in ipairs(RTG.Professions) do
    p.recipeRows = {}
    if p.kind == "craft" then
        for i,s in ipairs(p.steps or {}) do
            local name,qty=parse(s)
            if p.key=="tailoring" and i==33 then
                name="Glacial Slippers + Ebonweave Gloves";qty="2+3"
            end
            -- Only confirmed crafting rows; generic text isn't a recipe.
            if not name:find("Choose available",1,true) and
               not name:find("Check available",1,true) and
               not name:find("Disenchant spare",1,true) and
               not name:find("Review Warmane",1,true) then
                table.insert(p.recipeRows, {
                    low=s[1], high=s[2], name=name, count=qty,
                    mats=names[p.key] and names[p.key][i] or nil,
                })
            end
        end
    end
end
