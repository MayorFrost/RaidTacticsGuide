--[[
    Raid Tactics Guide - Shaman rotations (patch 3.3.5a, PvE)
    Elemental, Enhancement, Restoration
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- ELEMENTAL
-------------------------------------------------------------------------------
RTG:RegisterSpec("SHAMAN", "Elemental", {
    summary = "Caster priority: keep Flame Shock up, Lava Burst on cooldown (it always crits on Flame Shock), Lightning Bolt filler.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Water Shield, Flametongue Weapon, drop totems (Call of the Elements).]],
                  spells = {
                      { id = 49233, name = "Flame Shock",       label = "DoT" },
                      { id = 16166, name = "Elemental Mastery", label = "Haste" },
                      { id = 60043, name = "Lava Burst",        label = "Crit" },
                      { id = 49271, name = "Chain Lightning",   label = "On CD" },
                      { id = 49238, name = "Lightning Bolt",    label = "Filler" },
                  },
                  footer = [[Then follow the priority list.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Elemental is a priority list.]],
                  spells = {
                      { id = 49233, name = "Flame Shock",     note = "Not on target; let it fall off, never clip it" },
                      { id = 60043, name = "Lava Burst",      note = "On cooldown, only while Flame Shock is on the target" },
                      { id = 49271, name = "Chain Lightning", note = "On cooldown when its cast is not delaying Lava Burst" },
                      { id = 49238, name = "Lightning Bolt",  note = "Filler" },
                      { id = 59159, name = "Thunderstorm",    note = "Mana is low; mind the knockback on trash" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority (3+ targets)",
                  spells = {
                      { id = 58734, name = "Magma Totem",     note = "Drop it in the middle of a stacked pack (replaces Totem of Wrath)" },
                      { id = 61657, name = "Fire Nova",       note = "On cooldown while a fire totem is in range of the mobs" },
                      { id = 49271, name = "Chain Lightning", note = "On cooldown" },
                      { id = 49233, name = "Flame Shock",     note = "On the main target for Lava Burst" },
                      { id = 60043, name = "Lava Burst",      note = "On cooldown with Flame Shock up" },
                      { id = 59159, name = "Thunderstorm",    note = "For mana or to knock back small adds" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 14% spell hit (17% minus 3% from Elemental Precision; Draenei +1%). About 368 rating without raid buffs.
- Glyphs: Flame Shock, Lava, Lightning Bolt (or Totem of Wrath).
- Clearcasting from Elemental Focus: lets you spend less mana, no action needed.]] },
        { key = "important", title = "Important Tips", text = [[
- Totems: Totem of Wrath, Wrath of Air, Mana Spring (or Flametongue if a Resto has it), Strength of Earth for melee.
- Your Totem of Wrath gives raid spell power and +3% crit against targets in range - keep it up.
- Lava Burst on a Flame Shocked target is a guaranteed crit: never cast it without Flame Shock.
- Move with Flame Shock and Thunderstorm, not by stopping casting.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Elemental Mastery: instant cast and 15% haste, use on cooldown.
- Fire Elemental Totem: big damage, drop it with Bloodlust and trinkets (it replaces Totem of Wrath, so re-drop after).
- Bloodlust / Heroism: when the raid leader calls for it.]],
          spells = {
              { id = 16166, name = "Elemental Mastery" },
              { id = 2894,  name = "Fire Elemental Totem" },
              { id = 2825,  name = "Bloodlust" },
              { id = 32182, name = "Heroism" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Wind Shear: interrupt, also drops your threat.
- Cleanse Spirit (talent) / Cleansing Totem for poison and disease.
- Tremor Totem on fear fights. Hex for crowd control on trash.]],
          spells = {
              { id = 57994, name = "Wind Shear" },
              { id = 51886, name = "Cleanse Spirit" },
              { id = 8170,  name = "Cleansing Totem" },
              { id = 8143,  name = "Tremor Totem" },
              { id = 51514, name = "Hex" },
          } },
    },
})

-------------------------------------------------------------------------------
-- ENHANCEMENT
-------------------------------------------------------------------------------
RTG:RegisterSpec("SHAMAN", "Enhancement", {
    summary = "Melee/caster hybrid priority: spend 5-stack Maelstrom Weapon on Lightning Bolt, keep Flame Shock up, Stormstrike and Lava Lash on cooldown.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Windfury Weapon (main hand), Flametongue Weapon (off hand), Lightning Shield, totems.]],
                  spells = {
                      { id = 51533, name = "Feral Spirit",   label = "Wolves" },
                      { id = 58704, name = "Searing Totem",  label = "Fire" },
                      { id = 17364, name = "Stormstrike",    label = "Debuff" },
                      { id = 49233, name = "Flame Shock",    label = "DoT" },
                      { id = 60103, name = "Lava Lash",      label = "Off hand" },
                      { id = 49238, name = "Lightning Bolt", label = "5 stacks" },
                  },
                  footer = [[After the opener, follow the priority list.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Enhancement is a priority list (often called a "shock and strike" priority).]],
                  spells = {
                      { id = 49238, name = "Lightning Bolt", note = "Only with 5 stacks of Maelstrom Weapon (instant)" },
                      { id = 58704, name = "Searing Totem",  note = "No fire totem active (Magma Totem on 2+ targets)" },
                      { id = 49233, name = "Flame Shock",    note = "Not on the target" },
                      { id = 17364, name = "Stormstrike",    note = "On cooldown" },
                      { id = 49231, name = "Earth Shock",    note = "On cooldown while Flame Shock has time left" },
                      { id = 60103, name = "Lava Lash",      note = "On cooldown" },
                      { id = 61657, name = "Fire Nova",      note = "Filler when everything above is on cooldown (needs a fire totem in range)" },
                      { id = 49281, name = "Lightning Shield", note = "Refresh when it drops" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority (3+ targets)",
                  spells = {
                      { id = 58734, name = "Magma Totem",     note = "Drop it in the pack" },
                      { id = 61657, name = "Fire Nova",       note = "On cooldown" },
                      { id = 49271, name = "Chain Lightning", note = "With 5 Maelstrom Weapon stacks" },
                      { id = 49233, name = "Flame Shock",     note = "On the main target" },
                      { id = 17364, name = "Stormstrike",     note = "On cooldown" },
                      { id = 60103, name = "Lava Lash",       note = "On cooldown" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit: 8% for melee (Dual Wield Specialization gives part of it), 17% spell hit helps Maelstrom bolts. Expertise 26.
- Glyphs: Feral Spirit, Stormstrike (or Flame Shock), Lightning Shield / Fire Nova.
- Never let Maelstrom Weapon sit at 5 stacks: hard-casting at 4 stacks is OK if Stormstrike/Lava Lash are on cooldown.]] },
        { key = "important", title = "Important Tips", text = [[
- Totems: Strength of Earth, Windfury, Searing/Magma, Mana Spring or a Water totem your group lacks.
- Your Unleashed Rage (10% AP) and Windfury Totem (20% melee haste) are big raid buffs: stay near the melee.
- Shamanistic Rage solves mana problems; use it on cooldown.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Feral Spirit: wolves, use at pull and with Bloodlust.
- Shamanistic Rage: mana and 30% damage reduction.
- Fire Elemental Totem: big burst, replaces your fire totem for 2 min.
- Bloodlust / Heroism: when called.]],
          spells = {
              { id = 51533, name = "Feral Spirit" },
              { id = 30823, name = "Shamanistic Rage" },
              { id = 2894,  name = "Fire Elemental Totem" },
              { id = 2825,  name = "Bloodlust" },
              { id = 32182, name = "Heroism" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Wind Shear: interrupt. Purge: remove enemy magic buffs.
- Cleansing Totem / Tremor Totem when the fight needs it.
- Earth Elemental Totem: emergency off-tank.]],
          spells = {
              { id = 57994, name = "Wind Shear" },
              { id = 8012,  name = "Purge" },
              { id = 8170,  name = "Cleansing Totem" },
              { id = 8143,  name = "Tremor Totem" },
              { id = 2062,  name = "Earth Elemental Totem" },
          } },
    },
})

-------------------------------------------------------------------------------
-- RESTORATION
-------------------------------------------------------------------------------
RTG:RegisterSpec("SHAMAN", "Restoration", {
    summary = "Chain Heal raid healer with strong tank healing: Earth Shield on the tank, Riptide on cooldown, Chain Heal for groups.",
    categories = {
        {
            name = "Raid Healing",
            sections = {
                { type = "rotation", key = "setup", title = "Pull setup",
                  text = [[Before the pull: Water Shield, Earthliving Weapon, totems.]],
                  spells = {
                      { id = 49284, name = "Earth Shield",      label = "Main tank" },
                      { id = 57960, name = "Water Shield",      label = "Self" },
                      { id = 51994, name = "Earthliving Weapon", label = "Weapon" },
                      { id = 66842, name = "Call of the Elements", label = "Totems" },
                  },
                  footer = [[Totems: Mana Spring, Strength of Earth / Stoneskin, Flametongue, Wrath of Air (whatever your group lacks).]] },
                { type = "priority", key = "raid_prio", title = "Raid healing priority",
                  spells = {
                      { id = 61301, name = "Riptide",     note = "On cooldown on a damaged target; buffs your next Chain Heal" },
                      { id = 55459, name = "Chain Heal",  note = "Main raid heal; start it on the Riptided target" },
                      { id = 49276, name = "Lesser Healing Wave", note = "Fast single heal with Tidal Waves" },
                      { id = 49273, name = "Healing Wave", note = "Big single heal with Tidal Waves" },
                      { id = 49284, name = "Earth Shield", note = "Keep it on the tank all fight" },
                  } },
            },
        },
        {
            name = "Tank Healing",
            sections = {
                { type = "priority", key = "tank_prio", title = "Tank healing priority",
                  spells = {
                      { id = 49284, name = "Earth Shield", note = "Always on the tank (Glyph of Earth Shield)" },
                      { id = 61301, name = "Riptide",      note = "On cooldown on the tank: procs Tidal Waves" },
                      { id = 49273, name = "Healing Wave", note = "Main tank heal with Tidal Waves (30% faster)" },
                      { id = 49276, name = "Lesser Healing Wave", note = "Fast heal when moving or on spikes" },
                      { id = 55459, name = "Chain Heal",   note = "To refresh Tidal Waves when the raid also takes damage" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Chain Heal and Riptide grant Tidal Waves: next 2 Healing Wave / Lesser Healing Wave are faster.
- Earthliving Weapon procs a heal over time from every heal: always keep it on your weapon.
- Glyphs: Chain Heal, Earth Shield, Earthliving Weapon (or Healing Wave / Lesser Healing Wave).
- Haste is very strong; aim for about 1.0 sec Chain Heal cast with raid buffs.]] },
        { key = "important", title = "Important Tips", text = [[
- Only one Earth Shield per target: talk with other Shamans.
- Water Shield is your main mana regen: never let it drop.
- Pre-cast Riptide on the tank before the pull.
- Your Mana Tide Totem helps your whole group: use it when you are under 60-70% mana.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Nature's Swiftness: instant Healing Wave in emergencies.
- Tidal Force: +60% crit on heals, use on heavy raid damage.
- Mana Tide Totem: group mana regen.
- Bloodlust / Heroism: when called, healers also profit from the haste.]],
          spells = {
              { id = 16188, name = "Nature's Swiftness" },
              { id = 55198, name = "Tidal Force" },
              { id = 16190, name = "Mana Tide Totem" },
              { id = 2825,  name = "Bloodlust" },
              { id = 32182, name = "Heroism" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Cleanse Spirit: removes poison, disease and curse.
- Cleansing Totem: passive poison and disease removal for the group.
- Tremor Totem on fear fights. Wind Shear: interrupt.]],
          spells = {
              { id = 51886, name = "Cleanse Spirit" },
              { id = 8170,  name = "Cleansing Totem" },
              { id = 8143,  name = "Tremor Totem" },
              { id = 57994, name = "Wind Shear" },
          } },
    },
})
