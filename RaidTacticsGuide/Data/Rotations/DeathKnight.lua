--[[
    Raid Tactics Guide - Death Knight rotations (patch 3.3.5a, PvE)
    Blood (DPS / Tank), Frost (DPS / Tank), Unholy (DPS)
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- BLOOD
-------------------------------------------------------------------------------
RTG:RegisterSpec("DEATHKNIGHT", "Blood", {
    summary = "Rune-cycle melee: keep both diseases up, spend Blood runes on Heart Strike, Frost+Unholy on Death Strike. Strong self-healing tank.",
    categories = {
        {
            name = "DPS",
            sections = {
                { type = "rotation", key = "dps_cycle", title = "Rune cycle",
                  text = [[Blood DPS uses a fixed rune cycle. Pre-pull: Horn of Winter.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",     label = "Frost Fever" },
                      { id = 49921, name = "Plague Strike", label = "Blood Plague" },
                      { id = 55262, name = "Heart Strike",  label = "Blood" },
                      { id = 55262, name = "Heart Strike",  label = "Blood" },
                      { rowBreak = true },
                      { id = 49924, name = "Death Strike",  label = "Frost+Unholy" },
                      { id = 49924, name = "Death Strike",  label = "Frost+Unholy" },
                      { id = 55262, name = "Heart Strike",  label = "Blood" },
                      { id = 55262, name = "Heart Strike",  label = "Blood" },
                  },
                  footer = [[Repeat Death Strike x2 + Heart Strike x2. With Glyph of Disease, refresh both diseases with Pestilence (1 Blood rune) instead of re-casting Icy Touch and Plague Strike.]] },
                { type = "priority", key = "dps_prio", title = "Priority",
                  text = [[When runes desync, use this priority list.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",     note = "Frost Fever missing on the target" },
                      { id = 49921, name = "Plague Strike", note = "Blood Plague missing on the target" },
                      { id = 50842, name = "Pestilence",    note = "Diseases < 5 sec left (Glyph of Disease), or 2+ targets" },
                      { id = 49924, name = "Death Strike",  note = "Frost + Unholy runes available" },
                      { id = 55262, name = "Heart Strike",  note = "Blood rune available" },
                      { id = 49895, name = "Death Coil",    note = "Runic Power > 80 or Sudden Doom proc (free)" },
                      { id = 57623, name = "Horn of Winter", note = "Buff missing, or as filler when no runes" },
                  } },
            },
        },
        {
            name = "Tank",
            sections = {
                { type = "rotation", key = "tank_open", title = "Pull",
                  text = [[Frost Presence. Death Grip or Icy Touch to pull.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",     label = "Threat+FF" },
                      { id = 49921, name = "Plague Strike", label = "Plague" },
                      { id = 55262, name = "Heart Strike",  label = "Blood" },
                      { id = 55262, name = "Heart Strike",  label = "Blood" },
                      { id = 49924, name = "Death Strike",  label = "Heal" },
                      { id = 56815, name = "Rune Strike",   label = "Proc" },
                  },
                  footer = [[On packs: diseases on one mob, then Pestilence, Death and Decay, Blood Boil.]] },
                { type = "priority", key = "tank_prio", title = "Threat priority",
                  spells = {
                      { id = 56815, name = "Rune Strike",     note = "Whenever lit (after dodge/parry); off the GCD, press it all the time" },
                      { id = 49909, name = "Icy Touch",       note = "Frost Fever missing - big threat and attack speed debuff" },
                      { id = 49921, name = "Plague Strike",   note = "Blood Plague missing" },
                      { id = 49938, name = "Death and Decay", note = "On cooldown when 2+ mobs" },
                      { id = 49924, name = "Death Strike",    note = "Frost + Unholy runes; main self-heal" },
                      { id = 55262, name = "Heart Strike",    note = "Blood runes on single target" },
                      { id = 49941, name = "Blood Boil",      note = "Blood runes on 3+ mobs" },
                      { id = 49895, name = "Death Coil",      note = "Dump Runic Power only when Rune Strike is not lit" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Blood is a rune-cycle spec: every rune should be spent; never sit on 6 full runes.
- DPS uses Blood Presence; tanking uses Frost Presence.
- Keep Horn of Winter up when no Shaman provides Strength of Earth Totem.
- Glyph of Disease makes Pestilence refresh your diseases: saves runes on long fights.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating) melee; 17% for spells (Icy Touch) is not worth chasing.
- Expertise 26 removes dodges; tanks also want it for threat.
- Weapon enchant: Rune of the Fallen Crusader (DPS), Rune of the Stoneskin Gargoyle or Swordshattering (tank).
- Sudden Doom procs a free Death Coil from Heart Strike: no action needed.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Dancing Rune Weapon: DPS and threat burst, use at pull and with Bloodlust.
- Hysteria: give it to the best physical DPS in your group (or yourself).
- Empower Rune Weapon: refills all runes, use when every rune is on cooldown.
- Tank survival: Vampiric Blood + Rune Tap for heals, Icebound Fortitude for big hits, Anti-Magic Shell for magic.]],
          spells = {
              { id = 49028, name = "Dancing Rune Weapon" },
              { id = 49016, name = "Hysteria" },
              { id = 47568, name = "Empower Rune Weapon" },
              { id = 55233, name = "Vampiric Blood" },
              { id = 48982, name = "Rune Tap" },
              { id = 48792, name = "Icebound Fortitude" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Death Grip: pull casters or adds to you. Dark Command: taunt.
- Mind Freeze / Strangulate: interrupts.
- Anti-Magic Shell: soak magic damage and debuffs.
- Army of the Dead: pre-pull (about 5 sec before) on long boss fights.]],
          spells = {
              { id = 49576, name = "Death Grip" },
              { id = 56222, name = "Dark Command" },
              { id = 47528, name = "Mind Freeze" },
              { id = 48707, name = "Anti-Magic Shell" },
              { id = 42650, name = "Army of the Dead" },
          } },
    },
})

-------------------------------------------------------------------------------
-- FROST
-------------------------------------------------------------------------------
RTG:RegisterSpec("DEATHKNIGHT", "Frost", {
    summary = "Dual-wield rune-cycle spec: Obliterate on Frost+Unholy, Blood Strike for Death runes, Frost Strike for Runic Power, react to Killing Machine and Rime.",
    categories = {
        {
            name = "DPS",
            sections = {
                { type = "rotation", key = "dps_cycle", title = "Rune cycle (IT-PS-OB-BS-BS)",
                  text = [[Pre-pull: Horn of Winter. Blood Presence.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",     label = "Frost Fever" },
                      { id = 49921, name = "Plague Strike", label = "Blood Plague" },
                      { id = 51425, name = "Obliterate",    label = "Frost+Unholy" },
                      { id = 49930, name = "Blood Strike",  label = "Blood" },
                      { id = 49930, name = "Blood Strike",  label = "Blood" },
                      { rowBreak = true },
                      { id = 51425, name = "Obliterate",    label = "Frost+Unholy" },
                      { id = 51425, name = "Obliterate",    label = "Death runes" },
                      { id = 55268, name = "Frost Strike",  label = "RP dump" },
                  },
                  footer = [[Blood Strike turns Blood runes into Death runes (Blood of the North), which you then spend on Obliterate. Fill gaps with Frost Strike.]] },
                { type = "priority", key = "dps_prio", title = "Priority",
                  text = [[Frost is played as a priority list once the opener is done.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",     note = "Frost Fever missing" },
                      { id = 49921, name = "Plague Strike", note = "Blood Plague missing" },
                      { id = 50842, name = "Pestilence",    note = "Diseases < 5 sec (Glyph of Disease), or 2+ targets" },
                      { id = 51425, name = "Obliterate",    note = "Frost + Unholy (or 2 Death) runes available" },
                      { id = 49930, name = "Blood Strike",  note = "Blood runes available" },
                      { id = 51411, name = "Howling Blast", note = "Only with Rime (Freezing Fog) proc, best with Killing Machine" },
                      { id = 55268, name = "Frost Strike",  note = "Runic Power dump; best with Killing Machine" },
                      { id = 57623, name = "Horn of Winter", note = "Buff missing, or filler when no runes" },
                  } },
            },
        },
        {
            name = "Tank",
            sections = {
                { type = "priority", key = "tank_prio", title = "Tank priority",
                  text = [[Frost Presence. Strong AoE threat with Howling Blast and Death and Decay.]],
                  spells = {
                      { id = 56815, name = "Rune Strike",     note = "Whenever lit; off the GCD" },
                      { id = 49909, name = "Icy Touch",       note = "Frost Fever missing - big threat" },
                      { id = 49921, name = "Plague Strike",   note = "Blood Plague missing" },
                      { id = 51411, name = "Howling Blast",   note = "On cooldown with 2+ mobs, or on Rime proc" },
                      { id = 49938, name = "Death and Decay", note = "On cooldown with 2+ mobs" },
                      { id = 49924, name = "Death Strike",    note = "Frost + Unholy runes on single target; self-heal" },
                      { id = 49930, name = "Blood Strike",    note = "Blood runes (Blood Boil on 3+ mobs)" },
                      { id = 55268, name = "Frost Strike",    note = "Runic Power when Rune Strike is not lit" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Frost DPS is a priority list driven by rune pairs: Frost+Unholy on Obliterate, Blood on Blood Strike.
- Killing Machine: next Icy Touch / Howling Blast / Frost Strike crits. Spend it on Frost Strike or Howling Blast.
- Rime (Freezing Fog buff): next Howling Blast costs no runes - use it.
- Glyphs: Obliterate, Frost Strike, Disease.]] },
        { key = "important", title = "Important Tips", text = [[
- Yellow hit cap is 8%: Nerves of Cold Steel gives 3%, so you need about 164 hit rating from gear. Expertise 26.
- Runeforges: Rune of Razorice (main hand) + Rune of the Fallen Crusader (off hand), or Fallen Crusader on both.
- Your talent Improved Icy Talons gives 20% melee haste to the raid: keep Frost Fever up.
- Do not let Runic Power cap at 130 - Frost Strike it.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Unbreakable Armor: on cooldown, use Blood Tap first to get the Frost rune.
- Deathchill: makes the next Obliterate/Frost Strike crit, use with Unbreakable Armor.
- Empower Rune Weapon: when all runes are down, ideally during Bloodlust.
- Tank survival: Icebound Fortitude, Anti-Magic Shell, Unbreakable Armor.]],
          spells = {
              { id = 51271, name = "Unbreakable Armor" },
              { id = 45529, name = "Blood Tap" },
              { id = 49796, name = "Deathchill" },
              { id = 47568, name = "Empower Rune Weapon" },
              { id = 48792, name = "Icebound Fortitude" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Hungering Cold: AoE freeze on trash (breaks on damage, not diseases).
- Mind Freeze: interrupt. Death Grip: pull adds or casters.
- Army of the Dead: pre-pull on long fights. Raise Dead: extra ghoul for DPS.]],
          spells = {
              { id = 49203, name = "Hungering Cold" },
              { id = 47528, name = "Mind Freeze" },
              { id = 49576, name = "Death Grip" },
              { id = 42650, name = "Army of the Dead" },
              { id = 46584, name = "Raise Dead" },
          } },
    },
})

-------------------------------------------------------------------------------
-- UNHOLY
-------------------------------------------------------------------------------
RTG:RegisterSpec("DEATHKNIGHT", "Unholy", {
    summary = "Disease and pet spec: keep diseases and Desolation up, Scourge Strike on Frost+Unholy, Death Coil to dump Runic Power, Gargoyle for burst.",
    categories = {
        {
            name = "Single Target",
            sections = {
                { type = "rotation", key = "opener", title = "Opener",
                  text = [[Pre-pull: Army of the Dead (~5 sec before), Bone Shield, Horn of Winter, ghoul summoned.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",       label = "Frost Fever" },
                      { id = 49921, name = "Plague Strike",   label = "Blood Plague" },
                      { id = 49930, name = "Blood Strike",    label = "Desolation" },
                      { id = 49930, name = "Blood Strike",    label = "Blood" },
                      { id = 49938, name = "Death and Decay", label = "Death runes" },
                      { id = 55271, name = "Scourge Strike",  label = "Frost+Unholy" },
                      { rowBreak = true },
                      { id = 49206, name = "Summon Gargoyle", label = "60+ RP" },
                      { id = 49895, name = "Death Coil",      label = "RP dump" },
                  },
                  footer = [[After the opener, follow the priority list below.]] },
                { type = "priority", key = "st_prio", title = "Priority",
                  text = [[Unholy is a priority list.]],
                  spells = {
                      { id = 49909, name = "Icy Touch",       note = "Frost Fever missing or < 3 sec" },
                      { id = 49921, name = "Plague Strike",   note = "Blood Plague missing or < 3 sec" },
                      { id = 49206, name = "Summon Gargoyle", note = "On cooldown with 60+ Runic Power, best with Bloodlust/trinkets" },
                      { id = 49938, name = "Death and Decay", note = "On cooldown (even on a single target) using Death runes" },
                      { id = 55271, name = "Scourge Strike",  note = "Frost + Unholy runes available" },
                      { id = 49930, name = "Blood Strike",    note = "Blood runes; keeps Desolation up and makes Death runes" },
                      { id = 49895, name = "Death Coil",      note = "Runic Power > 80, or Sudden Doom proc" },
                      { id = 57623, name = "Horn of Winter",  note = "Buff missing, or filler" },
                  } },
            },
        },
        {
            name = "AoE",
            sections = {
                { type = "priority", key = "aoe_prio", title = "AoE priority (3+ targets)",
                  spells = {
                      { id = 49909, name = "Icy Touch",       note = "Diseases on the main target" },
                      { id = 49921, name = "Plague Strike",   note = "Second disease on the main target" },
                      { id = 50842, name = "Pestilence",      note = "Spread both diseases to all mobs" },
                      { id = 49938, name = "Death and Decay", note = "On cooldown under the pack" },
                      { id = 49941, name = "Blood Boil",      note = "Blood/Death runes when mobs are diseased" },
                      { id = 49895, name = "Death Coil",      note = "Runic Power dump" },
                  } },
            },
        },
    },
    notes = {
        { key = "notes", title = "Rotation Notes", text = [[
- Blood Presence for damage (Unholy Presence is fine while learning: shorter GCD).
- Desolation (from Blood Strike) gives +5% damage: never let it drop.
- Reaping turns Blood runes into Death runes - spend them on Death and Decay or Scourge Strike.
- Glyphs: Death and Decay, Disease, Scourge Strike / Ghoul.]] },
        { key = "important", title = "Important Tips", text = [[
- Hit cap: 8% (263 rating). Spell hit helps Gargoyle, but do not chase it.
- Runeforge: Rune of the Fallen Crusader on a two-hand weapon.
- Your Ebon Plaguebringer gives the raid +13% spell damage taken: keep diseases up all fight.
- Keep the ghoul alive (Master of Ghouls makes it permanent); re-summon after it dies.]] },
        { key = "cooldowns", title = "Cooldowns", text = [[
- Summon Gargoyle: biggest damage cooldown, cast with high RP and Bloodlust.
- Ghoul Frenzy: haste + heal for your ghoul, keep it on cooldown.
- Bone Shield: damage reduction and +2% damage, keep it up.
- Empower Rune Weapon: when all runes are down.]],
          spells = {
              { id = 49206, name = "Summon Gargoyle" },
              { id = 63560, name = "Ghoul Frenzy" },
              { id = 49222, name = "Bone Shield" },
              { id = 47568, name = "Empower Rune Weapon" },
              { id = 42650, name = "Army of the Dead" },
          } },
        { key = "situational", title = "Situational Abilities", text = [[
- Anti-Magic Shell: soak magic damage and gain Runic Power.
- Mind Freeze: interrupt. Death Grip: pull adds.
- Icebound Fortitude: emergency damage reduction.]],
          spells = {
              { id = 48707, name = "Anti-Magic Shell" },
              { id = 47528, name = "Mind Freeze" },
              { id = 49576, name = "Death Grip" },
              { id = 48792, name = "Icebound Fortitude" },
          } },
    },
})
