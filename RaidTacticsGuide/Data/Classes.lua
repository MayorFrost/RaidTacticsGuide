--[[
    Raid Tactics Guide - Classes and specializations
    ------------------------------------------------
    The list below controls which classes and specializations appear in the
    Class Guide, and in which order. The actual rotation content lives in
    Data\Rotations\<Class>.lua.

    Fields:
      key       class token used by the game (WARRIOR, DEATHKNIGHT, ...)
      name      display name
      specs     ordered list of specializations:
                  key        must match the key used in RTG:RegisterSpec(...)
                  name       display name
                  role       TANK, HEALER, MELEE or RANGED (several allowed: "TANK/MELEE")
                  iconSpell  spell whose icon represents the spec
                  icon       (optional) explicit icon path, used before iconSpell

    To add a spec, add a line here and register its rotation in a Rotations file.
    A spec registered in a Rotations file but missing here is still shown (at the end).
]]

local RTG = RaidTacticsGuide

RTG:RegisterClass({ key = "WARRIOR", name = "Warrior", specs = {
    { key = "Arms",        name = "Arms",        role = "MELEE",  iconSpell = 12294 },
    { key = "Fury",        name = "Fury",        role = "MELEE",  iconSpell = 23881 },
    { key = "Protection",  name = "Protection",  role = "TANK",   iconSpell = 23922 },
}})

RTG:RegisterClass({ key = "PALADIN", name = "Paladin", specs = {
    { key = "Holy",        name = "Holy",        role = "HEALER", iconSpell = 635 },
    { key = "Protection",  name = "Protection",  role = "TANK",   iconSpell = 20925 },
    { key = "Retribution", name = "Retribution", role = "MELEE",  iconSpell = 35395 },
}})

RTG:RegisterClass({ key = "HUNTER", name = "Hunter", specs = {
    { key = "BeastMastery", name = "Beast Mastery", role = "RANGED", iconSpell = 19574 },
    { key = "Marksmanship", name = "Marksmanship",  role = "RANGED", iconSpell = 19434 },
    { key = "Survival",     name = "Survival",      role = "RANGED", iconSpell = 3674 },
}})

RTG:RegisterClass({ key = "ROGUE", name = "Rogue", specs = {
    { key = "Assassination", name = "Assassination", role = "MELEE", iconSpell = 1329 },
    { key = "Combat",        name = "Combat",        role = "MELEE", iconSpell = 13750 },
    { key = "Subtlety",      name = "Subtlety",      role = "MELEE", iconSpell = 36554 },
}})

RTG:RegisterClass({ key = "PRIEST", name = "Priest", specs = {
    { key = "Discipline",  name = "Discipline",  role = "HEALER", iconSpell = 33206 },
    { key = "Holy",        name = "Holy",        role = "HEALER", iconSpell = 2060 },
    { key = "Shadow",      name = "Shadow",      role = "RANGED", iconSpell = 15473 },
}})

RTG:RegisterClass({ key = "DEATHKNIGHT", name = "Death Knight", specs = {
    { key = "Blood",       name = "Blood",       role = "TANK/MELEE", iconSpell = 48266 },
    { key = "Frost",       name = "Frost",       role = "TANK/MELEE", iconSpell = 48263 },
    { key = "Unholy",      name = "Unholy",      role = "MELEE",      iconSpell = 48265 },
}})

RTG:RegisterClass({ key = "SHAMAN", name = "Shaman", specs = {
    { key = "Elemental",   name = "Elemental",   role = "RANGED", iconSpell = 403 },
    { key = "Enhancement", name = "Enhancement", role = "MELEE",  iconSpell = 17364 },
    { key = "Restoration", name = "Restoration", role = "HEALER", iconSpell = 331 },
}})

RTG:RegisterClass({ key = "MAGE", name = "Mage", specs = {
    { key = "Arcane",      name = "Arcane",      role = "RANGED", iconSpell = 30451 },
    { key = "Fire",        name = "Fire",        role = "RANGED", iconSpell = 133 },
    { key = "Frost",       name = "Frost",       role = "RANGED", iconSpell = 116 },
}})

RTG:RegisterClass({ key = "WARLOCK", name = "Warlock", specs = {
    { key = "Affliction",  name = "Affliction",  role = "RANGED", iconSpell = 172 },
    { key = "Demonology",  name = "Demonology",  role = "RANGED", iconSpell = 47241 },
    { key = "Destruction", name = "Destruction", role = "RANGED", iconSpell = 17962 },
}})

RTG:RegisterClass({ key = "DRUID", name = "Druid", specs = {
    { key = "Balance",     name = "Balance",       role = "RANGED",     iconSpell = 24858 },
    { key = "Feral",       name = "Feral Combat",  role = "TANK/MELEE", iconSpell = 768 },
    { key = "Restoration", name = "Restoration",   role = "HEALER",     iconSpell = 33891 },
}})
