--[[
    Raid Tactics Guide - Warrior rotations (patch 3.3.5a, PvE raiding)
    Arms, Fury and Protection.
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- Arms
-------------------------------------------------------------------------------
RTG:RegisterSpec("WARRIOR", "Arms", {
    summary = "Battle Stance priority spec: keep Rend up, react to Taste for Blood and Sudden Death procs, Mortal Strike on cooldown.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Arms is a |cffffd100priority list|r, not a fixed rotation. Every GCD, use the first ability that is ready. Stay in Battle Stance.]],
                  spells = {
                      { id = 47465, name = "Rend", note = "Keep up at all times; refresh when it falls off (enables Taste for Blood)" },
                      { id = 7384, name = "Overpower", note = "Only when Taste for Blood procs or the target dodges" },
                      { id = 47486, name = "Mortal Strike", note = "On cooldown; keeps the healing debuff and Trauma up" },
                      { id = 47471, name = "Execute", note = "When Sudden Death procs, or spam when target is below 20%" },
                      { id = 46924, name = "Bladestorm", note = "On cooldown when MS and Overpower are not ready" },
                      { id = 47475, name = "Slam", note = "Filler when nothing above is ready" },
                      { id = 47450, name = "Heroic Strike", note = "Rage dump only, when above ~60 rage" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority (2+ targets)",
                  spells = {
                      { id = 12328, name = "Sweeping Strikes", note = "Use first; your next 5 hits also hit a second target" },
                      { id = 46924, name = "Bladestorm", note = "On cooldown when 2+ targets are in melee range" },
                      { id = 47486, name = "Mortal Strike", note = "On cooldown, cleaved by Sweeping Strikes" },
                      { id = 7384, name = "Overpower", note = "On Taste for Blood procs" },
                      { id = 47520, name = "Cleave", note = "Rage dump instead of Heroic Strike" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Stay in Battle Stance the whole fight.
- Rend must stay up: it powers Taste for Blood (free Overpower).
- Sudden Death procs allow Execute at any health; use them before they expire.
- Only press Heroic Strike when you have spare rage, otherwise it starves Slam and MS.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 hit rating). Expertise soft cap: 26 (214 rating).
- Trauma (from Mortal Strike crits) is a raid bleed buff; do not let it drop if no Feral druid covers it.
- Keep Battle Shout or Commanding Shout up (agree with the other warriors).
- Use Sunder Armor only if no other warrior or rogue applies armor reduction.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Recklessness and Bladestorm together for burst, ideally with Heroism / Bloodlust.
- Shattering Throw on bosses with high armor, coordinate with other warriors (one at a time).
- Pop trinkets and potions with Recklessness.]],
          spells = {
              { id = 1719, name = "Recklessness" },
              { id = 46924, name = "Bladestorm" },
              { id = 64382, name = "Shattering Throw" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Pummel to interrupt casts.
- Intercept or Charge to close gaps quickly.
- Retaliation against many melee adds.
- Berserker Rage to break or prevent fear.
- Victory Rush after killing a mob that gives honor or experience.]],
          spells = {
              { id = 6552, name = "Pummel" },
              { id = 11578, name = "Charge" },
              { id = 18499, name = "Berserker Rage" },
              { id = 20230, name = "Retaliation" },
              { id = 47436, name = "Battle Shout" },
              { id = 47440, name = "Commanding Shout" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Fury
-------------------------------------------------------------------------------
RTG:RegisterSpec("WARRIOR", "Fury", {
    summary = "Titan's Grip dual wielder: Bloodthirst and Whirlwind on cooldown, Slam on Bloodsurge, dump rage into Heroic Strike.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[Fury is a |cffffd100priority list|r. Stay in Berserker Stance and use the first ready ability.]],
                  spells = {
                      { id = 23881, name = "Bloodthirst", note = "On cooldown, highest priority" },
                      { id = 1680, name = "Whirlwind", note = "On cooldown, also on single target" },
                      { id = 47475, name = "Slam", note = "Only when Bloodsurge procs (instant cast)" },
                      { id = 47471, name = "Execute", note = "Target below 20% and BT / WW are on cooldown" },
                      { id = 47450, name = "Heroic Strike", note = "Rage dump (off GCD), above ~50 rage" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority (2+ targets)",
                  spells = {
                      { id = 1680, name = "Whirlwind", note = "On cooldown, hits up to 4 targets" },
                      { id = 23881, name = "Bloodthirst", note = "When Whirlwind is on cooldown" },
                      { id = 47475, name = "Slam", note = "On Bloodsurge procs" },
                      { id = 47520, name = "Cleave", note = "Rage dump instead of Heroic Strike" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Stay in Berserker Stance.
- Bloodthirst and Whirlwind are your main damage: never delay them.
- Bloodsurge procs give an instant Slam; use it before it fades.
- Heroic Strike / Cleave are off the GCD: queue them whenever rage is high.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap for specials: 8% (263 rating), Precision gives 3% so you need 164 rating.
- Expertise soft cap 26 (214 rating) is worth chasing after hit.
- Keep Battle Shout or Commanding Shout up, agree with the other warriors.
- Rampage is passive with the talent; Sunder Armor only if nobody else does armor reduction.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Death Wish and Recklessness on pull and with Heroism / Bloodlust.
- Save one Death Wish for the execute phase (below 20%) when the fight allows it.
- Bloodrage for extra rage on pull.]],
          spells = {
              { id = 12292, name = "Death Wish" },
              { id = 1719, name = "Recklessness" },
              { id = 2687, name = "Bloodrage" },
              { id = 64382, name = "Shattering Throw" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Pummel to interrupt.
- Intercept to close distance, Heroic Fury removes roots and resets Intercept.
- Enraged Regeneration as a self heal during high damage.
- Berserker Rage against fear.]],
          spells = {
              { id = 6552, name = "Pummel" },
              { id = 20252, name = "Intercept" },
              { id = 60970, name = "Heroic Fury" },
              { id = 55694, name = "Enraged Regeneration" },
              { id = 18499, name = "Berserker Rage" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Protection
-------------------------------------------------------------------------------
RTG:RegisterSpec("WARRIOR", "Protection", {
    summary = "Defensive Stance tank: Shield Slam, Revenge and Devastate for threat; Thunder Clap and Demoralizing Shout debuffs.",
    categories = {
        {
            name = "Single Target Threat",
            sections = {
                { type = "priority", key = "st_prio", title = "Single target threat priority",
                  text = [[Protection is a |cffffd100priority list|r. Stay in Defensive Stance.]],
                  spells = {
                      { id = 47488, name = "Shield Slam", note = "On cooldown and on every Sword and Board proc" },
                      { id = 57823, name = "Revenge", note = "Whenever it lights up after a block, dodge or parry" },
                      { id = 46968, name = "Shockwave", note = "On cooldown if the boss is not stun immune (damage still counts)" },
                      { id = 12809, name = "Concussion Blow", note = "On cooldown" },
                      { id = 47502, name = "Thunder Clap", note = "Keep the attack speed debuff up" },
                      { id = 47437, name = "Demoralizing Shout", note = "Keep up if no druid or paladin covers it" },
                      { id = 47498, name = "Devastate", note = "Filler, stacks Sunder Armor" },
                      { id = 47450, name = "Heroic Strike", note = "Rage dump (off GCD) when rage is high" },
                  } },
            },
        },
        {
            name = "AoE Threat",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE threat priority",
                  spells = {
                      { id = 47502, name = "Thunder Clap", note = "On cooldown, hits every nearby enemy" },
                      { id = 46968, name = "Shockwave", note = "Face the pack, stuns and damages in a cone" },
                      { id = 57823, name = "Revenge", note = "Hits a second target with Improved Revenge" },
                      { id = 47488, name = "Shield Slam", note = "On cooldown on your main target" },
                      { id = 47520, name = "Cleave", note = "Rage dump instead of Heroic Strike" },
                      { id = 47498, name = "Devastate", note = "Tab between targets to spread Sunder" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Stay in Defensive Stance.
- Shield Slam is your biggest threat; Sword and Board procs reset it.
- Cast Vigilance on the top DPS (it also returns Taunt cooldowns).
- Keep Thunder Clap and Demoralizing Shout up on bosses.]] },
        { key = "important", title = "Important Tips", text = [[
- Defense cap: 540 defense skill (689 defense rating) to be uncrittable by bosses.
- Hit 8% (263 rating) and expertise 26 help threat, but survival comes first.
- Use Taunt only when you need to take the boss back; it does not add threat over time.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Shield Wall (-60% damage) and Last Stand (+30% health) for heavy damage phases.
- Shield Block before big physical hits (and for higher Shield Slam damage).
- Enraged Regeneration as an extra self heal.]],
          spells = {
              { id = 871, name = "Shield Wall" },
              { id = 12975, name = "Last Stand" },
              { id = 2565, name = "Shield Block" },
              { id = 55694, name = "Enraged Regeneration" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Taunt for tank swaps.
- Challenging Shout if adds run to the healers.
- Spell Reflection against single target spells.
- Intervene to save a raid member or move fast.
- Heroic Throw to pull at range.]],
          spells = {
              { id = 355, name = "Taunt" },
              { id = 1161, name = "Challenging Shout" },
              { id = 23920, name = "Spell Reflection" },
              { id = 3411, name = "Intervene" },
              { id = 50720, name = "Vigilance" },
              { id = 57755, name = "Heroic Throw" },
          } },
    },
})
