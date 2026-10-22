--[[
    Raid Tactics Guide - Loot: The Obsidian Sanctum
    Generated from AtlasLoot Enhanced (WotLK 3.3.5a) loot tables.
    Entry format: { itemId, "Name", quality, "Slot / type" [, "drop chance"] }
    or { header = "Text" } to start a labelled group (e.g. Hard Mode).
    Difficulty keys: "10N", "10H", "25N", "25H". Leave a key out if it does not exist.
    The item name/quality here are only shown until the client has the item cached.
]]

local RTG = RaidTacticsGuide

-- Sartharion
RTG:RegisterLoot("OS_Sartharion", {
    ["10N"] = {
        { 40428, "Titan's Outlook", 4, "Head, Plate", "18%" },
        { 40427, "Circle of Arcane Streams", 4, "Neck", "18%" },
        { 40426, "Signet of the Accord", 4, "Ring", "19%" },
        { 40433, "Wyrmrest Band", 4, "Ring", "7%" },
        { 40430, "Majestic Dragon Figurine", 4, "Trinket", "18%" },
        { 40429, "Crimson Steel", 4, "Main Hand, Fist Weapon", "18%" },
        { 43345, "Dragon Hide Bag", 4, "Bag", "100%" },
        { 43347, "Satchel of Spoils", 4, "", "100%" },
        { header = "Bonus Loot - One Drake Left" },
        { 43988, "Gale-Proof Cloak", 4, "Back", "1%" },
        { 43990, "Blade-Scarred Tunic", 4, "Chest, Leather", "2%" },
        { 43991, "Legguards of Composure", 4, "Legs, Leather", "1%" },
        { 43989, "Remembrance Girdle", 4, "Waist, Plate", "2%" },
        { 43992, "Volitant Amulet", 4, "Neck", "2%" },
        { 40613, "Gloves of the Lost Conqueror", 4, "Token", "28%" },
        { 40614, "Gloves of the Lost Protector", 4, "Token", "29%" },
        { 40615, "Gloves of the Lost Vanquisher", 4, "Token", "37%" },
        { header = "Bonus Loot - Two Drakes Left" },
        { 43995, "Enamored Cowl", 4, "Head, Cloth", "0.00%" },
        { 43998, "Chestguard of Flagrant Prowess", 4, "Chest, Mail" },
        { 43996, "Sabatons of Firmament", 4, "Feet, Mail" },
        { 43994, "Belabored Legplates", 4, "Legs, Plate" },
        { 43993, "Greatring of Collision", 4, "Ring" },
        { header = "Bonus Loot - Three Drakes Left" },
        { 43986, "Reins of the Black Drake", 4, "Mount", "100%" },
    },
    ["25N"] = {
        { 40437, "Concealment Shoulderpads", 4, "Shoulder, Leather", "16%" },
        { 40439, "Mantle of the Eternal Sentinel", 4, "Shoulder, Leather", "19%" },
        { 40451, "Hyaline Helm of the Sniper", 4, "Head, Mail", "16%" },
        { 40438, "Council Chamber Epaulets", 4, "Shoulder, Mail", "19%" },
        { 40453, "Chestplate of the Great Aspects", 4, "Chest, Plate", "17%" },
        { 40446, "Dragon Brood Legguards", 4, "Legs, Plate", "17%" },
        { 40433, "Wyrmrest Band", 4, "Ring", "7%" },
        { 40431, "Fury of the Five Flights", 4, "Trinket", "17%" },
        { 40432, "Illustration of the Dragon Soul", 4, "Trinket", "19%" },
        { 40455, "Staff of Restraint", 4, "Staff", "19%" },
        { 43345, "Dragon Hide Bag", 4, "Bag", "100%" },
        { 43346, "Large Satchel of Spoils", 4, "", "100%" },
        { 40628, "Gauntlets of the Lost Conqueror", 4, "Token", "51%" },
        { 40629, "Gauntlets of the Lost Protector", 4, "Token", "53%" },
        { 40630, "Gauntlets of the Lost Vanquisher", 4, "Token", "67%" },
        { header = "Bonus Loot - One Drake Left" },
        { 44002, "The Sanctum's Flowing Vestments", 4, "Chest, Cloth", "7%" },
        { 44003, "Upstanding Spaulders", 4, "Shoulder, Mail", "7%" },
        { 44004, "Bountiful Gauntlets", 4, "Hands, Mail", "6%" },
        { 44000, "Dragonstorm Breastplate", 4, "Chest, Plate", "6%" },
        { header = "Bonus Loot - Two Drakes Left" },
        { 44005, "Pennant Cloak", 4, "Back", "3%" },
        { 44008, "Unsullied Cuffs", 4, "Wrist, Cloth", "3%" },
        { 44007, "Headpiece of Reconciliation", 4, "Head, Leather", "3%" },
        { 44011, "Leggings of the Honored", 4, "Legs, Leather", "3%" },
        { 44006, "Obsidian Greathelm", 4, "Head, Plate", "3%" },
        { header = "Bonus Loot - Three Drakes Left" },
        { 43954, "Reins of the Twilight Drake", 4, "Mount", "100%" },
    },
})
