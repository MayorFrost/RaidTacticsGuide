-- Raid Tactics Guide - Ulduar part 2: The Keepers, Descent into Madness, Celestial Planetarium
-- Hodir, Thorim, Freya, Mimiron, General Vezax, Yogg-Saron, Algalon the Observer (patch 3.3.5a)

local RTG = RaidTacticsGuide

------------------------------------------------------------------------------------------
-- HODIR
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Hodir", {
    summary = "A movement and buff-management fight: keep moving against Biting Cold, hide in snowdrifts for Flash Freeze, and use the freed NPC helpers.",

    overview = [[
Hodir is one of the four Keepers of Ulduar. He is a single-target fight with almost no adds, but the room itself is your enemy: it is freezing cold, and everyone slowly takes more and more frost damage if they stand still.

Hodir has a lot of health and an enrage timer (about 8 minutes), so the fight is a DPS check. To pass it you get help from friendly NPCs (a mage, a priest, a druid and a shaman) who are frozen in ice blocks when the fight starts. Break them out and use their buffs.

What kills raids here: players who do not find a snowdrift before {spell:61968} finishes, players who stand still and stack up {spell:62188}, and a tank who is not ready for {spell:62478}.
]],

    preparation = [[
- 1-2 tanks, 2-3 healers (10-man) or 2 tanks, 5-6 healers (25-man)
- Frost resistance is NOT needed, but bring good self-heals and movement abilities
- Ranged DPS and healers spread loosely in a wide circle around Hodir
- Assign 1-2 ranged DPS to break frozen NPC helpers out of their ice blocks
- Make sure everyone has DBM or a similar boss mod: the Flash Freeze cast warning is vital
- For hard mode, plan a very high DPS group with bloodlust/heroism saved for the start
]],

    phases = {
        { title = "Pull - free the helpers", text = [[
- The NPC helpers (mage, priest, druid, shaman) stand around the room inside ice blocks.
- Ranged DPS break the ice blocks right away. Freed helpers start supporting the raid.
- The tank picks up Hodir and holds him near the middle of the room.
- Everyone starts the habit of moving a little all the time (a step or a jump every few seconds) to clear {spell:62188} stacks.
]] },
        { title = "Main phase - repeat until Hodir is dead", text = [[
# Biting Cold
- A stacking frost debuff that grows while you stand still. Moving or jumping removes stacks.
- Standing near the mage helper's Toasty Fire also removes it.

# Icicles and Snowdrifts
- Icicles fall from the ceiling all fight long. A small marker shows on the ground first: step away.
- Just before Flash Freeze, icicles fall and leave piles of snow (Snowdrifts) on the floor.

# Flash Freeze (first after about 1 minute, then roughly every 50 seconds)
- Hodir casts {spell:61968} for about 9 seconds.
- Run into a Snowdrift before the cast ends. Players standing in a Snowdrift are safe.
- Anyone outside a Snowdrift is frozen in a block of ice and cannot act until freed.
- NPC helpers outside snowdrifts get frozen too. Break them out again quickly.

# Frozen Blows
- Hodir periodically buffs himself with {spell:62478} for 20 seconds.
- His melee hits deal heavy frost damage and the whole raid takes frost damage every few seconds.
- Healers spend big heals here, the tank uses a defensive cooldown.
]] },
    },

    tank = [[
- Pick up Hodir and keep him roughly in the middle so the raid can reach snowdrifts on every side.
- Keep moving a little yourself (strafe a step, then back) to clear Biting Cold.
- Use a defensive cooldown (Shield Wall, Survival Instincts, Icebound Fortitude, Divine Protection) when {spell:62478} goes up.
- During Flash Freeze, move with Hodir toward a Snowdrift. If you get frozen the boss will turn to the raid, so the off-tank should be ready to taunt.
- If you are the off-tank, help DPS by standing in Starlight and the Storm Cloud stack, and be ready to taunt.
]],

    healer = [[
- Raid damage is constant (Biting Cold and Frozen Blows). Use efficient area heals.
- Big damage window: {spell:62478}. Save mana and cooldowns for those 20 seconds.
- The Priest helper heals the raid and removes Freeze (ice roots) on players.
- Stand in the Druid's Starlight circle when it is near you: it gives a large haste buff.
- Watch for frozen players. Ask DPS to break them out fast so they can help again.
- Keep moving a step every few seconds yourself. Healers who turret-cast die to Biting Cold.
]],

    dps = [[
- First job: break NPC helpers out of ice blocks (at the pull and after every Flash Freeze).
- Second job: break frozen players out of Flash Freeze ice blocks.
- Then everything goes into Hodir. This is a strict DPS check.
- Use the helper buffs:
- Druid helper: Starlight circle on the ground gives a big haste buff - stand in it.
- Shaman helper: puts {spell:65123} on a random player. Stack on that player to get Storm Power (huge crit damage bonus). If YOU have the cloud, stand next to other DPS.
- Mage helper: Toasty Fire on the ground removes Biting Cold. Stand near it when you can.
- Keep moving a step every few seconds to clear Biting Cold, even as a caster.
]],

    warnings = [[
- |cffff2020Get into a Snowdrift before Flash Freeze ends.|r Being frozen costs DPS and can kill you.
- Never stand still for long. {spell:62188} stacks get deadly fast.
- Watch the ground under you: falling Icicles show a marker first and hit hard.
- Do not forget the frozen NPC helpers. Without their buffs most raids cannot beat the enrage timer.
- When {spell:65123} is on you, do not run away from the group. Other players need your Storm Power.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
# How to activate
There is no button. A chest called the Rare Cache of Hodir stands in the room. If you kill Hodir within about |cffff20203 minutes|r of the pull, the Rare Cache survives and gives extra, better loot. After 3 minutes Hodir destroys it and the fight continues as normal mode. This also awards the achievement "I Could Say That This Cache Was Rare".

# What changes
- Hodir's abilities do not change. The only difference is the time limit.
- You must free helpers very fast and keep Storm Power and Starlight on your DPS all the time.
- Use bloodlust/heroism right at the pull, potions and all cooldowns.
- Healers must keep the raid alive with fewer players helping to free NPCs, so fewer mistakes are allowed.
]],

    alternatives = {
        { title = "Loose spread vs. ranged stack", text = [[
- Spread: everyone spreads in a wide circle. Less splash damage, and someone is always near a Snowdrift.
- Ranged stack: ranged DPS and healers stand together near the Storm Cloud target and the Starlight circle to share buffs, then run to the nearest Snowdrift together. Faster, but you must pick a snowdrift with enough room.
]] },
    },

    abilities = {
        {
            name = "Flash Freeze",
            spellId = 61968,
            danger = "high",
            target = "Everyone in the room",
            timing = "First at about 1 minute, then roughly every 50 seconds (9 second cast)",
            description = [[Hodir freezes the whole room. Anyone not standing in a Snowdrift is trapped in a block of ice and takes damage. NPC helpers outside snowdrifts are frozen too.]],
            response = [[Run into a Snowdrift (snow pile left by falling icicles) before the cast ends. After the cast, break frozen players and NPC helpers out of their ice blocks.]],
        },
        {
            name = "Frozen Blows",
            spellId = 62478,
            danger = "high",
            target = "Tank and whole raid",
            timing = "Lasts 20 seconds",
            description = [[Hodir's melee hits deal extra frost damage, and the whole raid takes frost damage every few seconds while the buff is up.]],
            response = [[Tank uses a defensive cooldown. Healers use strong area heals and cooldowns. DPS use self-heals if they drop low.]],
        },
        {
            name = "Biting Cold",
            spellId = 62188,
            danger = "medium",
            target = "Everyone",
            timing = "All fight",
            description = [[A stacking frost damage debuff that grows while you stand still. High stacks deal a lot of damage every second.]],
            response = [[Keep moving: take a step or jump every few seconds. Standing near the mage's Toasty Fire also removes it.]],
        },
        {
            name = "Storm Cloud (helper buff)",
            spellId = 65123,
            danger = "low",
            target = "Random raid member (2 in 25-man)",
            description = [[The shaman helper puts a Storm Cloud on a player. Players near that player gain Storm Power, which greatly increases critical strike damage.]],
            response = [[If you have the cloud, stand next to the DPS. If you are DPS, stack on the marked player for the buff.]],
        },
    },

    chat = {
        summary = {
            "Biting Cold stacks while you stand still - keep moving a step or jump every few seconds.",
            "Flash Freeze (9 sec cast): run into a snow pile (Snowdrift) before it ends or you get frozen.",
            "After every Flash Freeze, break frozen players and NPC helpers out of the ice.",
            "Use helper buffs: stand in Druid Starlight, stack on the Storm Cloud player, stand near Toasty Fire.",
            "Watch the ceiling markers and step away from falling Icicles.",
        },
        tank = {
            "Hold Hodir near the middle so the raid can reach snowdrifts on every side.",
            "Use a defensive cooldown when Frozen Blows is up, it lasts 20 seconds.",
            "Keep strafing a little to clear Biting Cold stacks.",
        },
        healer = {
            "Frozen Blows is the big raid damage window - save mana and cooldowns for it.",
            "Stand in Druid Starlight for haste and keep moving to clear Biting Cold.",
            "Get into a Snowdrift before Flash Freeze ends, frozen healers cannot heal.",
        },
        dps = {
            "Break NPC helpers out of ice at the pull and after every Flash Freeze, then frozen players.",
            "Stack on the Storm Cloud player for Storm Power and stand in Starlight for haste.",
            "This is a DPS race against the enrage, keep damage on Hodir at all times.",
        },
    },
})

------------------------------------------------------------------------------------------
-- THORIM
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Thorim", {
    summary = "A split-raid fight: the arena team fights waves of adds while the gauntlet team fights through a hallway to reach Thorim, then everyone kills him in the arena.",

    overview = [[
Thorim watches from a balcony above his arena. In the first phase you cannot attack him directly. The raid splits into two groups:

- The arena team stays in the arena and kills waves of Dark Rune adds while Thorim throws {spell:62042} at them.
- The gauntlet team runs through a long hallway beside the arena, kills the Runic Colossus and the Ancient Rune Giant, and climbs up to Thorim's balcony.

When the gauntlet team attacks Thorim on his balcony, he jumps down into the arena and phase 2 begins: a tank-and-spank with lightning pillars.

Each phase has a soft enrage of about 5 minutes. Being too slow in the gauntlet is the most common reason for wipes. A hard mode is available if the gauntlet team reaches Thorim before his ally Sif leaves.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers. 25-man: 2-3 tanks, 5-6 healers.
- Gauntlet team (10-man about 4-5 players, 25-man about 8-10): 1 tank, 1-2 healers, strong DPS (melee is fine).
- Arena team: 1 tank, the remaining healers and DPS, with good AoE damage and interrupts.
- Assign interrupters for the Dark Rune Acolytes and Evokers (they heal and shield the adds).
- Turn on a range check (DBM shows 8 yards) for the arena team, it helps against Stormhammer and Chain Lightning.
]],

    phases = {
        { title = "Phase 1 - Arena team", text = [[
- The fight starts when you engage the adds in the arena.
- Adds come in waves: Dark Rune Champions, Commoners (weak, come in packs), Evokers, Warbringers and Acolytes.
- Kill order: |cffff2020Acolytes and Evokers first|r (they heal and shield), then Champions and Warbringers, then AoE the Commoners.
- Thorim throws {spell:62042} at a random arena player. It damages and stuns the target, and players near the target are also hit by its thunder. Stay spread a little (about 8 yards).
- Thorim also charges one of the large orbs around the arena. The area near the charged orb fills with {spell:62017}. Move away from that orb.
- Keep the adds under control until the gauntlet team brings Thorim down.
]] },
        { title = "Phase 1 - Gauntlet team", text = [[
- The gauntlet team runs into the hallway on the side of the arena and works forward.
- Runic Colossus: smashes one side of the hallway at a time. Stand on the other side and kill it. Kill the Colossus to open the way.
- Dark Rune Acolytes and Iron Ring Guards come along the hallway. Interrupt and kill the Acolytes first.
- Ancient Rune Giant: at the end of the hallway. It buffs nearby adds and places {spell:62526} on a random player. That player explodes after a short delay. Run away from the marked player (or away from the group if it is you).
- After the Rune Giant, run up the stairs and attack Thorim. He yells and jumps into the arena.
- Speed matters: the whole raid is waiting on you, and hard mode depends on how fast you are.
]] },
        { title = "Phase 2 - Thorim in the arena", text = [[
- The gauntlet team jumps down. The whole raid fights Thorim in the arena.
- {spell:62130}: a heavy tank hit that leaves a debuff lowering the tank's defenses. The other tank taunts after each one.
- {spell:64390}: chains between nearby players. Ranged and healers stay spread (about 8 yards).
- {spell:62279}: one of the stone pillars around the arena lights up and then blasts a big cone of lightning. Each charge also makes Thorim stronger (stacking buff). Get out of the line between the lit pillar and the area in front of it.
- Kill Thorim before his phase 2 enrage (about 5 minutes).
]] },
    },

    tank = [[
# Arena tank (phase 1)
- Pick up Champions and Warbringers and keep them gathered so DPS can cleave and AoE.
- Face adds away from the raid and move them away from the charged orb.
# Gauntlet tank
- Tank the Runic Colossus on the safe side of its smash, then the Ancient Rune Giant.
- Pull hallway trash quickly and keep moving. Speed is everything.
# Phase 2 (both tanks)
- One tank holds Thorim, the other taunts after every {spell:62130} hits the current tank.
- Use cooldowns as Thorim's Lightning Charge stacks grow, he hits harder over time.
- Do not move Thorim into the path of a charged pillar's cone.
]],

    healer = [[
- Arena healers: steady damage from Stormhammer and adds. Watch players stunned by Stormhammer.
- Gauntlet healer: tank damage on the Colossus and Giant is high. Keep yourself out of {spell:62526} explosions.
- Phase 2: Chain Lightning and Lightning Charge cause spikes on the raid. The tank takes big hits after each Unbalancing Strike, so heal the newly taunting tank.
- Stay spread from other players to avoid Chain Lightning jumping to you.
- Late in phase 2 Thorim's damage keeps rising (Lightning Charge stacks). Save cooldowns for the end.
]],

    dps = [[
# Arena team
- Interrupt and kill Dark Rune Acolytes and Evokers first. Then Champions and Warbringers. AoE the Commoners.
- Stay spread about 8 yards from others for Stormhammer.
- Move away from the orb Thorim charges.
# Gauntlet team
- Kill the Colossus fast while standing on the safe side.
- Interrupt Acolytes in the hallway.
- Rune of Detonation on you: run away from the group right away.
# Phase 2
- Full damage on Thorim. Use cooldowns and bloodlust here.
- Stay spread for Chain Lightning and get out of the charged pillar's cone.
]],

    warnings = [[
- |cffff2020The gauntlet team must be fast.|r If Thorim is not on the ground in about 5 minutes, he enrages and wipes the arena.
- Ignoring the Acolytes and Evokers in the arena means adds get healed and shielded forever.
- Standing in front of a lit pillar during {spell:62279} deals huge damage and buffs Thorim more.
- Players marked with {spell:62526} must run out of the group.
- Do not stand near orbs charged by Thorim ({spell:62017}).
]],

    heroicTitle = "Hard Mode",
    heroic = [[
# How to activate
At the start of the fight, Thorim's ally Sif stands on the balcony and channels {spell:62507} on Thorim for about |cffff20202 minutes 30 seconds|r (DBM shows a timer). If the gauntlet team reaches Thorim and brings him down before Sif leaves, she stays and fights alongside him. This is the "Lose Your Illusion" achievement and unlocks the hard mode loot.
If you are too slow, Sif says the mortals are beneath her and teleports away. The fight then continues in normal mode.

# What changes
- Sif joins phase 2 and fights with Thorim. She casts {spell:62605} (roots players near her), {spell:62604} (frost damage on many players) and Blizzard (a frost area on the ground - move out).
- Thorim fights at full power, so phase 2 lasts longer and hits harder.
- The gauntlet team must be your fastest players. Many raids use bloodlust in the gauntlet.
- Interrupt Sif's Frost Nova and Frostbolt Volley where possible and stay out of Blizzard.
]],

    alternatives = {
        { title = "Gauntlet team size", text = [[
- Small gauntlet (fewer players, all strong DPS): the arena is easier to hold but the gauntlet is slower.
- Big gauntlet (more DPS in the hallway): faster to Thorim, needed for hard mode, but the arena team must handle the adds with fewer players. Most hard mode groups send a big gauntlet team.
]] },
    },

    abilities = {
        {
            name = "Lightning Charge",
            spellId = 62279,
            danger = "high",
            target = "Everyone in the cone in front of a lit pillar",
            timing = "Phase 2, about every 15 seconds",
            description = [[A pillar around the arena charges up and then blasts a big cone of lightning. Each charge also gives Thorim a stacking buff that increases his damage.]],
            response = [[Watch for the glowing pillar and move out of the cone. Keep Thorim positioned so the raid can step out easily.]],
        },
        {
            name = "Unbalancing Strike",
            spellId = 62130,
            danger = "high",
            target = "Current tank",
            timing = "Phase 2, roughly every 20-30 seconds",
            description = [[A heavy hit on the tank that leaves a debuff which badly lowers their defenses for a while.]],
            response = [[The other tank taunts Thorim right after each Unbalancing Strike.]],
        },
        {
            name = "Stormhammer",
            spellId = 62042,
            danger = "medium",
            target = "Random arena player",
            timing = "Phase 1, about every 15-17 seconds",
            description = [[Thorim throws his hammer from the balcony at an arena player, dealing damage and briefly stunning them. Players close to the target are also affected.]],
            response = [[Arena team stays spread a little (about 8 yards) so only one player is hit.]],
        },
        {
            name = "Rune of Detonation",
            spellId = 62526,
            danger = "medium",
            target = "Random gauntlet player",
            timing = "Phase 1, Ancient Rune Giant",
            description = [[The Ancient Rune Giant marks a player with a rune that explodes after a few seconds, hurting everyone nearby.]],
            response = [[If it is on you, run away from the group. Everyone else moves away from the marked player.]],
        },
        {
            name = "Chain Lightning",
            spellId = 64390,
            danger = "medium",
            target = "Random players, jumps to nearby players",
            timing = "Phase 2, about every 10-15 seconds",
            description = [[Lightning that jumps from player to player. More players close together means more damage.]],
            response = [[Ranged DPS and healers stay spread about 8 yards apart.]],
        },
        {
            name = "Lightning Shock (charged orb)",
            spellId = 62017,
            danger = "medium",
            target = "Anyone close to a charged orb",
            description = [[Thorim charges one of the orbs in the arena. Players standing near it take lightning damage.]],
            response = [[Move away from the charged orb and pull adds away from it.]],
        },
        {
            name = "Frost Nova (Sif, hard mode)",
            spellId = 62605,
            danger = "medium",
            target = "Players near Sif",
            heroicOnly = true,
            description = [[Sif freezes everyone around her in place and deals frost damage.]],
            response = [[Interrupt it when possible. Dispel magic roots from your group.]],
        },
    },

    chat = {
        summary = {
            "Phase 1: arena team kills adds, gauntlet team runs the hallway to reach Thorim on his balcony.",
            "Arena: kill Acolytes and Evokers first, stay spread for Stormhammer, avoid the charged orb.",
            "Gauntlet: stand on the safe side of the Colossus smash, run out with Rune of Detonation.",
            "Phase 2: get out of the cone in front of the lit pillar (Lightning Charge), spread for Chain Lightning.",
            "Be fast - each phase has an enrage of about 5 minutes.",
        },
        tank = {
            "Arena tank: gather Champions and Warbringers, move adds away from the charged orb.",
            "Phase 2: taunt Thorim after every Unbalancing Strike on the other tank.",
            "Keep Thorim placed so the raid can step out of the pillar cones easily.",
        },
        healer = {
            "Arena: watch players stunned by Stormhammer. Gauntlet: heavy tank damage on Colossus and Giant.",
            "Phase 2: heal the new tank after each Unbalancing Strike swap and stay spread for Chain Lightning.",
            "Thorim gets stronger with every Lightning Charge, save cooldowns for the end.",
        },
        dps = {
            "Arena: interrupt and kill Acolytes and Evokers first, then Champions, then AoE Commoners.",
            "Gauntlet: kill fast, interrupt Acolytes, run out of the group with Rune of Detonation.",
            "Phase 2: full damage, stay spread and step out of the lit pillar cone.",
        },
    },
})

------------------------------------------------------------------------------------------
-- FREYA
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Freya", {
    summary = "An add-wave fight: kill six waves of nature adds while dodging and killing Eonar's Gift, then tank Freya and dodge Nature Bombs.",

    overview = [[
Freya is the Keeper of nature. In phase 1 she summons a wave of adds every minute, six waves in total. Freya starts with 150 stacks of Attuned to Nature, and every add you kill removes some of them. After the waves are done (or the stacks are gone), phase 2 starts and you fight Freya directly.

There are three kinds of waves. Each needs a different answer, so learn them:
- Detonating Lashers: ten small adds that explode when they die.
- Ancient Conservator: one big add that silences players, cured by standing near mushrooms.
- Elemental trio: three adds that must die close together or they come back to life.

Freya also keeps growing an Eonar's Gift (a sapling) that must be killed fast or it heals her and her adds.

Freya's three Elders (Brightleaf, Ironbranch and Stonebark) live in the Conservatory before her room. In normal mode you kill them first. Leaving them alive is Freya's hard mode. Freya has a 10 minute enrage timer.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers. 25-man: 2-3 tanks, 5-6 healers.
- Kill the three Elders in the Conservatory first for normal mode (each is a short mini boss).
- Bring strong AoE for the Lasher waves and burst damage for the Elemental trio.
- Assign one tank for adds, one for Freya and later the Nature's Fury / Snaplasher work.
- Assign burst DPS for each of the three elementals so they die at the same time.
- Clear the trash in the Conservatory. Note that Freya's trash respawns after a while.
]],

    phases = {
        { title = "Phase 1 - Waves of adds (6 waves, one per minute)", text = [[
- Freya herself does not need much attention in phase 1. A tank holds her out of the way.
- Freya casts Sunbeam on random players. Step out of the beam area.

# Eonar's Gift (all fight, roughly every 40-50 seconds)
- A small tree spawns and starts to grow. When fully grown it casts Lifebinder's Gift, a big heal on Freya and all her adds.
- |cffff2020DPS switch to Eonar's Gift and kill it at once.|r

# Detonating Lashers wave
- Ten small adds. When one dies it explodes and hurts players nearby.
- Tank or kite them together and AoE them down. Melee step back when they are low.

# Ancient Conservator wave
- One big add. It casts Conservator's Grip, which stops nearby players from attacking or casting.
- Healthy Spores (small mushrooms) grow nearby. Stand near a Healthy Spore to remove the Grip.
- It also casts {spell:63571} on a random player. That player must move away from everyone (8 yards). The debuff lasts 10 seconds.

# Elemental trio wave
- Ancient Water Spirit, Storm Lasher and Snaplasher.
- All three must die within about 12 seconds of each other, otherwise they resurrect.
- Bring them all down to low health evenly, then kill them together.
- Interrupt the Storm Lasher's spells. The Snaplasher gets stronger over time, so do not let this wave last long.
]] },
        { title = "Phase 2 - Freya", text = [[
- After the last wave, Freya fights directly. Tank her in place.
- {spell:64587}: small green Nature Bombs spawn on the ground around players and explode after a few seconds. Move away from them.
- Eonar's Gift keeps spawning. Keep switching to it and kill it.
- Burn Freya before the 10 minute enrage.
]] },
    },

    tank = [[
- Freya tank: hold Freya in a corner of the room away from the add fights. She hits moderately in phase 1 and harder in phase 2.
- Add tank: pick up the Ancient Conservator, the Snaplasher and Storm Lasher. Keep the Elemental trio close together so the raid can balance their health.
- Lasher wave: gather the Lashers and pull them away from the melee so their death explosions do not hit everyone.
- Phase 2: hold Freya still and move out of Nature Bombs. Move as little as possible so melee can keep up.
- Hard mode with Elder Ironbranch alive: when you are rooted by Iron Roots, your team must break you out.
]],

    healer = [[
- Phase 1 damage comes from add waves: Lasher explosions, Sunbeams and Nature's Fury.
- Conservator wave: you will be silenced by Conservator's Grip. Stand near a Healthy Spore to remove it.
- Watch the player with {spell:63571}. They take damage until it ends and must be topped up.
- Phase 2 has steady raid damage from Nature Bombs. Stay mobile.
- Hard mode adds lots of extra damage (Ground Tremor, Iron Roots, Unstable Sun Beams). Expect to use most of your cooldowns.
]],

    dps = [[
- Always kill |cffff2020Eonar's Gift|r right away when it spawns. It heals Freya and her adds otherwise.
- Lashers: AoE them down. Watch for death explosions around you.
- Conservator: kill it, use Healthy Spores to remove Grip. Move away from everyone if you get {spell:63571}.
- Elemental trio: bring all three to low health together, then kill them within 12 seconds. Interrupt the Storm Lasher.
- Phase 2: full damage on Freya, step away from Nature Bombs.
]],

    warnings = [[
- |cffff2020Kill Eonar's Gift every time.|r Letting it finish growing heals Freya and every add.
- The Elemental trio must die within about 12 seconds of each other or they all come back.
- Players with {spell:63571} must run away from the group right away.
- Lasher death explosions hurt melee who stand next to them.
- Never stand in a Nature Bomb when it explodes.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
# How to activate
Do |cffff2020not|r kill Freya's three Elders in the Conservatory before pulling her. Each Elder alive when you pull Freya gives her one extra ability and makes her much stronger. Freya's loot cache grows with every living Elder. With all three alive, Freya yells "Elders, grant me your strength!" and the fight is full hard mode ("Knock, Knock, Knock on Wood" achievement).

# Extra abilities per Elder
- Elder Brightleaf alive: Unstable Sun Beams ({spell:62865}). Sun beams appear and move around the room. Players inside take damage. Move out of the beams.
- Elder Ironbranch alive: {spell:62438}. Random players are rooted in place by roots that deal damage over time. DPS must attack the roots to free the player quickly.
- Elder Stonebark alive: {spell:62859}. A room-wide tremor that interrupts and stuns spellcasters who are casting. Stop casting when you see the warning.

# Tips
- Each extra ability starts in phase 1 and continues in phase 2.
- Healers face heavy damage: Ground Tremor timing and root breaking are the most common failure points.
- Many guilds learn the hard mode one Elder at a time (for example Stonebark alive first).
]],

    alternatives = {
        { title = "Elder kill order (normal mode)", text = [[
- Elder Stonebark: tank kites him during {spell:62344} (his melee hits very hard for a short time), casters stop casting on Ground Tremor.
- Elder Ironbranch: tank swaps on Impale, break players out of Iron Roots.
- Elder Brightleaf: move out of sun beams and avoid standing still in her flux.
- Order does not really matter. Kill them one at a time and clear the trash in between.
]] },
    },

    abilities = {
        {
            name = "Lifebinder's Gift (Eonar's Gift)",
            spellId = 62584,
            danger = "high",
            target = "Freya and all her adds",
            timing = "A new Eonar's Gift every 40-50 seconds",
            description = [[A small tree spawns and grows. When fully grown, it heals Freya and all her allies for a large amount.]],
            response = [[All DPS switch to Eonar's Gift as soon as it appears and kill it before it finishes growing.]],
        },
        {
            name = "Allies of Nature (add waves)",
            spellId = 62678,
            danger = "high",
            target = "Raid",
            timing = "Phase 1, one wave every 60 seconds (6 waves)",
            description = [[Freya summons a wave: Detonating Lashers, an Ancient Conservator, or the Elemental trio. The Elemental trio must die within about 12 seconds of each other or they resurrect.]],
            response = [[Kill each wave with the right method: AoE the Lashers, use Healthy Spores against the Conservator, and balance the trio's health before killing them together.]],
        },
        {
            name = "Nature's Fury",
            spellId = 63571,
            danger = "medium",
            target = "Random player (Ancient Conservator)",
            timing = "Lasts 10 seconds",
            description = [[A debuff that deals nature damage to the target and to all players near them.]],
            response = [[If you have it, move at least 8 yards away from everyone until it ends.]],
        },
        {
            name = "Nature Bomb",
            spellId = 64587,
            danger = "medium",
            target = "Ground around players",
            timing = "Phase 2, every few seconds",
            description = [[Small bombs grow from the ground around players and explode after a few seconds, dealing damage and knocking players back.]],
            response = [[Move away from the bombs before they explode.]],
        },
        {
            name = "Iron Roots (hard mode)",
            spellId = 62438,
            danger = "medium",
            target = "Random player",
            heroicOnly = true,
            description = [[With Elder Ironbranch alive, players are trapped in roots that deal damage over time until destroyed.]],
            response = [[Nearby DPS target the roots and destroy them fast. Healers keep the rooted player alive.]],
        },
        {
            name = "Ground Tremor (hard mode)",
            spellId = 62859,
            danger = "medium",
            target = "Whole raid",
            heroicOnly = true,
            description = [[With Elder Stonebark alive, Freya shakes the ground, damaging and interrupting everyone who is casting.]],
            response = [[Stop casting just before it goes off (DBM warns casters), then continue.]],
        },
        {
            name = "Unstable Sun Beam (hard mode)",
            spellId = 62865,
            danger = "medium",
            target = "Areas of the room",
            heroicOnly = true,
            description = [[With Elder Brightleaf alive, sun beams appear and deal heavy damage to players standing in them.]],
            response = [[Move out of the beams as soon as they appear.]],
        },
    },

    chat = {
        summary = {
            "Kill Eonar's Gift (small growing tree) the moment it spawns, or it heals Freya and all adds.",
            "Lashers wave: AoE them, they explode when they die. Conservator: stand by mushrooms to remove the silence.",
            "Elemental trio: bring all three low together and kill them within 12 seconds or they come back.",
            "Nature's Fury on you: run 8 yards away from everyone.",
            "Phase 2: tank Freya and move away from Nature Bombs on the ground.",
        },
        tank = {
            "Hold Freya away from the add fights. Add tank picks up the Conservator, Snaplasher and Storm Lasher.",
            "Pull Lashers away from melee so their death explosions do not hit the raid.",
            "Keep the Elemental trio close together so DPS can balance their health.",
        },
        healer = {
            "Conservator's Grip silences you - stand near a Healthy Spore mushroom to remove it.",
            "Top up the player with Nature's Fury, they take damage for 10 seconds.",
            "Phase 2 has steady raid damage from Nature Bombs, stay mobile.",
        },
        dps = {
            "Switch to Eonar's Gift every time it spawns. This is the top priority all fight.",
            "Interrupt the Storm Lasher and kill the trio within 12 seconds of each other.",
            "Phase 2: full damage on Freya, step away from Nature Bombs.",
        },
    },
})

------------------------------------------------------------------------------------------
-- MIMIRON
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Mimiron", {
    summary = "A four-phase fight against Mimiron's machines: a tank, a laser cannon, a flying robot, and all three combined into V-07-TR-0N.",

    overview = [[
Mimiron is the Keeper of invention. You fight his machines one after another:

- Phase 1: Leviathan Mk II, a tank on the ground.
- Phase 2: VX-001, a big rotating laser cannon.
- Phase 3: Aerial Command Unit, a flying robot that summons bots.
- Phase 4: V-07-TR-0N, all three machines joined together. Each part keeps its old abilities, and all three must die at almost the same time.

Between phases Mimiron talks for a short while (DBM shows a phase timer). Each phase is a new set of mechanics, so new raiders should learn them one at a time. The fight has a 15 minute enrage.

What kills raids: melee standing in {spell:63631}, players walking into {spell:63027} or {spell:64402} markers, players who do not move with the {spell:63274}, and not killing the three parts together in phase 4.
]],

    preparation = [[
- 10-man: 2 tanks, 3 healers. 25-man: 2-3 tanks, 6 healers.
- Ranged DPS are very valuable in phase 3 (the Aerial Command Unit flies).
- Assign 1-2 players to pick up Magnetic Cores in phase 3.
- Assign DPS to Bomb Bots in phase 3 and to each part of V-07-TR-0N in phase 4.
- Many raids switch loot to free-for-all in phase 3 so anyone can loot Magnetic Cores (DBM can do this for the raid leader).
- For hard mode, a player presses the big red button in the room (see Hard Mode).
]],

    phases = {
        { title = "Phase 1 - Leviathan Mk II", text = [[
- The main tank picks up the Leviathan Mk II. Ranged and healers spread out around it.
- {spell:64529}: a huge damage channel on the tank for a few seconds. Tank uses a big cooldown, healers spam heals on the tank.
- {spell:63631}: a 4 second cast. |cffff2020All melee run at least 15 yards away|r before it finishes. It deals massive damage.
- {spell:63027}: mines spawn around the boss and explode when players walk into them. Tank moves the boss away from the mines, everyone else walks around them.
- {spell:63666}: shells hit random players and burn them and players near them. Stay spread.
- When the Leviathan dies, Mimiron climbs into his next machine.
]] },
        { title = "Phase 2 - VX-001", text = [[
- VX-001 is a stationary cannon that does not need a tank. The raid stacks loosely in a group near it.
- Rapid Burst: fires at random players. Healers keep the raid topped.
- {spell:64402}: red markers on the ground show where rockets will land. Step out of the markers right away, they hit very hard.
- {spell:63414} then {spell:63274}: the cannon spins up for 4 seconds, then fires a laser that slowly sweeps around it for about 10 seconds. Walk around the cannon in the same direction as the laser, staying just ahead of it.
- Heat Wave: fire damage to the whole raid. Healers keep everyone healthy.
]] },
        { title = "Phase 3 - Aerial Command Unit", text = [[
- The Aerial Command Unit flies, so only ranged DPS can hit it at first. It shoots Plasma Balls at its target.
- It summons three kinds of bots:
- Assault Bots: big bots, tanks pick them up. When an Assault Bot dies it drops a {spell:64444}.
- {spell:63811}: small bots that walk to players and explode. Kill them fast (ranged) or move away.
- Junk Bots: small melee adds, tanked and AoE'd.
- A player loots the Magnetic Core and uses it under the Aerial Command Unit. This pulls it to the ground for a short time and it takes extra damage. Now melee can hit it too: everyone burns it.
]] },
        { title = "Phase 4 - V-07-TR-0N", text = [[
- The three machines join together: Leviathan legs, VX-001 body and Aerial Unit head. Each part starts at 50% health.
- Leviathan part: {spell:63631} (melee run out) and {spell:63027} (walk around mines).
- VX-001 part: {spell:63274} (move with the laser) and {spell:64402} (step out of markers).
- Aerial Unit part: Plasma Balls on its target.
- |cffff2020All three parts must die within about 15 seconds of each other.|r When one part is destroyed, it starts {spell:64383}. If the others are not dead before the repair finishes, it comes back.
- Bring all three parts low evenly, then kill them together.
]] },
    },

    tank = [[
# Phase 1
- Tank the Leviathan Mk II. Use your biggest cooldown when {spell:64529} hits you.
- Run out of {spell:63631} with the melee (at least 15 yards). The boss follows you after the cast.
- Move the boss away from fresh {spell:63027}.
# Phase 2
- No tanking needed. Stand with the raid and move with the laser.
# Phase 3
- Pick up Assault Bots and Junk Bots and hold them away from the raid. Assault Bots drop the Magnetic Core when killed.
# Phase 4
- One tank holds the Leviathan part. Run out of Shock Blast, use cooldowns on Plasma Blast if it happens again.
- The head (Aerial part) shoots Plasma Balls at its threat target. A tank or assigned player holds it.
]],

    healer = [[
- Phase 1: {spell:64529} on the tank is the biggest single-target damage of the fight. Pre-shield and spam heals on the tank. Watch {spell:63666} targets.
- Phase 2: steady raid damage from Rapid Burst and Heat Wave. Keep moving with the laser while healing.
- Phase 3: Bomb Bot explosions and Plasma Balls. Heal the bot tanks.
- Phase 4: everything at once. Stay in your group, move as a group with the laser, and never stand in a rocket marker.
- Stay out of melee range of the Leviathan parts so you never get hit by Shock Blast.
]],

    dps = [[
- Phase 1: melee run out of {spell:63631} every time. Avoid mines.
- Phase 2: everyone damages VX-001. Move with the laser and out of rocket markers.
- Phase 3: ranged on the Aerial Command Unit. Kill Bomb Bots before they reach the raid. Melee kill Assault Bots and Junk Bots. When the Unit is pulled down by a Magnetic Core, everyone burns it.
- Phase 4: follow your raid leader's assignment. Bring all three parts low evenly, then kill them within about 15 seconds of each other.
- Do not "tunnel" one part in phase 4. A part that dies too early just repairs itself.
]],

    warnings = [[
- |cffff2020Melee: run out of Shock Blast (4 second cast) every time.|r It is the most common death.
- Rocket Strike markers and Proximity Mines kill. Watch your feet.
- During the laser barrage, walk with the laser, never through it.
- Bomb Bots explode on players. Kill them or move away.
- Phase 4: all three parts must die close together or they repair to 50% health.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
# How to activate
In Mimiron's room there is a big red button labelled "Do not push this button". One player clicks it before the pull. Mimiron starts a |cffff2020self-destruct sequence|r ({spell:64582}): you have about 10 minutes to beat all four phases, or the whole room explodes and the raid wipes. This is the "Firefighter" achievement.

# What changes
- Every machine has more health and deals more damage.
- {spell:64566}: fires appear in the room about every 28 seconds and spread fast. If they cover the room, the raid dies. You must put them out:
- Phase 1: the Leviathan casts {spell:64570}, which removes fires around it. Tank the boss through the fires so its suppressant clears them.
- Phase 2: VX-001 creates a {spell:64623}. After about 15 seconds it explodes and removes all fires in a big area. Move away from the bomb before it explodes, it also hurts players.
- Phase 3: Emergency Fire Bots appear and spray water on fires. {spell:64616} silences nearby players: move away when DBM warns you.
- Phase 4: fires keep spawning, Frost Bombs and Flame Suppressant keep clearing them.
- Fire control is a team job. The raid leader assigns players to drag fires to the bomb or suppressant.
]],

    alternatives = {
        { title = "Phase 4 kill order", text = [[
- Most raids bring the Leviathan part and VX-001 part down to about 1-5%, then kill the Aerial Unit head last together with them.
- Some raids split DPS by part (melee on the legs, ranged on the head, the rest on the body) and call the final burn on voice.
]] },
    },

    abilities = {
        {
            name = "Shock Blast",
            spellId = 63631,
            danger = "high",
            target = "Everyone within about 15 yards",
            timing = "Phase 1 and 4, about every 35-40 seconds (4 second cast)",
            description = [[The Leviathan charges a huge blast around itself. It deals massive damage to everyone close by.]],
            response = [[All melee and the tank run at least 15 yards away before the cast ends, then come back.]],
        },
        {
            name = "Plasma Blast",
            spellId = 64529,
            danger = "high",
            target = "Current tank",
            timing = "Phase 1, about every 30-40 seconds",
            description = [[A powerful beam that deals very high damage to the tank for several seconds.]],
            response = [[Tank uses a big defensive cooldown. Healers focus the tank until it ends.]],
        },
        {
            name = "Laser Barrage",
            spellId = 63274,
            danger = "high",
            target = "Everyone in its path",
            timing = "Phase 2 and 4, about every 45 seconds",
            description = [[VX-001 spins up for 4 seconds, then fires a laser that slowly sweeps in a circle for about 10 seconds. Anyone hit takes huge damage.]],
            response = [[Move around the boss in the same direction as the laser, staying ahead of it.]],
        },
        {
            name = "Rocket Strike",
            spellId = 64402,
            danger = "high",
            target = "Marked ground location",
            timing = "Phase 2 and 4, about every 20-25 seconds",
            description = [[A red marker appears on the ground and a rocket lands there a moment later, dealing very heavy damage.]],
            response = [[Step out of the red marker immediately.]],
        },
        {
            name = "Self Repair",
            spellId = 64383,
            danger = "high",
            target = "V-07-TR-0N parts",
            timing = "Phase 4, 15 second cast",
            description = [[When one part of V-07-TR-0N is destroyed, it starts repairing. If the other parts are still alive when the repair ends, it comes back with health.]],
            response = [[Bring all three parts low together and kill them within about 15 seconds of each other.]],
        },
        {
            name = "Proximity Mines",
            spellId = 63027,
            danger = "medium",
            target = "Ground around the Leviathan",
            timing = "Phase 1 and 4, about every 35 seconds",
            description = [[Mines are scattered around the boss and explode when a player touches them.]],
            response = [[Walk around the mines. The tank moves the boss to a clean area.]],
        },
        {
            name = "Bomb Bot",
            spellId = 63811,
            danger = "medium",
            target = "Random players",
            timing = "Phase 3, about every 15-20 seconds",
            description = [[A small robot walks toward players and explodes when it reaches them.]],
            response = [[Ranged DPS kill Bomb Bots quickly. Move away from any bot that reaches you.]],
        },
        {
            name = "Napalm Shell",
            spellId = 63666,
            danger = "medium",
            target = "Random players",
            timing = "Phase 1",
            description = [[Fire shells hit random players and burn them and players near them.]],
            response = [[Stay spread out. Healers heal the burning players.]],
        },
        {
            name = "Magnetic Core",
            spellId = 64444,
            danger = "low",
            target = "Aerial Command Unit",
            timing = "Phase 3, dropped by Assault Bots",
            description = [[An item dropped by Assault Bots. Using it under the Aerial Command Unit pulls it down to the ground for a short time and makes it take extra damage.]],
            response = [[Assigned player loots the core and uses it under the Unit. Everyone then burns the Unit while it is grounded.]],
        },
    },

    chat = {
        summary = {
            "Phase 1: melee run 15 yards out of Shock Blast (4 sec cast). Walk around Proximity Mines and stay spread.",
            "Phase 2: step out of red Rocket Strike markers. On Laser Barrage walk around the boss with the laser.",
            "Phase 3: kill Bomb Bots fast, loot Magnetic Core from Assault Bots and use it under the flying Unit.",
            "Phase 4: all three parts must die within about 15 seconds of each other or they repair.",
        },
        tank = {
            "Phase 1: big cooldown on Plasma Blast and run out of Shock Blast with the melee.",
            "Phase 3: pick up Assault Bots and Junk Bots, keep them away from the raid.",
            "Phase 4: hold the Leviathan legs and run out of every Shock Blast.",
        },
        healer = {
            "Phase 1: Plasma Blast is huge tank damage - focus the tank until it ends.",
            "Phase 2 and 4: move with the laser while healing, never stand in rocket markers.",
            "Stay out of melee range of the Leviathan so Shock Blast never hits you.",
        },
        dps = {
            "Melee: run out of Shock Blast every time. Everyone: walk around mines and out of rocket markers.",
            "Phase 3: ranged kill Bomb Bots first, burn the Unit when the Magnetic Core pulls it down.",
            "Phase 4: bring all parts low evenly, do not kill one part early.",
        },
    },
})

------------------------------------------------------------------------------------------
-- GENERAL VEZAX
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Vezax", {
    summary = "A single-phase fight with no mana regeneration: interrupt Searing Flames, dodge Shadow Crash, run out with Mark of the Faceless and use Saronite Vapors for mana.",

    overview = [[
General Vezax guards the way to Yogg-Saron. His Aura of Despair stops all normal mana regeneration for the whole raid. Mana users only get mana back by standing in the Saronite Vapors that appear about every 30 seconds.

The fight is one phase that repeats until Vezax dies or reaches his 10 minute enrage. Main jobs:
- Interrupt every {spell:62661}.
- Dodge {spell:62660} and run away from others with {spell:63276}.
- The tank survives {spell:62662} by kiting.

Vezax has a hard mode: if no Saronite Vapors are killed, they merge into a Saronite Animus after about 3 minutes.
]],

    preparation = [[
- 10-man: 1-2 tanks, 2-3 healers. 25-man: 2 tanks, 5-6 healers.
- Set an interrupt rotation of 3 or more players for {spell:62661} (DBM counts kicks 1-2-3).
- Ranged DPS and healers spread out (at least 10-12 yards apart) for Shadow Crash and Mark of the Faceless.
- Bring mana potions. Mana regeneration is almost impossible without the vapors.
- Rogues, warriors, death knights and other mana-free classes make this fight easier.
]],

    phases = {
        { title = "Only phase - repeating mechanics", text = [[
# Aura of Despair
- No normal mana regeneration for anyone in the raid.

# Saronite Vapors (about every 30 seconds)
- A purple cloud appears in the room ({spell:63322}).
- Mana users stand in it to gain mana when they take damage. Each tick also stacks a debuff that makes the next tick hurt more.
- Do not stay too long. Step out when the damage gets dangerous.

# Searing Flames
- Vezax casts {spell:62661} often. It deals big fire damage to the raid.
- Interrupt every cast in a rotation.

# Shadow Crash (about every 10 seconds)
- {spell:62660} flies at a random ranged player and explodes on the ground, hitting and knocking back everyone near the spot.
- Move away from the targeted spot as soon as you see the warning. Stay spread.

# Mark of the Faceless (about every 35-45 seconds)
- {spell:63276} marks a random player for 10 seconds. Vezax drains health from everyone standing near that player and heals himself.
- If you are marked, run away from everyone. Others move away from the marked player.

# Surge of Darkness (about every 50-60 seconds)
- {spell:62662}: for 10 seconds Vezax deals massive melee damage but moves slowly.
- The tank kites him (walks away while he follows) until it ends.
]] },
    },

    tank = [[
- Tank Vezax in the middle of the room with space to walk backward.
- On {spell:62662} (10 seconds), walk away from Vezax. He is slowed and cannot catch you if you keep moving. Use a cooldown if he does reach you.
- Melee should not follow him while he is empowered.
- Help interrupt {spell:62661} if your class can.
- Hard mode: an off-tank picks up the Saronite Animus.
]],

    healer = [[
- Manage your mana carefully: use Saronite Vapors when they spawn, mana potions and class mana abilities.
- Searing Flames that are not interrupted cause heavy raid damage. Watch for missed interrupts.
- Players hit by Shadow Crash and players near a Mark of the Faceless target lose health quickly.
- Do not heal Vezax by standing next to the Mark of the Faceless target.
- When in the vapors, step out before the stacking damage gets too high.
]],

    dps = [[
- Interrupt {spell:62661} in your rotation every time.
- Ranged: stay spread at least 10-12 yards. Move off the targeted spot when {spell:62660} is cast.
- {spell:63276} on you: run away from everyone right away.
- Melee: stay out of Vezax's path during {spell:62662} and do not chase him.
- Mana users (DPS casters too) use the vapors.
- Hard mode: do not AoE or attack the Saronite Vapors.
]],

    warnings = [[
- |cffff2020Interrupt every Searing Flames.|r Missed kicks drain healer mana you cannot get back.
- Mark of the Faceless: the marked player runs away, everyone else moves away too. Vezax heals from each player near the mark.
- Shadow Crash knocks you back - do not stand near ledges or in a clump.
- Stay in the vapors only for a few ticks. The damage stacks.
- Tank: kite during Surge of Darkness, do not tank it face to face.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
# How to activate
Do |cffff2020not|r kill any Saronite Vapors (do not AoE them). After six vapors have spawned (about 3 minutes into the fight), they merge into a Saronite Animus ({spell:63145}). Vezax gains Saronite Barrier ({spell:63364}) and cannot be damaged while the Animus lives. This is the "I Love the Smell of Saronite in the Morning" achievement.

# What changes
- Mana users cannot use vapors after the Animus forms. You must reach the end of the fight on potions and saved mana.
- The Saronite Animus must be tanked and killed. It casts Profound Darkness, a stacking shadow damage on the whole raid that grows the longer the Animus lives.
- After the Animus dies the barrier drops and the raid finishes Vezax with all normal mechanics still active.
- Healers must be very mana-efficient from the first second.
]],

    alternatives = {
        { title = "Ranged spread circle", text = [[
- Most raids place ranged and healers in a large circle around Vezax, each player with their own spot. When a Shadow Crash or Mark of the Faceless hits, only one player moves.
- Melee stay tight behind the boss, and the tank kites in a fixed direction on Surge of Darkness so melee know where to go.
]] },
    },

    abilities = {
        {
            name = "Searing Flames",
            spellId = 62661,
            danger = "high",
            target = "Whole raid",
            timing = "Very often (2 second cast)",
            description = [[A fire spell that hits the whole raid for a lot of damage and reduces armor.]],
            response = [[Interrupt every cast with a rotation of several players.]],
        },
        {
            name = "Mark of the Faceless",
            spellId = 63276,
            danger = "high",
            target = "Random player",
            timing = "About every 35-45 seconds, lasts 10 seconds",
            description = [[Vezax drains health from all players near the marked player and heals himself for it.]],
            response = [[The marked player runs away from the raid. Everyone else moves away from the marked player.]],
        },
        {
            name = "Surge of Darkness",
            spellId = 62662,
            danger = "high",
            target = "Tank (anyone in melee)",
            timing = "About every 50-60 seconds, lasts 10 seconds",
            description = [[Vezax's melee damage is greatly increased but he moves much slower.]],
            response = [[The tank kites him away. Melee do not chase him.]],
        },
        {
            name = "Shadow Crash",
            spellId = 62660,
            danger = "medium",
            target = "Random ranged player",
            timing = "About every 8-12 seconds",
            description = [[A shadow missile that explodes on the ground, dealing damage and knocking back players near the impact.]],
            response = [[Move away from the targeted spot. Ranged stay spread so only one player has to move.]],
        },
        {
            name = "Saronite Vapors",
            spellId = 63322,
            danger = "low",
            target = "Players standing in the cloud",
            timing = "About every 30 seconds",
            description = [[A cloud that restores mana when it damages you. Each tick stacks a debuff that increases the damage of the next.]],
            response = [[Mana users step in for a few ticks, then step out before the damage gets dangerous.]],
        },
        {
            name = "Saronite Animus (hard mode)",
            spellId = 63145,
            danger = "high",
            target = "Whole raid",
            heroicOnly = true,
            description = [[If no vapors are killed, six vapors merge into a Saronite Animus. Vezax is shielded until it dies, and it deals stacking shadow damage to the raid.]],
            response = [[Off-tank picks up the Animus, everyone kills it fast, then return to Vezax.]],
        },
    },

    chat = {
        summary = {
            "Interrupt every Searing Flames in a rotation.",
            "Shadow Crash: move away from the targeted spot, ranged stay spread 10-12 yards.",
            "Mark of the Faceless on you: run away from everyone. Vezax heals from players near you.",
            "No mana regen: mana users stand in Saronite Vapors for a few ticks when they spawn.",
            "Surge of Darkness: tank kites Vezax for 10 seconds, melee do not follow.",
        },
        tank = {
            "On Surge of Darkness walk away from Vezax for 10 seconds, he is slowed.",
            "Tank him in the middle with room to kite. Help interrupt Searing Flames.",
        },
        healer = {
            "Your mana does not regenerate - use vapors, potions and efficient heals.",
            "Watch for missed Searing Flames interrupts and players hit by Shadow Crash.",
            "Step out of the vapors before the stacking damage gets too high.",
        },
        dps = {
            "Interrupt Searing Flames when it is your turn.",
            "Ranged stay spread and dodge Shadow Crash. Run out with Mark of the Faceless.",
            "Hard mode: do not AoE or kill the Saronite Vapors.",
        },
    },
})

------------------------------------------------------------------------------------------
-- YOGG-SARON
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_YoggSaron", {
    summary = "A three-phase fight against an Old God where you must protect your Sanity: kill Guardians next to Sara, send a team into Yogg-Saron's brain, then burn him while looking away from his gaze.",

    overview = [[
Yogg-Saron is the final boss of Ulduar's main wing. The fight has three phases and a special resource: {spell:63050}. Every player starts with 100 Sanity. Many abilities lower it. If your Sanity reaches 0 you go insane: Yogg-Saron controls you permanently, and the raid has to kill you.

The Keepers you freed earlier (Freya, Thorim, Mimiron and Hodir) help you in this fight. Each gives the raid a buff and one special ability. Fighting with fewer Keepers is the hard mode.

- Phase 1: Sara cannot be attacked directly. Kill Guardians of Yogg-Saron next to her. Their death explosions hurt her.
- Phase 2: Yogg-Saron appears with tentacles. A team goes through portals into his brain and damages it.
- Phase 3: Yogg-Saron can be attacked directly. Look away from his Lunatic Gaze and handle Immortal Guardians.

The fight has a 15 minute enrage. Sanity control is the key to every kill.
]],

    preparation = [[
- 10-man: 2 tanks, 3 healers. 25-man: 3 tanks, 6-7 healers.
- Brain team: 4 players in 10-man, 10 in 25-man (one per portal). Pick DPS with high burst and good awareness, plus a healer if your raid prefers.
- Assign interrupters for Crusher Tentacles and dispellers for Corruptor Tentacle debuffs.
- Turn on DBM: it shows your Sanity, Brain Portal timers and Induce Madness timer.
- Decide how many Keepers you will use. Learning raids use all four.
]],

    phases = {
        { title = "Phase 1 - Sara (The Lucid Dream)", text = [[
- Sara floats in the middle of the room. She cannot be damaged directly.
- Ominous Clouds drift around the floor. A player who walks into one spawns a Guardian of Yogg-Saron ({spell:62979}). Clouds also spawn Guardians by themselves over time.
- Tanks pick up Guardians and drag them next to Sara. DPS bring them down. When a Guardian dies it casts Shadow Nova, which damages Sara and players close to it.
- DBM warns when a Guardian is at 30%: stop attacking until the tank has it next to Sara, then finish it.
- {spell:63138}: Sara buffs a random player (more damage dealt and taken). Healers watch that player.
- Interrupt the Guardians' Dark Volley.
- When Sara's health runs out, phase 2 starts.
]] },
        { title = "Phase 2 - Descent into Madness (outside team)", text = [[
- Sara transforms and Yogg-Saron appears. His body cannot be damaged yet.
- Tentacles grow around the room:
- Crusher Tentacles: hit hard, tanks pick them up. Interrupt their Diminish Power.
- Constrictor Tentacles: grab a player with {spell:64125}. DPS kill the tentacle to free them.
- Corruptor Tentacles: cast debuffs (curses, poisons, diseases). Dispel them.
- Sara casts {spell:63802}: two players are linked. If they move too far apart they both take damage and lose Sanity. Linked players stay close to each other.
- Sara casts {spell:63830}: the target is feared and loses Sanity, and it jumps to players near them. Spread out.
- Death Rays: Sara spawns beams that move around the floor. Avoid them.
- Keep the outside raid alive and tentacles under control while the brain team works.
]] },
        { title = "Phase 2 - Brain team (portals)", text = [[
- About every 80 seconds (first about 1 minute into phase 2), portals open near Yogg-Saron. The brain team clicks them.
- Inside, you are in one of three visions from the past. Kill the Influence Tentacles in the vision. Avoid the Laughing Skulls (they drain Sanity) and do not attack the vision characters.
- When all Influence Tentacles are dead, a door opens. Go down to the Brain of Yogg-Saron and attack it with everything.
- The Brain casts {spell:64059} for 60 seconds. |cffff2020Leave through the portal back up before it finishes|r, or you lose all your Sanity and go insane. DBM warns when to leave.
- Repeat with the next portal set until the Brain reaches 30% health. Then phase 3 starts.
]] },
        { title = "Phase 3 - True Face of Death", text = [[
- Yogg-Saron can now be attacked. All tentacles are gone. Ranged DPS and healers focus Yogg-Saron.
- {spell:64163}: Yogg-Saron's eye lights up and he casts Lunatic Gaze (4 seconds). |cffff2020Turn your camera and character away from him|r or you lose a lot of Sanity.
- Immortal Guardians spawn. They cannot be killed normally (they stop at 1% health). Tanks pick them up and keep them away from the raid.
- {spell:64465} marks Immortal Guardians and gives them {spell:64486}: they heal and grow stronger. Tanks watch them.
- If Thorim helps you, his Titanic Storm kills Immortal Guardians at low health.
- 25-man with 3 or fewer Keepers: {spell:64189} silences the raid and costs Sanity. Stop casting.
- Burn Yogg-Saron before the enrage.
]] },
    },

    tank = [[
# Phase 1
- Pick up Guardians of Yogg-Saron and drag them next to Sara before they die. Do not let them die far away from her.
- Do not stand too close to a Guardian when it dies: its Shadow Nova hurts players too.
# Phase 2
- Tank Crusher Tentacles. They hit hard, and their Diminish Power must be interrupted.
- Stay away from Death Rays and help keep linked players together.
# Phase 3
- Pick up the Immortal Guardians and keep them away from the raid.
- Watch for {spell:64465} and {spell:64486}: guardians get stronger and heal. Use cooldowns.
- Turn away from Yogg-Saron during Lunatic Gaze, too.
]],

    healer = [[
- Phase 1: watch the {spell:63138} target and the tanks. Guardian Shadow Novas hurt players nearby.
- Phase 2: dispel Corruptor Tentacle debuffs. Heal players grabbed by Constrictor Tentacles. Heal both {spell:63802} targets.
- If you go into the brain, heal the brain team and get out before Induce Madness ends.
- Phase 3: heal the Immortal Guardian tanks and the raid. Look away during Lunatic Gaze.
- If Freya is helping, she creates Sanity Wells: stand in them to restore Sanity when you are low.
]],

    dps = [[
# Phase 1
- Attack Guardians only after the tank has them near Sara. Stop when DBM warns at 30% until the Guardian is in place.
- Interrupt Dark Volley. Never walk into an Ominous Cloud.
# Phase 2 (outside)
- Kill Constrictor Tentacles to free grabbed players, then Corruptor Tentacles, then help on Crushers.
- {spell:63830} on you: stay away from others. {spell:63802} on you: stay close to your linked partner.
# Phase 2 (brain team)
- Click your portal, kill Influence Tentacles, avoid Laughing Skulls, then burn the Brain.
- Leave before {spell:64059} finishes.
# Phase 3
- Ranged DPS go all in on Yogg-Saron. Melee follow the raid leader's plan (Yogg or Guardians).
- Turn away during {spell:64163}.
]],

    warnings = [[
- |cffff2020Watch your Sanity.|r At 0 you are mind controlled for the rest of the fight and must be killed.
- Never walk into Ominous Clouds in phase 1. Each one you touch spawns a Guardian.
- Brain team: leave before {spell:64059} finishes or you go insane.
- {spell:63830} jumps to nearby players: spread out. {spell:63802} hurts linked players who stand apart.
- Phase 3: turn away from Yogg-Saron for every Lunatic Gaze.
- Guardians that die far from Sara do nothing useful in phase 1.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
# How to activate
Before the pull, the Keepers' images stand at the entrance to Yogg-Saron's room. Talk to each one to ask for help. Asking fewer Keepers for help activates harder versions of the fight. With fewer Keepers, Yogg-Saron has more health and deals more damage, and you lose that Keeper's help.
- 3 Keepers: "Three Lights in the Darkness" achievement.
- 2 Keepers: "Two Lights in the Darkness".
- 1 Keeper: "One Light in the Darkness".
- 0 Keepers: "Alone in the Darkness", the hardest version with the best loot (in 25-man this includes a chance at Mimiron's Head, a rare mount).

# What each Keeper gives
- Freya: a healing buff and Sanity Wells in phase 2 and 3 (green circles that restore Sanity). Without her, Sanity control is much harder.
- Thorim: a health buff and Titanic Storm in phase 3, which kills weakened Immortal Guardians.
- Mimiron: a movement speed buff and help against tentacles in phase 2.
- Hodir: Protective Gaze, which saves a player from a killing blow every so often.

# Other changes
- In 25-man with 3 or fewer Keepers, Yogg-Saron casts {spell:64189} in phase 3 (raid silence and Sanity loss).
- Without Freya, every Sanity point counts. Avoid every avoidable Sanity loss.
]],

    alternatives = {
        { title = "Brain team composition", text = [[
- DPS-only brain team: maximum damage on the Brain, but they must keep themselves alive.
- DPS plus one healer: safer and steadier, but the outside raid has one healer less.
- Some raids keep the same team for every portal, others rotate players so nobody runs low on Sanity.
]] },
        { title = "Phase 3 melee plan", text = [[
- With Thorim: melee kill Immortal Guardians down to low health so Titanic Storm finishes them.
- Without Thorim: tanks hold the Guardians, melee DPS help on Yogg-Saron and only peel when tanks need help.
]] },
    },

    abilities = {
        {
            name = "Sanity",
            spellId = 63050,
            danger = "high",
            target = "Every player",
            timing = "Whole fight",
            description = [[Every player starts with 100 Sanity. Many of Yogg-Saron's abilities lower it. At 0 Sanity you go insane and are mind controlled permanently.]],
            response = [[Avoid every ability that drains Sanity. Stand in Freya's Sanity Wells (if she helps) to restore it.]],
        },
        {
            name = "Induce Madness",
            spellId = 64059,
            danger = "high",
            target = "Everyone inside the brain room",
            timing = "Phase 2, 60 second cast each portal cycle",
            description = [[The Brain of Yogg-Saron drives everyone still in the brain room insane when the cast finishes.]],
            response = [[The brain team leaves through the portal before the cast ends. DBM warns you.]],
        },
        {
            name = "Lunatic Gaze",
            spellId = 64163,
            danger = "high",
            target = "Everyone looking at Yogg-Saron",
            timing = "Phase 3, about every 12 seconds (4 second cast)",
            description = [[Yogg-Saron's gaze drains Sanity from everyone who is facing him.]],
            response = [[Turn your character and camera away from Yogg-Saron until it ends.]],
        },
        {
            name = "Malady of the Mind",
            spellId = 63830,
            danger = "medium",
            target = "Random player, jumps to nearby players",
            timing = "Phase 2, about every 20 seconds",
            description = [[Fears the target and drains their Sanity. When it ends, it jumps to nearby players.]],
            response = [[Stay spread so it cannot jump to someone else.]],
        },
        {
            name = "Brain Link",
            spellId = 63802,
            danger = "medium",
            target = "Two random players",
            timing = "Phase 2, about every 25 seconds",
            description = [[Links two players. If they are too far apart, both take damage and lose Sanity.]],
            response = [[Linked players move next to each other until the link ends.]],
        },
        {
            name = "Squeeze (Constrictor Tentacle)",
            spellId = 64125,
            danger = "medium",
            target = "Random player",
            timing = "Phase 2",
            description = [[A Constrictor Tentacle grabs a player and crushes them until the tentacle dies.]],
            response = [[DPS kill the tentacle quickly. Healers keep the grabbed player alive.]],
        },
        {
            name = "Sara's Fervor",
            spellId = 63138,
            danger = "low",
            target = "Random player",
            timing = "Phase 1",
            description = [[Sara buffs a player so they deal more damage but also take more damage.]],
            response = [[Healers keep the target topped up.]],
        },
        {
            name = "Empowering Shadows",
            spellId = 64486,
            danger = "medium",
            target = "Immortal Guardians",
            timing = "Phase 3, about every 45 seconds",
            description = [[Yogg-Saron marks Immortal Guardians with Shadow Beacon, and they heal and grow stronger.]],
            response = [[Tanks use cooldowns. DPS assigned to Guardians bring them down again.]],
        },
        {
            name = "Deafening Roar (25-man hard mode)",
            spellId = 64189,
            danger = "medium",
            target = "Whole raid",
            heroicOnly = true,
            timing = "Phase 3, 25-man with 3 or fewer Keepers",
            description = [[A roar that silences the raid and lowers Sanity.]],
            response = [[Stop casting just before it and use instant spells.]],
        },
    },

    chat = {
        summary = {
            "Watch your Sanity - at 0 you are mind controlled and must be killed.",
            "Phase 1: do not walk into clouds. Tanks bring Guardians next to Sara, then kill them there.",
            "Phase 2: spread for Malady, stay close to your Brain Link partner, kill tentacles that grab players.",
            "Brain team: kill Influence Tentacles, burn the Brain, leave before Induce Madness ends.",
            "Phase 3: turn away from Yogg-Saron on Lunatic Gaze. Tanks hold Immortal Guardians.",
        },
        tank = {
            "Phase 1: drag Guardians next to Sara before they die.",
            "Phase 2: tank Crusher Tentacles and make sure Diminish Power gets interrupted.",
            "Phase 3: pick up Immortal Guardians, use cooldowns when they get Empowering Shadows.",
        },
        healer = {
            "Dispel Corruptor Tentacle debuffs and heal players grabbed by Constrictor Tentacles.",
            "Stand in Freya's Sanity Wells when your Sanity gets low.",
            "Phase 3: heal the Guardian tanks and turn away during Lunatic Gaze.",
        },
        dps = {
            "Phase 1: stop on Guardians at 30% until they are next to Sara, interrupt Dark Volley.",
            "Phase 2: kill Constrictor Tentacles first to free grabbed players.",
            "Phase 3: ranged burn Yogg-Saron, turn away for every Lunatic Gaze.",
        },
    },
})

------------------------------------------------------------------------------------------
-- ALGALON THE OBSERVER
------------------------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Algalon", {
    summary = "A tough DPS race with a 6 minute enrage: swap tanks on Phase Punch, dodge Cosmic Smash, and hide in black holes from Big Bang.",

    overview = [[
Algalon the Observer waits in the Celestial Planetarium, a separate room in Ulduar. He is optional and very hard. You need the access key from the quest chain to open his door.

The fight has two phases:
- Phase 1 (100% to 20%): Collapsing Stars, Living Constellations and Big Bang.
- Phase 2 (below 20%): permanent black holes spawn Unleashed Dark Matter, and you burn Algalon.

Algalon enrages after about 6 minutes (Ascend to the Heavens, a raid wipe). So every second counts.

What kills raids: not being inside a black hole when {spell:64584} finishes, standing close to {spell:64596}, and tanks letting {spell:64412} reach 5 stacks.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers. 25-man: 2-3 tanks, 5-6 healers. Bring the most DPS you can.
- One player needs the access key from the quest chain to open the Planetarium.
- The first time you engage Algalon, a |cffff2020one-hour timer|r starts. If you have not killed him within an hour, he leaves and you lose the chance for the week.
- Assign who calls which black hole to use for Big Bang.
- Bring all consumables (flasks, food, potions). This fight is a strict DPS check.
]],

    phases = {
        { title = "Phase 1 - Stars and Constellations", text = [[
# Phase Punch (tanks)
- {spell:64412} stacks on the tank about every 15 seconds. At 5 stacks the tank is phased out of the fight.
- Tanks swap at 4 stacks (DBM warns at 4).

# Collapsing Stars (about every 60 seconds)
- Algalon summons Collapsing Stars. They lose health on their own over time.
- When a star dies it explodes ({spell:65108}), hitting the whole raid, and leaves a Black Hole on the ground.
- Kill the stars one at a time, so explosions do not stack up, and in places where you want black holes.

# Living Constellations
- Small adds that shoot Arcane Barrage at players.
- A Constellation that touches a Black Hole is destroyed, but it also closes the black hole. Do not waste black holes you need for Big Bang.

# Cosmic Smash (about every 25 seconds)
- {spell:64596}: markers appear on the ground and stars fall on them after a few seconds.
- Damage is huge at the center and lower further away. Move as far away from the markers as you can.

# Big Bang (about every 90 seconds)
- {spell:64584}: an 8 second cast that kills anyone still in the normal world.
- |cffff2020Everyone runs into a Black Hole before the cast ends.|r Inside, you are in another phase where Unleashed Dark Matter adds attack you.
- After Big Bang, leave the black hole and continue the fight.
]] },
        { title = "Phase 2 - Below 20%", text = [[
- Algalon yells "Behold the tools of creation!" and phase 2 starts.
- No more Collapsing Stars or Constellations. Four permanent Black Holes appear around the room. Unleashed Dark Matter keeps coming out of them.
- Tanks pick up the Dark Matter adds. Everyone else burns Algalon.
- Phase Punch and Cosmic Smash continue. Keep swapping tanks and dodging.
- Kill Algalon before the 6 minute enrage.
]] },
    },

    tank = [[
- Two tanks swap on {spell:64412}: taunt when the other tank reaches 4 stacks. Never let a tank reach 5.
- Algalon's melee hits are very heavy. Use cooldowns in a rotation.
- Hold Algalon in a fixed spot so the raid can plan where stars die.
- Off-tank (or a third tank) picks up Unleashed Dark Matter inside black holes and in phase 2.
- Move with the raid into a black hole for every Big Bang. Taunt Algalon back afterwards.
]],

    healer = [[
- Tank damage is high all fight. Assign one healer per tank in 25-man.
- Collapsing Star explosions damage the whole raid. Heal up between each one.
- Cosmic Smash deals heavy damage even at the edge. Top up players after each one.
- Move into a black hole before {spell:64584} ends. Inside, keep the raid alive against Dark Matter.
- Phase 2: steady raid and tank damage. Use cooldowns, this is the final push.
]],

    dps = [[
- Main target is Algalon. Switch to Collapsing Stars only when the raid leader calls it (one star at a time).
- Kill Living Constellations only when needed, or lure them into a black hole you no longer need.
- Move far away from {spell:64596} markers.
- Run into a black hole before {spell:64584} ends, every time.
- Save bloodlust and DPS cooldowns for a time where nothing else needs your attention, often the start or phase 2.
]],

    warnings = [[
- |cffff2020Big Bang kills everyone outside a black hole.|r Get in before the 8 second cast ends.
- Cosmic Smash: get as far as possible from the markers. The center deals deadly damage.
- Phase Punch: tanks swap at 4 stacks.
- Do not kill more than one Collapsing Star at a time. Overlapping explosions can wipe the raid.
- Constellations close black holes. Do not lead them into the hole you need for Big Bang.
- The enrage is about 6 minutes. A slow start means a wipe.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Algalon has no hard mode. The fight is the same in 10 and 25 player, but the numbers change.

# One-hour timer
- When your raid first engages Algalon, a one-hour countdown starts. It keeps running through wipes.
- If Algalon is not dead when the hour ends, he sends his signal and leaves. You cannot try again until the next raid reset.
- Plan your attempts and do not waste time between pulls.

# 10 player
- Fewer players, so every death hurts DPS a lot. Two tanks and 2-3 healers are enough.
- Tanks still swap at 4 stacks of Phase Punch.

# Both sizes
- Each size has its own "He Feeds On Your Tears" achievement: kill Algalon without anyone in the raid ever dying to him.

# 25 player
- Algalon and his adds have much more health and hit much harder.
- More healers are needed (5-6), and a third tank helps with Dark Matter.
- There are more players to fit inside each black hole: decide in advance which group uses which hole.
]],

    abilities = {
        {
            name = "Big Bang",
            spellId = 64584,
            danger = "high",
            target = "Everyone not inside a black hole",
            timing = "About every 90 seconds (8 second cast), first at about 1:40",
            description = [[A huge explosion that kills everyone still in the normal world.]],
            response = [[Run into a Black Hole before the cast ends. Leave it after Big Bang.]],
        },
        {
            name = "Phase Punch",
            spellId = 64412,
            danger = "high",
            target = "Current tank",
            timing = "About every 15 seconds",
            description = [[A stacking debuff on the tank. At 5 stacks, the tank is phased out of the fight.]],
            response = [[Tanks swap at 4 stacks.]],
        },
        {
            name = "Cosmic Smash",
            spellId = 64596,
            danger = "high",
            target = "Marked ground locations",
            timing = "About every 25 seconds",
            description = [[Stars fall on the marked spots after a few seconds. Damage is very high near the center and lower further away.]],
            response = [[Move as far away from the markers as you can.]],
        },
        {
            name = "Black Hole Explosion (Collapsing Star)",
            spellId = 65108,
            danger = "medium",
            target = "Whole raid",
            timing = "When a Collapsing Star dies, stars spawn about every 60 seconds",
            description = [[Collapsing Stars lose health over time. When one dies it explodes, damaging the whole raid, and leaves a Black Hole.]],
            response = [[Kill stars one at a time where you want black holes. Heal up between explosions.]],
        },
    },

    chat = {
        summary = {
            "Big Bang (8 sec cast) kills everyone outside a black hole - run into one before it ends.",
            "Cosmic Smash: run as far from the ground markers as you can.",
            "Kill Collapsing Stars one at a time, each leaves a black hole for Big Bang.",
            "Constellations close black holes - do not lead them into the hole you need.",
            "6 minute enrage: full DPS on Algalon all fight.",
        },
        tank = {
            "Swap Algalon at 4 stacks of Phase Punch, never let a tank reach 5.",
            "Pick up Unleashed Dark Matter inside black holes and in phase 2.",
        },
        healer = {
            "Heavy tank damage all fight. Heal the raid up after each star explosion and Cosmic Smash.",
            "Get into a black hole before Big Bang ends, then heal the raid against Dark Matter.",
        },
        dps = {
            "Focus Algalon. Kill Collapsing Stars only one at a time when called.",
            "Run far from Cosmic Smash and into a black hole for every Big Bang.",
        },
    },
})
