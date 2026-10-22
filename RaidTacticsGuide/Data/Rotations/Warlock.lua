--[[
    Raid Tactics Guide - Warlock rotations (patch 3.3.5a, PvE)
    Affliction, Demonology, Destruction
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- AFFLICTION
-------------------------------------------------------------------------------
RTG:RegisterSpec("WARLOCK", "Affliction", {
    summary = "DoT spec: set up Haunt, Corruption, Unstable Affliction and a curse, fill with Shadow Bolt, finish with Drain Soul below 25%.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "DoT setup",
                  text = [[Pre-pull: Fel Armor, Felhunter out, Life Tap for the Glyph of Life Tap buff.]],
                  spells = {
                      { id = 47809, name = "Shadow Bolt",         label = "Shadow Mast." },
                      { id = 59164, name = "Haunt",               label = "Haunt" },
                      { id = 47843, name = "Unstable Affliction", label = "UA" },
                      { id = 47813, name = "Corruption",          label = "Corr." },
                      { id = 47864, name = "Curse of Agony",      label = "Curse" },
                      { id = 47809, name = "Shadow Bolt",         label = "Filler" },
                  },
                  footer = [[Corruption never needs refreshing: Everlasting Affliction refreshes it with Shadow Bolt, Haunt and Drain Soul. Use Curse of the Elements instead of Agony if no one else has it.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[After the setup, Affliction is a priority list.]],
                  spells = {
                      { id = 59164, name = "Haunt",               note = "On cooldown; keep the debuff up" },
                      { id = 47843, name = "Unstable Affliction", note = "Refresh with < 1.5 sec left (its cast time)" },
                      { id = 47813, name = "Corruption",          note = "Only if it fell off" },
                      { id = 47864, name = "Curse of Agony",      note = "Refresh when it ends (or keep your assigned curse)" },
                      { id = 57946, name = "Life Tap",            note = "Keep the Glyph of Life Tap buff up; tap when mana is low" },
                      { id = 47809, name = "Shadow Bolt",         note = "Filler above 25% boss health" },
                      { id = 47855, name = "Drain Soul",          note = "Filler below 25% boss health (4x damage)" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 47836, name = "Seed of Corruption", note = "Spam on different mobs of a pack" },
                      { id = 47813, name = "Corruption",         note = "Tab-DoT 2-4 targets that live long" },
                      { id = 47820, name = "Rain of Fire",       note = "Stacked packs that do not move" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 14% spell hit with Suppression (about 368 rating); 17% for Destruction spells.
- Pandemic lets your DoTs crit: crit and haste are good.
- Glyphs: Haunt, Life Tap, Quick Decay (or Corruption).
- Pet: Felhunter (Fel Intelligence), use its Shadow Bite automatically.]] },
        { key = "important", title = "Important Tips", text = [[
- Your Shadow Embrace and Haunt only boost your own DoTs; Curse of the Elements boosts the whole raid.
- Never refresh Unstable Affliction early: it cannot be clipped.
- Watch threat on the pull; Soulshatter if you pull aggro.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Affliction has no big cooldown: use trinkets, potions and Bloodlust while DoTs tick.
- Curse of Doom: on bosses that live > 1 min when no curse is assigned.
- Soulshatter: drop threat.]],
          spells = {
              { id = 47867, name = "Curse of Doom" },
              { id = 29858, name = "Soulshatter" },
              { id = 47878, name = "Create Healthstone" },
              { id = 47884, name = "Create Soulstone" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Demonic Circle: fast escape on movement fights.
- Death Coil: emergency heal / fear. Shadow Ward: absorb shadow damage.
- Banish / Fear: crowd control on trash.]],
          spells = {
              { id = 48018, name = "Demonic Circle: Summon" },
              { id = 48020, name = "Demonic Circle: Teleport" },
              { id = 47860, name = "Death Coil" },
              { id = 47891, name = "Shadow Ward" },
              { id = 18647, name = "Banish" },
          } },
    },
})

-------------------------------------------------------------------------------
-- DEMONOLOGY
-------------------------------------------------------------------------------
RTG:RegisterSpec("WARLOCK", "Demonology", {
    summary = "Felguard spec with a strong raid buff (Demonic Pact): keep Immolate and Corruption up, Shadow Bolt filler, Soul Fire on Decimation, Metamorphosis burst.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Fel Armor, Felguard out, Life Tap for Glyph of Life Tap.]],
                  spells = {
                      { id = 47809, name = "Shadow Bolt",        label = "Shadow Mast." },
                      { id = 47811, name = "Immolate",           label = "DoT" },
                      { id = 47813, name = "Corruption",         label = "DoT" },
                      { id = 47865, name = "Curse of the Elements", label = "Curse" },
                      { id = 47241, name = "Metamorphosis",      label = "Burst" },
                      { id = 47193, name = "Demonic Empowerment", label = "Pet" },
                  },
                  footer = [[In Metamorphosis use Immolation Aura when in melee range of the boss.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Demonology is a priority list.]],
                  spells = {
                      { id = 47241, name = "Metamorphosis",  note = "On cooldown with trinkets / Bloodlust" },
                      { id = 47193, name = "Demonic Empowerment", note = "On cooldown (Felguard)" },
                      { id = 47811, name = "Immolate",       note = "Refresh with < 2 sec left" },
                      { id = 47813, name = "Corruption",     note = "Not on target" },
                      { id = 47825, name = "Soul Fire",      note = "With Decimation (target < 35%) or Molten Core" },
                      { id = 47838, name = "Incinerate",     note = "With Molten Core stacks" },
                      { id = 57946, name = "Life Tap",       note = "Keep the glyph buff up; tap when mana is low" },
                      { id = 47809, name = "Shadow Bolt",    note = "Filler" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 47241, name = "Metamorphosis",      note = "For Immolation Aura on big packs" },
                      { id = 50589, name = "Immolation Aura",    note = "In Metamorphosis, stand in the pack" },
                      { id = 47836, name = "Seed of Corruption", note = "Spam on different mobs" },
                      { id = 47823, name = "Hellfire",           note = "Only if healers can cover the self-damage" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 17% spell hit (446 rating) minus raid buffs.
- Decimation: below 35% boss health, Shadow Bolt / Incinerate make Soul Fire fast and shardless.
- Molten Core (from Corruption ticks): empowered Incinerate or Soul Fire.
- Glyphs: Life Tap, Metamorphosis, Felguard (or Quick Decay).]] },
        { key = "important", title = "Important Tips", text = [[
- Demonic Pact gives the raid about 10% of your spell power: keep the Felguard attacking (its crits refresh it).
- Keep the Felguard alive; use Fel Domination if you need to re-summon in combat.
- Use Curse of the Elements if no other Warlock / Unholy DK / Moonkin covers it.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Metamorphosis: 30 sec of +20% damage, line it up with trinkets.
- Demonic Empowerment: Felguard haste.
- Inferno: summon an Infernal on long fights (very long cooldown).]],
          spells = {
              { id = 47241, name = "Metamorphosis" },
              { id = 47193, name = "Demonic Empowerment" },
              { id = 1122,  name = "Inferno" },
              { id = 18708, name = "Fel Domination" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Soulshatter: drop threat.
- Demonic Circle: fast escape on movement fights.
- Death Coil / Shadow Ward: survival.]],
          spells = {
              { id = 29858, name = "Soulshatter" },
              { id = 48018, name = "Demonic Circle: Summon" },
              { id = 48020, name = "Demonic Circle: Teleport" },
              { id = 47860, name = "Death Coil" },
              { id = 47891, name = "Shadow Ward" },
          } },
    },
})

-------------------------------------------------------------------------------
-- DESTRUCTION
-------------------------------------------------------------------------------
RTG:RegisterSpec("WARLOCK", "Destruction", {
    summary = "Burst fire spec: keep Immolate up, Conflagrate for Backdraft, Chaos Bolt on cooldown, Incinerate filler.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Fel Armor, Imp out, Life Tap for Glyph of Life Tap.]],
                  spells = {
                      { id = 47811, name = "Immolate",    label = "DoT" },
                      { id = 17962, name = "Conflagrate", label = "Backdraft" },
                      { id = 59172, name = "Chaos Bolt",  label = "On CD" },
                      { id = 47838, name = "Incinerate",  label = "Filler" },
                  },
                  footer = [[Repeat: keep Immolate up, Conflagrate and Chaos Bolt on cooldown, Incinerate in between.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Destruction is a priority list.]],
                  spells = {
                      { id = 47811, name = "Immolate",    note = "Not on the target, or < 3 sec left (do not let Conflagrate eat it)" },
                      { id = 17962, name = "Conflagrate", note = "On cooldown while Immolate is up (with Glyph of Conflagrate it keeps Immolate)" },
                      { id = 59172, name = "Chaos Bolt",  note = "On cooldown, best under Backdraft" },
                      { id = 47867, name = "Curse of Doom", note = "If no curse is assigned to you, bosses > 1 min" },
                      { id = 57946, name = "Life Tap",    note = "Keep the glyph buff up; tap when mana is low" },
                      { id = 47838, name = "Incinerate",  note = "Filler" },
                      { id = 47827, name = "Shadowburn",  note = "Only while moving at the end of a fight" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority",
                  spells = {
                      { id = 47847, name = "Shadowfury",         note = "Stun the pack at the start" },
                      { id = 47820, name = "Rain of Fire",       note = "Stacked packs that do not move" },
                      { id = 47836, name = "Seed of Corruption", note = "Spam on different mobs" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Hit cap: 17% spell hit (446 rating) minus raid buffs.
- Backdraft: after Conflagrate, the next 3 Destruction spells cast 30% faster.
- Glyphs: Conflagrate, Life Tap, Incinerate (or Imp).
- Pet: Imp (Blood Pact, Fire Bolt) with Empowered Imp, or a Succubus/Felhunter depending on build.]] },
        { key = "important", title = "Important Tips", text = [[
- Without Glyph of Conflagrate, Conflagrate consumes your Immolate: re-apply it right after.
- Empowered Imp proc: next spell crits - spend it on Chaos Bolt if possible.
- Chaos Bolt cannot be resisted and goes through absorbs: great on shielded targets.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Destruction has no damage cooldown of its own: use trinkets, potions and Bloodlust.
- Curse of Doom on long bosses if no other curse is needed.
- Soulshatter: drop threat after a big crit.]],
          spells = {
              { id = 47867, name = "Curse of Doom" },
              { id = 29858, name = "Soulshatter" },
              { id = 1122,  name = "Inferno" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Shadowfury: AoE stun on trash.
- Demonic Circle: fast escape on movement fights.
- Death Coil / Shadow Ward: survival.]],
          spells = {
              { id = 47847, name = "Shadowfury" },
              { id = 48018, name = "Demonic Circle: Summon" },
              { id = 48020, name = "Demonic Circle: Teleport" },
              { id = 47860, name = "Death Coil" },
              { id = 47891, name = "Shadow Ward" },
          } },
    },
})
