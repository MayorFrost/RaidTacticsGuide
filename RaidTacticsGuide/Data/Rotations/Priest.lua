--[[
    Raid Tactics Guide - Priest rotations (patch 3.3.5a, PvE raiding)
    Discipline, Holy and Shadow.
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- Discipline
-------------------------------------------------------------------------------
RTG:RegisterSpec("PRIEST", "Discipline", {
    summary = "Absorb healer: Power Word: Shield prevents damage, Penance and Flash Heal top up, Pain Suppression saves tanks.",
    categories = {
        {
            name = "Tank Healing",
            sections = {
                { type = "priority", key = "tank_prio", title = "Tank healing priority",
                  text = [[Discipline healing is a |cffffd100priority list|r: prevent damage first, then heal.]],
                  spells = {
                      { id = 48066, name = "Power Word: Shield", note = "Keep up on the tank, recast when Weakened Soul ends" },
                      { id = 48113, name = "Prayer of Mending", note = "On cooldown on the tank" },
                      { id = 53007, name = "Penance", note = "On cooldown when the tank is damaged" },
                      { id = 48071, name = "Flash Heal", note = "Main filler heal (Grace stacks on the tank)" },
                      { id = 48063, name = "Greater Heal", note = "Only during steady heavy damage when you have Borrowed Time" },
                      { id = 48068, name = "Renew", note = "Only while moving" },
                  } },
            },
        },
        {
            name = "Raid Healing",
            sections = {
                { type = "priority", key = "raid_prio", title = "Raid healing priority",
                  spells = {
                      { id = 48066, name = "Power Word: Shield", note = "Blanket shields on raid members before AoE damage" },
                      { id = 48113, name = "Prayer of Mending", note = "On cooldown, bounces through the raid" },
                      { id = 53007, name = "Penance", note = "On the lowest raid member" },
                      { id = 48072, name = "Prayer of Healing", note = "When a whole group is damaged" },
                      { id = 48071, name = "Flash Heal", note = "Spot heals" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Shield first: Rapture returns mana when a shield is fully absorbed.
- Borrowed Time (after every shield) gives 15% haste to the next spell.
- Grace stacks (3) on your main target: keep healing the same tank.
- Glyph of Power Word: Shield and Glyph of Penance are standard.]] },
        { key = "important", title = "Important Tips", text = [[
- Inner Fire must be up (spell power and armor).
- Divine Aegis adds an extra shield on every crit heal.
- Use Dispel Magic and Abolish Disease when asked.
- Spirit and spell power are your best stats; haste helps with shield spam.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Pain Suppression: -40% damage taken on a tank, for big hits.
- Power Infusion: +20% haste, give to a caster DPS or use on yourself during heavy healing.
- Shadowfiend and Hymn of Hope for mana (Hymn helps the whole raid).
- Inner Focus before a big Prayer of Healing or Penance.]],
          spells = {
              { id = 33206, name = "Pain Suppression" },
              { id = 10060, name = "Power Infusion" },
              { id = 34433, name = "Shadowfiend" },
              { id = 64901, name = "Hymn of Hope" },
              { id = 14751, name = "Inner Focus" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Fear Ward on a tank before fear effects.
- Fade to drop threat.
- Mass Dispel against Divine Shield / Ice Block or many debuffs at once.
- Divine Hymn as a raid wide emergency heal.]],
          spells = {
              { id = 6346, name = "Fear Ward" },
              { id = 586, name = "Fade" },
              { id = 32375, name = "Mass Dispel" },
              { id = 64843, name = "Divine Hymn" },
              { id = 988, name = "Dispel Magic" },
              { id = 48168, name = "Inner Fire" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Holy
-------------------------------------------------------------------------------
RTG:RegisterSpec("PRIEST", "Holy", {
    summary = "Strong raid healer: Circle of Healing and Prayer of Mending on cooldown, Prayer of Healing for groups, Guardian Spirit for tanks.",
    categories = {
        {
            name = "Raid Healing",
            sections = {
                { type = "priority", key = "raid_prio", title = "Raid healing priority",
                  text = [[Holy healing is a |cffffd100priority list|r: use cooldown based heals first.]],
                  spells = {
                      { id = 48113, name = "Prayer of Mending", note = "On cooldown, on a player taking damage" },
                      { id = 48089, name = "Circle of Healing", note = "On cooldown when 3+ players are damaged" },
                      { id = 48072, name = "Prayer of Healing", note = "When a whole group is damaged" },
                      { id = 48068, name = "Renew", note = "On players taking steady damage, or while moving" },
                      { id = 48120, name = "Binding Heal", note = "When you and a target are both damaged" },
                      { id = 48071, name = "Flash Heal", note = "Fast spot heal, with Surge of Light procs it is free" },
                  } },
            },
        },
        {
            name = "Tank Healing",
            sections = {
                { type = "priority", key = "tank_prio", title = "Tank healing priority",
                  spells = {
                      { id = 48113, name = "Prayer of Mending", note = "On cooldown on the tank" },
                      { id = 48068, name = "Renew", note = "Keep up on the tank" },
                      { id = 48063, name = "Greater Heal", note = "Big heal on heavy steady damage (Serendipity makes it faster)" },
                      { id = 48071, name = "Flash Heal", note = "Fast heal, builds Serendipity stacks" },
                      { id = 47788, name = "Guardian Spirit", note = "Emergency: +40% healing and prevents death" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Prayer of Mending and Circle of Healing are your strongest heals per mana: use them on cooldown.
- Serendipity: Flash Heal and Binding Heal make your next Greater Heal / Prayer of Healing faster.
- Glyph of Prayer of Healing, Glyph of Circle of Healing and Glyph of Guardian Spirit are standard.
- Use Lightwell before the pull and remind the raid to click it.]] },
        { key = "important", title = "Important Tips", text = [[
- Inner Fire must be up.
- Spirit of Redemption: if you die you can still heal for 15 sec.
- Haste and spell power are your best stats, spirit for mana.
- Use Dispel Magic and Abolish Disease when asked.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Guardian Spirit on a dying tank.
- Divine Hymn during heavy raid damage.
- Hymn of Hope and Shadowfiend for mana.
- Desperate Prayer as a self heal.]],
          spells = {
              { id = 47788, name = "Guardian Spirit" },
              { id = 64843, name = "Divine Hymn" },
              { id = 64901, name = "Hymn of Hope" },
              { id = 34433, name = "Shadowfiend" },
              { id = 48173, name = "Desperate Prayer" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Lightwell for passive healing (raid clicks it).
- Holy Nova for small AoE heals while moving.
- Fear Ward on a tank before fear effects.
- Fade to drop threat, Mass Dispel for many debuffs.]],
          spells = {
              { id = 48087, name = "Lightwell" },
              { id = 48078, name = "Holy Nova" },
              { id = 6346, name = "Fear Ward" },
              { id = 586, name = "Fade" },
              { id = 32375, name = "Mass Dispel" },
              { id = 552, name = "Abolish Disease" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Shadow
-------------------------------------------------------------------------------
RTG:RegisterSpec("PRIEST", "Shadow", {
    summary = "DoT caster in Shadowform: set up three DoTs, Mind Blast on cooldown, Mind Flay filler. Brings Replenishment.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "setup", title = "DoT setup",
                  text = [[Apply DoTs in this |cffffd100fixed order|r at the start of the fight:]],
                  spells = {
                      { id = 15473, name = "Shadowform", label = "Form" },
                      { id = 48160, name = "Vampiric Touch", label = "DoT 1" },
                      { id = 48300, name = "Devouring Plague", label = "DoT 2" },
                      { id = 48127, name = "Mind Blast", label = "Nuke" },
                      { id = 48156, name = "Mind Flay", label = "Build" },
                      { id = 48156, name = "Mind Flay", label = "Build" },
                      { id = 48125, name = "Shadow Word: Pain", label = "DoT 3" },
                  },
                  footer = [[Apply Shadow Word: Pain after 5 Shadow Weaving stacks; Mind Flay then refreshes it (Pain and Suffering).]] },
                { type = "priority", key = "st_prio", title = "Single target priority",
                  text = [[After setup, Shadow is a |cffffd100priority list|r.]],
                  spells = {
                      { id = 48160, name = "Vampiric Touch", note = "Keep up, refresh with < 1.5 sec left (cast time)" },
                      { id = 48300, name = "Devouring Plague", note = "Keep up, refresh only after it ends" },
                      { id = 48125, name = "Shadow Word: Pain", note = "Keep up; Mind Flay refreshes it, do not recast" },
                      { id = 48127, name = "Mind Blast", note = "On cooldown" },
                      { id = 48158, name = "Shadow Word: Death", note = "While moving, or below 35% when health allows" },
                      { id = 48156, name = "Mind Flay", note = "Filler, do not clip the channel" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 53023, name = "Mind Sear", note = "Channel on a target in the middle of 4+ enemies" },
                      { id = 48125, name = "Shadow Word: Pain", note = "On 2-3 targets that live long" },
                      { id = 48160, name = "Vampiric Touch", note = "On a second target for Replenishment" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Stay in Shadowform.
- Vampiric Touch gives Replenishment to the raid: never let it drop.
- Shadow Weaving (5 stacks) gives +10% shadow damage; build it before Shadow Word: Pain.
- Do not clip Mind Flay unless a DoT or Mind Blast needs to be cast.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 17% spell hit (446 rating). Shadow Focus and Misery (or a Balance druid / Affliction warlock debuff) lower it.
- Haste is your best stat after hit, then spell power and crit.
- Glyph of Shadow, Glyph of Mind Flay and Glyph of Shadow Word: Pain / Dispersion are standard.
- Inner Fire and Vampiric Embrace should always be up.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Shadowfiend early in the fight for damage and mana, then on cooldown.
- Dispersion when out of mana or to survive a big hit.
- Inner Focus before a Mind Blast or Devouring Plague.]],
          spells = {
              { id = 34433, name = "Shadowfiend" },
              { id = 47585, name = "Dispersion" },
              { id = 14751, name = "Inner Focus" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Fade to drop threat.
- Shadow Word: Death while moving.
- Mass Dispel and Dispel Magic when asked.
- Power Word: Shield on yourself in an emergency (usable in Shadowform).]],
          spells = {
              { id = 586, name = "Fade" },
              { id = 15286, name = "Vampiric Embrace" },
              { id = 988, name = "Dispel Magic" },
              { id = 32375, name = "Mass Dispel" },
              { id = 48066, name = "Power Word: Shield" },
          } },
    },
})
