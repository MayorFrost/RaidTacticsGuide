--[[
    Raid Tactics Guide - Raids and encounters
    ---------------------------------------
    The order of raids and bosses here is the order shown in the guidebook.
    To add a raid: copy a RegisterRaid block, give it a new key and list its bosses.
    Boss fields:
      key       unique id used by the Tactics and Loot files (e.g. "ICC_Marrowgar")
      name      display name
      npc       creature id, used for the 3D portrait
      iconSpell a spell id whose icon represents the boss (or set icon = "Interface\\Icons\\...")
      area      wing / section name shown under the boss name
    Raid fields: sizes, hasHeroic (shows the Heroic button in the loot tab), heroicLabel,
    factionLoot (loot differs for Alliance/Horde), tier (groups raids in the sidebar).
]]

local RTG = RaidTacticsGuide

RTG:RegisterRaid({
    key = "ICC",
    name = "Icecrown Citadel",
    short = "ICC",
    tier = "Tier 10 ",
    icon = "Interface\\Icons\\Achievement_Dungeon_Icecrown_Frostmourne",
    iconSpell = 72762,
    sizes = { 10, 25 },
    hasHeroic = true,
    description = "The Lich King's fortress. Twelve encounters across five wings, ending at the Frozen Throne. Heroic mode unlocks per size after you defeat the Lich King on Normal.",
    bosses = {
        { key = "ICC_Marrowgar", name = "Lord Marrowgar", npc = 36612, iconSpell = 69076, area = "The Lower Spire" },
        { key = "ICC_Deathwhisper", name = "Lady Deathwhisper", npc = 36855, iconSpell = 71289, area = "The Lower Spire" },
        { key = "ICC_Gunship", name = "Icecrown Gunship Battle", npc = 36939, iconSpell = 69705, area = "The Lower Spire" },
        { key = "ICC_Saurfang", name = "Deathbringer Saurfang", npc = 37813, iconSpell = 72293, area = "The Lower Spire" },
        { key = "ICC_Festergut", name = "Festergut", npc = 36626, iconSpell = 69279, area = "The Plagueworks" },
        { key = "ICC_Rotface", name = "Rotface", npc = 36627, iconSpell = 69674, area = "The Plagueworks" },
        { key = "ICC_Putricide", name = "Professor Putricide", npc = 36678, iconSpell = 72295, area = "The Plagueworks" },
        { key = "ICC_BloodPrinces", name = "Blood Prince Council", npc = 37970, iconSpell = 72037, area = "The Crimson Hall" },
        { key = "ICC_Lanathel", name = "Blood-Queen Lana'thel", npc = 37955, iconSpell = 71340, area = "The Crimson Hall" },
        { key = "ICC_Valithria", name = "Valithria Dreamwalker", npc = 36789, iconSpell = 70633, area = "Frostwing Halls" },
        { key = "ICC_Sindragosa", name = "Sindragosa", npc = 36853, iconSpell = 70126, area = "Frostwing Halls" },
        { key = "ICC_LichKing", name = "The Lich King", npc = 36597, iconSpell = 72762, area = "The Frozen Throne" },
    },
})

RTG:RegisterRaid({
    key = "RS",
    name = "The Ruby Sanctum",
    short = "RS",
    tier = "Tier 10",
    icon = "Interface\\Icons\\Spell_Shadow_Twilight",
    iconSpell = 74562,
    sizes = { 10, 25 },
    hasHeroic = true,
    description = "A Red Dragonflight sanctum under attack by the Twilight dragonflight. Three mini-bosses guard the way to Halion. All loot drops from Halion.",
    bosses = {
        { key = "RS_Baltharus", name = "Baltharus the Warborn", npc = 39751, iconSpell = 74505, area = "Ruby Sanctum", lootNote = "Baltharus the Warborn has no loot of its own. All loot in this raid drops from Halion." },
        { key = "RS_Saviana", name = "Saviana Ragefire", npc = 39747, iconSpell = 74453, area = "Ruby Sanctum", lootNote = "Saviana Ragefire has no loot of its own. All loot in this raid drops from Halion." },
        { key = "RS_Zarithrian", name = "General Zarithrian", npc = 39746, iconSpell = 74367, area = "Ruby Sanctum", lootNote = "General Zarithrian has no loot of its own. All loot in this raid drops from Halion." },
        { key = "RS_Halion", name = "Halion", npc = 39863, iconSpell = 74562, area = "Ruby Sanctum" },
    },
})

RTG:RegisterRaid({
    key = "TOC",
    name = "Trial of the Crusader",
    short = "ToC",
    tier = "Tier 9 ",
    icon = "Interface\\Icons\\Achievement_Reputation_ArgentCrusader",
    iconSpell = 66134,
    sizes = { 10, 25 },
    hasHeroic = true,
    factionLoot = true,
    description = "The Argent Crusade's tournament coliseum. Five encounters in a single room with no trash. Heroic mode gives a limited number of attempts (50) for the whole raid.",
    bosses = {
        { key = "TOC_Beasts", name = "The Beasts of Northrend", npc = 34796, iconSpell = 66330, area = "Argent Coliseum" },
        { key = "TOC_Jaraxxus", name = "Lord Jaraxxus", npc = 34780, iconSpell = 66237, area = "Argent Coliseum" },
        { key = "TOC_Champions", name = "Faction Champions", npc = 34461, iconSpell = 66010, area = "Argent Coliseum" },
        { key = "TOC_Twins", name = "Twin Val'kyr", npc = 34497, iconSpell = 65724, area = "Argent Coliseum" },
        { key = "TOC_Anubarak", name = "Anub'arak", npc = 34564, iconSpell = 66134, area = "Argent Coliseum" },
    },
})

RTG:RegisterRaid({
    key = "ONY",
    name = "Onyxia's Lair",
    short = "Ony",
    tier = "Tier 9 ",
    icon = "Interface\\Icons\\Achievement_Boss_Onyxia",
    iconSpell = 18500,
    sizes = { 10, 25 },
    hasHeroic = false,
    description = "The classic black dragon, updated to level 80 for 10 and 25 players.",
    bosses = {
        { key = "ONY_Onyxia", name = "Onyxia", npc = 10184, iconSpell = 18500, area = "Onyxia's Lair" },
    },
})

RTG:RegisterRaid({
    key = "ULD",
    name = "Ulduar",
    short = "Uld",
    tier = "Tier 8 ",
    icon = "Interface\\Icons\\Achievement_Dungeon_UlduarRaid_Misc_01",
    iconSpell = 63138,
    sizes = { 10, 25 },
    hasHeroic = false,
    heroicLabel = "Hard Mode",
    description = "The titan city of Ulduar. Fourteen encounters, most with an optional Hard Mode that drops extra loot. Hard Mode items are listed under their own header in the loot tab.",
    bosses = {
        { key = "ULD_Leviathan", name = "Flame Leviathan", npc = 33113, iconSpell = 62297, area = "The Siege of Ulduar" },
        { key = "ULD_Ignis", name = "Ignis the Furnace Master", npc = 33118, iconSpell = 62488, area = "The Siege of Ulduar" },
        { key = "ULD_Razorscale", name = "Razorscale", npc = 33186, iconSpell = 64733, area = "The Siege of Ulduar" },
        { key = "ULD_XT002", name = "XT-002 Deconstructor", npc = 33293, iconSpell = 64234, area = "The Siege of Ulduar" },
        { key = "ULD_IronCouncil", name = "The Assembly of Iron", npc = 32867, iconSpell = 62274, area = "The Antechamber" },
        { key = "ULD_Kologarn", name = "Kologarn", npc = 32930, iconSpell = 64002, area = "The Antechamber" },
        { key = "ULD_Auriaya", name = "Auriaya", npc = 33515, iconSpell = 64386, area = "The Antechamber" },
        { key = "ULD_Hodir", name = "Hodir", npc = 32845, iconSpell = 61968, area = "The Keepers" },
        { key = "ULD_Thorim", name = "Thorim", npc = 32865, iconSpell = 62042, area = "The Keepers" },
        { key = "ULD_Freya", name = "Freya", npc = 32906, iconSpell = 62865, area = "The Keepers" },
        { key = "ULD_Mimiron", name = "Mimiron", npc = 33432, iconSpell = 63631, area = "The Keepers" },
        { key = "ULD_Vezax", name = "General Vezax", npc = 33271, iconSpell = 62660, area = "The Descent into Madness" },
        { key = "ULD_YoggSaron", name = "Yogg-Saron", npc = 33288, iconSpell = 63138, area = "The Descent into Madness" },
        { key = "ULD_Algalon", name = "Algalon the Observer", npc = 32871, iconSpell = 64584, area = "Celestial Planetarium" },
    },
})

RTG:RegisterRaid({
    key = "NAXX",
    name = "Naxxramas",
    short = "Naxx",
    tier = "Tier 7 ",
    icon = "Interface\\Icons\\Achievement_Dungeon_Naxxramas_Normal",
    iconSpell = 27808,
    sizes = { 10, 25 },
    hasHeroic = false,
    description = "The floating necropolis of Kel'Thuzad. Four quarters (Arachnid, Plague, Military and Construct), then Sapphiron and Kel'Thuzad in Frostwyrm Lair. Great place to learn raiding.",
    bosses = {
        { key = "NAXX_AnubRekhan", name = "Anub'Rekhan", npc = 15956, iconSpell = 28785, area = "Arachnid Quarter" },
        { key = "NAXX_Faerlina", name = "Grand Widow Faerlina", npc = 15953, iconSpell = 28732, area = "Arachnid Quarter" },
        { key = "NAXX_Maexxna", name = "Maexxna", npc = 15952, iconSpell = 28622, area = "Arachnid Quarter" },
        { key = "NAXX_Noth", name = "Noth the Plaguebringer", npc = 15954, iconSpell = 29213, area = "Plague Quarter" },
        { key = "NAXX_Heigan", name = "Heigan the Unclean", npc = 15936, iconSpell = 30122, area = "Plague Quarter" },
        { key = "NAXX_Loatheb", name = "Loatheb", npc = 16011, iconSpell = 29204, area = "Plague Quarter" },
        { key = "NAXX_Razuvious", name = "Instructor Razuvious", npc = 16061, iconSpell = 29107, area = "Military Quarter" },
        { key = "NAXX_Gothik", name = "Gothik the Harvester", npc = 16060, iconSpell = 28679, area = "Military Quarter" },
        { key = "NAXX_Horsemen", name = "The Four Horsemen", npc = 16063, iconSpell = 28863, area = "Military Quarter" },
        { key = "NAXX_Patchwerk", name = "Patchwerk", npc = 16028, iconSpell = 41926, area = "Construct Quarter" },
        { key = "NAXX_Grobbulus", name = "Grobbulus", npc = 15931, iconSpell = 28169, area = "Construct Quarter" },
        { key = "NAXX_Gluth", name = "Gluth", npc = 15932, iconSpell = 28374, area = "Construct Quarter" },
        { key = "NAXX_Thaddius", name = "Thaddius", npc = 15928, iconSpell = 28089, area = "Construct Quarter" },
        { key = "NAXX_Sapphiron", name = "Sapphiron", npc = 15989, iconSpell = 28542, area = "Frostwyrm Lair" },
        { key = "NAXX_KelThuzad", name = "Kel'Thuzad", npc = 15990, iconSpell = 27808, area = "Frostwyrm Lair" },
    },
})

RTG:RegisterRaid({
    key = "OS",
    name = "The Obsidian Sanctum",
    short = "OS",
    tier = "Tier 7 ",
    icon = "Interface\\Icons\\Achievement_Dungeon_CoABlackDragonflight_Normal",
    iconSpell = 57491,
    sizes = { 10, 25 },
    hasHeroic = false,
    heroicLabel = "Drakes Up",
    description = "Sartharion and his three Twilight drakes. Leaving drakes alive makes the fight much harder and adds extra loot.",
    bosses = {
        { key = "OS_Sartharion", name = "Sartharion", npc = 28860, iconSpell = 57491, area = "Obsidian Sanctum" },
    },
})

RTG:RegisterRaid({
    key = "EOE",
    name = "The Eye of Eternity",
    short = "EoE",
    tier = "Tier 7 ",
    icon = "Interface\\Icons\\Achievement_Dungeon_NexusRaid",
    iconSpell = 56505,
    sizes = { 10, 25 },
    hasHeroic = false,
    description = "Malygos, Aspect of Magic, fought on a floating platform and finally on drake-back.",
    bosses = {
        { key = "EOE_Malygos", name = "Malygos", npc = 28859, iconSpell = 56505, area = "Eye of Eternity" },
    },
})

RTG:RegisterRaid({
    key = "VOA",
    name = "Vault of Archavon",
    short = "VoA",
    tier = "Wintergrasp",
    icon = "Interface\\Icons\\INV_Misc_Statue_02",
    iconSpell = 58678,
    sizes = { 10, 25 },
    hasHeroic = false,
    description = "Raid under Wintergrasp, open to the faction that controls the zone. Each watcher drops PvE tier and PvP gloves/legs for every class.",
    bosses = {
        { key = "VOA_Archavon", name = "Archavon the Stone Watcher", npc = 31125, iconSpell = 58678, area = "Vault of Archavon" },
        { key = "VOA_Emalon", name = "Emalon the Storm Watcher", npc = 33993, iconSpell = 64218, area = "Vault of Archavon" },
        { key = "VOA_Koralon", name = "Koralon the Flame Watcher", npc = 35013, iconSpell = 66725, area = "Vault of Archavon" },
        { key = "VOA_Toravon", name = "Toravon the Ice Watcher", npc = 38433, iconSpell = 72090, area = "Vault of Archavon" },
    },
})
