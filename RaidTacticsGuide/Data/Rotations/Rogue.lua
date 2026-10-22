--[[
    Raid Tactics Guide - Rogue rotations (patch 3.3.5a, PvE raiding)
    Assassination, Combat and Subtlety.
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- Assassination
-------------------------------------------------------------------------------
RTG:RegisterSpec("ROGUE", "Assassination", {
    summary = "Mutilate poison spec: keep Hunger For Blood and Slice and Dice up, Envenom at 4 combo points.",
    categories = {
        {
            name = "Opener",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  spells = {
                      { id = 57934, name = "Tricks of the Trade", label = "On tank" },
                      { id = 48676, name = "Garrote", label = "From stealth" },
                      { id = 48666, name = "Mutilate", label = "Build CP" },
                      { id = 6774, name = "Slice and Dice", label = "1-2 CP" },
                      { id = 51662, name = "Hunger For Blood", label = "Needs bleed" },
                      { id = 48666, name = "Mutilate", label = "Build CP" },
                      { id = 57993, name = "Envenom", label = "4 CP" },
                  },
                  footer = [[Hunger For Blood needs a bleed on the target (your Garrote or Rupture, or a warrior / feral bleed).]] },
            },
        },
        {
            name = "Single Target",
            sections = {
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Assassination is a |cffffd100priority list|r. Pool energy so you never cap.]],
                  spells = {
                      { id = 51662, name = "Hunger For Blood", note = "Keep up at all times, refresh with < 5 sec left" },
                      { id = 6774, name = "Slice and Dice", note = "Keep up; Envenom with Cut to the Chase refreshes it" },
                      { id = 57993, name = "Envenom", note = "At 4 combo points (Mutilate often gives 2-3)" },
                      { id = 48672, name = "Rupture", note = "Only if no other bleed keeps Hunger For Blood active" },
                      { id = 48666, name = "Mutilate", note = "Combo point builder" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 51723, name = "Fan of Knives", note = "Spam on 3+ targets (poisons apply too)" },
                      { id = 6774, name = "Slice and Dice", note = "Keep up if the pack lives long" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Main hand Instant Poison, off hand Deadly Poison (or the other way, Deadly on the slower weapon).
- Envenom at 4 combo points; Mutilate gives 2 (3 with Seal Fate crits).
- Do not let Hunger For Blood drop: it is a 15% damage buff.
- Envenom consumes Deadly Poison stacks; with Master Poisoner that is fine.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating) for specials, 17% for poisons (Precision helps).
- Expertise soft cap 26 (214 rating).
- Master Poisoner gives the raid +3% crit debuff.
- Use Tricks of the Trade on the tank at pull and on cooldown on a DPS.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Cold Blood before an Envenom for a guaranteed crit.
- Vanish then Garrote or Overkill for extra damage (also drops threat).]],
          spells = {
              { id = 14177, name = "Cold Blood" },
              { id = 26889, name = "Vanish" },
              { id = 57934, name = "Tricks of the Trade" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Kick to interrupt.
- Feint to lower threat and AoE damage taken.
- Cloak of Shadows removes and prevents magic debuffs.
- Evasion if a mob attacks you.
- Expose Armor only if no warrior applies Sunder Armor.]],
          spells = {
              { id = 1766, name = "Kick" },
              { id = 48659, name = "Feint" },
              { id = 31224, name = "Cloak of Shadows" },
              { id = 26669, name = "Evasion" },
              { id = 8643, name = "Kidney Shot" },
              { id = 8647, name = "Expose Armor" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Combat
-------------------------------------------------------------------------------
RTG:RegisterSpec("ROGUE", "Combat", {
    summary = "Sinister Strike builder with Rupture and Slice and Dice upkeep; Killing Spree, Adrenaline Rush and Blade Flurry for burst.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  spells = {
                      { id = 57934, name = "Tricks of the Trade", label = "On tank" },
                      { id = 48638, name = "Sinister Strike", label = "Build CP" },
                      { id = 6774, name = "Slice and Dice", label = "1-2 CP" },
                      { id = 48638, name = "Sinister Strike", label = "Build CP" },
                      { id = 48672, name = "Rupture", label = "5 CP" },
                      { id = 13750, name = "Adrenaline Rush", label = "Burst" },
                  },
                  footer = [[Then keep both finishers up as shown in the priority.]] },
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Combat is a |cffffd100priority list|r built around keeping two finishers up.]],
                  spells = {
                      { id = 6774, name = "Slice and Dice", note = "Keep up at all times, refresh with < 2 sec left" },
                      { id = 48672, name = "Rupture", note = "5 CP, keep up if no other rogue or feral has a bleed on it" },
                      { id = 48668, name = "Eviscerate", note = "5 CP when SnD and Rupture both have time left" },
                      { id = 51690, name = "Killing Spree", note = "On cooldown when energy is low (under ~40)" },
                      { id = 48638, name = "Sinister Strike", note = "Combo point builder" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 13877, name = "Blade Flurry", note = "On 2 targets: every hit copies to a second target" },
                      { id = 6774, name = "Slice and Dice", note = "Keep up, works with Blade Flurry" },
                      { id = 51723, name = "Fan of Knives", note = "Spam on 3+ targets" },
                      { id = 51690, name = "Killing Spree", note = "With Blade Flurry for big cleave" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Main hand Instant Poison, off hand Deadly Poison (slow main hand, fast off hand).
- Slice and Dice is your most important buff: never let it fall off.
- Use Glyph of Killing Spree, Glyph of Sinister Strike and Glyph of Slice and Dice / Rupture.
- Never go below 5 combo points for Rupture or Eviscerate.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating) for specials, Precision gives 5%.
- Expertise soft cap 26 (214 rating), Weapon Expertise talent gives 10.
- Combat gives Savage Combat (+4% physical damage debuff) to the raid.
- Tricks of the Trade on the tank at pull, then on a DPS.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Adrenaline Rush: double energy regen for 15 sec, use with Heroism / Bloodlust.
- Killing Spree: do not use it while Adrenaline Rush is up (energy would cap).
- Blade Flurry whenever a second target is in range (Glyph of Blade Flurry removes its energy cost).]],
          spells = {
              { id = 13750, name = "Adrenaline Rush" },
              { id = 51690, name = "Killing Spree" },
              { id = 13877, name = "Blade Flurry" },
              { id = 57934, name = "Tricks of the Trade" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Kick to interrupt.
- Feint and Vanish to reduce threat.
- Cloak of Shadows against magic debuffs.
- Evasion if a mob attacks you.]],
          spells = {
              { id = 1766, name = "Kick" },
              { id = 48659, name = "Feint" },
              { id = 26889, name = "Vanish" },
              { id = 31224, name = "Cloak of Shadows" },
              { id = 26669, name = "Evasion" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Subtlety
-------------------------------------------------------------------------------
RTG:RegisterSpec("ROGUE", "Subtlety", {
    summary = "Hemorrhage builder with Shadow Dance bursts of Ambush; keep Slice and Dice and Rupture up. Weaker in raids than Combat.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  spells = {
                      { id = 57934, name = "Tricks of the Trade", label = "On tank" },
                      { id = 14183, name = "Premeditation", label = "2 CP" },
                      { id = 48691, name = "Ambush", label = "From stealth" },
                      { id = 6774, name = "Slice and Dice", label = "SnD" },
                      { id = 48660, name = "Hemorrhage", label = "Build CP" },
                      { id = 48672, name = "Rupture", label = "5 CP" },
                  },
                  footer = [[Then follow the priority list.]] },
                { type = "rotation", key = "dance", title = "Shadow Dance window",
                  text = [[During |cffffd100Shadow Dance|r (6 sec) you can use stealth abilities. Use this fixed sequence:]],
                  spells = {
                      { id = 51713, name = "Shadow Dance", label = "Start" },
                      { id = 14183, name = "Premeditation", label = "2 CP" },
                      { id = 48691, name = "Ambush", label = "Spam" },
                      { id = 48691, name = "Ambush", label = "Spam" },
                      { id = 48668, name = "Eviscerate", label = "5 CP" },
                  },
                  footer = [[Pool energy (80+) before pressing Shadow Dance.]] },
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Outside Shadow Dance, Subtlety is a |cffffd100priority list|r.]],
                  spells = {
                      { id = 6774, name = "Slice and Dice", note = "Keep up, refresh with < 2 sec left" },
                      { id = 48672, name = "Rupture", note = "5 CP, keep up on the boss" },
                      { id = 48668, name = "Eviscerate", note = "5 CP when both finishers have time left" },
                      { id = 48660, name = "Hemorrhage", note = "Keep the debuff up, also the main builder" },
                      { id = 48657, name = "Backstab", note = "Builder if you are behind and Hemorrhage debuff is up" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Subtlety is behind Combat and Assassination in raids; play it only if your raid needs it.
- Hemorrhage gives the raid a physical damage taken debuff, keep it up.
- Instant Poison main hand, Deadly Poison off hand.
- Use Glyph of Hemorrhage and Glyph of Shadow Dance.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating) for specials.
- Expertise soft cap 26 (214 rating).
- Ambush requires a dagger in the main hand.
- Honor Among Thieves gives you combo points from raid crits.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Shadow Dance every minute for a burst of Ambushes.
- Shadowstep for a damage buff and to get behind the target.
- Preparation resets Vanish, Shadowstep and Premeditation.]],
          spells = {
              { id = 51713, name = "Shadow Dance" },
              { id = 36554, name = "Shadowstep" },
              { id = 14185, name = "Preparation" },
              { id = 26889, name = "Vanish" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Kick to interrupt.
- Feint to lower threat.
- Cloak of Shadows against magic debuffs.
- Kidney Shot to stun adds.]],
          spells = {
              { id = 1766, name = "Kick" },
              { id = 48659, name = "Feint" },
              { id = 31224, name = "Cloak of Shadows" },
              { id = 8643, name = "Kidney Shot" },
              { id = 57934, name = "Tricks of the Trade" },
          } },
    },
})
