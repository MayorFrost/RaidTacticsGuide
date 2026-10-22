--[[
    Raid Tactics Guide - Druid rotations (patch 3.3.5a, PvE)
    Balance, Feral (Cat DPS / Bear Tank), Restoration
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- BALANCE
-------------------------------------------------------------------------------
RTG:RegisterSpec("DRUID", "Balance", {
    summary = "Eclipse cycle caster: Wrath until Lunar Eclipse, Starfire during it, Starfire until Solar Eclipse, Wrath during it. Keep DoTs and Faerie Fire up.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Moonkin Form, Mark/Gift of the Wild, Thorns on the tank.]],
                  spells = {
                      { id = 770,   name = "Faerie Fire",   label = "Debuff" },
                      { id = 48468, name = "Insect Swarm",  label = "DoT" },
                      { id = 48463, name = "Moonfire",      label = "DoT" },
                      { id = 33831, name = "Force of Nature", label = "Treants" },
                      { id = 48461, name = "Wrath",         label = "To Lunar" },
                  },
                  footer = [[Then start the Eclipse cycle below.]] },
                { type = "rotation", key = "eclipse", title = "Eclipse cycle",
                  text = [[Eclipse procs from crits, each has its own 30 sec cooldown.]],
                  spells = {
                      { id = 48461, name = "Wrath",    label = "Until Lunar" },
                      { id = 48518, name = "Eclipse (Lunar)", label = "Proc" },
                      { id = 48465, name = "Starfire", label = "15 sec" },
                      { rowBreak = true },
                      { id = 48465, name = "Starfire", label = "Until Solar" },
                      { id = 48517, name = "Eclipse (Solar)", label = "Proc" },
                      { id = 48461, name = "Wrath",    label = "15 sec" },
                  },
                  footer = [[Keep casting the same spell after an Eclipse ends until the other Eclipse procs. Starfall on cooldown only if it will not pull extra mobs.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  spells = {
                      { id = 770,   name = "Faerie Fire",  note = "Missing on the boss (and no Feral druid keeps it)" },
                      { id = 48468, name = "Insect Swarm", note = "Not on target; skip it during Lunar Eclipse" },
                      { id = 48463, name = "Moonfire",     note = "Not on target; skip it during Solar Eclipse" },
                      { id = 53201, name = "Starfall",     note = "On cooldown when safe (single boss, no adds to pull)" },
                      { id = 48465, name = "Starfire",     note = "During Lunar Eclipse, and while waiting for Solar" },
                      { id = 48461, name = "Wrath",        note = "During Solar Eclipse, and while waiting for Lunar" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 53201, name = "Starfall",   note = "On cooldown in the pack" },
                      { id = 48467, name = "Hurricane",  note = "Stacked packs (channel)" },
                      { id = 61384, name = "Typhoon",    note = "Knock back packs; mind the tank position" },
                      { id = 48463, name = "Moonfire",   note = "Moving: tab-DoT" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 17% spell hit, minus Balance of Power (4%) = 13%, about 341 rating; Draenei and Misery lower it further.
- Glyphs: Starfire, Moonfire, Starfall (or Insect Swarm).
- Do not cast Moonfire/Insect Swarm during the wrong Eclipse: the extra casts lose damage.]] },
        { key = "important", title = "Important Tips", text = [[
- Moonkin Aura (5% spell crit) and Improved Faerie Fire (3% hit) are raid buffs: stay in range.
- Earth and Moon gives the raid +13% spell damage taken: your Wrath and Starfire keep it up.
- Starfall hits every mob in range: do not use it near un-pulled packs.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Force of Nature: treants at the pull and with Bloodlust.
- Starfall: on cooldown on single bosses.
- Innervate: on yourself or a healer that needs mana.]],
          spells = {
              { id = 33831, name = "Force of Nature" },
              { id = 53201, name = "Starfall" },
              { id = 29166, name = "Innervate" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Rebirth: combat resurrection.
- Barkskin: damage reduction, castable while stunned.
- Remove Curse / Abolish Poison: cleanse the raid.
- Cyclone / Hibernate / Entangling Roots: crowd control on trash.]],
          spells = {
              { id = 48477, name = "Rebirth" },
              { id = 22812, name = "Barkskin" },
              { id = 2782,  name = "Remove Curse" },
              { id = 2893,  name = "Abolish Poison" },
          } },
    },
})

-------------------------------------------------------------------------------
-- FERAL
-------------------------------------------------------------------------------
RTG:RegisterSpec("DRUID", "Feral", {
    summary = "Cat: energy priority around Savage Roar, Rip and Mangle, Shred filler. Bear: Mangle, Lacerate stack, Faerie Fire (Feral), Maul with spare rage.",
    categories = {
        {
            name = "Cat DPS",
            sections = {
                { type = "rotation", key = "cat_open", title = "Opener",
                  text = [[Cat Form. Stand behind the boss.]],
                  spells = {
                      { id = 48566, name = "Mangle (Cat)",  label = "Debuff" },
                      { id = 16857, name = "Faerie Fire (Feral)", label = "Armor" },
                      { id = 48572, name = "Shred",         label = "Combo" },
                      { id = 52610, name = "Savage Roar",   label = "1-2 CP" },
                      { id = 50213, name = "Tiger's Fury",  label = "Energy" },
                      { id = 50334, name = "Berserk",       label = "Burst" },
                      { rowBreak = true },
                      { id = 48574, name = "Rake",          label = "Bleed" },
                      { id = 48572, name = "Shred",         label = "Combo" },
                      { id = 49800, name = "Rip",           label = "5 CP" },
                  },
                  footer = [[Then follow the priority list.]] },
                { type = "priority", key = "cat_prio", title = "Priority",
                  text = [[Feral Cat is an energy priority list.]],
                  spells = {
                      { id = 52610, name = "Savage Roar",  note = "Not active (any combo points); try to keep it desynced from Rip" },
                      { id = 49800, name = "Rip",          note = "5 combo points and Rip not on the target" },
                      { id = 48566, name = "Mangle (Cat)", note = "Bleed debuff missing (no Arms Warrior / other Feral)" },
                      { id = 48574, name = "Rake",         note = "Not on the target" },
                      { id = 50213, name = "Tiger's Fury", note = "Energy < 30 and Berserk not active" },
                      { id = 48577, name = "Ferocious Bite", note = "5 CP and Rip + Savage Roar have > 10 sec left" },
                      { id = 16857, name = "Faerie Fire (Feral)", note = "Debuff missing, or as energy-free filler" },
                      { id = 48572, name = "Shred",        note = "Filler to build combo points" },
                  } },
            },
        },
        {
            name = "Bear Tank",
            sections = {
                { type = "rotation", key = "bear_open", title = "Pull",
                  text = [[Dire Bear Form. Feral Charge or Faerie Fire (Feral) to pull.]],
                  spells = {
                      { id = 16979, name = "Feral Charge - Bear", label = "Charge" },
                      { id = 48564, name = "Mangle (Bear)", label = "Threat" },
                      { id = 16857, name = "Faerie Fire (Feral)", label = "Armor" },
                      { id = 48568, name = "Lacerate",      label = "x5 stack" },
                      { id = 48480, name = "Maul",          label = "Rage dump" },
                  },
                  footer = [[On packs: Swipe (Bear) on cooldown, tab-target Mangle, Maul with spare rage.]] },
                { type = "priority", key = "bear_prio", title = "Threat priority",
                  spells = {
                      { id = 48564, name = "Mangle (Bear)",  note = "On cooldown" },
                      { id = 16857, name = "Faerie Fire (Feral)", note = "On cooldown (threat and armor debuff)" },
                      { id = 48568, name = "Lacerate",       note = "Build to 5 stacks, refresh with < 3 sec left" },
                      { id = 48562, name = "Swipe (Bear)",   note = "Filler, or main ability on 2+ mobs" },
                      { id = 48560, name = "Demoralizing Roar", note = "Debuff missing (no Warrior or other Druid)" },
                      { id = 48480, name = "Maul",           note = "Off the GCD; queue it when rage > 40" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Cat: hit cap 8% (263 rating), expertise 26. Glyphs: Shred, Rip, Savage Roar.
- Bear: Glyphs Maul, Survival Instincts, Frenzied Regeneration (or Berserk).
- Omen of Clarity proc (Clearcasting): next ability is free - spend it on Shred (cat) or Maul (bear).]] },
        { key = "important", title = "Important Tips", text = [[
- Cat: never let Savage Roar or Rip fall off; Shred needs you behind the target.
- Glyph of Shred extends Rip with each Shred: up to 6 sec.
- Bear: Savage Defense absorbs from crits - crit and agility help survival.
- Your Leader of the Pack gives the raid 5% melee crit: keep it on.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Berserk: cat energy cost halved, bear Mangle hits 3 targets without cooldown.
- Tiger's Fury: +energy and damage (cat).
- Bear survival: Survival Instincts, Barkskin, Frenzied Regeneration, Enrage for rage.]],
          spells = {
              { id = 50334, name = "Berserk" },
              { id = 50213, name = "Tiger's Fury" },
              { id = 61336, name = "Survival Instincts" },
              { id = 22812, name = "Barkskin" },
              { id = 22842, name = "Frenzied Regeneration" },
              { id = 5229,  name = "Enrage" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Growl: taunt; Challenging Roar: AoE taunt for adds.
- Bash: stun / interrupt trash. Feral Charge - Cat: close gaps.
- Rebirth: combat resurrection (tank Druid often keeps it for healers).]],
          spells = {
              { id = 6795,  name = "Growl" },
              { id = 5209,  name = "Challenging Roar" },
              { id = 8983,  name = "Bash" },
              { id = 49376, name = "Feral Charge - Cat" },
              { id = 48477, name = "Rebirth" },
          } },
    },
})

-------------------------------------------------------------------------------
-- RESTORATION
-------------------------------------------------------------------------------
RTG:RegisterSpec("DRUID", "Restoration", {
    summary = "HoT healer: Lifebloom stacks on the tank, Wild Growth on cooldown, Rejuvenation blanket and Nourish/Swiftmend for spikes.",
    categories = {
        {
            name = "Raid Healing",
            sections = {
                { type = "rotation", key = "setup", title = "Pull setup",
                  text = [[Tree of Life form. Pre-HoT the tank before the pull.]],
                  spells = {
                      { id = 48451, name = "Lifebloom",    label = "x3 tank" },
                      { id = 48441, name = "Rejuvenation", label = "Tank" },
                      { id = 48443, name = "Regrowth",     label = "Tank" },
                      { id = 53251, name = "Wild Growth",  label = "Raid" },
                  },
                  footer = [[Keep 3 Lifebloom stacks rolling on the main tank (refresh before it blooms).]] },
                { type = "priority", key = "raid_prio", title = "Raid healing priority",
                  spells = {
                      { id = 53251, name = "Wild Growth",  note = "On cooldown on a stacked damaged group" },
                      { id = 48441, name = "Rejuvenation", note = "On damaged players without one" },
                      { id = 18562, name = "Swiftmend",    note = "Instant heal on a player at low health with a HoT" },
                      { id = 50464, name = "Nourish",      note = "Fast heal on targets that have your HoTs (+20%)" },
                      { id = 48443, name = "Regrowth",     note = "Spikes, or on targets that need a HoT and a direct heal" },
                  } },
            },
        },
        {
            name = "Tank Healing",
            sections = {
                { type = "priority", key = "tank_prio", title = "Tank healing priority",
                  spells = {
                      { id = 48451, name = "Lifebloom",    note = "Keep 3 stacks; refresh with 1-2 sec left" },
                      { id = 48441, name = "Rejuvenation", note = "Keep it on the tank" },
                      { id = 48443, name = "Regrowth",     note = "Keep the HoT up for Nourish and Glyph of Swiftmend" },
                      { id = 18562, name = "Swiftmend",    note = "On cooldown during damage spikes" },
                      { id = 50464, name = "Nourish",      note = "Spam heal when the tank takes heavy damage" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Haste is king: 856 haste rating lets Rejuvenation and Wild Growth hit the 1.0 sec GCD in Tree of Life with raid buffs.
- Glyphs: Wild Growth, Swiftmend (keeps the HoT), Nourish or Rejuvenation / Lifebloom.
- Tree of Life gives +6% healing received to your group.]] },
        { key = "important", title = "Important Tips", text = [[
- Lifebloom stacks on one tank only; letting it bloom wastes mana.
- Omen of Clarity: next heal is free - use it on Regrowth.
- Nature's Grace / haste breakpoints matter more than spell power.
- Assign Innervate with the other healers.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Nature's Swiftness: instant Healing Touch in emergencies.
- Tranquility: big group heal (channel, stand still).
- Innervate: mana for you or another healer.
- Barkskin: personal damage reduction.]],
          spells = {
              { id = 17116, name = "Nature's Swiftness" },
              { id = 48378, name = "Healing Touch" },
              { id = 48447, name = "Tranquility" },
              { id = 29166, name = "Innervate" },
              { id = 22812, name = "Barkskin" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Rebirth: combat resurrection.
- Remove Curse / Abolish Poison: cleanse the raid.
- Nature's Grasp: roots melee adds that hit you.]],
          spells = {
              { id = 48477, name = "Rebirth" },
              { id = 2782,  name = "Remove Curse" },
              { id = 2893,  name = "Abolish Poison" },
              { id = 53312, name = "Nature's Grasp" },
          } },
    },
})
