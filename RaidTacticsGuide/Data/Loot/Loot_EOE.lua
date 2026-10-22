--[[
    Raid Tactics Guide - Loot: The Eye of Eternity
    Generated from AtlasLoot Enhanced (WotLK 3.3.5a) loot tables.
    Entry format: { itemId, "Name", quality, "Slot / type" [, "drop chance"] }
    or { header = "Text" } to start a labelled group (e.g. Hard Mode).
    Difficulty keys: "10N", "10H", "25N", "25H". Leave a key out if it does not exist.
    The item name/quality here are only shown until the client has the item cached.
]]

local RTG = RaidTacticsGuide

-- Malygos
RTG:RegisterLoot("EOE_Malygos", {
    ["10N"] = {
        { 40526, "Gown of the Spell-Weaver", 4, "Chest, Cloth", "12%" },
        { 40519, "Footsteps of Malygos", 4, "Feet, Leather", "12%" },
        { 40511, "Focusing Energy Epaulets", 4, "Shoulder, Plate", "13%" },
        { 40486, "Necklace of the Glittering Chamber", 4, "Neck", "12%" },
        { 40474, "Surge Needle Ring", 4, "Ring", "10%" },
        { 40491, "Hailstorm", 4, "One-Hand, Sword", "11%" },
        { 40488, "Ice Spire Scepter", 4, "Main Hand, Mace", "12%" },
        { 40489, "Greatstaff of the Nexus", 4, "Staff", "12%" },
        { 40497, "Black Ice", 4, "Polearm", "10%" },
        { 40475, "Barricade of Eternity", 4, "Shield", "11%" },
        { 43952, "Reins of the Azure Drake", 4, "Mount", "1%" },
        { 44569, "Key to the Focusing Iris", 4, "Quest Item", "91%" },
        { 44650, "Heart of Magic", 1, "Quest Item", "100%" },
        { 44658, "Chain of the Ancient Wyrm", 4, "Quest Reward: Neck" },
        { 44660, "Drakescale Collar", 4, "Quest Reward: Neck" },
        { 44659, "Pendant of the Dragonsworn", 4, "Quest Reward: Neck" },
        { 44657, "Torque of the Red Dragonflight", 4, "Quest Reward: Neck" },
    },
    ["25N"] = {
        { 40562, "Hood of Rationality", 4, "Head, Cloth", "9%" },
        { 40555, "Mantle of Dissemination", 4, "Shoulder, Cloth", "9%" },
        { 40194, "Blanketing Robes of Snow", 4, "Chest, Cloth", "9%" },
        { 40561, "Leash of Heedless Magic", 4, "Waist, Cloth", "9%" },
        { 40560, "Leggings of the Wanton Spellcaster", 4, "Legs, Cloth", "10%" },
        { 40558, "Arcanic Tramplers", 4, "Feet, Cloth", "7%" },
        { 40594, "Spaulders of Catatonia", 4, "Shoulder, Leather", "10%" },
        { 40539, "Chestguard of the Recluse", 4, "Chest, Leather", "8%" },
        { 40541, "Frosted Adroit Handguards", 4, "Hands, Leather", "9%" },
        { 40566, "Unravelling Strands of Sanity", 4, "Waist, Leather", "11%" },
        { 40543, "Blue Aspect Helm", 4, "Head, Mail", "9%" },
        { 40588, "Tunic of the Artifact Guardian", 4, "Chest, Mail", "9%" },
        { 40564, "Winter Spectacle Gloves", 4, "Hands, Mail", "9%" },
        { 40549, "Boots of the Renewed Flight", 4, "Feet, Mail", "8%" },
        { 40590, "Elevated Lair Pauldrons", 4, "Shoulder, Plate", "9%" },
        { 40589, "Legplates of Sovereignty", 4, "Legs, Plate", "9%" },
        { 40592, "Boots of Healing Energies", 4, "Feet, Plate", "10%" },
        { 40591, "Melancholy Sabatons", 4, "Feet, Plate", "9%" },
        { 40532, "Living Ice Crystals", 4, "Trinket", "9%" },
        { 40531, "Mark of Norgannon", 4, "Trinket", "8%" },
        { 43952, "Reins of the Azure Drake", 4, "Mount", "1%" },
        { 44577, "Heroic Key to the Focusing Iris", 4, "Quest Item", "92%" },
        { 44650, "Heart of Magic", 1, "Quest Item", "100%" },
        { 44664, "Favor of the Dragon Queen", 4, "Quest Reward: Neck" },
        { 44662, "Life-Binder's Locket", 4, "Quest Reward: Neck" },
        { 44665, "Nexus War Champion Beads", 4, "Quest Reward: Neck" },
        { 44661, "Wyrmrest Necklace of Power", 4, "Quest Reward: Neck" },
    },
})
