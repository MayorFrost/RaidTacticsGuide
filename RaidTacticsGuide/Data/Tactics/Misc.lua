-- Raid Tactics Guide - encounter guides for the smaller WotLK raids:
-- Obsidian Sanctum, Eye of Eternity, Onyxia's Lair and Vault of Archavon.

local RTG = RaidTacticsGuide

---------------------------------------------------------------------------
-- Obsidian Sanctum - Sartharion the Onyx Guardian
---------------------------------------------------------------------------
RTG:RegisterTactics("OS_Sartharion", {
    summary = "Dodge the lava waves, kill the Lava Blazes, and handle the Twilight Drakes and their portals if you leave any drakes alive.",

    overview = [[
Sartharion the Onyx Guardian is the only boss of the Obsidian Sanctum. He sits in the middle of a lava-filled room, guarded by three Twilight Drakes: Tenebron, Shadron and Vesperon. Each drake waits on its own island and can be killed before you pull Sartharion.

How many drakes you leave alive decides how hard the fight is. With all drakes dead ("0 drakes" or "0D") this is an easy fight about dodging lava. Every drake you leave alive flies in during the fight, adds its own mechanics and adds bonus loot.

What kills raids: standing still when the |cffff2020lava waves|r come, ignoring Lava Blazes, and (with drakes up) Shadow Fissures and drakes breathing on the raid. A 0D kill takes about 2-3 minutes.
]],

    preparation = [[
- 0D: 1-2 tanks, 2 healers (10) or 2 tanks, 5 healers (25)
- With drakes up: one extra tank for the drakes, more healers and a "portal team" (see below)
- Fire resistance is not needed. Bring a raid that can move: the lava waves force everyone to run
- Kill the drakes you do not want before pulling Sartharion. Each drake is a small fight of its own
- Agree on where the raid stands and which side you go to when the waves come
]],

    phases = {
        { title = "Sartharion (whole fight)", text = [[
- The main tank holds Sartharion with his head pointed away from the raid. He breathes fire in front ({spell:58956}) and swipes his tail behind him (Tail Lash)
- About every 30 seconds the lava on one side of the room churns and walls of lava roll across the platform: {spell:57491}. DBM calls this "Fire Wall"
- The walls have gaps between them. Move into a gap and let the walls pass, or you are knocked back and burned
- Sartharion's Lava Strikes hit the ground and spawn Lava Blazes (fire elementals). Kill them quickly with AoE before they pile up
]] },
        { title = "Drakes arrive (only if left alive)", text = [[
# Arrival times (from the pull)
- Tenebron about 30 seconds, Shadron about 75 seconds, Vesperon about 120 seconds
- Each drake lands, uses Shadow Breath (frontal) and {spell:59127} (a black void zone that explodes after 5 seconds with {spell:59128})
- Each drake also opens a purple portal into the Twilight Realm, a phased copy of the room. Click the portal to enter it

# What each portal does
- Tenebron: Twilight Eggs appear in the Twilight Realm. Kill them fast or they hatch into Twilight Whelps that attack the raid
- Shadron: an Acolyte of Shadron appears. While it lives Shadron is protected (Sartharion gets the protection instead if Shadron is already dead) and takes far less damage. Kill the Acolyte
- Vesperon: an Acolyte of Vesperon appears. While it lives the raid takes damage whenever it deals damage ({spell:57988}). Kill the Acolyte quickly and DPS carefully until it is dead
]] },
    },

    tank = [[
- Pick up Sartharion and face him away from the raid. Nobody should stand in front or behind him
- When the lava walls come, walk Sartharion with you into the gap. Do not leave him tanked inside the wave path
- Off-tank: grab Lava Blazes and keep them on you while DPS kill them
# Drake tank (drakes up)
- Pick up each drake as it lands and tank it away from the raid, facing away (Shadow Breath)
- Move the drake out of Shadow Fissures. Never let a fissure sit under the melee group
- When a drake dies the others hit harder (Twilight Revenge). Use cooldowns after a drake kill
]],

    healer = [[
- Damage is mostly on the tanks plus spikes on players who get hit by the lava waves
- Move into the gap with the raid; you cannot heal from inside the lava
- With drakes up: players inside the Twilight Realm are phased and cannot be healed from the normal realm. Send a healer with the portal team
- During Vesperon's portal everyone who deals damage gets hurt. Expect raid damage until the Acolyte dies
]],

    dps = [[
- Main target is Sartharion, but switch to Lava Blazes as soon as they appear. AoE them down
- Always keep an eye on the lava: when it starts to churn, stop and move to the gap
- Never stand in front of or behind the boss
# Portal team (drakes up)
- 2-4 assigned players (usually ranged with a healer) take the portal, kill the eggs or the Acolyte, then come back through the portal
- Everyone else: move out of Shadow Fissures at once - the explosion can one-shot you
- Common kill order with drakes up: the drakes one by one (often Tenebron, Shadron, then Vesperon), then Sartharion
]],

    warnings = [[
- |cffff2020Lava waves every ~30 seconds.|r Getting hit knocks you back and burns you. Move into a gap early
- |cffff2020Shadow Fissure explodes after 5 seconds.|r Run out of every black void zone immediately
- Do not let Lava Blazes run around untanked. They add up fast and kill healers
- Do not take a drake portal unless you are assigned to it
- Never stand in front of Sartharion or a drake, and never behind Sartharion (tail)
]],

    heroicTitle = "Drakes Up (1, 2 or 3 drakes)",
    heroic = [[
Obsidian Sanctum has no Heroic mode. Instead, the difficulty depends on how many drakes are alive when you pull Sartharion. Each living drake gives the raid more loot, and leaving 1, 2 or 3 drakes alive gives the achievements Twilight Assist, Twilight Duo and The Twilight Zone (Reins of the Black Drake in 10-player, Reins of the Twilight Drake in 25-player for 3 drakes).

# What each drake adds
- Tenebron (lands at ~30s): his portal spawns Twilight Eggs. Unkilled eggs hatch into Twilight Whelps. Send DPS through the portal or AoE the whelps when they arrive
- Shadron (lands at ~75s): his Acolyte shields Shadron (or Sartharion if Shadron is dead) from damage. You must kill the Acolyte to keep damaging the shielded target
- Vesperon (lands at ~120s): his Acolyte causes {spell:57988} - players who deal damage are hurt. Kill the Acolyte fast and ease off DPS if healers struggle
- All drakes: frontal Shadow Breath and Shadow Fissure void zones. Every drake needs a tank

# Tips
- 1 drake is a good first step for a new group. 3 drakes needs a well geared and organized raid
- Twilight Revenge: when a drake dies, the survivors hit harder. Plan healing cooldowns for each drake kill
]],

    alternatives = {
        { title = "3 drakes: kill drakes first", text = [[
The common 3-drake approach: one tank holds Sartharion, drake tanks pick up each drake as it lands, and the raid kills the drakes one at a time with a portal team handling the eggs and Acolytes. Sartharion dies last. Only the drakes alive at the pull count for loot.
]] },
        { title = "3 drakes: burn Sartharion", text = [[
Very well geared raids keep the drakes tanked away from the raid and burn Sartharion before the drakes and portals overwhelm them. This needs very high DPS and strong drake tanks.
]] },
    },

    abilities = {
        {
            name = "Flame Tsunami (lava waves)",
            spellId = 57491,
            danger = "high",
            target = "Everyone in the path of the walls",
            timing = "About every 30 seconds",
            description = [[ Walls of lava roll across the platform from one side. They knock you back and leave a strong fire damage over time effect. ]],
            response = [[ When the lava churns, move into the gap between the walls and wait for them to pass. Tanks bring the boss along. ]],
        },
        {
            name = "Shadow Fissure / Void Blast",
            spellId = 59127,
            danger = "high",
            target = "Random spot near players (drakes)",
            timing = "Often, while a drake is alive",
            description = [[ A drake creates a black void zone. After 5 seconds it explodes ({spell:59128}) for huge shadow damage. ]],
            response = [[ Run out of the void zone immediately. Tanks move the drake away from it. ]],
        },
        {
            name = "Flame Breath",
            spellId = 58956,
            danger = "medium",
            target = "Cone in front of Sartharion",
            timing = "About every 10 seconds",
            description = [[ A big fire breath in front of Sartharion. Only the tank should take it. ]],
            response = [[ Tank faces Sartharion away from the raid. Everyone else stays to his sides. ]],
        },
        {
            name = "Lava Blaze",
            icon = "Interface\\Icons\\Spell_Fire_Fire",
            danger = "medium",
            target = "Spawns near the raid",
            description = [[ Fire elementals that appear where Sartharion's Lava Strikes hit the ground. They attack players. ]],
            response = [[ Off-tank picks them up; DPS AoE them down quickly. ]],
        },
        {
            name = "Twilight Torment (Vesperon portal)",
            spellId = 57988,
            danger = "medium",
            target = "Players who deal damage",
            timing = "While the Acolyte of Vesperon is alive",
            description = [[ While Vesperon's Acolyte lives in the Twilight Realm, damage you deal hurts you back. ]],
            response = [[ Portal team kills the Acolyte fast. Healers expect raid damage. ]],
        },
        {
            name = "Power of Tenebron (eggs and whelps)",
            spellId = 61248,
            danger = "medium",
            target = "Raid",
            timing = "Tenebron lands ~30s, eggs ~60s after pull",
            description = [[ Tenebron's portal spawns Twilight Eggs in the Twilight Realm. If they are not killed they hatch into whelps. ]],
            response = [[ Portal team kills the eggs, or the raid AoEs the whelps. ]],
        },
        {
            name = "Power of Shadron (Acolyte shield)",
            spellId = 58105,
            danger = "medium",
            target = "Shadron or Sartharion",
            timing = "Shadron lands ~75s after pull",
            description = [[ Shadron's Acolyte protects Shadron (or Sartharion if Shadron is dead) from damage while it lives. ]],
            response = [[ Portal team kills the Acolyte of Shadron so the raid can damage the target again. ]],
        },
    },

    chat = {
        summary = {
            "Lava waves every 30 sec: when the lava churns, move into the gap between the walls. Getting hit knocks you back and burns.",
            "Lava Blazes (fire adds) spawn: off-tank grabs them, DPS AoE them down fast.",
            "Never stand in front of or behind Sartharion: frontal Flame Breath and Tail Lash.",
            "Drakes up: run out of black Shadow Fissures at once, they explode after 5 sec.",
            "Drakes up: only the assigned portal team enters the purple portals to kill eggs and Acolytes.",
        },
        tank = {
            "Face Sartharion away from the raid and drag him into the gap when the lava waves come.",
            "Off-tank picks up Lava Blazes; drake tank grabs each drake as it lands and faces it away.",
            "Move drakes out of Shadow Fissures. Use cooldowns after a drake dies (Twilight Revenge).",
        },
        healer = {
            "Heal tanks and players hit by lava waves. Move into the gap with the raid.",
            "Twilight Realm players are phased: one healer goes with the portal team.",
            "Vesperon portal: raid takes damage while dealing damage until the Acolyte dies.",
        },
        dps = {
            "Switch to Lava Blazes as soon as they spawn and AoE them.",
            "Stop and move when the lava churns. Run out of Shadow Fissures instantly.",
            "Portal team: kill eggs or Acolyte in the Twilight Realm, then come back.",
        },
    },
})

---------------------------------------------------------------------------
-- Eye of Eternity - Malygos
---------------------------------------------------------------------------
RTG:RegisterTactics("EOE_Malygos", {
    summary = "Three phases: kill Power Sparks on the ground, kill the disc riders in the air, then fight Malygos on drake mounts.",

    overview = [[
Malygos, the Spell-Weaver, is the only boss of the Eye of Eternity. The fight has three very different phases: a normal ground fight, an add phase on flying discs, and a final phase where the whole raid rides Wyrmrest drakes (vehicles with their own action bar).

Phase 3 is where most new raids wipe, because nobody practised the drake buttons. Read the Phase 3 section before you pull.

The fight has a hard enrage at about 10 minutes (615 seconds). The achievement You Don't Have an Eternity asks for a kill within 6 minutes.
]],

    preparation = [[
- 2 tanks, 2-3 healers (10) or 2 tanks, 5-6 healers (25)
- Before the pull, look at the drake vehicle bar in Phase 3 (see below). Healers and DPS have different jobs on the drakes
- Slows, roots and stuns are useful for Power Sparks in Phase 1
- Spread out a bit in Phase 1 so Arcane Breath and Vortex damage is easier to heal
]],

    phases = {
        { title = "Phase 1 - Ground (100% to 50%)", text = [[
- The tank holds Malygos facing away from the raid (Arcane Breath is a frontal cone)
- About every 30 seconds {spell:56140}: a spark floats from the edge of the room toward Malygos. If it reaches him he gets a big damage buff
- Slow and kill the spark close to the raid (and close to the boss). It leaves a pool on the ground: stand in it for a big damage buff for the raid
- About every 60 seconds {spell:56105}: everyone is lifted into the air and spun around for about 10 seconds while taking arcane damage. You cannot move. Instant spells and instant heals still work
]] },
        { title = "Phase 2 - Disc adds (at 50%)", text = [[
- Malygos flies up and stays out of reach. Nexus Lords (melee) and Scions of Eternity (casters on flying discs) appear
- Tanks pick up the Nexus Lords; DPS kill them. Ranged DPS kill the Scions
- When a Lord or Scion dies, its disc drops. Melee can ride a disc to reach the flying Scions
- Malygos throws Arcane Bombs that create bubbles on the ground. About every 60 seconds he uses {spell:56505} (his Deep Breath). Everyone must be inside a bubble or they die
- He also hits random players with Arcane Barrage. Stay grouped in or near a bubble
- The phase ends when all adds are dead. The platform shatters and everyone gets a drake
]] },
        { title = "Phase 3 - Drakes (vehicle phase)", text = [[
# Drake buttons (Wyrmrest drake vehicle bar)
- 1 Flame Spike: attack that builds a combo point on your target (max 5)
- 2 Engulf in Flames: spends combo points on a damage over time on Malygos
- 3 Revivify: heal over time on a friendly drake (stacks)
- 4 Life Burst: heals drakes around you
- 5 Flame Shield: spends combo points to make your drake take much less damage for a short time
- 6 Blazing Speed: short speed boost
# What Malygos does
- {spell:57430}: a large purple zone in the air. Fly out of it right away (use Blazing Speed)
- {spell:60936}: Malygos "fixes his eyes on you" and channels heavy damage. Use Flame Shield at once
]] },
    },

    tank = [[
- Phase 1: face Malygos away from the raid. Move him a little so the raid can kill Power Sparks near him, and so melee can stand in the spark pool
- Use a cooldown during Vortex if you are low; you cannot be healed much while spinning
- Phase 2: pick up the Nexus Lords and keep them near a bubble. Get into a bubble before the Deep Breath
- Phase 3: you are a DPS drake like everyone else. Keep 1-2 combo points for Flame Shield
]],

    healer = [[
- Vortex: only instant heals work while spinning. Top everyone up before it, then use instants and HoTs
- Phase 2: stay in or next to a bubble. Heal Arcane Barrage targets and the Nexus Lord tanks
- Phase 3: spam Revivify on drakes (it stacks) and use Life Burst when many drakes are low. Save combo points for Flame Shield when you are targeted
]],

    dps = [[
- Phase 1: Power Sparks have top priority. Slow, stun and kill them before they reach Malygos, then stand in the pool
- Phase 2: kill Nexus Lords and Scions. Melee can jump on a dropped disc to reach Scions. Everyone back into a bubble for the Deep Breath
- Phase 3: Flame Spike (1) to build combo points, then Engulf in Flames (2) at 5 points. Keep the DoT up on Malygos
- Phase 3: keep enough combo points for a Flame Shield (5) when Surge of Power targets you
]],

    warnings = [[
- |cffff2020Deep Breath (Surge of Power) in Phase 2 kills anyone outside a bubble.|r Bubbles shrink over time, use a fresh one
- |cffff2020Never let a Power Spark reach Malygos.|r His damage goes up a lot
- Phase 3: fly out of Static Field immediately and Flame Shield when Surge of Power targets you
- Do not spend all your combo points on damage in Phase 3. A dead drake means a dead player
- Hard enrage at about 10 minutes
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Eye of Eternity has no Heroic mode. The 10 and 25 player versions use the same mechanics.

- 25 player has more Nexus Lords and Scions of Eternity in Phase 2, so the add phase takes longer and needs more AoE and target switching
- Malygos and the adds have much more health and hit harder; Vortex and Arcane Barrage do more damage
- In 25 player, Phase 3 Surge of Power can target several players at the same time, so more people must use Flame Shield
- Loot from Alexstrasza's Gift differs: Reins of the Blue Drake can drop in 10 player, Reins of the Azure Drake in 25 player
]],

    abilities = {
        {
            name = "Surge of Power (Deep Breath)",
            spellId = 56505,
            danger = "high",
            target = "Whole raid (Phase 2)",
            timing = "About every 60 seconds in Phase 2",
            description = [[ Malygos breathes arcane energy over the entire platform. Anyone outside an Arcane Bomb bubble is almost certainly killed. ]],
            response = [[ Be inside a bubble before the breath. Pick a bubble that is still large. ]],
        },
        {
            name = "Power Spark",
            spellId = 56140,
            danger = "high",
            target = "Floats to Malygos",
            timing = "About every 30 seconds in Phase 1",
            description = [[ A spark spawns at the edge and moves toward Malygos. If it reaches him he deals much more damage. If killed it leaves a pool that buffs players. ]],
            response = [[ Slow and kill the spark before it reaches the boss, then stand in its pool. ]],
        },
        {
            name = "Vortex",
            spellId = 56105,
            danger = "medium",
            target = "Whole raid (Phase 1)",
            timing = "About every 60 seconds",
            description = [[ Lifts everyone into a whirlwind for about 10 seconds with constant arcane damage. ]],
            response = [[ Top up before it. Use instant heals, HoTs and defensive cooldowns while spinning. ]],
        },
        {
            name = "Surge of Power (Phase 3)",
            spellId = 60936,
            danger = "high",
            target = "Random drake rider(s)",
            timing = "Often in Phase 3",
            description = [[ Malygos fixes his eyes on a player and channels heavy arcane damage on their drake. ]],
            response = [[ Use Flame Shield (5) right away. Healers help with Revivify and Life Burst. ]],
        },
        {
            name = "Static Field",
            spellId = 57430,
            danger = "medium",
            target = "A drake rider",
            timing = "About every 10-20 seconds in Phase 3",
            description = [[ A big zone of arcane energy in the air that keeps damaging drakes inside it. ]],
            response = [[ Fly out of it immediately. Blazing Speed (6) helps. ]],
        },
        {
            name = "Arcane Barrage",
            icon = "Interface\\Icons\\Spell_Arcane_StarFire",
            danger = "medium",
            target = "Random players (Phase 2)",
            description = [[ Malygos fires arcane missiles at players while he flies above the platform. ]],
            response = [[ Healers heal the targets. Stay near a bubble. ]],
        },
        {
            name = "Arcane Breath",
            icon = "Interface\\Icons\\Spell_Arcane_Blast",
            danger = "medium",
            target = "Cone in front of Malygos",
            timing = "Phase 1",
            description = [[ A frontal breath that damages and debuffs anyone in front of Malygos. ]],
            response = [[ Tank faces Malygos away. Never stand in front of him. ]],
        },
    },

    chat = {
        summary = {
            "P1: kill Power Sparks before they reach Malygos, then stand in their pool for a damage buff.",
            "P1 Vortex every 60 sec: you spin for 10 sec, use instant spells and heals only.",
            "P2: kill Nexus Lords and Scions. Be INSIDE a bubble before the Deep Breath or you die.",
            "P3 drakes: 1 builds combo points, 2 is damage, 3 and 4 heal, 5 is Flame Shield, 6 is speed.",
            "P3: fly out of Static Field, and use Flame Shield (5) when Malygos fixes his eyes on you.",
        },
        tank = {
            "Face Malygos away from the raid and help the raid kill Power Sparks near him.",
            "P2: tank the Nexus Lords next to a bubble and get inside before the Deep Breath.",
            "P3: you are a DPS drake. Keep combo points for Flame Shield.",
        },
        healer = {
            "Top up before Vortex, then use instant heals and HoTs while spinning.",
            "P2: heal Arcane Barrage targets from inside or next to a bubble.",
            "P3: spam Revivify (3) on drakes, Life Burst (4) when many are low, Flame Shield (5) if targeted.",
        },
        dps = {
            "P1: Power Sparks first. Slow, stun and kill them, then stand in the pool.",
            "P2: ranged kill Scions, melee kill Nexus Lords then ride a dropped disc to reach Scions.",
            "P3: Flame Spike (1) to 5 combo points, Engulf in Flames (2). Save points for Flame Shield (5).",
        },
    },
})

---------------------------------------------------------------------------
-- Onyxia's Lair - Onyxia (level 80)
---------------------------------------------------------------------------
RTG:RegisterTactics("ONY_Onyxia", {
    summary = "Classic three phase dragon: tank her on the ground, survive Deep Breaths and adds while she flies, then handle the fear in phase 3.",

    overview = [[
Onyxia is the brood mother of the black dragonflight, brought back as a level 80 raid for the 5th anniversary of WoW. The fight is the classic one: she fights on the ground, then flies over the lair while adds pour in, then lands for the last phase.

The fight has three phases decided by her health: Phase 1 (100% to 65%), Phase 2 (65% to 40%) and Phase 3 (40% to 0%).

What kills raids: standing in front of her or behind her (tail), standing in the path of {spell:18584}, losing control of the whelps and Lair Guards, and the fear in Phase 3.
]],

    preparation = [[
- 2 tanks, 2-3 healers (10) or 2-3 tanks, 5-6 healers (25)
- Fear protection for Phase 3: Fear Ward (priest), Tremor Totem (shaman), Berserker Rage (warrior), Will of the Forsaken
- AoE classes are very useful for the whelps in Phase 2
- Know where the two side caves are; the whelps come out of them
]],

    phases = {
        { title = "Phase 1 - Ground (100% to 65%)", text = [[
- The tank turns Onyxia so she faces a wall, away from the raid
- {spell:18435} hits a cone in front of her. Tail Sweep hits and knocks back anyone behind her
- {spell:18500} knocks back players in front of her and reduces threat
- Everyone else attacks from her sides
]] },
        { title = "Phase 2 - Air (65% to 40%)", text = [[
- She flies up and hovers over the room. You cannot melee her
- She throws {spell:18392} at random players. It splashes, so stay spread about 8 yards apart
- Sometimes she flies to one side of the room and uses {spell:18584}: a huge fire line across the room. Get out of the line she is facing. It is deadly
- Onyxian Whelps pour out of the side caves in waves. AoE them down
- About every 45 seconds an Onyxian Lair Guard (a big elite add) appears. A tank picks it up. It casts {spell:68958}: melee must run out before it finishes
- Ranged DPS keep damaging Onyxia to push her to 40%
]] },
        { title = "Phase 3 - Ground again (40% to 0%)", text = [[
- She lands with "It seems you'll need another lesson, mortals!". The tank picks her up fast and faces her away again
- Phase 1 abilities come back
- Every so often she uses {spell:18431}: a fear on the whole raid. While players are feared, lava erupts from cracks in the floor
- Use fear protection. Tanks must not lose aggro while feared
- Finish off any remaining adds, then all DPS on Onyxia
]] },
    },

    tank = [[
- Phase 1: face her toward a wall. Never let her turn to the raid. Wing Buffet lowers your threat, so keep building it
- Phase 2: one tank picks up each Lair Guard and turns it away from the raid. Move away from it during Blast Nova if you are low
- Help gather the whelps so AoE can kill them
- Phase 3: be in position before she lands and taunt her at once. Use Berserker Rage, Fear Ward or a Tremor Totem for the fear
]],

    healer = [[
- Phase 1: mostly tank healing; watch players knocked back by Tail Sweep or Wing Buffet
- Phase 2: heal Fireball targets (and players near them) and players hit by whelps. Stay spread out
- If someone is caught by Deep Breath, they need big heals at once (if they survive)
- Phase 3: the fear stops your heals. Use HoTs and shields on the tank before each fear
]],

    dps = [[
- Phase 1: attack from her sides only. Not in front, not behind
- Phase 2: AoE the whelps as soon as they come out. Then kill the Lair Guard. Ranged keep hitting Onyxia when the adds are under control
- Melee: run out when a Lair Guard casts Blast Nova
- Phase 3: kill remaining adds, then full DPS on Onyxia. Use fear protection if you have it
]],

    warnings = [[
- |cffff2020Deep Breath kills.|r When she flies to the side and inhales, get out of the line in front of her
- |cffff2020Never stand in front of or behind her on the ground.|r Flame Breath and Tail Sweep
- Do not let whelps pile up. A pack of untanked whelps kills healers quickly
- Melee must run out of Lair Guard Blast Nova
- Stay spread about 8 yards apart in Phase 2 (Fireball splash)
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Onyxia's Lair has no Heroic mode. The 10 and 25 player versions use the same mechanics.

- 25 player: Onyxia and the Lair Guards have much more health and hit harder
- More whelps come out of the caves, so AoE is even more important
- Raid damage from Fireballs, Deep Breath and Phase 3 is higher. Bring more healers
- Achievements exist for both sizes: More Dots! (kill within 5 minutes) and Many Whelps! Handle It! (kill 50 whelps within 10 seconds)
]],

    alternatives = {
        { title = "Phase 2 whelp handling", text = [[
Many groups send one tank (or a paladin/death knight with AoE) to stand near each cave entrance and pick up whelps as they come out, while AoE classes burn them down there. Others let the whelps come to the raid and AoE them together. Agree on one plan before the pull.
]] },
    },

    abilities = {
        {
            name = "Deep Breath",
            spellId = 18584,
            danger = "high",
            target = "Line across the room (Phase 2)",
            timing = "First about 75 seconds into Phase 2, then every 35-60 seconds",
            description = [[ Onyxia flies to one side and breathes fire in a wide line across the whole room. Anyone in the line takes massive damage. ]],
            response = [[ When she inhales on one side, move out of the line in front of her toward the sides. ]],
        },
        {
            name = "Flame Breath",
            spellId = 18435,
            danger = "high",
            target = "Cone in front of her",
            timing = "About every 13-20 seconds on the ground",
            description = [[ Fire breath in a frontal cone. Kills non-tanks. ]],
            response = [[ Tank faces her away from the raid. Everyone else stays at her sides. ]],
        },
        {
            name = "Bellowing Roar",
            spellId = 18431,
            danger = "high",
            target = "Whole raid (Phase 3)",
            timing = "Repeats in Phase 3",
            description = [[ A raid-wide fear. Lava erupts from cracks in the floor while you run in fear. ]],
            response = [[ Use Fear Ward, Tremor Totem, Berserker Rage or other fear protection. Tank must keep aggro. ]],
        },
        {
            name = "Blast Nova (Lair Guard)",
            spellId = 68958,
            danger = "high",
            target = "Players near the Lair Guard",
            timing = "Cast by each Onyxian Lair Guard",
            description = [[ The big Lair Guard add casts a fire explosion around itself. ]],
            response = [[ Melee run away until the cast is over. Tank can stay if healthy. ]],
        },
        {
            name = "Fireball",
            spellId = 18392,
            danger = "medium",
            target = "Random players (Phase 2)",
            description = [[ Onyxia throws a fireball at a random player. It splashes onto nearby players. ]],
            response = [[ Stay spread about 8 yards apart. Healers heal the target. ]],
        },
        {
            name = "Onyxian Lair Guard",
            spellId = 68959,
            danger = "medium",
            target = "Spawns in Phase 2",
            timing = "About every 45 seconds in Phase 2",
            description = [[ A large elite add that hits hard (Ignite Weapon) and casts Blast Nova. ]],
            response = [[ A tank picks it up and faces it away; DPS kill it after the whelps. ]],
        },
        {
            name = "Onyxian Whelps",
            icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Black",
            danger = "medium",
            target = "Raid",
            timing = "Waves during Phase 2",
            description = [[ Many small dragons pour out of the side caves. ]],
            response = [[ Gather and AoE them quickly. ]],
        },
        {
            name = "Wing Buffet",
            spellId = 18500,
            danger = "low",
            target = "Players in front",
            description = [[ Knocks back players in front of her and reduces threat. ]],
            response = [[ Tank keeps building threat; others stay away from her front. ]],
        },
    },

    chat = {
        summary = {
            "P1 and P3: never stand in front of her (Flame Breath) or behind her (Tail Sweep). Attack from the sides.",
            "P2 (65%): she flies. Spread 8 yards for Fireballs. AoE the whelps from the caves.",
            "P2 Deep Breath: when she flies to one side and inhales, get out of the line in front of her.",
            "P2 Lair Guards: tank them, melee run out of Blast Nova.",
            "P3 (40%): she lands and fears the raid. Use fear protection, tank picks her up fast.",
        },
        tank = {
            "Face Onyxia toward a wall, away from the raid. Wing Buffet lowers threat, keep building it.",
            "P2: pick up each Lair Guard and face it away. Help gather whelps.",
            "P3: be ready when she lands, taunt at once, use Berserker Rage or ask for Fear Ward.",
        },
        healer = {
            "P2: stay spread, heal Fireball targets and whelp damage.",
            "Anyone hit by Deep Breath needs big heals right away.",
            "P3: put HoTs and shields on the tank before each fear.",
        },
        dps = {
            "Attack from her sides only.",
            "P2: AoE whelps first, then the Lair Guard, then ranged hit Onyxia. Melee run out of Blast Nova.",
            "P3: kill remaining adds, then full DPS on Onyxia.",
        },
    },
})

---------------------------------------------------------------------------
-- Vault of Archavon - shared text
---------------------------------------------------------------------------
local VOA_ACCESS = [[
Vault of Archavon is in Wintergrasp. |cffff2020Only the faction that controls Wintergrasp can enter|r, and the raid closes while a Wintergrasp battle is in progress (players inside are removed). If your faction loses Wintergrasp you must wait for the next battle.
]]

---------------------------------------------------------------------------
-- Vault of Archavon - Archavon the Stone Watcher
---------------------------------------------------------------------------
RTG:RegisterTactics("VOA_Archavon", {
    summary = "A simple two-tank fight: swap tanks after Stomp, spread for Rock Shards and kill him before the 5 minute enrage.",

    overview = VOA_ACCESS .. [[

Archavon the Stone Watcher is a simple tank and spank fight with a tank swap. He drops Tier 7 and PvP gear. He enrages after 5 minutes, so DPS matters.
]],

    preparation = [[
- 2 tanks, 2 healers (10) or 2 tanks, 4-5 healers (25)
- Ranged spread out loosely behind and to the sides of the boss
]],

    phases = {
        { title = "Single phase", text = [[
- Tank faces Archavon away from the raid
- About every 45 seconds {spell:60880} stuns everyone near him. Right after it he lunges for the tank and grabs (impales) them, so the second tank must taunt
- {spell:58678} hits a random player with rock shards. Heal them
- {spell:60895} jumps to a random player and damages players around them
]] },
    },

    tank = [[
- Main tank faces him away from the raid
- Off-tank stays close but not in front. When he grabs the main tank after Stomp, taunt at once
- Swap back the same way after the next Stomp
]],

    healer = [[
- Heavy tank damage. Heal the grabbed tank quickly after Stomp
- Heal Rock Shards and Crushing Leap targets
]],

    dps = [[
- Full DPS on the boss, the enrage is at 5 minutes
- Ranged spread so Crushing Leap does not hit many players
]],

    warnings = [[
- |cffff2020Enrage after 5 minutes.|r
- Off-tank must taunt right after Stomp, or he kills the wrong person
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- Same mechanics in both sizes. In 25 player he has more health, hits harder and drops more loot
- Rock Shards and Crushing Leap do more damage in 25 player
]],

    abilities = {
        {
            name = "Stomp",
            spellId = 60880,
            danger = "high",
            target = "Players near him",
            timing = "About every 45 seconds",
            description = [[ Stuns and damages nearby players. Followed by a grab on the tank. ]],
            response = [[ Heal through the stun. Off-tank taunts right after. ]],
        },
        {
            name = "Impale (tank grab)",
            icon = "Interface\\Icons\\Ability_Warrior_Charge",
            danger = "high",
            target = "Current tank",
            timing = "Right after Stomp",
            description = [[ Archavon lunges for the tank and grabs them, dealing heavy damage. ]],
            response = [[ Second tank taunts immediately; heal the grabbed tank. ]],
        },
        {
            name = "Rock Shards",
            spellId = 58678,
            danger = "medium",
            target = "Random player",
            description = [[ Shards of rock hit a player for several seconds. ]],
            response = [[ Healers heal the target. ]],
        },
        {
            name = "Crushing Leap",
            spellId = 60895,
            danger = "medium",
            target = "Random player at range",
            description = [[ Archavon jumps to a player and damages everyone around them. ]],
            response = [[ Stay spread. Tank picks him back up. ]],
        },
    },

    chat = {
        summary = {
            "Enrage after 5 minutes: full DPS.",
            "Stomp stuns everyone close, then he grabs the tank: off-tank taunts right away.",
            "Spread out for Rock Shards and Crushing Leap.",
        },
        tank = {
            "Face him away from the raid.",
            "After Stomp he grabs the tank: the other tank taunts immediately.",
        },
        healer = {
            "Big tank damage after Stomp and the grab.",
            "Heal Rock Shards and Crushing Leap targets.",
        },
        dps = {
            "Full DPS, enrage at 5 minutes.",
            "Ranged stay spread out.",
        },
    },
})

---------------------------------------------------------------------------
-- Vault of Archavon - Emalon the Storm Watcher
---------------------------------------------------------------------------
RTG:RegisterTactics("VOA_Emalon", {
    summary = "Run away from Lightning Nova, spread for Chain Lightning, and kill the Overcharged Tempest Minion before it explodes.",

    overview = VOA_ACCESS .. [[

Emalon the Storm Watcher fights with four Tempest Minions. About every 45 seconds he overcharges one of them. That minion grows and explodes after 10 stacks (about 20 seconds), which usually wipes the raid. He drops Tier 8 and PvP gear and enrages after 6 minutes.
]],

    preparation = [[
- 2 tanks (one for Emalon, one for the minions), 2-3 healers (10) or 5-6 (25)
- Ranged spread about 10 yards apart for Chain Lightning
]],

    phases = {
        { title = "Single phase", text = [[
- Main tank holds Emalon; off-tank holds the Tempest Minions away from the boss
- {spell:65279}: Emalon charges a big lightning blast around himself. Everyone runs about 20 yards away until it ends
- {spell:64218}: one minion gets {spell:64217} stacks every 2 seconds. At 10 stacks it explodes. All DPS switch and kill it
- Chain Lightning jumps between players who stand close together
]] },
    },

    tank = [[
- Emalon tank: hold him in place and run out with everyone for Lightning Nova
- Minion tank: hold all minions together, away from Emalon. Dead minions come back after a short time
]],

    healer = [[
- Heal Chain Lightning damage and stay spread
- Move out for Lightning Nova; anyone caught takes huge damage
]],

    dps = [[
- Hit Emalon, but switch at once to the Overcharged minion (it glows and grows) and kill it before 10 stacks
- Run 20 yards away during Lightning Nova
]],

    warnings = [[
- |cffff2020Kill the Overcharged minion before 10 stacks|r or it wipes the raid
- Run out of Lightning Nova
- Enrage after 6 minutes
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- Same mechanics in both sizes. In 25 player the boss and minions have more health and Lightning Nova and Chain Lightning hit harder
- Killing the Overcharged minion in time needs more focus in 25 player because it has more health
]],

    abilities = {
        {
            name = "Overcharge",
            spellId = 64218,
            danger = "high",
            target = "One Tempest Minion",
            timing = "About every 45 seconds",
            description = [[ A minion gains a stack of Overcharged every 2 seconds. At 10 stacks it explodes for raid-wide damage. ]],
            response = [[ All DPS switch and kill it within about 20 seconds. ]],
        },
        {
            name = "Lightning Nova",
            spellId = 65279,
            danger = "high",
            target = "Players near Emalon",
            timing = "Every 40-60 seconds",
            description = [[ A large lightning explosion around Emalon after a short cast. ]],
            response = [[ Everyone runs about 20 yards away until it is over. ]],
        },
        {
            name = "Chain Lightning",
            spellId = 64213,
            danger = "medium",
            target = "Random player, jumps",
            description = [[ Lightning that jumps to nearby players. ]],
            response = [[ Stay about 10 yards apart. ]],
        },
    },

    chat = {
        summary = {
            "Overcharged minion explodes at 10 stacks (20 sec): all DPS kill it right away.",
            "Lightning Nova: everyone runs 20 yards away from Emalon until it ends.",
            "Spread 10 yards for Chain Lightning. Enrage at 6 minutes.",
        },
        tank = {
            "Hold Emalon in place and run out for Lightning Nova.",
            "Off-tank holds the minions away from Emalon. They respawn after dying.",
        },
        healer = {
            "Stay spread for Chain Lightning and run out of Lightning Nova.",
            "Expect raid damage if the Overcharged minion explodes.",
        },
        dps = {
            "Switch to the Overcharged minion instantly and kill it before 10 stacks.",
            "Run 20 yards away during Lightning Nova.",
        },
    },
})

---------------------------------------------------------------------------
-- Vault of Archavon - Koralon the Flame Watcher
---------------------------------------------------------------------------
RTG:RegisterTactics("VOA_Koralon", {
    summary = "Two tanks share Meteor Fists, everyone moves out of Flaming Cinder fire, and the raid kills him before Burning Fury stacks get too high.",

    overview = VOA_ACCESS .. [[

Koralon the Flame Watcher is a short fire fight. His Meteor Fists damage is split between players in front of him, so both tanks stand together. He gets stronger over time with Burning Fury, so kill him quickly. He drops Tier 9 and PvP gear and enrages after 5 minutes.
]],

    preparation = [[
- 2 tanks stacked together in front of the boss, 2-3 healers (10) or 5-6 (25)
- Ranged and healers spread behind the boss
]],

    phases = {
        { title = "Single phase", text = [[
- Both tanks stand in front of Koralon, on top of each other
- About every 47 seconds {spell:66725}: for a while his hits are split between everyone in front of him. Two tanks share the damage
- {spell:66684} drops fire patches on the ground. Move out at once
- {spell:66665}: a breath of fire for a few seconds. Heal through it
- Every ~20 seconds {spell:66721} stacks up and makes the fight harder over time
]] },
    },

    tank = [[
- Both tanks stand together in front of Koralon at all times so Meteor Fists is split
- Use cooldowns during Meteor Fists and late in the fight when Burning Fury stacks are high
- Move him out of Flaming Cinder patches
]],

    healer = [[
- Heavy tank damage during Meteor Fists: heal both tanks
- Raid damage during Burning Breath; it gets worse as Burning Fury stacks
]],

    dps = [[
- Full DPS, the fight gets harder the longer it lasts
- Move out of Flaming Cinder fire right away. Do not stand in front of him
]],

    warnings = [[
- |cffff2020Move out of Flaming Cinder fire.|r
- Two tanks must stand together for Meteor Fists
- Enrage after 5 minutes
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- Same mechanics in both sizes. In 25 player there is more health and higher damage on tanks and raid
- 25 player needs more healers for Meteor Fists and Burning Breath
]],

    abilities = {
        {
            name = "Meteor Fists",
            spellId = 66725,
            danger = "high",
            target = "Players in front (tanks)",
            timing = "About every 47 seconds",
            description = [[ His melee hits deal extra fire damage split between everyone in front of him. ]],
            response = [[ Both tanks stand together in front. Use cooldowns. ]],
        },
        {
            name = "Flaming Cinder",
            spellId = 66684,
            danger = "medium",
            target = "Random spots on the ground",
            description = [[ Fire patches on the ground that burn anyone standing in them. ]],
            response = [[ Move out immediately. ]],
        },
        {
            name = "Burning Breath",
            spellId = 66665,
            danger = "medium",
            target = "Raid",
            timing = "About every 45 seconds",
            description = [[ A fire breath lasting a few seconds. ]],
            response = [[ Healers top everyone up; do not stand in front of him. ]],
        },
        {
            name = "Burning Fury",
            spellId = 66721,
            danger = "medium",
            target = "Stacks over time",
            timing = "About every 20 seconds",
            description = [[ A stacking effect that makes the fight hurt more the longer it lasts. ]],
            response = [[ Kill him quickly; save cooldowns for late in the fight. ]],
        },
    },

    chat = {
        summary = {
            "Both tanks stand together in front for Meteor Fists, the damage is split.",
            "Move out of Flaming Cinder fire on the ground immediately.",
            "Burning Fury stacks every 20 sec: kill fast, enrage at 5 minutes.",
        },
        tank = {
            "Both tanks stack on top of each other in front of Koralon.",
            "Use cooldowns during Meteor Fists and late in the fight.",
        },
        healer = {
            "Heal both tanks hard during Meteor Fists.",
            "Raid damage from Burning Breath grows with Burning Fury stacks.",
        },
        dps = {
            "Full DPS, never stand in front, move out of fire at once.",
        },
    },
})

---------------------------------------------------------------------------
-- Vault of Archavon - Toravon the Ice Watcher
---------------------------------------------------------------------------
RTG:RegisterTactics("VOA_Toravon", {
    summary = "Tanks swap on Frostbite stacks, DPS kill Frozen Orbs, and healers carry the raid through Whiteout.",

    overview = VOA_ACCESS .. [[

Toravon the Ice Watcher is the last and hardest boss of the Vault. He stacks Frostbite on his tank, so two tanks must swap. He summons Frozen Orbs that pulse frost damage, and his Whiteout hits the whole raid. He drops Tier 10 and PvP gear.
]],

    preparation = [[
- 2 tanks, 3 healers (10) or 6 healers (25)
- One tank or a group of DPS assigned to the Frozen Orbs
- Spread out a little so Freezing Ground hits fewer players
]],

    phases = {
        { title = "Single phase", text = [[
- Each hit gives the tank a stack of {spell:72004}. It slows them and does frost damage over time. Tanks swap before the stacks get too high
- About every 38 seconds {spell:72091} summons orbs that pulse frost damage to the raid. Kill them quickly
- About every 38 seconds {spell:72034} hits the whole raid with frost damage
- {spell:72090} freezes the ground under players. Move out of it
]] },
    },

    tank = [[
- Swap tanks on Frostbite stacks (often around 5-8 stacks, agree on a number). The stacks fall off after about 20 seconds without hits
- Off-tank can pick up the Frozen Orbs and keep them away from the boss
]],

    healer = [[
- Whiteout every ~38 seconds: raid-wide damage, top everyone up before it
- Heavy tank damage as Frostbite stacks. Watch the tank with stacks
- Frozen Orbs add constant raid damage while alive
]],

    dps = [[
- Switch to Frozen Orbs as soon as they spawn and kill them, then back to Toravon
- Move out of Freezing Ground
]],

    warnings = [[
- |cffff2020Kill the Frozen Orbs fast|r, their damage adds up with Whiteout
- Tanks must swap on Frostbite or the tank will die
- Move out of Freezing Ground
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- Same mechanics in both sizes. In 25 player there are more Frozen Orbs per cast, more health and much more raid damage
- 25 player needs strong AoE or cleave on the orbs and more healers for Whiteout
]],

    abilities = {
        {
            name = "Frozen Orb",
            spellId = 72091,
            danger = "high",
            target = "Spawns near the raid",
            timing = "About every 38 seconds",
            description = [[ Summons orbs that pulse frost damage to players around them. ]],
            response = [[ DPS switch and kill the orbs quickly. ]],
        },
        {
            name = "Frostbite",
            spellId = 72004,
            danger = "high",
            target = "Current tank",
            description = [[ Stacking debuff from his melee hits. Deals frost damage and slows the tank. Lasts about 20 seconds. ]],
            response = [[ Tanks swap at the agreed stack count. ]],
        },
        {
            name = "Whiteout",
            spellId = 72034,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 38 seconds",
            description = [[ A burst of frost damage to the whole raid. ]],
            response = [[ Healers top everyone up before it; use raid cooldowns if needed. ]],
        },
        {
            name = "Freezing Ground",
            spellId = 72090,
            danger = "medium",
            target = "Random players",
            description = [[ Freezes the ground and damages players standing in it. ]],
            response = [[ Move out of it right away. ]],
        },
    },

    chat = {
        summary = {
            "Tanks swap on Frostbite stacks.",
            "Frozen Orbs pulse frost damage: DPS kill them fast every ~38 sec.",
            "Whiteout hits the whole raid every ~38 sec. Move out of Freezing Ground.",
        },
        tank = {
            "Swap tanks at the agreed Frostbite stack count.",
            "Off-tank can pick up Frozen Orbs away from the boss.",
        },
        healer = {
            "Top everyone up before each Whiteout.",
            "Watch the tank with Frostbite stacks.",
        },
        dps = {
            "Kill Frozen Orbs as soon as they spawn, then back to Toravon.",
            "Move out of Freezing Ground.",
        },
    },
})
