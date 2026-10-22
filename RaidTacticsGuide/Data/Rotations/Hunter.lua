--[[
    Raid Tactics Guide - Hunter rotations (patch 3.3.5a, PvE raiding)
    Beast Mastery, Marksmanship and Survival.
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- Beast Mastery
-------------------------------------------------------------------------------
RTG:RegisterSpec("HUNTER", "BeastMastery", {
    summary = "Pet focused priority spec: Kill Command and Bestial Wrath on cooldown, Steady Shot filler, exotic pet for raid buffs.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  spells = {
                      { id = 34477, name = "Misdirection", label = "On tank" },
                      { id = 53338, name = "Hunter's Mark", label = "Mark" },
                      { id = 49001, name = "Serpent Sting", label = "DoT" },
                      { id = 19574, name = "Bestial Wrath", label = "Burst" },
                      { id = 3045, name = "Rapid Fire", label = "Haste" },
                      { id = 34026, name = "Kill Command", label = "Pet" },
                  },
                  footer = [[Then follow the priority list below.]] },
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Beast Mastery is a |cffffd100priority list|r. Use the first ready shot.]],
                  spells = {
                      { id = 61006, name = "Kill Shot", note = "Only when the target is below 20%" },
                      { id = 34026, name = "Kill Command", note = "On cooldown (off the GCD)" },
                      { id = 19574, name = "Bestial Wrath", note = "On cooldown, together with Rapid Fire" },
                      { id = 49001, name = "Serpent Sting", note = "Keep up, refresh only after it falls off" },
                      { id = 49050, name = "Aimed Shot", note = "On cooldown (shares its cooldown with Multi-Shot)" },
                      { id = 49045, name = "Arcane Shot", note = "On cooldown when mana allows" },
                      { id = 49052, name = "Steady Shot", note = "Filler between all other shots" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 49048, name = "Multi-Shot", note = "On cooldown, hits 3 targets" },
                      { id = 58434, name = "Volley", note = "Channel on 4+ stacked targets" },
                      { id = 49067, name = "Explosive Trap", note = "Placed at your feet (no Trap Launcher in 3.3.5a), only if the pack is near you" },
                      { id = 34026, name = "Kill Command", note = "On cooldown" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Use Aspect of the Dragonhawk, swap to Aspect of the Viper only when out of mana.
- Pet: Wolf (Furious Howl) or exotic Devilsaur / Core Hound with Beast Mastery.
- Keep the pet on Growl off in raids, and keep it behind the boss.
- Call of the Wild (pet ability) with Bestial Wrath for burst.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating), Focused Aim talent lowers it.
- The pet also needs hit and expertise; it scales from your hit rating.
- Misdirection on the tank on every pull and after a tank swap.
- Hunter's Mark is a raid buff to attack power, keep it on the boss.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Bestial Wrath (2 min) and Rapid Fire (5 min) together, ideally with Heroism / Bloodlust.
- Use trinkets and potions with Bestial Wrath.]],
          spells = {
              { id = 19574, name = "Bestial Wrath" },
              { id = 3045, name = "Rapid Fire" },
              { id = 53434, name = "Call of the Wild" },
              { id = 34477, name = "Misdirection" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Feign Death to drop threat.
- Tranquilizing Shot to remove enrage effects.
- Freezing Trap or Freezing Arrow for crowd control.
- Master's Call to free a player from roots.
- Deterrence in emergencies.]],
          spells = {
              { id = 5384, name = "Feign Death" },
              { id = 19801, name = "Tranquilizing Shot" },
              { id = 60192, name = "Freezing Arrow" },
              { id = 53271, name = "Master's Call" },
              { id = 19263, name = "Deterrence" },
              { id = 61847, name = "Aspect of the Dragonhawk" },
              { id = 34074, name = "Aspect of the Viper" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Marksmanship
-------------------------------------------------------------------------------
RTG:RegisterSpec("HUNTER", "Marksmanship", {
    summary = "Shot priority spec built around Chimera Shot refreshing Serpent Sting; brings Trueshot Aura to the raid.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  spells = {
                      { id = 34477, name = "Misdirection", label = "On tank" },
                      { id = 53338, name = "Hunter's Mark", label = "Mark" },
                      { id = 49001, name = "Serpent Sting", label = "DoT" },
                      { id = 53209, name = "Chimera Shot", label = "Refresh" },
                      { id = 3045, name = "Rapid Fire", label = "Haste" },
                      { id = 49050, name = "Aimed Shot", label = "Strike" },
                  },
                  footer = [[Then follow the priority list below.]] },
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Marksmanship is a |cffffd100priority list|r. Use the first ready shot.]],
                  spells = {
                      { id = 61006, name = "Kill Shot", note = "Only when the target is below 20%" },
                      { id = 49001, name = "Serpent Sting", note = "Apply once; Chimera Shot keeps it refreshed" },
                      { id = 53209, name = "Chimera Shot", note = "On cooldown (refreshes Serpent Sting)" },
                      { id = 49050, name = "Aimed Shot", note = "On cooldown" },
                      { id = 49045, name = "Arcane Shot", note = "Only when Chimera and Aimed are on cooldown and mana is fine" },
                      { id = 49052, name = "Steady Shot", note = "Filler between all other shots" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 49048, name = "Multi-Shot", note = "On cooldown, hits 3 targets" },
                      { id = 58434, name = "Volley", note = "Channel on 4+ stacked targets" },
                      { id = 49067, name = "Explosive Trap", note = "Drop under the pack when safe" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Never let Serpent Sting fall off: Chimera Shot refreshes it and deals bonus damage.
- Steady Shot fills every gap; do not clip it with other shots too early.
- Use Aspect of the Dragonhawk, swap to Viper only when out of mana.
- Pet: a Wolf for Furious Howl or a Cat for damage.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating), Focused Aim lowers it.
- Glyph of Serpent Sting, Glyph of Steady Shot and Glyph of Chimera Shot are standard.
- Trueshot Aura is your raid buff (10% attack power), keep it on.
- Misdirection on the tank on every pull.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Rapid Fire, then Readiness to reset it and use Rapid Fire again (also resets Misdirection and Chimera).
- Use trinkets and potions with Rapid Fire and Heroism / Bloodlust.]],
          spells = {
              { id = 3045, name = "Rapid Fire" },
              { id = 23989, name = "Readiness" },
              { id = 34477, name = "Misdirection" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Silencing Shot to interrupt casts (also usable for extra damage).
- Tranquilizing Shot to remove enrage.
- Feign Death to drop threat.
- Freezing Trap or Freezing Arrow for crowd control.]],
          spells = {
              { id = 34490, name = "Silencing Shot" },
              { id = 19801, name = "Tranquilizing Shot" },
              { id = 5384, name = "Feign Death" },
              { id = 60192, name = "Freezing Arrow" },
              { id = 61847, name = "Aspect of the Dragonhawk" },
              { id = 34074, name = "Aspect of the Viper" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Survival
-------------------------------------------------------------------------------
RTG:RegisterSpec("HUNTER", "Survival", {
    summary = "Explosive Shot cycle with Lock and Load procs; keep Black Arrow and Serpent Sting up. Brings Replenishment.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  spells = {
                      { id = 34477, name = "Misdirection", label = "On tank" },
                      { id = 53338, name = "Hunter's Mark", label = "Mark" },
                      { id = 49001, name = "Serpent Sting", label = "DoT" },
                      { id = 63672, name = "Black Arrow", label = "DoT" },
                      { id = 60053, name = "Explosive Shot", label = "Nuke" },
                      { id = 3045, name = "Rapid Fire", label = "Haste" },
                  },
                  footer = [[Then follow the cycle below.]] },
                { type = "rotation", key = "lnl_cycle", title = "Lock and Load cycle",
                  text = [[When |cffffd100Lock and Load|r procs, you get 2 free shots. Explosive Shot must not overwrite its own DoT, so use this |cffffd100fixed cycle|r:]],
                  spells = {
                      { id = 60053, name = "Explosive Shot", label = "Shot 1" },
                      { id = 49052, name = "Steady Shot", label = "Filler" },
                      { id = 60053, name = "Explosive Shot", label = "Shot 2" },
                  },
                  footer = [[Put one other shot (Steady, Aimed or Kill Shot) between two Explosive Shots so the DoT can finish.]] },
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Outside Lock and Load, Survival is a |cffffd100priority list|r.]],
                  spells = {
                      { id = 61006, name = "Kill Shot", note = "Only when the target is below 20%" },
                      { id = 60053, name = "Explosive Shot", note = "On cooldown, and on Lock and Load procs" },
                      { id = 63672, name = "Black Arrow", note = "Keep up (main source of Lock and Load procs)" },
                      { id = 49001, name = "Serpent Sting", note = "Keep up, refresh only after it falls off" },
                      { id = 49050, name = "Aimed Shot", note = "On cooldown" },
                      { id = 49052, name = "Steady Shot", note = "Filler" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 49067, name = "Explosive Trap", note = "Under the pack, can proc Lock and Load" },
                      { id = 49048, name = "Multi-Shot", note = "On cooldown, hits 3 targets" },
                      { id = 58434, name = "Volley", note = "Channel on 4+ stacked targets" },
                      { id = 60053, name = "Explosive Shot", note = "On Lock and Load procs" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Lock and Load procs from Black Arrow and traps: next 2 shots cost no mana and no cooldown.
- Never cast Explosive Shot twice in a row; put another shot in between.
- Hunting Party gives the raid Replenishment through your Steady / Arcane / Explosive crits.
- Use Aspect of the Dragonhawk, Viper only when out of mana.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating).
- Agility is your best stat after hit.
- Glyph of Explosive Shot, Glyph of Serpent Sting and Glyph of Kill Shot are standard.
- Black Arrow shares a cooldown with traps: do not waste it on a trap on single target.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Rapid Fire with Heroism / Bloodlust, trinkets and potions.
- Readiness if you have it in your build.]],
          spells = {
              { id = 3045, name = "Rapid Fire" },
              { id = 34477, name = "Misdirection" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Feign Death to drop threat.
- Tranquilizing Shot to remove enrage.
- Freezing Trap or Freezing Arrow for crowd control.
- Deterrence in emergencies.]],
          spells = {
              { id = 5384, name = "Feign Death" },
              { id = 19801, name = "Tranquilizing Shot" },
              { id = 14311, name = "Freezing Trap" },
              { id = 60192, name = "Freezing Arrow" },
              { id = 19263, name = "Deterrence" },
              { id = 61847, name = "Aspect of the Dragonhawk" },
              { id = 34074, name = "Aspect of the Viper" },
          } },
    },
})
