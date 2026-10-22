--[[
    Raid Tactics Guide - Loot: The Ruby Sanctum
    Generated from AtlasLoot Enhanced (WotLK 3.3.5a) loot tables.
    Entry format: { itemId, "Name", quality, "Slot / type" [, "drop chance"] }
    or { header = "Text" } to start a labelled group (e.g. Hard Mode).
    Difficulty keys: "10N", "10H", "25N", "25H". Leave a key out if it does not exist.
    The item name/quality here are only shown until the client has the item cached.
]]

local RTG = RaidTacticsGuide

-- Baltharus the Warborn: no personal loot (see the final boss).

-- Saviana Ragefire: no personal loot (see the final boss).

-- General Zarithrian: no personal loot (see the final boss).

-- Halion
RTG:RegisterLoot("RS_Halion", {
    ["10N"] = {
        { 53115, "Abduction's Cover", 4, "Back" },
        { 53118, "Misbegotten Belt", 4, "Waist, Cloth" },
        { 53114, "Gloaming Sark", 4, "Chest, Leather" },
        { 53117, "Changeling Gloves", 4, "Hands, Leather" },
        { 53113, "Twilight Scale Shoulders", 4, "Shoulder, Mail" },
        { 53119, "Boots of Divided Being", 4, "Feet, Mail" },
        { 53112, "Bracers of the Heir", 4, "Wrist, Plate" },
        { 53121, "Surrogate Belt", 4, "Waist, Plate" },
        { 53111, "Scion's Treads", 4, "Feet, Plate" },
        { 53103, "Baltharus' Gift", 4, "Neck" },
        { 53116, "Saviana's Tribute", 4, "Ring" },
        { 53110, "Zarithrian's Offering", 4, "Ring" },
    },
    ["10H"] = {
        { 54556, "Abduction's Cover", 4, "Back" },
        { 54562, "Misbegotten Belt", 4, "Waist, Cloth" },
        { 54561, "Gloaming Sark", 4, "Chest, Leather" },
        { 54560, "Changeling Gloves", 4, "Hands, Leather" },
        { 54566, "Twilight Scale Shoulders", 4, "Shoulder, Mail" },
        { 54558, "Boots of Divided Being", 4, "Feet, Mail" },
        { 54559, "Bracers of the Heir", 4, "Wrist, Plate" },
        { 54565, "Surrogate Belt", 4, "Waist, Plate" },
        { 54564, "Scion's Treads", 4, "Feet, Plate" },
        { 54557, "Baltharus' Gift", 4, "Neck" },
        { 54563, "Saviana's Tribute", 4, "Ring" },
        { 54567, "Zarithrian's Offering", 4, "Ring" },
    },
    ["25N"] = {
        { 53489, "Cloak of Burning Dusk", 4, "Back" },
        { 53486, "Bracers of Fiery Night", 4, "Wrist, Cloth" },
        { 53134, "Phaseshifter's Bracers", 4, "Wrist, Leather" },
        { 53126, "Umbrage Armbands", 4, "Waist, Leather" },
        { 53488, "Split Shape Belt", 4, "Waist, Mail" },
        { 53127, "Returning Footfalls", 4, "Feet, Mail" },
        { 53125, "Apocalypse's Advance", 4, "Feet, Plate" },
        { 53487, "Foreshadow Steps", 4, "Feet, Plate" },
        { 53129, "Treads of Impending Resurrection", 4, "Feet, Plate" },
        { 53132, "Penumbra Pendant", 4, "Neck" },
        { 53490, "Ring of Phased Regeneration", 4, "Ring" },
        { 53133, "Signet of Twilight", 4, "Ring" },
        { 54572, "Charred Twilight Scale", 4, "Trinket" },
        { 54573, "Glowing Twilight Scale", 4, "Trinket" },
        { 54571, "Petrified Twilight Scale", 4, "Trinket" },
        { 54569, "Sharpened Twilight Scale", 4, "Trinket" },
    },
    ["25H"] = {
        { 54583, "Cloak of Burning Dusk", 4, "Back" },
        { 54582, "Bracers of Fiery Night", 4, "Wrist, Cloth" },
        { 54584, "Phaseshifter's Bracers", 4, "Wrist, Leather" },
        { 54580, "Umbrage Armbands", 4, "Waist, Leather" },
        { 54587, "Split Shape Belt", 4, "Waist, Mail" },
        { 54577, "Returning Footfalls", 4, "Feet, Mail" },
        { 54578, "Apocalypse's Advance", 4, "Feet, Plate" },
        { 54586, "Foreshadow Steps", 4, "Feet, Plate" },
        { 54579, "Treads of Impending Resurrection", 4, "Feet, Plate" },
        { 54581, "Penumbra Pendant", 4, "Neck" },
        { 54585, "Ring of Phased Regeneration", 4, "Ring" },
        { 54576, "Signet of Twilight", 4, "Ring" },
        { 54588, "Charred Twilight Scale", 4, "Trinket" },
        { 54589, "Glowing Twilight Scale", 4, "Trinket" },
        { 54591, "Petrified Twilight Scale", 4, "Trinket" },
        { 54590, "Sharpened Twilight Scale", 4, "Trinket" },
    },
})
