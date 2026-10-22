--[[
    Raid Tactics Guide - Paladin rotations (patch 3.3.5a, PvE raiding)
    Holy, Protection and Retribution.
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- Holy
-------------------------------------------------------------------------------
RTG:RegisterSpec("PALADIN", "Holy", {
    summary = "Single-target tank healer with strong burst: Beacon one tank, Sacred Shield the other, spam Holy Light.",
    categories = {
        {
            name = "Tank Healing",
            sections = {
                { type = "rotation", key = "setup", title = "Pull setup",
                  text = [[Do this before or right at the pull:]],
                  spells = {
                      { id = 53563, name = "Beacon of Light", label = "Main tank" },
                      { id = 53601, name = "Sacred Shield", label = "Off tank" },
                      { id = 20166, name = "Seal of Wisdom", label = "Seal" },
                      { id = 20271, name = "Judgement of Light", label = "Judge" },
                  },
                  footer = [[Judge every 60 sec to keep Judgements of the Pure (haste) up.]] },
                { type = "priority", key = "prio", title = "Healing priority",
                  text = [[Healing is a |cffffd100priority list|r: react to incoming damage.]],
                  spells = {
                      { id = 53563, name = "Beacon of Light", note = "Keep up on the main tank, refresh before it drops" },
                      { id = 53601, name = "Sacred Shield", note = "Keep up on the tank you are not beaconing" },
                      { id = 48825, name = "Holy Shock", note = "On cooldown for burst or while moving" },
                      { id = 48782, name = "Holy Light", note = "Main heal, spam on the tank that is not beaconed" },
                      { id = 48785, name = "Flash of Light", note = "Light damage, or to save mana; heals Beacon target too" },
                      { id = 20271, name = "Judgement of Light", note = "Every 60 sec to refresh Judgements of the Pure" },
                  } },
            },
        },
        {
            name = "Raid Healing",
            sections = {
                { type = "priority", key = "raid_prio", title = "Raid healing priority",
                  text = [[Paladins have no group heals: heal raid members one at a time while Beacon keeps healing the tank.]],
                  spells = {
                      { id = 48825, name = "Holy Shock", note = "Instant heal on the lowest raid member" },
                      { id = 48785, name = "Flash of Light", note = "Cheap fast heal for moderate raid damage" },
                      { id = 48782, name = "Holy Light", note = "Big single hits on raid members" },
                      { id = 31821, name = "Aura Mastery", note = "With Concentration Aura vs. silences, or Devotion for damage" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Healing on any target is copied to your Beacon target: Beacon the tank taking the most damage and heal the other one.
- Holy Shock crits give Infusion of Light (faster next Holy Light).
- Stack spell power, crit and haste. Intellect is great for mana.]] },
        { key = "important", title = "Important Tips", text = [[
- Glyph of Holy Light (splash heal) and Glyph of Seal of Wisdom are standard.
- Glyph of Beacon of Light extends Beacon to 90 sec.
- Use Divine Plea when mana is not full but healing is calm (it halves healing done).
- Cleanse magic, poison and disease debuffs when asked.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Divine Illumination: -50% mana cost, use during heavy healing.
- Avenging Wrath: +20% healing (cannot be used with Divine Shield / Protection).
- Divine Favor: guaranteed crit on the next heal, for emergencies.
- Lay on Hands: full heal of the target, emergency only.]],
          spells = {
              { id = 31842, name = "Divine Illumination" },
              { id = 54428, name = "Divine Plea" },
              { id = 31884, name = "Avenging Wrath" },
              { id = 20216, name = "Divine Favor" },
              { id = 48788, name = "Lay on Hands" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Hand of Sacrifice on a tank taking a big hit.
- Hand of Protection on a raid member being attacked by melee (not tanks!).
- Hand of Salvation on DPS with high threat.
- Hand of Freedom against roots and slows.
- Divine Sacrifice to soak raid damage with Aura Mastery.]],
          spells = {
              { id = 6940, name = "Hand of Sacrifice" },
              { id = 10278, name = "Hand of Protection" },
              { id = 1038, name = "Hand of Salvation" },
              { id = 1044, name = "Hand of Freedom" },
              { id = 64205, name = "Divine Sacrifice" },
              { id = 4987, name = "Cleanse" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Protection
-------------------------------------------------------------------------------
RTG:RegisterSpec("PALADIN", "Protection", {
    summary = "Mana based tank with the 96969 rotation: alternate 6 sec and 9 sec abilities for constant threat and mana.",
    categories = {
        {
            name = "Single Target Threat",
            sections = {
                { type = "rotation", key = "setup", title = "Pre-pull setup",
                  spells = {
                      { id = 25780, name = "Righteous Fury", label = "Threat" },
                      { id = 20911, name = "Blessing of Sanctuary", label = "Self buff" },
                      { id = 31801, name = "Seal of Vengeance", label = "Seal" },
                  },
                  footer = [[Horde use Seal of Corruption instead of Seal of Vengeance. Righteous Fury must be on!]] },
                { type = "rotation", key = "st_rot", title = "96969 rotation",
                  text = [[Alternate a 6 sec ability with a 9 sec ability. This is a |cffffd100fixed cycle|r: 6 - 9 - 6 - 9 - 6 - 9.]],
                  spells = {
                      { id = 61411, name = "Shield of Righteousness", label = "6 sec" },
                      { id = 48952, name = "Holy Shield", label = "9 sec" },
                      { id = 53595, name = "Hammer of the Righteous", label = "6 sec" },
                      { id = 48819, name = "Consecration", label = "9 sec" },
                      { id = 61411, name = "Shield of Righteousness", label = "6 sec" },
                      { id = 53408, name = "Judgement of Wisdom", label = "9 sec" },
                      { rowBreak = true },
                      { id = 53595, name = "Hammer of the Righteous", label = "6 sec" },
                      { id = 48952, name = "Holy Shield", label = "9 sec" },
                  },
                  footer = [[Then keep repeating. If an ability is not ready, wait for it rather than breaking the pattern.]] },
            },
        },
        {
            name = "AoE Threat",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE pull priority",
                  text = [[Same 96969 cycle, but open with Avenger's Shield and lean on Consecration.]],
                  spells = {
                      { id = 48827, name = "Avenger's Shield", note = "Pull with it, hits 3 targets" },
                      { id = 48819, name = "Consecration", note = "Keep down under the pack at all times" },
                      { id = 53595, name = "Hammer of the Righteous", note = "On cooldown, hits 3 targets" },
                      { id = 48952, name = "Holy Shield", note = "Keep up, damages attackers on block" },
                      { id = 48817, name = "Holy Wrath", note = "On undead or demon packs, also stuns" },
                      { id = 61411, name = "Shield of Righteousness", note = "Fill the 6 sec slot" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Righteous Fury must be active or you will lose threat.
- The 96969 cycle keeps your GCDs full and mana stable.
- Use Judgement of Wisdom unless another paladin covers it; then use Judgement of Light.
- Divine Plea on cooldown for mana (Glyph of Divine Plea reduces damage taken).]] },
        { key = "important", title = "Important Tips", text = [[
- Defense cap: 540 defense skill (689 rating) to be uncrittable.
- Holy Shield must be up when big hits land (block value).
- Hand of Reckoning taunts; Righteous Defense taunts up to 3 mobs off a friendly target.
- Keep Blessing of Sanctuary on yourself if no other paladin gives it.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Divine Protection: -50% damage taken, for big damage phases.
- Lay on Hands on yourself in emergencies (causes Forbearance).
- Avenging Wrath for extra threat on pull (not with Divine Protection).]],
          spells = {
              { id = 498, name = "Divine Protection" },
              { id = 48788, name = "Lay on Hands" },
              { id = 54428, name = "Divine Plea" },
              { id = 31884, name = "Avenging Wrath" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Hand of Reckoning to taunt.
- Righteous Defense to pick up adds on healers.
- Hammer of Justice to stun adds.
- Divine Sacrifice and Aura Mastery for raid saving.]],
          spells = {
              { id = 62124, name = "Hand of Reckoning" },
              { id = 31789, name = "Righteous Defense" },
              { id = 10308, name = "Hammer of Justice" },
              { id = 53736, name = "Seal of Corruption" },
              { id = 6940, name = "Hand of Sacrifice" },
          } },
    },
})

-------------------------------------------------------------------------------
-- Retribution
-------------------------------------------------------------------------------
RTG:RegisterSpec("PALADIN", "Retribution", {
    summary = "FCFS (first come first served) melee spec: Judgement, Crusader Strike, Divine Storm and Consecration on cooldown.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "priority", key = "st_prio", title = "FCFS priority",
                  text = [[Retribution is a |cffffd100priority list|r (FCFS): press the first ability that is ready.]],
                  spells = {
                      { id = 53408, name = "Judgement of Wisdom", note = "On cooldown (keep the raid debuff up)" },
                      { id = 48806, name = "Hammer of Wrath", note = "Only when the target is below 20% health" },
                      { id = 35395, name = "Crusader Strike", note = "On cooldown" },
                      { id = 53385, name = "Divine Storm", note = "On cooldown" },
                      { id = 48819, name = "Consecration", note = "On cooldown if the boss stands still" },
                      { id = 48801, name = "Exorcism", note = "Only on The Art of War procs (instant)" },
                      { id = 48817, name = "Holy Wrath", note = "Undead / demon targets, when nothing else is ready" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 53385, name = "Divine Storm", note = "On cooldown, hits 4 targets" },
                      { id = 48819, name = "Consecration", note = "Top priority on 3+ targets" },
                      { id = 48817, name = "Holy Wrath", note = "On undead or demon packs" },
                      { id = 35395, name = "Crusader Strike", note = "When the above are on cooldown" },
                      { id = 53408, name = "Judgement of Wisdom", note = "Keep the debuff up" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Use Seal of Vengeance (Horde: Seal of Corruption) on bosses; Seal of Command for short AoE trash.
- Exorcism only when The Art of War procs (instant cast).
- Divine Plea on cooldown when mana is not full (Glyph of Divine Plea recommended).]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating). Expertise soft cap 26 (214 rating).
- Judge Wisdom or Light depending on what the other paladins use.
- Agree on Blessings with other paladins (Kings, Might, Wisdom, Sanctuary).
- Sacred Shield on yourself or a tank is a nice extra when moving.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Avenging Wrath: +20% damage, use with Heroism / Bloodlust or below 20%.
- Pop trinkets and potions together with Avenging Wrath.]],
          spells = {
              { id = 31884, name = "Avenging Wrath" },
              { id = 54428, name = "Divine Plea" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Hammer of Justice to stun adds.
- Hand of Protection / Sacrifice / Freedom to help raid members.
- Divine Protection or Divine Shield in emergencies (Shield drops threat).]],
          spells = {
              { id = 10308, name = "Hammer of Justice" },
              { id = 6940, name = "Hand of Sacrifice" },
              { id = 1044, name = "Hand of Freedom" },
              { id = 642, name = "Divine Shield" },
              { id = 20375, name = "Seal of Command" },
              { id = 53736, name = "Seal of Corruption" },
          } },
    },
})
