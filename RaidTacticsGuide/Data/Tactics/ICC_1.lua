-- Raid Tactics Guide - Icecrown Citadel part 1
-- The Lower Spire (Marrowgar, Deathwhisper, Gunship, Saurfang) and The Plagueworks (Festergut, Rotface)

local RTG = RaidTacticsGuide

------------------------------------------------------------------------
-- Lord Marrowgar
------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Marrowgar", {
    summary = "A movement check on the first boss: free players from Bone Spikes, never stand in Coldflame, and spread out during Bone Storm.",

    overview = [[
Lord Marrowgar is the first boss of Icecrown Citadel. It is a one-boss fight with no adds to tank, but it punishes players who do not watch the floor.

Marrowgar hits his tanks with {spell:69055}, which is split between the tank and the players closest to him. A second tank (and often a third in 25-man) must stand right on top of the main tank to share that damage.

Raids wipe here for three reasons: DPS forget to kill {spell:69057} spikes and impaled players die, people stand in {spell:69146} (blue-white fire lines on the ground), and players stand still during {spell:69076} when he spins across the room.

The fight lasts about 4-6 minutes. There is an enrage after 10 minutes (shorter on some Warmane realms), so damage matters but survival matters more.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- Tanks stack on the exact same spot in front of the boss to share Bone Slice
- Melee stand behind the boss, never in front
- Ranged and healers stand loosely behind or to the side of the boss, inside healing range of the tanks
- Assign a few ranged players (or everyone) to switch to Bone Spikes. Raid markers on spikes help a lot.
- Keep the room around you clear in your head: you will need space to step sideways from Coldflame
]],

    phases = {
        { title = "Normal phase (melee phase)", text = [[
- The tanks hold Marrowgar in place. The off-tank stands inside the main tank so Bone Slice is shared.
- About every 15-20 seconds he casts {spell:69057}: a spike impales 1 random player (3 in 25-man). Tanks are never chosen.
- An impaled player cannot move and takes damage until the spike dies. DPS switch to the spike at once.
- He also sends {spell:69146} out in a straight line toward a random player. Step sideways out of the line, do not run along it.
]] },
        { title = "Bone Storm (about every 90 seconds)", text = [[
- He starts whirling (spinning) and stops attacking the tanks. The tanks have nothing to do but survive.
- He moves to random players and the damage is highest close to him. Everyone spread out and keep moving away from him.
- During the storm Coldflame comes out in a cross shape (four lines) from where he stops. Watch the floor.
- Bone Storm lasts about 20 seconds on Normal. On Normal there are no Bone Spikes during the storm.
- When the storm ends, the main tank must pick him up again quickly. The raid returns to its normal positions.
]] },
    },

    tank = [[
- Main tank: face Marrowgar away from the raid and keep him still. Moving him makes Coldflame harder to predict.
- Off-tank (and third tank in 25-man): stand inside the main tank, on the same spot, so Bone Slice hits you too. If you drift away, the main tank takes the full hit and can die.
- You still have to step out of Coldflame. Move together with the other tank, a few steps only.
- After Bone Storm ends, taunt or attack right away so he does not run to a healer.
- Use a defensive cooldown if healers are behind after a Bone Storm.
]],

    healer = [[
- The tanks take steady heavy damage from Bone Slice. If the tanks are not stacked, the main tank takes double damage - call it out.
- Impaled players take damage every second. Keep them alive until the spike dies.
- Bone Storm is the hardest part: players get hit hard and are spread out. Use raid healing and stay mobile.
- Do not stand still to finish a long cast if Coldflame is under you. Move first, heal second.
- Save mana cooldowns for Bone Storms on long fights.
]],

    dps = [[
- Priority: Bone Spike first, boss second. Target the spike, kill it, go back to the boss.
- Melee: stay behind the boss. Never stand in front (Bone Slice and the tanks are there).
- Ranged: Bone Spikes spawn on the impaled players, so you can reach them without moving far.
- During Bone Storm, keep moving away from the boss and keep DPS on him if you can. Instant casts help.
- Do not chase him into Coldflame lines just to keep attacking.
]],

    warnings = [[
- |cffff2020Never stand in Coldflame.|r It ticks fast and stacks with other damage. Step sideways, not along the line.
- |cffff2020Kill Bone Spikes immediately.|r A player left impaled for a long time will die.
- Tanks must stand on the same spot. A tank alone eats the full Bone Slice.
- During Bone Storm, do not stand still and do not run toward the boss.
- Melee standing in front of the boss will take Bone Slice damage they cannot survive.
]],

    heroic = [[
- Everything hits much harder. Coldflame and Bone Storm damage are higher.
- Bone Storm lasts about 30 seconds instead of 20.
- Marrowgar keeps casting Bone Spike Graveyard during Bone Storm. DPS must kill spikes while the raid is spread and moving.
- Healers need to be ready for spikes during the storm: an impaled player cannot move away from the boss.
- Achievement "Boned": nobody may stay impaled for more than 8 seconds.
]],

    alternatives = {
        { title = "Stack strategy (common for organised raids)", text = [[
All ranged and healers stand in one tight group behind or beside the boss. Coldflame lines then all come toward that group, so everyone steps sideways together in the same direction. Bone Spikes spawn close together, so melee cleaves and ranged can kill them fast. During Bone Storm, the group spreads out and re-forms when it ends.
]] },
        { title = "Spread strategy (easier for pick-up groups)", text = [[
Ranged and healers spread out loosely around the back half of the room. Coldflame lines hit fewer people at once, and nobody has to react to a group call. The downside is that spikes are far apart, so assign one or two ranged DPS to each side of the room to kill them.
]] },
    },

    abilities = {
        {
            name = "Bone Spike Graveyard",
            spellId = 69057,
            danger = "high",
            target = "1 random player (3 in 25-man), never the tank",
            timing = "About every 15-20 seconds",
            description = [[ Bone spikes impale random players. An impaled player cannot move and takes damage every second until the spike is destroyed. ]],
            response = [[ DPS switch to the spike and kill it right away. Healers keep the impaled player alive. ]],
        },
        {
            name = "Bone Storm",
            spellId = 69076,
            danger = "high",
            target = "Whole raid, highest damage near the boss",
            timing = "About every 90 seconds, 20 sec (30 sec Heroic)",
            description = [[ Marrowgar spins and moves between random players. The damage is highest close to him. He does not attack the tanks during it. ]],
            response = [[ Spread out and keep moving away from him. Tanks pick him up again when it ends. ]],
        },
        {
            name = "Coldflame",
            spellId = 69146,
            danger = "high",
            target = "Line toward a random player; cross shape during Bone Storm",
            description = [[ A line of frost fire travels across the floor and keeps burning for a few seconds. ]],
            response = [[ Step sideways out of the line. Do not run along it. ]],
        },
        {
            name = "Bone Slice (Saber Lash)",
            spellId = 69055,
            danger = "medium",
            target = "Main tank and the players closest to him",
            description = [[ A heavy melee hit that is split between the main target and the nearest players. ]],
            response = [[ The off-tank (and a third tank in 25-man) stand on top of the main tank. Melee stay behind the boss. ]],
        },
        {
            name = "Impaled",
            spellId = 69065,
            danger = "medium",
            target = "Players hit by Bone Spike Graveyard",
            description = [[ The debuff on a player stuck in a Bone Spike. It lasts until the spike dies. ]],
            response = [[ If you are impaled, use a defensive cooldown. Everyone else kills the spike. ]],
        },
    },

    chat = {
        summary = {
            "Bone Spikes impale random players: DPS switch to the spikes immediately and free them.",
            "Coldflame: frost lines on the ground - never stand in them, step sideways.",
            "Bone Storm every 90 sec: boss spins and moves, hits hardest near him - spread out and keep moving away.",
            "Melee behind the boss only. Nobody in front except the tanks.",
        },
        tank = {
            "Off-tank stand on the exact same spot as the main tank to share Bone Slice.",
            "Keep the boss still and facing away from the raid.",
            "Pick him up fast when Bone Storm ends.",
        },
        healer = {
            "Tanks take heavy Bone Slice damage - more if they are not stacked.",
            "Impaled players take damage every second - keep them up until the spike dies.",
            "Bone Storm is the big damage window: move, spread and raid heal.",
        },
        dps = {
            "Bone Spike first, boss second. Kill spikes the moment they appear.",
            "Melee stay behind the boss. Step out of Coldflame lines.",
            "During Bone Storm keep moving away from him and keep attacking if you can.",
        },
    },
})

------------------------------------------------------------------------
-- Lady Deathwhisper
------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Deathwhisper", {
    summary = "A two-phase fight: burn her Mana Barrier while handling cultist adds, then tank-swap and interrupt Frostbolts once she comes down.",

    overview = [[
Lady Deathwhisper stands on a platform at the end of a long hall. In phase 1 she is protected by {spell:70842}: damage taken drains her mana instead of her health. When her mana reaches zero, the barrier breaks and phase 2 begins.

During phase 1, waves of cultists come out of the doors on the left and right sides of the room. Fanatics are melee adds that must be tanked. Adherents are casters that should be interrupted and killed. Lady Deathwhisper can empower or transform them, and dying cultists can be raised again.

In phase 2 she comes down and fights the tank directly. She casts Frostbolts that must be interrupted, summons Vengeful Shades that chase players, and keeps casting {spell:71001} and {spell:71289}.

Raids wipe from poor add control in phase 1, from mind-controlled players killing healers, and from Vengeful Shades exploding in groups of players.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- In phase 1 one tank picks up adds on the left door, one on the right door (in 10-man the adds come from one side at a time)
- The raid stands in the middle of the room, near the stairs below her platform, so everyone can reach the boss and both doors
- Assign interrupters for adherents in phase 1 and for her Frostbolt in phase 2
- Assign crowd control (Polymorph, Hex, Repentance, Fear, Hammer of Justice) for mind-controlled players
]],

    phases = {
        { title = "Phase 1 - Mana Barrier and adds", text = [[
- She stays on her platform and casts Shadow Bolts on random players. Her {spell:70842} soaks all damage.
- A wave of cultists spawns about every 60 seconds (45 on Heroic). Tanks pick up the fanatics, DPS kill adherents first.
- {spell:71001} is placed under groups of players. Move out of it at once.
- She can turn a fanatic into a big Deformed Fanatic ({spell:70900}) or an adherent into an Empowered Adherent ({spell:70901}). Kill these quickly.
- When an add casts {spell:71236}, it is about to explode. Melee run away.
- From 10-man Heroic and 25-man upward she also casts {spell:71289}. A mind-controlled player attacks the raid for about 12 seconds.
- DPS the boss between waves. Phase 2 starts when her mana is gone.
]] },
        { title = "Phase 2 - She comes down", text = [[
- She walks down to the tank. All remaining adds should be dead or tanked out of the way.
- Interrupt her {spell:72007}. It hits very hard and slows. She also casts {spell:72905}, which hits the whole raid.
- {spell:71204} lowers the current tank's threat with each stack. The other tank taunts at about 3 stacks.
- {spell:71426}: Vengeful Shades appear and chase a random player, then explode. That player runs away from the raid.
- Death and Decay and Dominate Mind continue. Keep moving out of the ground effect.
- On Heroic, adds keep spawning in phase 2. On Warmane they may also keep spawning on Normal, so keep an add tank ready.
]] },
    },

    tank = [[
- Phase 1: each tank owns one door. Pick up fanatics as they arrive and drag them to the middle near the raid so ranged can hit them.
- Deformed Fanatics hit very hard. Use a cooldown and get them killed first.
- Watch for {spell:71236}: if a fanatic you are tanking starts casting it, move it away from melee or step away yourself.
- Phase 2: one tank takes the boss. Taunt from the other tank when {spell:71204} reaches about 3 stacks, then swap back when it falls off.
- Do not tank her in Death and Decay.
]],

    healer = [[
- Phase 1: random Shadow Bolts and Death and Decay are the main damage. Add tanks take spiky melee damage from fanatics.
- Dispel or purge {spell:70674} on fanatics if your class can (it makes them hit harder and heal).
- If you are mind controlled, other players will crowd control you. Nothing to do but wait.
- Phase 2: Frostbolt Volley hits everyone. Missed Frostbolt interrupts hit the tank very hard.
- Vengeful Shade explosions can hit several players. Top them up afterwards.
]],

    dps = [[
- Phase 1 priority: Empowered Adherent and Deformed Fanatic first, then other adherents, then fanatics, then the boss.
- Interrupt adherents. Remove curses ({spell:71237}) if you are a mage or druid.
- Do not ignore the boss: the fight only moves on once her mana is gone. Hit her between waves.
- Melee run when an add casts Dark Martyrdom.
- Phase 2: interrupt Frostbolt. If a Vengeful Shade chases you, run away from the raid until it explodes.
- If a raid member is mind controlled, crowd control them. Do not kill them.
]],

    warnings = [[
- |cffff2020Interrupt her Frostbolt in phase 2.|r A full Frostbolt on the tank can kill them.
- |cffff2020Get out of Death and Decay right away.|r It ticks fast and is often placed under the healers.
- Mind-controlled players must be crowd controlled. A mind-controlled melee player can kill a healer in seconds.
- Shades chasing you: run away from the raid. Do not bring them into the group.
- Leaving adherents alive leads to raid-wide damage and curses. Kill them.
- Running out of time on the add waves happens when the raid ignores the boss. Split damage sensibly.
]],

    heroic = [[
- Add waves come every 45 seconds instead of 60.
- On Heroic, adds keep spawning in phase 2, so an add tank must stay on adds while the main tank holds the boss.
- {spell:71289} takes 1 player on 10-man Heroic and 3 players on 25-man Heroic. More crowd control is needed.
- All damage is higher. Mana Barrier is larger, so phase 1 lasts longer.
- Many melee remove their weapons when mind controlled (an equipment set swap) so they hit the raid less.
]],

    alternatives = {
        { title = "Ranged burn boss, melee on adds", text = [[
Ranged DPS stay on Lady Deathwhisper during phase 1 and only switch to adherents. Melee DPS stay with the tanks and kill the adds near each door. This pushes phase 1 quickly and is popular in 25-man.
]] },
        { title = "Whole raid on adds", text = [[
Everyone kills each add wave together in the middle, then everyone goes back to the boss. Slower, but safer for new groups because no add is ever left free. Works well in 10-man where adds come from one side at a time.
]] },
    },

    abilities = {
        {
            name = "Dominate Mind",
            spellId = 71289,
            danger = "high",
            target = "Random player (not on 10-man Normal; 3 players on 25-man Heroic)",
            timing = "About every 40 seconds",
            description = [[ A raid member is mind controlled for about 12 seconds and attacks the raid. ]],
            response = [[ Crowd control the controlled player (Polymorph, Hex, Repentance, Fear, stuns). Do not kill them. ]],
        },
        {
            name = "Frostbolt",
            spellId = 72007,
            danger = "high",
            target = "Current tank (phase 2)",
            description = [[ A heavy Frost bolt that also slows the target. ]],
            response = [[ Assigned interrupters must kick every cast. ]],
        },
        {
            name = "Summon Spirit (Vengeful Shade)",
            spellId = 71426,
            danger = "high",
            target = "Random player (phase 2)",
            description = [[ Vengeful Shades appear and chase a player, then explode, hitting everyone nearby. ]],
            response = [[ The chased player runs away from the raid. Everyone else stays away from shades. ]],
        },
        {
            name = "Mana Barrier",
            spellId = 70842,
            danger = "medium",
            target = "Lady Deathwhisper (phase 1)",
            description = [[ All damage she takes drains her mana instead of health. Phase 2 starts when her mana is empty. ]],
            response = [[ Keep damage on her between add waves to push phase 2. ]],
        },
        {
            name = "Death and Decay",
            spellId = 71001,
            danger = "medium",
            target = "Ground under groups of players",
            description = [[ A dark circle on the ground that deals Shadow damage every second. ]],
            response = [[ Move out immediately. ]],
        },
        {
            name = "Touch of Insignificance",
            spellId = 71204,
            danger = "medium",
            target = "Current tank (phase 2)",
            description = [[ A stacking debuff that lowers the tank's threat. ]],
            response = [[ The other tank taunts at about 3 stacks. ]],
        },
        {
            name = "Frostbolt Volley",
            spellId = 72905,
            danger = "medium",
            target = "Whole raid (phase 2)",
            description = [[ Frost damage on everyone plus a slow. ]],
            response = [[ Healers prepare raid healing. It cannot be avoided. ]],
        },
        {
            name = "Dark Martyrdom",
            spellId = 71236,
            danger = "medium",
            target = "Players near the casting add",
            description = [[ A cultist sacrifices itself and explodes, hitting everyone close to it. ]],
            response = [[ Melee and the add tank step away from the casting add. ]],
        },
        {
            name = "Dark Empowerment / Dark Transformation",
            spellId = 70901,
            danger = "medium",
            target = "One adherent or fanatic",
            description = [[ She empowers an adherent (it can no longer be interrupted) or turns a fanatic into a huge Deformed Fanatic that hits very hard. ]],
            response = [[ Kill the empowered or deformed add first. Tanks use cooldowns on Deformed Fanatics. ]],
        },
        {
            name = "Vampiric Might",
            spellId = 70674,
            danger = "low",
            target = "Cult Fanatics",
            description = [[ A magic buff on a fanatic that makes it heal from the damage it deals. ]],
            response = [[ Purge or dispel it from the fanatic. ]],
        },
    },

    chat = {
        summary = {
            "Phase 1: damage drains her Mana Barrier. Kill adds when they spawn, hit the boss between waves.",
            "Get out of Death and Decay immediately.",
            "Mind controlled players: crowd control them, do not kill them.",
            "Phase 2: interrupt every Frostbolt. If a Vengeful Shade chases you, run away from the raid.",
            "Melee run away from adds casting Dark Martyrdom - they explode.",
        },
        tank = {
            "Phase 1: one tank per door. Bring fanatics to the middle. Use cooldowns on Deformed Fanatics.",
            "Phase 2: taunt swap at about 3 stacks of Touch of Insignificance.",
            "Keep the boss out of Death and Decay.",
        },
        healer = {
            "Phase 1: watch add tanks and random Shadow Bolts. Purge Vampiric Might if you can.",
            "Phase 2: Frostbolt Volley hits everyone. Missed interrupts spike the tank.",
            "Stay out of Death and Decay - it is often placed on healers.",
        },
        dps = {
            "Kill order: Empowered Adherent and Deformed Fanatic, then adherents, then fanatics, then boss.",
            "Interrupt adherents in phase 1 and her Frostbolt in phase 2. Remove curses.",
            "Crowd control mind controlled players. Shade on you: run away from the raid.",
        },
    },
})

------------------------------------------------------------------------
-- Icecrown Gunship Battle
------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Gunship", {
    summary = "A vehicle and add fight between two airships: gunners shoot the enemy ship, a boarding team kills the enemy mage, and everyone else kills boarders.",

    overview = [[
The Gunship Battle is fought on two flying airships. You win by bringing the enemy ship's health to zero. You do not have to kill the enemy commander.

Alliance raids stand on The Skybreaker (commander Muradin Bronzebeard) and fight Orgrim's Hammer (commander High Overlord Saurfang). Horde raids stand on Orgrim's Hammer and fight The Skybreaker. The mechanics are the same on both sides; only the names change.

Your ship has cannons. Gunners in the cannons do most of the damage to the enemy ship. The enemy sends boarders onto your deck, shoots at you from its own deck, and every so often sends a mage who casts {spell:69705} to freeze all your cannons. A boarding team uses rocket packs to jump to the enemy ship and kill that mage.

Raids wipe when the cannons stay frozen for too long, when boarders are left alive until they become Elite, or when players miss the rocket pack jump and fall off the ship.
]],

    preparation = [[
- Grab a Goblin Rocket Pack from the goblin vendor (Zafod Boombox) on your ship before the start. Everyone should have one.
- Cannons: 2 gunners in 10-man, 4 in 25-man. Pick players who are calm with vehicles. Ranged DPS often do it, as their normal DPS is not needed on the deck.
- Boarding team: 1 tank plus 2-3 DPS in 10-man; 1-2 tanks plus 4-6 DPS (sometimes a healer) in 25-man.
- Deck team: the other tank, all healers and the rest of the DPS stay on your ship to kill boarders.
- Your own commander (Muradin or Saurfang) helps fight boarders on your deck.
- Names to know: Alliance raids must kill the Kor'kron Battle-Mage on Orgrim's Hammer. Horde raids must kill the Skybreaker Sorcerer on The Skybreaker.
]],

    phases = {
        { title = "Start - ships come side by side", text = [[
- After a short talk (about 45 seconds) the enemy ship comes alongside and combat starts.
- Gunners get into the cannons right away and start firing at the enemy ship.
- Deck team gets ready for the first boarding wave.
]] },
        { title = "Boarders (about every 60 seconds)", text = [[
- Alliance raids: Kor'kron Reavers and Kor'kron Sergeants jump onto your ship. Horde raids: Skybreaker Marines and Skybreaker Sergeants.
- Adds that live too long gain ranks: {spell:71188}, then {spell:71193}, then {spell:71195}. Each rank makes them hit harder. Kill them fast.
- Sergeants use {spell:69652} (melee get out) and {spell:69651} (reduces healing on the tank).
- Meanwhile the enemy deck shoots at you: Kor'kron Axethrowers and Rocketeers (Alliance raid) or Skybreaker Riflemen and Mortar Soldiers (Horde raid). Rocket and mortar impacts show a circle on the ground. Move out of it.
]] },
        { title = "Mage freeze (Below Zero)", text = [[
- When your cannons have done enough hull damage, the enemy commander calls a mage. The mage casts {spell:69705} and freezes all of your cannons.
- The boarding team uses rocket packs to jump to the enemy ship and kills the mage. This is the top priority.
- The enemy commander attacks anyone on his ship and gains {spell:69638} stacks while fighting. The boarding tank picks him up and keeps him away from the DPS.
- When the mage is dead the cannons thaw. Gunners fire again. The boarding team jumps back home.
- A new mage comes roughly every 30-35 seconds after the last one, depending on how fast you damage the ship.
]] },
        { title = "Victory", text = [[
- When the enemy ship's health reaches zero, the fight is over. Loot is in a chest on your ship.
]] },
    },

    tank = [[
- Deck tank: pick up every boarder as it lands, including Sergeants. Face them away from the raid.
- Sergeant {spell:69651} reduces healing on you. Use cooldowns if several adds are on you.
- Boarding tank: jump with the boarding team. Pick up the enemy commander (Saurfang for Alliance, Muradin for Horde) and drag him away from the mage.
- {spell:69638} stacks make him hit harder the longer he fights. Jump back home before the stacks get too high and let them fall off.
- In 25-man two boarding tanks can swap on him.
]],

    healer = [[
- Stay on your own ship. The deck tank and players hit by rockets or mortars are your main job.
- Wounding Strike from Sergeants lowers healing on the tank. Heal through it or ask for the Sergeant to die first.
- Watch the boarding team: they are far away, but you can heal them if you stand near the edge closest to the enemy ship.
- Bladestorm hits all melee near the Sergeant. Expect spikes on melee.
- Do not stand in rocket or mortar impact circles.
]],

    dps = [[
- Gunners: use Cannon Blast to build heat and Incinerating Blast to spend it. Never let the heat bar reach full or the cannon overheats and stops firing. Aim at the enemy shooters on their deck - it hurts the ship and kills the shooters.
- Gunners: when frozen by Below Zero you can leave the cannon and help with adds, then get back in once the mage is dead.
- Boarding team: when Below Zero starts, use the rocket pack, land in the middle of the enemy deck and kill the mage. Ignore the commander. Jump back afterwards.
- Deck team: kill boarders before they become Elite. Sergeants first. Melee leave when a Sergeant Bladestorms.
- Ranged on the deck can also shoot the enemy shooters on the other ship when they are in range.
]],

    warnings = [[
- |cffff2020Aim the rocket pack at the middle of the deck.|r Missing the jump means falling to your death.
- |cffff2020Kill the mage quickly.|r Every second the cannons are frozen makes the fight longer and harder.
- Do not let boarders reach Elite rank. They become very dangerous.
- Gunners: do not overheat the cannon. Watch the heat bar.
- Do not attack the enemy commander. His health does not matter, and he grows stronger with Battle Fury stacks.
- Get out of rocket and mortar circles on your deck.
]],

    heroic = [[
- The enemy ship has more health, and boarders, shooters and the enemy commander all hit harder.
- Boarders that reach higher ranks are much more dangerous, so the deck team must kill them faster.
- The boarding tank must manage Battle Fury stacks more carefully, as the commander hits very hard.
- The basic plan is the same: gunners fire, the boarding team kills the mage, the deck team kills boarders.
]],

    alternatives = {
        { title = "Large boarding team (fast kill)", text = [[
Send most melee DPS to the enemy ship and keep them there. They kill the mage instantly each time and also kill the enemy shooters on the deck. Needs a strong boarding tank to handle the commander, and fewer people stay home to kill boarders.
]] },
        { title = "Small boarding team (safe kill)", text = [[
Only a tank and a few DPS jump, and only when a mage appears. Everyone else stays home on adds. Slower, but safer for new raids because the deck stays under control.
]] },
    },

    abilities = {
        {
            name = "Below Zero",
            spellId = 69705,
            danger = "high",
            target = "All of your cannons",
            timing = "First after about 35-40 seconds, then roughly every 30-35 seconds",
            description = [[ An enemy mage freezes your cannons so they cannot fire until the mage dies. ]],
            response = [[ The boarding team jumps to the enemy ship and kills the mage at once. ]],
        },
        {
            name = "Battle Fury",
            spellId = 69638,
            danger = "medium",
            target = "Enemy commander, while fighting",
            description = [[ A stacking buff on the commander that increases his damage every time he fights. ]],
            response = [[ Only the boarding tank fights him. Go home and let stacks fall off when they get high. ]],
        },
        {
            name = "Elite (boarder rank)",
            spellId = 71195,
            danger = "high",
            target = "Boarders that live too long",
            description = [[ Boarders gain Experienced, Veteran and finally Elite ranks over time, each one making them hit harder. ]],
            response = [[ Kill boarders quickly after they land. ]],
        },
        {
            name = "Bladestorm",
            spellId = 69652,
            danger = "medium",
            target = "Melee near a Sergeant",
            description = [[ A Sergeant spins and hits everyone close to him. ]],
            response = [[ Melee step away until it ends. The tank stays. ]],
        },
        {
            name = "Wounding Strike",
            spellId = 69651,
            danger = "medium",
            target = "Sergeant's current target",
            description = [[ A strike that reduces healing taken by the target. ]],
            response = [[ Kill Sergeants first. Tanks use cooldowns while it is on them. ]],
        },
    },

    chat = {
        summary = {
            "Win by killing the enemy ship. Do not attack the enemy commander.",
            "Gunners: build heat with Cannon Blast, spend it with Incinerating Blast, never overheat.",
            "Below Zero freezes our cannons: boarding team rocket packs over and kills the mage at once.",
            "Deck team: kill boarders fast, Sergeants first, before they become Elite.",
            "Aim your rocket pack at the middle of the deck - missing means falling to your death.",
        },
        tank = {
            "Deck tank: pick up every boarder as it lands, face Sergeants away from the raid.",
            "Boarding tank: hold the enemy commander away from the mage, jump home when Battle Fury stacks get high.",
        },
        healer = {
            "Stay on our ship. Heal the deck tank and players hit by rockets or mortars.",
            "Wounding Strike lowers healing on the tank - kill the Sergeant or heal through it.",
        },
        dps = {
            "Gunners: aim at enemy shooters on their deck. Leave the cannon when frozen and help with adds.",
            "Boarding team: on Below Zero jump over, kill the mage, jump back.",
            "Deck team: Sergeants first. Melee step out of Bladestorm.",
        },
    },
})

------------------------------------------------------------------------
-- Deathbringer Saurfang
------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Saurfang", {
    summary = "A DPS race: every hit on the raid fills his Blood Power bar, and at 100 a player gets a deadly Mark. Kill Blood Beasts fast and burn him.",

    overview = [[
Deathbringer Saurfang is a single-target fight built around his Blood Power bar. Every time he or his Blood Beasts damage a player, he gains Blood Power. When the bar reaches 100, he places {spell:72293} on a random raid member and the bar resets.

A marked player takes extra damage every time Saurfang hits anyone, and the mark never goes away. If a marked player dies, Saurfang heals himself. With every mark the raid takes more damage, so the fight becomes a race: kill him before the marks overwhelm the healers.

The biggest source of Blood Power is the Blood Beasts that spawn every 40 seconds. If they reach players and hit them, he fills his bar very fast. Killing the beasts quickly is the key to the fight.

Normal kills usually see 2-4 marks. At 30% health he enters {spell:72737} and hits harder. There is an enrage after about 8 minutes (7 on some Warmane realms).
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers, 5-6 DPS
- 25-man: 2 tanks, 5-6 healers, the rest DPS. Bring many ranged if you can.
- Tank him near the entrance of the platform. Melee stand behind him.
- Ranged and healers spread out in a half-circle behind him with at least 12 yards between each other (Blood Nova splash).
- Assign ranged DPS to Blood Beasts. Hunters, frost mages, shamans and death knights should bring slows and stuns for beasts.
- Combat starts about 45 seconds after the talking at the start.
]],

    phases = {
        { title = "Main phase (100% to 30%)", text = [[
- Saurfang hits the tank and places {spell:72410} on them. The other tank taunts to stop him healing from it.
- {spell:72385} goes on random players: heavy damage over time.
- {spell:72378} hits a random player and everyone near them. Stay spread.
- Every 40 seconds he calls {spell:72173}: 2 beasts in 10-man, 5 in 25-man. Ranged kill them before they reach anyone.
- When Blood Power reaches 100 he casts {spell:72293} on a random player. The mark lasts until death.
]] },
        { title = "Frenzy (below 30%)", text = [[
- He gains {spell:72737}: faster, stronger attacks. Tanks use cooldowns.
- All DPS use their cooldowns and burn him down. Marks keep coming, so speed is everything.
]] },
    },

    tank = [[
- Two tanks share the boss. When {spell:72410} lands on the current tank, the other tank taunts at once.
- Keep him facing away from the raid. Do not move him around.
- Beasts should not reach the tanks either, but if a beast runs at a healer, the off-tank can grab it.
- Use cooldowns during Frenzy below 30%.
- If you get marked, you will take extra damage from every hit. Call it out so healers focus you.
]],

    healer = [[
- Boiling Blood targets need strong healing. Shields and heal-over-time spells help.
- Marked players take damage each time Saurfang hits anyone. Keep every marked player near full health. A dead marked player heals the boss.
- Each new mark raises raid damage. Plan cooldowns for the later part of the fight.
- Stay spread at least 12 yards from other ranged to avoid shared Blood Nova damage.
]],

    dps = [[
- When Blood Beasts spawn, ranged switch immediately. Slow and stun them (Frost Trap, Earthbind Totem, Chains of Ice, Frost Nova). They take reduced damage from area attacks, so use single-target attacks.
- Beasts must die before they reach players. Every hit they land gives Saurfang Blood Power.
- Melee stay on Saurfang behind him. Help on beasts only if they reach the melee group.
- Save cooldowns for after the first or second mark, or for Frenzy below 30%.
- Stay spread if you are ranged.
]],

    warnings = [[
- |cffff2020Kill Blood Beasts fast.|r Beasts hitting players are the fastest way to get many marks.
- |cffff2020Do not let marked players die.|r Each death heals Saurfang.
- Ranged stand spread. Blood Nova hits everyone near the target.
- Tanks must taunt on Rune of Blood, or he heals himself from the tank.
- This is a DPS check. Too many marks will wipe the raid, so do not waste time.
]],

    heroic = [[
- All damage is higher, and marks hurt much more.
- About 10 seconds after Blood Beasts spawn, if any beast is still alive, Saurfang casts {spell:72769}, which makes the surviving beasts far more dangerous. Kill or control all beasts before that.
- Beasts have more health, so more DPS and more slows are needed on them.
- Healing is much tighter. Many raids assign a healer to marked players only.
]],

    alternatives = {
        { title = "Ranged kill beasts at spawn", text = [[
Ranged DPS stand close to where beasts spawn and kill them as they come out, with slows and stuns. Fast, and beasts rarely reach anyone. Needs enough ranged DPS.
]] },
        { title = "Off-tank picks up beasts", text = [[
In raids with few ranged, the off-tank picks up the beasts while the melee and ranged kill them near the tank. Beasts then only hit the tank, which still gives Blood Power, but less than hitting the whole raid.
]] },
    },

    abilities = {
        {
            name = "Mark of the Fallen Champion",
            spellId = 72293,
            danger = "high",
            target = "Random raid member, when Blood Power reaches 100",
            description = [[ A permanent mark. The marked player takes extra Shadow damage every time Saurfang hits anyone. If the player dies, Saurfang heals. ]],
            response = [[ Healers keep marked players topped up. Keep Blood Power low by killing beasts fast. ]],
        },
        {
            name = "Call Blood Beasts",
            spellId = 72173,
            danger = "high",
            target = "Spawns 2 beasts (5 in 25-man)",
            timing = "Every 40 seconds",
            description = [[ Blood Beasts appear and run at players. Every hit they land gives Saurfang Blood Power. ]],
            response = [[ Ranged switch, slow and stun them, kill them with single-target attacks. ]],
        },
        {
            name = "Scent of Blood",
            spellId = 72769,
            danger = "high",
            heroicOnly = true,
            target = "Living Blood Beasts",
            timing = "About 10 seconds after beasts spawn",
            description = [[ If any beast is still alive, it becomes much more dangerous. ]],
            response = [[ Kill or control every beast within about 10 seconds. ]],
        },
        {
            name = "Boiling Blood",
            spellId = 72385,
            danger = "medium",
            target = "Random players",
            timing = "About every 15-20 seconds",
            description = [[ A strong damage over time effect on one or more random players. ]],
            response = [[ Healers focus the targets. Targets can use a defensive cooldown. ]],
        },
        {
            name = "Blood Nova",
            spellId = 72378,
            danger = "medium",
            target = "Random player and everyone near them",
            timing = "About every 20-25 seconds",
            description = [[ A burst of blood damage that splashes on nearby players. ]],
            response = [[ Ranged stay at least 12 yards apart. ]],
        },
        {
            name = "Rune of Blood",
            spellId = 72410,
            danger = "medium",
            target = "Current tank",
            timing = "Every 20 seconds",
            description = [[ Saurfang heals himself and gains power from his hits on the marked tank. ]],
            response = [[ The other tank taunts when it lands. ]],
        },
        {
            name = "Frenzy",
            spellId = 72737,
            danger = "medium",
            target = "Saurfang, below 30% health",
            description = [[ Saurfang attacks faster and hits harder. ]],
            response = [[ Tanks use cooldowns, DPS burn him down. ]],
        },
        {
            name = "Blood Power",
            spellId = 72371,
            danger = "low",
            target = "Saurfang's power bar",
            description = [[ Fills whenever he or his beasts damage players. At 100 he casts a new Mark. ]],
            response = [[ Watch the bar. Kill beasts fast to slow it down. ]],
        },
    },

    chat = {
        summary = {
            "Every hit on us fills his Blood Power. At 100 he marks a player. Marks stack damage on the raid.",
            "Blood Beasts every 40 sec: ranged slow and kill them before they reach anyone.",
            "Ranged and healers spread 12 yards apart for Blood Nova.",
            "Do not let marked players die - he heals when they do. This is a DPS race.",
        },
        tank = {
            "Taunt swap on every Rune of Blood.",
            "Keep him still and facing away from the raid. Cooldowns at 30% Frenzy.",
        },
        healer = {
            "Keep marked players near full health - a dead marked player heals the boss.",
            "Focus Boiling Blood targets. Stay spread 12 yards apart.",
        },
        dps = {
            "Ranged: switch to Blood Beasts at once, slow and stun them, single-target only.",
            "Melee stay on the boss. Save cooldowns for marks and the 30% Frenzy.",
        },
    },
})

------------------------------------------------------------------------
-- Festergut
------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Festergut", {
    summary = "Share Gas Spores to build Inoculated stacks before each Pungent Blight, swap tanks on Gastric Bloat, and spread for Vile Gas.",

    overview = [[
Festergut is the first boss of the Plagueworks wing. It is a single-target fight with a 5 minute enrage, so it is also a DPS check.

The room fills with gas. Every 30-35 seconds Festergut inhales it ({spell:69166}), which makes him hit harder. After the third inhale he releases {spell:69195}, a huge blast that hits the whole raid. Without protection this blast can wipe the raid.

The protection comes from {spell:69279}. Spores are placed on random players. After 12 seconds they explode, damaging everyone nearby and giving them {spell:69291}, which reduces the damage they take from the blight. Players need to stand with spore targets to collect Inoculated stacks.

Raids wipe here when people miss spores and then die to Pungent Blight, when tanks do not swap on {spell:72219}, or when DPS is too low before the enrage.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- Tank Festergut in the middle of the room. Melee stack together behind him.
- Ranged and healers split into fixed groups around the boss (two in 10-man, three in 25-man). Inside each group players keep about 10 yards from each other because of Vile Gas, and close together when spores go out.
- Gas Spore goes on 2 players in 10-man, 3 in 25-man. Each spore player goes to a group that needs stacks.
- Make sure melee and tanks also get spore stacks. The tanks need Inoculated too.
]],

    phases = {
        { title = "Single phase - inhale cycle", text = [[
- Festergut inhales the room's gas three times, about every 33-35 seconds. Each stack of {spell:69166} increases his damage.
- About 33 seconds after the third inhale he casts {spell:69195}: massive raid damage. Then the cycle starts over.
- {spell:69279} goes out about every 40-50 seconds. Spore players and the people they stand with get one stack of Inoculated each time (up to 3 stacks).
- {spell:69240} targets random ranged players and hurts everyone near them. Spread out when no spore is up.
- {spell:72219} stacks on the tank. Tanks swap before it gets too high.
]] },
    },

    tank = [[
- {spell:72219} goes on the current tank roughly every 15 seconds. At 10 stacks it explodes and can kill you and people near you.
- The other tank taunts at about 6-9 stacks. The stacks fade after 100 seconds.
- Make sure you get Inoculated stacks too. A spore player near the melee group gives them to you.
- After each inhale he hits harder. Use defensive cooldowns at 3 stacks of Inhaled Blight and during Pungent Blight.
]],

    healer = [[
- Pungent Blight is the biggest damage spike. Top everyone up before it and use raid cooldowns on it.
- Spore explosions hurt everyone near them. Heal the group afterwards.
- Vile Gas hits ranged players. Keep them topped.
- The tank takes increasing damage after each inhale. The third stack is the hardest.
- Stay with your group when spores go out so you also get Inoculated.
]],

    dps = [[
- Pure single-target fight. All damage on Festergut. The 5 minute enrage is real.
- If you get a Gas Spore, move to the group that has the fewest Inoculated stacks (or to your assigned spot). Do not run off alone.
- If someone near you has a spore, stand with them until it explodes.
- Ranged: spread about 10 yards apart when no spore is out (Vile Gas).
- Melee: stay stacked behind the boss so spores near you hit everyone.
- Use damage cooldowns early; this fight is short.
]],

    warnings = [[
- |cffff2020Collect Inoculated stacks.|r Players with 0 stacks can die to Pungent Blight.
- |cffff2020Tanks: swap before 10 stacks of Gastric Bloat.|r The explosion can kill the tank and people near them.
- Spore players: do not run away from the raid. You are the medicine.
- Ranged: do not stand on top of each other when no spore is up. Vile Gas hurts everyone close.
- Damage matters. The enrage comes at 5 minutes.
]],

    heroic = [[
- Professor Putricide joins from his balcony and throws {spell:72297} at ranged players. It leaves a slime zone that hurts and slows anyone standing in it. Dodge it.
- All damage is much higher, especially Pungent Blight. Inoculated stacks are even more important.
- Tank swaps on Gastric Bloat must be on time - the tank cannot survive mistakes.
- Achievement "Flu Shot Shortage": nobody may get more than 2 Inoculated stacks (normally done on Normal mode).
]],

    alternatives = {
        { title = "Fixed spore spots", text = [[
Ranged and healers stand in two (10-man) or three (25-man) fixed spots around the boss, and melee are one more spot. Each spore player goes to an assigned spot. Easy to call, and stacks spread evenly.
]] },
        { title = "Everyone stacks for spores", text = [[
Every time spores go out, the whole raid stacks behind the boss with the spore players, then ranged spread out again once the spores explode. Simple for new raids, but costs ranged movement and can overlap with Vile Gas.
]] },
    },

    abilities = {
        {
            name = "Pungent Blight",
            spellId = 69195,
            danger = "high",
            target = "Whole raid",
            timing = "About 33 seconds after the 3rd Inhaled Blight",
            description = [[ A huge blast of blight that hits every raid member. ]],
            response = [[ Have Inoculated stacks. Healers use raid cooldowns. ]],
        },
        {
            name = "Gas Spore",
            spellId = 69279,
            danger = "high",
            target = "2 random players (3 in 25-man)",
            timing = "About every 40-50 seconds",
            description = [[ A spore that explodes after 12 seconds, hurting everyone nearby and giving them Inoculated. ]],
            response = [[ Spore players go to their group. Everyone near them stays close until it explodes. ]],
        },
        {
            name = "Gastric Bloat",
            spellId = 72219,
            danger = "high",
            target = "Current tank",
            timing = "About every 13-16 seconds",
            description = [[ A stacking debuff on the tank. At 10 stacks it explodes. ]],
            response = [[ Swap tanks at about 6-9 stacks. ]],
        },
        {
            name = "Malleable Goo",
            spellId = 72297,
            danger = "high",
            heroicOnly = true,
            target = "Location of a random ranged player",
            description = [[ Professor Putricide throws goo that hurts and slows anyone in the impact area. ]],
            response = [[ Watch for the goo and step out of where it lands. ]],
        },
        {
            name = "Inhaled Blight",
            spellId = 69166,
            danger = "medium",
            target = "Festergut",
            timing = "About every 33-35 seconds",
            description = [[ Festergut breathes in the gas. Each stack makes him hit harder. After 3 stacks he casts Pungent Blight. ]],
            response = [[ Tanks use cooldowns at high stacks. Everyone gets ready for Pungent Blight. ]],
        },
        {
            name = "Vile Gas",
            spellId = 69240,
            danger = "medium",
            target = "Random ranged players and those near them",
            timing = "About every 30 seconds",
            description = [[ Poison gas that damages the target and everyone close to them. ]],
            response = [[ Ranged spread about 10 yards apart when spores are not up. ]],
        },
        {
            name = "Inoculated",
            spellId = 69291,
            danger = "low",
            target = "Players hit by a Gas Spore explosion",
            description = [[ A helpful buff that reduces blight damage taken. Stacks up to 3 times. ]],
            response = [[ Collect stacks by standing near spore players. ]],
        },
    },

    chat = {
        summary = {
            "Gas Spore players: go to your group. Everyone stands with a spore to get Inoculated stacks.",
            "Inoculated protects you from Pungent Blight after his 3rd inhale. No stacks means you may die.",
            "Ranged spread 10 yards apart when no spore is up (Vile Gas).",
            "Single-target DPS race with a 5 minute enrage.",
        },
        tank = {
            "Taunt swap at about 6-9 stacks of Gastric Bloat. 10 stacks explodes.",
            "Get Inoculated stacks too. Cooldowns at 3 Inhaled Blight stacks.",
        },
        healer = {
            "Top everyone before Pungent Blight and use raid cooldowns on it.",
            "Heal groups after spore explosions. Stand with spores yourself.",
        },
        dps = {
            "All damage on Festergut. Use cooldowns early.",
            "Got a spore: go to the group with the fewest stacks. Melee stay stacked behind the boss.",
        },
    },
})

------------------------------------------------------------------------
-- Rotface
------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Rotface", {
    summary = "Infected players bring their Little Ooze to the ooze kiter, the kiter keeps the Big Ooze away from the raid, and everyone dodges Slime Spray.",

    overview = [[
Rotface is the second boss of the Plagueworks. The boss itself is simple, but he creates oozes that must be handled by the whole raid.

{spell:69674} goes on a random player. When it ends, a Little Ooze spawns where that player stands and attacks them. Two Little Oozes merge into a Big Ooze. Each extra Little Ooze it eats gives it a stack of {spell:69558}. At 5 stacks it casts {spell:69839} and throws slime around the room.

One tank (the ooze kiter) takes the oozes and walks them around the edge of the room. Kite = walk away while the add follows you. The rest of the raid stays near the boss, dodges {spell:69508} and stays out of slime puddles.

Raids wipe when Little Oozes spawn in the middle of the raid, when the Big Ooze touches the group, or when people stand in Slime Spray.
]],

    preparation = [[
- 10-man: 2 tanks (one on Rotface, one ooze kiter), 2 healers, Rest DPS
- 25-man: 2 tanks, 2 healers, the rest DPS
- The main tank holds Rotface in the middle of the room. Melee behind him.
- Ranged and healers stand loosely around the inner part of the room, between the boss and the outer edge.
- The ooze kiter walks a circle around the outer edge of the room.
- A kiter with good self-healing and speed helps. Some raids use a hunter or frost death knight for the Big Ooze.
]],

    phases = {
        { title = "Single phase - oozes", text = [[
- {spell:69674} lasts 12 seconds. The infected player runs to the ooze kiter before it ends.
- The Little Ooze spawns at the kiter, who picks it up. When two Little Oozes meet they form a Big Ooze.
- The kiter walks the Big Ooze around the edge of the room. New Little Oozes are brought to it to merge.
- The Big Ooze has {spell:69760}: it hurts everyone near it. Keep it away from the raid.
- At 5 stacks of {spell:69558} it casts {spell:69839} for about 4 seconds, then explodes and throws slime around the room. Dodge where it lands.
- Oozes put {spell:69774} puddles under their target. Step out.
- {spell:69508}: Rotface turns to a random player and sprays a green cone. Get out of the cone, ideally behind him.
- Professor Putricide floods parts of the room ({spell:69789}). Move out of the green flooded area.
- Over time Mutated Infection comes faster, and two players can be infected at once.
]] },
    },

    tank = [[
- Main tank: keep Rotface in the middle and facing away from the raid. Slime Spray does not turn toward you, so you are usually safe.
- Ooze kiter: stand on the outer edge. When an infected player reaches you, pick up their Little Ooze as soon as it spawns.
- Walk the Big Ooze slowly around the edge. Stay out of the green Ooze Flood and step out of Sticky Ooze puddles.
- When a new Little Ooze arrives, bring the Big Ooze toward it so they merge.
- When the Big Ooze starts Unstable Ooze Explosion, keep it away from the raid and step out of the landing spots.
]],

    healer = [[
- Infected players take damage over time and receive less healing. Keep them alive while they run to the kiter.
- The ooze kiter takes steady damage from Radiating Ooze and melee. Assign a healer to them.
- Slime Spray can hurt several players who are slow to move.
- Stay out of the flooded parts of the room and away from the Big Ooze.
]],

    dps = [[
- All damage on Rotface. Do not attack the oozes.
- If you are infected, run to the ooze kiter right away. Do not let the Little Ooze spawn in the raid.
- If a Little Ooze attacks you anyway, run to the kiter.
- Dodge Slime Spray: watch which way the boss turns and move behind him.
- Watch the floor for Ooze Flood and Sticky Ooze.
- When the Big Ooze explodes, look for the landing spots and move out of them.
]],

    warnings = [[
- |cffff2020Infected players must run to the ooze kiter.|r A Little Ooze in the raid hurts everyone and makes merging messy.
- |cffff2020Keep the Big Ooze away from the raid.|r Its aura hurts everyone near it.
- Do not stand in Slime Spray. Move behind the boss.
- Do not stand in the green flooded parts of the room.
- Do not DPS the oozes. Only Rotface matters.
- Explosions throw slime around the room. Step away from where it lands.
]],

    heroic = [[
- Professor Putricide casts {spell:72272} on ranged players. It damages them and those near them. Ranged spread about 10 yards apart.
- All ooze damage is much higher. The kiter needs dedicated healing and must not make mistakes.
- Radiating Ooze and the Unstable Ooze Explosion hit very hard. Keep good distance from the Big Ooze.
- Infected players must reach the kiter quickly - mistakes are rarely survivable.
]],

    alternatives = {
        { title = "Infected players go to the kiter (standard)", text = [[
The infected player runs to the ooze kiter before the debuff ends. The Little Ooze spawns next to the kiter and Big Ooze, and merges almost at once. Clean and safe, but needs everyone to react fast.
]] },
        { title = "Kiter picks up Little Oozes in the raid", text = [[
The infected player stays near the raid edge. When the Little Ooze spawns, the kiter taunts it and drags it to the Big Ooze. Easier for slow players, but Little Oozes may hit people before being picked up.
]] },
        { title = "Let the Big Ooze explode early", text = [[
Some raids feed the Big Ooze quickly and let it explode at a planned spot on the edge of the room, far from the raid. Others keep it at fewer stacks and only kite it. Explosions on a far edge are safer than in the middle.
]] },
    },

    abilities = {
        {
            name = "Mutated Infection",
            spellId = 69674,
            danger = "high",
            target = "Random player (two at once later in the fight)",
            timing = "Faster as the fight goes on",
            description = [[ A 12 second debuff that hurts the target. When it ends, a Little Ooze spawns under the player and attacks them. ]],
            response = [[ Run to the ooze kiter before it ends. ]],
        },
        {
            name = "Unstable Ooze Explosion",
            spellId = 69839,
            danger = "high",
            target = "Spots around the room",
            description = [[ A Big Ooze at 5 stacks casts this for about 4 seconds, then throws exploding slime around the room. ]],
            response = [[ Keep it far from the raid. Step out of the landing spots. ]],
        },
        {
            name = "Slime Spray",
            spellId = 69508,
            danger = "medium",
            target = "Cone toward a random player",
            timing = "About every 20 seconds",
            description = [[ Rotface turns to a random player and sprays a green cone in that direction. ]],
            response = [[ Move out of the cone, ideally behind the boss. ]],
        },
        {
            name = "Radiating Ooze",
            spellId = 69760,
            danger = "medium",
            target = "Everyone near the Big Ooze",
            description = [[ A damaging aura around the Big Ooze. ]],
            response = [[ Keep the Big Ooze away from the raid. Only the kiter is near it. ]],
        },
        {
            name = "Ooze Flood",
            spellId = 69789,
            danger = "medium",
            target = "Parts of the room under the pipes",
            timing = "About every 20-25 seconds",
            description = [[ Professor Putricide pours slime into a part of the room. It hurts and slows anyone standing in it. ]],
            response = [[ Move out of the green flooded area. ]],
        },
        {
            name = "Sticky Ooze",
            spellId = 69774,
            danger = "medium",
            target = "Under the ooze's target",
            description = [[ A slime puddle that slows and damages anyone in it. ]],
            response = [[ Step out of it right away. The kiter keeps moving. ]],
        },
        {
            name = "Vile Gas",
            spellId = 72272,
            danger = "medium",
            heroicOnly = true,
            target = "Random ranged players and those near them",
            timing = "About every 30 seconds",
            description = [[ Professor Putricide throws poison gas at ranged players. ]],
            response = [[ Ranged spread about 10 yards apart. ]],
        },
        {
            name = "Unstable Ooze",
            spellId = 69558,
            danger = "low",
            target = "Big Ooze",
            description = [[ A stack the Big Ooze gains each time it eats a Little Ooze. At 5 stacks it explodes. ]],
            response = [[ The kiter watches the stacks and moves the ooze to a safe edge before 5. ]],
        },
    },

    chat = {
        summary = {
            "Infected: run to the ooze kiter before your debuff ends. Little Ooze spawns where you stand.",
            "Ooze kiter keeps the Big Ooze on the outer edge. Everyone else stays away from it.",
            "Slime Spray: green cone toward a random player - move behind the boss.",
            "Stay out of green Ooze Flood and Sticky Ooze puddles. Do not attack the oozes.",
            "Big Ooze explosion: look for the slime landing spots and move away.",
        },
        tank = {
            "Main tank: Rotface in the middle, facing away from the raid.",
            "Kiter: pick up Little Oozes, merge them with the Big Ooze, walk the outer edge.",
        },
        healer = {
            "Infected players get less healing - keep them alive until they reach the kiter.",
            "Assign a healer to the ooze kiter. Stay out of floods and away from the Big Ooze.",
        },
        dps = {
            "All damage on Rotface. Never attack the oozes.",
            "Infected: run to the kiter. Dodge Slime Spray by moving behind the boss.",
        },
    },
})
