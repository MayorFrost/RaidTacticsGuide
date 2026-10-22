--[[
    Raid Tactics Guide - Mage rotations (patch 3.3.5a, PvE)
    Arcane, Fire, Frost
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- ARCANE
-------------------------------------------------------------------------------
RTG:RegisterSpec("MAGE", "Arcane", {
    summary = "Mana-management spec: stack Arcane Blast to 4, release with Arcane Missiles on Missile Barrage, burn and conserve phases around Evocation.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "cycle", title = "Arcane Blast cycle",
                  text = [[Pre-pull: Molten Armor (or Mage Armor if mana is short), Arcane Intellect, Focus Magic on a caster.]],
                  spells = {
                      { id = 42897, name = "Arcane Blast",    label = "1 stack" },
                      { id = 42897, name = "Arcane Blast",    label = "2 stacks" },
                      { id = 42897, name = "Arcane Blast",    label = "3 stacks" },
                      { id = 42897, name = "Arcane Blast",    label = "4 stacks" },
                      { id = 42846, name = "Arcane Missiles", label = "Barrage" },
                  },
                  footer = [[Burn phase (high mana, cooldowns up): keep casting Arcane Blast at 4 stacks, only use Arcane Missiles with Missile Barrage. Conserve phase: Arcane Blast x3-4 then Arcane Missiles to drop the stacks.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  spells = {
                      { id = 42846, name = "Arcane Missiles", note = "Only with Missile Barrage, and at 4 Arcane Blast stacks" },
                      { id = 42897, name = "Arcane Blast",    note = "Main spell; keep stacking while mana > ~35%" },
                      { id = 44781, name = "Arcane Barrage",  note = "Only while moving" },
                      { id = 12051, name = "Evocation",       note = "When mana is low, ideally after a burn phase" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 42940, name = "Blizzard",         note = "Stacked packs that live > 8 sec" },
                      { id = 42926, name = "Flamestrike",      note = "Stacked packs; cast it before Blizzard" },
                      { id = 42921, name = "Arcane Explosion", note = "Packs on top of you (mind threat)" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 17% spell hit (446 rating), minus Arcane Focus (3%) and raid buffs.
- Arcane Blast stacks raise both damage and mana cost; the stacks drop after Arcane Missiles or Arcane Barrage.
- Glyphs: Arcane Blast, Arcane Missiles, Molten Armor.]] },
        { key = "important", title = "Important Tips", text = [[
- Use your Mana Gem before Evocation, and drink a mana potion during the burn.
- Focus Magic on a caster with high crit (Moonkin, Elemental, Mage).
- Arcane Empowerment gives your group +3% damage when you crit: no action needed.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Arcane Power + Icy Veins + trinkets together, with Bloodlust when possible.
- Presence of Mind: instant Arcane Blast or Pyroblast while moving.
- Mirror Image: at the pull and with Bloodlust.
- Evocation: refill mana; channel it fully.]],
          spells = {
              { id = 12042, name = "Arcane Power" },
              { id = 12472, name = "Icy Veins" },
              { id = 12043, name = "Presence of Mind" },
              { id = 55342, name = "Mirror Image" },
              { id = 12051, name = "Evocation" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Counterspell: interrupt. Spellsteal: steal enemy buffs.
- Remove Curse: decurse the raid. Invisibility: drop threat.
- Ice Block: survive a mechanic or remove a debuff.]],
          spells = {
              { id = 2139,  name = "Counterspell" },
              { id = 30449, name = "Spellsteal" },
              { id = 475,   name = "Remove Curse" },
              { id = 66,    name = "Invisibility" },
              { id = 45438, name = "Ice Block" },
          } },
    },
})

-------------------------------------------------------------------------------
-- FIRE
-------------------------------------------------------------------------------
RTG:RegisterSpec("MAGE", "Fire", {
    summary = "Proc-based spec: keep Living Bomb up, spam Fireball, and cast Pyroblast only on Hot Streak.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Molten Armor, Arcane Intellect, Mirror Image.]],
                  spells = {
                      { id = 55360, name = "Living Bomb", label = "DoT" },
                      { id = 42833, name = "Fireball",    label = "Spam" },
                      { id = 42891, name = "Pyroblast",   label = "Hot Streak" },
                  },
                  footer = [[If no other Fire Mage or Shadow Priest provides a 5% spell crit debuff, keep Improved Scorch up with Scorch.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Fire is a priority list.]],
                  spells = {
                      { id = 42891, name = "Pyroblast",   note = "Only with Hot Streak (instant)" },
                      { id = 55360, name = "Living Bomb", note = "Not on the target (let it explode, do not clip)" },
                      { id = 42859, name = "Scorch",      note = "Only if Improved Scorch debuff is missing and no one else provides it" },
                      { id = 42833, name = "Fireball",    note = "Filler" },
                      { id = 42873, name = "Fire Blast",  note = "Only while moving" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 55360, name = "Living Bomb",  note = "On up to 3-4 mobs (tab-target)" },
                      { id = 42926, name = "Flamestrike",  note = "On the stacked pack, re-cast when the DoT ends" },
                      { id = 42940, name = "Blizzard",     note = "Between Flamestrikes on long-lived packs" },
                      { id = 42945, name = "Blast Wave",   note = "Packs in melee range" },
                      { id = 42950, name = "Dragon's Breath", note = "Packs in front of you" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hot Streak: 2 crits in a row from Fireball, Fire Blast, Scorch, Living Bomb or Frostfire Bolt give an instant Pyroblast.
- Hit cap: 17% spell hit (446 rating), lower with Precision and raid buffs.
- Glyphs: Fireball (or Frostfire), Living Bomb, Molten Armor.]] },
        { key = "important", title = "Important Tips", text = [[
- Never hard-cast Pyroblast in the rotation; it is only worth it at the pull.
- Living Bomb on several targets is a big DPS gain; it is limited only by your casting time.
- Pick Fireball over Frostfire Bolt unless your gear and talents are built for it.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Combustion: crit damage burst, use with trinkets and Bloodlust.
- Mirror Image: at the pull and with Bloodlust.
- Mana Gem / Evocation for mana.]],
          spells = {
              { id = 11129, name = "Combustion" },
              { id = 55342, name = "Mirror Image" },
              { id = 42985, name = "Conjure Mana Gem" },
              { id = 12051, name = "Evocation" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Counterspell: interrupt. Spellsteal: steal buffs.
- Remove Curse: decurse. Invisibility: drop threat.
- Ice Block: survive a mechanic.]],
          spells = {
              { id = 2139,  name = "Counterspell" },
              { id = 30449, name = "Spellsteal" },
              { id = 475,   name = "Remove Curse" },
              { id = 66,    name = "Invisibility" },
              { id = 45438, name = "Ice Block" },
          } },
    },
})

-------------------------------------------------------------------------------
-- FROST
-------------------------------------------------------------------------------
RTG:RegisterSpec("MAGE", "Frost", {
    summary = "Simple spec: spam Frostbolt, use Brain Freeze for instant Fireball and Fingers of Frost for Deep Freeze / Ice Lance.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Molten Armor (or Mage Armor), Arcane Intellect, summon Water Elemental.]],
                  spells = {
                      { id = 12472, name = "Icy Veins",    label = "Haste" },
                      { id = 55342, name = "Mirror Image", label = "Images" },
                      { id = 42842, name = "Frostbolt",    label = "Spam" },
                  },
                  footer = [[Then follow the priority and react to procs.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Frost is a priority list built around its procs.]],
                  spells = {
                      { id = 44572, name = "Deep Freeze", note = "With Fingers of Frost (bosses are stun immune: it does direct damage)" },
                      { id = 47610, name = "Frostfire Bolt", note = "Only with Brain Freeze (Fireball! buff), instant and free" },
                      { id = 42914, name = "Ice Lance",   note = "With the last Fingers of Frost charge, or while moving" },
                      { id = 42842, name = "Frostbolt",   note = "Filler" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 42940, name = "Blizzard",    note = "Main AoE on stacked packs" },
                      { id = 42917, name = "Frost Nova",  note = "Packs on you, then step out" },
                      { id = 42931, name = "Cone of Cold", note = "Packs in front of you" },
                      { id = 42921, name = "Arcane Explosion", note = "Packs on top of you" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 17% spell hit (446 rating), lower with Precision and raid buffs.
- Brain Freeze makes your next Fireball or Frostfire Bolt instant and free.
- Fingers of Frost: next 2 spells treat the target as frozen (Shatter crit bonus).
- Glyphs: Frostbolt, Water Elemental (or Eternal Water), Molten Armor.]] },
        { key = "important", title = "Important Tips", text = [[
- Frost is the weakest raid spec in 3.3.5a but the easiest; Fire or Arcane do more damage.
- Keep the Water Elemental on the boss; do not let it Freeze trash you must not pull.
- Fireball with Brain Freeze is equally fine if you prefer it over Frostfire Bolt.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Icy Veins: 20% haste, use with trinkets and Bloodlust.
- Cold Snap: resets Icy Veins, Water Elemental and Ice Block.
- Mirror Image: pull and Bloodlust.]],
          spells = {
              { id = 12472, name = "Icy Veins" },
              { id = 11958, name = "Cold Snap" },
              { id = 31687, name = "Summon Water Elemental" },
              { id = 55342, name = "Mirror Image" },
              { id = 12051, name = "Evocation" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Counterspell: interrupt. Spellsteal: steal buffs.
- Ice Barrier: absorb shield before big damage.
- Remove Curse: decurse. Ice Block: survive a mechanic.]],
          spells = {
              { id = 2139,  name = "Counterspell" },
              { id = 30449, name = "Spellsteal" },
              { id = 43039, name = "Ice Barrier" },
              { id = 475,   name = "Remove Curse" },
              { id = 45438, name = "Ice Block" },
          } },
    },
})
