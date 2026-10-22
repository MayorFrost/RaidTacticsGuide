-- Raid Tactics Guide - Naxxramas (level 80), part 1
-- Arachnid Quarter, Plague Quarter, Military Quarter (first two bosses)

local RTG = RaidTacticsGuide

------------------------------------------------------------------------------
-- Anub'Rekhan
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_AnubRekhan", {
    summary = "A slow-moving spider lord: dodge Impale lines and kite him around the room during Locust Swarm.",

    overview = [[
Anub'Rekhan is the first boss of the Arachnid Quarter and often the first boss a new raid kills in Naxxramas. He hits the tank hard, throws an Impale at random players and, every 80-90 seconds or so, covers himself in a Locust Swarm.

The whole fight is about Locust Swarm. While the swarm is up, everyone near him takes heavy damage and is silenced (cannot cast spells). The tank must walk him around the edge of the room ("kiting" = walking away while the boss follows you) and everyone else stays far away from him.

Crypt Guards (big beetle adds) also join the fight and must be tanked and killed. When things die, Corpse Scarabs can crawl out of the bodies. A normal kill takes about 3-4 minutes.
]],

    preparation = [[
- 2 tanks, 2-3 healers (10-man) or 2 tanks, 5-6 healers (25-man)
- Agree on a kite path before the pull: usually a big circle along the outer edge of the round room
- Ranged DPS and healers spread out loosely so one Impale line only hits one person
- The off-tank is ready to pick up Crypt Guards
- Turn on the DBM Locust Swarm timer so you know when to start moving
]],

    phases = {
        { title = "Normal phase (tank and spank)", text = [[
- The main tank holds Anub'Rekhan near the edge of the room, facing away from the raid.
- Everyone attacks the boss. Ranged stand spread out at range.
- {spell:28783} is cast on a random player about every 13-20 seconds. Spikes burst out of the ground in a line from the boss to that player and throw everyone in the line into the air.
- The off-tank tanks Crypt Guards away from the raid and the DPS kill them.
]] },
        { title = "Locust Swarm (about every 80-90 seconds, lasts about 20 seconds)", text = [[
- When DBM warns "Locust Swarm", the boss starts a short cast and then gets the swarm.
- Everyone except the tank moves far away from him right away.
- The tank walks along the kite path. The boss is slowed while the swarm is up, so he cannot catch a tank who keeps walking.
- A new Crypt Guard spawns during the swarm. The off-tank grabs it.
- When the swarm fades, the tank stops, the raid comes back into position and normal damage resumes.
]] },
    },

    tank = [[
# Main tank
- Tank the boss at the edge of the room with his back to the raid.
- At the Locust Swarm warning, start walking along the agreed path. Keep moving until the swarm fades. Do not walk into the raid.
- You will be silenced if he catches you, so use defensive cooldowns early if you get hit.

# Off-tank
- Pick up every Crypt Guard (including the one that spawns during Locust Swarm) and tank it away from the raid and away from the kite path.
- Face Crypt Guards away from others; they cleave.
]],

    healer = [[
- The main tank takes steady heavy melee damage. Keep him topped up.
- Impale victims take a big hit plus fall damage. Heal them quickly.
- During Locust Swarm you will be silenced if you are close to the boss. Stay far away, but stay in range of the kiting tank. Pre-place heal-over-time spells before the swarm starts.
- Watch the off-tank when a Crypt Guard is up.
]],

    dps = [[
- Target priority: Crypt Guards when they are up, then the boss. AoE (area damage) the Corpse Scarabs that crawl out of bodies.
- Spread out so that one Impale line does not hit several of you.
- When Locust Swarm starts, stop attacking and run far away from the boss. Melee too. You can attack again when the swarm fades.
- Ranged can keep attacking from max range during the swarm if the kite path keeps them out of it.
]],

    warnings = [[
- |cffff2020Never stand near the boss during Locust Swarm.|r It silences and deals heavy damage to everyone close.
- Do not stand on the kite path. The tank brings the swarm with him.
- Spread out to keep Impale from hitting many players at once.
- Do not forget the Crypt Guards. An untanked guard will kill healers.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- The mechanics are the same in both sizes. In 25-man the boss and adds hit harder and have more health.
- In 25-man there are already Crypt Guards at the start of the fight, so the off-tank has work right away. More players means more Corpse Scarabs when things die.
- DBM shows a slightly longer first swarm timer and a longer swarm (about 23 seconds instead of about 19) in 25-man.
- Achievement "Arachnophobia": kill Maexxna within 20 minutes of killing Anub'Rekhan. DBM shows a 20 minute timer after the kill.
]],

    abilities = {
        {
            name = "Locust Swarm",
            spellId = 28785,
            danger = "high",
            target = "Everyone near the boss",
            timing = "About every 80-90 seconds, lasts about 20 seconds",
            description = [[ A swarm of insects surrounds Anub'Rekhan. Everyone near him takes heavy damage over time and is silenced. He moves slower while the swarm is up. ]],
            response = [[ Tank kites him along the edge of the room. Everyone else runs far away and stays away until it fades. ]],
        },
        {
            name = "Impale",
            spellId = 28783,
            danger = "medium",
            target = "Random player (and anyone in the line)",
            timing = "About every 13-20 seconds",
            description = [[ Spikes erupt in a line from the boss to a random player, damaging and launching everyone in that line into the air. ]],
            response = [[ Spread out so lines only hit one person. Healers top up impaled players. ]],
        },
        {
            name = "Crypt Guard",
            icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",
            danger = "medium",
            target = "Off-tank",
            timing = "One spawns during each Locust Swarm (more at pull in 25-man)",
            description = [[ A large beetle add that cleaves and spits acid. It can frenzy at low health. ]],
            response = [[ Off-tank picks it up away from the raid. DPS kill it before the boss. ]],
        },
        {
            name = "Corpse Scarabs",
            icon = "Interface\\Icons\\Spell_Shadow_CorpseExplode",
            danger = "low",
            target = "Nearby players",
            description = [[ Small beetles that crawl out of dead Crypt Guards and dead players. ]],
            response = [[ AoE them down quickly. Off-tank or any tank can gather them. ]],
        },
    },

    chat = {
        summary = {
            "Spread out loosely so Impale lines only hit one person.",
            "Locust Swarm about every 90 sec: everyone except the main tank runs far away from the boss. It silences and hurts.",
            "Main tank kites the boss around the room edge during the swarm. Do not stand on the kite path.",
            "Crypt Guards spawn: off-tank picks them up, DPS kill them first. AoE the small scarabs.",
        },
        tank = {
            "MT: at the swarm warning walk the boss along the room edge until it fades, never through the raid.",
            "OT: pick up every Crypt Guard, face it away from the raid and away from the kite path.",
        },
        healer = {
            "Stay far from the boss during Locust Swarm or you get silenced. Put HoTs on the MT before the swarm.",
            "Impale victims take a big hit plus fall damage, heal them fast.",
        },
        dps = {
            "Kill Crypt Guards before the boss, AoE the scarabs.",
            "Swarm warning: stop attacking and run away from the boss, melee too. Come back when it fades.",
        },
    },
})

------------------------------------------------------------------------------
-- Grand Widow Faerlina
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Faerlina", {
    summary = "Kill a Worshipper next to her each time she Frenzies; their death removes Frenzy with Widow's Embrace.",

    overview = [[
Grand Widow Faerlina is the second boss of the Arachnid Quarter. She is guarded by Naxxramas Worshippers, and in 25-man also by Naxxramas Followers.

About once a minute she goes into Frenzy: she attacks much faster and harder and can kill the tank in seconds. The answer is the Worshippers. When a Worshipper dies close to Faerlina, she gets {spell:28732}. Widow's Embrace removes her Frenzy and, for about 30 seconds, stops her from casting her nature spells such as Poison Bolt Volley.

So the fight is: tank her, hold the Worshippers alive, and kill one Worshipper next to her each time she Frenzies. The rest is poison dispelling and moving out of Rain of Fire. A normal kill takes about 3-4 minutes.
]],

    preparation = [[
- 2 tanks (3 is comfortable in 25-man), 2-3 healers (10-man) or 5-6 healers (25-man)
- Healers and classes that can remove poison (druids, shamans, paladins) are ready to dispel
- Mark the Worshippers with raid icons so DPS kill the right one at the right time
- Decide who calls "kill the Worshipper" when Frenzy happens (usually the raid leader)
]],

    phases = {
        { title = "Pull and add control", text = [[
- The main tank picks up Faerlina. The off-tank picks up the Worshippers and holds them close to her but out of cleave range of the raid.
- 25-man: the Followers charge players and silence nearby casters. Kill them first.
- Do NOT kill the Worshippers yet (unless your raid kills one at once on purpose). You need them for the Frenzies.
]] },
        { title = "Main phase - Frenzy and Widow's Embrace", text = [[
- Everyone damages Faerlina. Dispel {spell:28796} poison and move out of {spell:28794}.
- About every 60 seconds she gains {spell:28798}. DBM gives a warning a few seconds before.
- When she Frenzies, DPS kill ONE marked Worshipper right next to her. Its death gives her Widow's Embrace, which removes the Frenzy.
- Repeat for each Frenzy. If you run out of Worshippers, the tank must use big cooldowns and the DPS must finish her fast.
]] },
    },

    tank = [[
# Main tank
- Tank Faerlina in a spot where the Worshippers can be brought close to her.
- Use a defensive cooldown if a Frenzy is not removed quickly.

# Off-tank
- Hold all Worshippers next to the boss (within a few yards), so whichever one is killed is in range to give her Widow's Embrace.
- 25-man: pick up the Followers if they are not killed right away.
]],

    healer = [[
- Poison Bolt Volley hits several players and leaves a poison. Dispel poison and heal the raid.
- When she Frenzies the main tank takes huge damage. Focus him until a Worshipper dies.
- Move out of Rain of Fire immediately.
- 25-man: Followers can silence you. Stay spread from each other.
]],

    dps = [[
- Main target is Faerlina. Do not AoE: area damage will kill Worshippers at the wrong time.
- When the raid leader calls it (right after Frenzy), kill the marked Worshipper standing next to her. Then go straight back to the boss.
- 25-man: kill the Followers first at the start.
- Move out of Rain of Fire right away.
]],

    warnings = [[
- |cffff2020Do not AoE or kill Worshippers early.|r Each one is a tool to remove one Frenzy.
- A Worshipper must die close to Faerlina, or she does not get Widow's Embrace.
- An unremoved Frenzy will kill the tank.
- Move out of Rain of Fire. It ticks hard.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- 25-man adds Naxxramas Followers. They charge random players and silence. Kill them first.
- Everything has more health and hits harder; Poison Bolt Volley hits more players, so poison dispels matter more.
- Achievement "Momma Said Knock You Out": kill Faerlina without killing any Worshippers. You must burn her quickly and tank her through Frenzy with cooldowns. Only try this when your raid is well geared.
]],

    alternatives = {
        { title = "Kill all adds first (geared groups)", text = [[
Some well-geared groups kill all Worshippers at the start next to the boss and then burn her down, using tank cooldowns and Heroism/Bloodlust for later Frenzies. This is faster but needs strong DPS. New raids should use the "one Worshipper per Frenzy" method.
]] },
    },

    abilities = {
        {
            name = "Frenzy",
            spellId = 28798,
            danger = "high",
            target = "Faerlina (tank damage)",
            timing = "About every 60 seconds",
            description = [[ Faerlina attacks much faster and harder. The tank can die in a few seconds. ]],
            response = [[ Kill one Worshipper right next to her to remove it. Tank uses a cooldown if needed. ]],
        },
        {
            name = "Widow's Embrace",
            spellId = 28732,
            danger = "low",
            target = "Faerlina",
            timing = "When a Worshipper dies near her, lasts 30 seconds",
            description = [[ Good for you: removes Frenzy and stops her nature spells for about 30 seconds. ]],
            response = [[ Kill Worshippers next to her only when she Frenzies. ]],
        },
        {
            name = "Poison Bolt Volley",
            spellId = 28796,
            danger = "medium",
            target = "Several random players",
            timing = "About every 8-10 seconds",
            description = [[ Hits several players with nature damage and a poison that keeps ticking. ]],
            response = [[ Dispel the poison and heal through it. ]],
        },
        {
            name = "Rain of Fire",
            spellId = 28794,
            danger = "medium",
            target = "Area at a random player",
            description = [[ Fire rains down on an area and burns everyone in it. ]],
            response = [[ Move out of the fire right away. ]],
        },
        {
            name = "Naxxramas Follower (25-man)",
            icon = "Interface\\Icons\\Ability_Warrior_Charge",
            danger = "medium",
            target = "Random players",
            description = [[ An add that charges players and silences everyone near. Only in 25-man. ]],
            response = [[ Kill Followers first. Casters stay spread. ]],
        },
    },

    chat = {
        summary = {
            "Do not AoE. The Worshippers must stay alive until we need them.",
            "About every 60 sec she Frenzies: kill ONE marked Worshipper right next to her to remove it.",
            "Dispel the Poison Bolt Volley poison. Move out of Rain of Fire.",
            "25-man: kill the Followers first, they charge and silence.",
        },
        tank = {
            "MT: tank her where the Worshippers can stand close to her. Use a cooldown if Frenzy is not removed fast.",
            "OT: hold every Worshipper right next to the boss so the one we kill gives her Widow's Embrace.",
        },
        healer = {
            "Dispel poison after each Poison Bolt Volley.",
            "During Frenzy, focus the main tank until a Worshipper dies.",
        },
        dps = {
            "No AoE. Boss is the main target.",
            "On Frenzy kill the marked Worshipper next to her, then go back to the boss.",
        },
    },
})

------------------------------------------------------------------------------
-- Maexxna
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Maexxna", {
    summary = "A giant spider: free Web Wrapped players, AoE the spiderlings and keep the tank alive through Web Spray.",

    overview = [[
Maexxna is the last boss of the Arachnid Quarter. She is a big spider in a web-covered room. The fight has one phase, but several things happen on timers.

Every 40 seconds she casts {spell:29484}: the whole raid is wrapped in webs and stunned for several seconds. Nobody can act, not even healers, so the tank must be at full health before it. She also wraps random players in cocoons on the wall ({spell:28622}), summons little spiderlings, and puts a poison on the tank that cuts healing.

At 30% health she Frenzies and hits much harder. A normal kill takes about 3-4 minutes.
]],

    preparation = [[
- 1 tank (2 in 25-man for safety), 2-3 healers (10-man) or 5-6 healers (25-man)
- Poison removers (druids, shamans, paladins) are assigned to the tank for Necrotic Poison
- Ranged DPS are assigned to shoot down Web Wrap cocoons on the walls
- Someone with AoE (area damage) is ready for spiderlings
- Save Heroism/Bloodlust for the 30% Frenzy
]],

    phases = {
        { title = "Main phase (100% - 30%)", text = [[
- Tank Maexxna in the middle of the room, facing away from the raid (she has a frontal poison attack).
- About every 40 seconds: {spell:29484}. Everyone is stunned. Healers top the tank BEFORE it lands.
- Starting about 20 seconds in and then every 40 seconds: {spell:28622}. Players are wrapped on the walls. Ranged kill the cocoons to free them.
- About every 40 seconds (first at 30 seconds): spiderlings spawn. Kill them with AoE.
- Dispel Necrotic Poison from the tank quickly.
]] },
        { title = "Frenzy (30% and below)", text = [[
- At 30% she Frenzies: faster and harder attacks on the tank.
- Use Heroism/Bloodlust and burn her down. Tank uses cooldowns, especially just before Web Spray.
]] },
    },

    tank = [[
- Face her away from the raid; Poison Shock is a frontal cone.
- Use a defensive cooldown right before each Web Spray (DBM shows the timer) because healers will be stunned.
- At 30% use your big cooldowns. If two tanks are used, the second tank is ready to taunt if the first dies.
- Pick up spiderlings if they run at healers.
]],

    healer = [[
- Keep the tank at full health at all times, but especially 3-5 seconds before every Web Spray.
- Dispel Necrotic Poison from the tank immediately; it reduces healing taken by a lot.
- Heal Web Wrapped players; they take damage while in the cocoon.
- Put heal-over-time spells on the tank before Web Spray so healing continues while you are stunned.
]],

    dps = [[
- Ranged: when someone is Web Wrapped, switch and kill the cocoon on the wall to free them.
- Everyone: AoE the spiderlings as soon as they spawn, then back to the boss.
- Melee: stand behind her, never in front.
- At 30% use all cooldowns. The faster she dies, the fewer Web Sprays the tank has to survive.
]],

    warnings = [[
- |cffff2020Tank must be at full health before Web Spray.|r Nobody can heal during it.
- Do not stand in front of her (Poison Shock).
- Free Web Wrapped players quickly; they cannot do anything until the cocoon dies.
- Spiderlings left alive will swarm the healers.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- Mechanics are the same. In 25-man she has much more health and hits harder, so tank cooldowns and Necrotic Poison dispels are even more important.
- More spiderlings spawn in 25-man, and Web Wrap takes more players, so more ranged DPS must be assigned to the cocoons.
- Achievement "Arachnophobia": kill Maexxna within 20 minutes of killing Anub'Rekhan.
]],

    abilities = {
        {
            name = "Web Spray",
            spellId = 29484,
            danger = "high",
            target = "Whole raid",
            timing = "Every 40 seconds",
            description = [[ Everyone is webbed and stunned for several seconds and takes damage. Maexxna keeps hitting the tank. ]],
            response = [[ Top up the tank before it, tank uses a cooldown, HoTs on the tank. ]],
        },
        {
            name = "Web Wrap",
            spellId = 28622,
            danger = "medium",
            target = "Random players",
            timing = "About every 40 seconds (first at about 20 seconds)",
            description = [[ Players are thrown to the wall and wrapped in a cocoon. They are helpless and take damage. ]],
            response = [[ Ranged DPS kill the cocoon to free the player. ]],
        },
        {
            name = "Necrotic Poison",
            icon = "Interface\\Icons\\Spell_Nature_NullifyPoison",
            danger = "high",
            target = "Tank",
            description = [[ A poison on the tank that greatly reduces healing received. ]],
            response = [[ Dispel poison from the tank immediately. ]],
        },
        {
            name = "Maexxna Spiderlings",
            spellId = 17332,
            danger = "medium",
            target = "Random players",
            timing = "About every 40 seconds (first at 30 seconds)",
            description = [[ A group of small spiders spawns and attacks the raid. ]],
            response = [[ AoE them down right away. ]],
        },
        {
            name = "Frenzy",
            icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
            danger = "high",
            target = "Tank",
            timing = "At 30% health",
            description = [[ Maexxna attacks faster and harder until she dies. ]],
            response = [[ Heroism/Bloodlust, tank cooldowns, burn her down. ]],
        },
        {
            name = "Poison Shock",
            icon = "Interface\\Icons\\Spell_Nature_CorrosiveBreath",
            danger = "low",
            target = "Frontal cone",
            description = [[ A cone of poison in front of her. ]],
            response = [[ Only the tank stands in front. ]],
        },
    },

    chat = {
        summary = {
            "Web Spray every 40 sec stuns everyone: tank must be at full health before it lands.",
            "Web Wrap: ranged kill the cocoon on the wall to free the player.",
            "Spiderlings spawn: AoE them right away.",
            "At 30% she Frenzies: Heroism and burn. Nobody stands in front of her.",
        },
        tank = {
            "Face her away from the raid. Use a cooldown just before each Web Spray.",
            "Save big cooldowns for the 30% Frenzy.",
        },
        healer = {
            "Tank to full before every Web Spray, put HoTs on him first.",
            "Dispel Necrotic Poison from the tank at once, it cuts healing.",
        },
        dps = {
            "Ranged: kill Web Wrap cocoons on the walls immediately.",
            "AoE the spiderlings, then back to the boss. Melee stand behind her.",
        },
    },
})

------------------------------------------------------------------------------
-- Noth the Plaguebringer
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Noth", {
    summary = "Remove his curses fast, and kill the waves of undead adds when he teleports to the balcony.",

    overview = [[
Noth the Plaguebringer is the first boss of the Plague Quarter. The fight switches between two phases: a ground phase where you fight Noth while small adds spawn, and a balcony phase where Noth teleports away and stronger adds attack the raid.

The most important thing on the ground is {spell:29213}. If a cursed player is not decursed in time, the curse turns into Wrath of the Plaguebringer and hurts everyone nearby. Classes that can remove curses (mages and druids) must be fast.

The balcony phases are add fights. Tanks gather the adds and everyone uses AoE (area damage). A normal kill takes about 5-6 minutes.
]],

    preparation = [[
- 2 tanks (3 in 25-man is comfortable), 2-3 healers (10-man) or 5-6 healers (25-man)
- Assign decursers (mages, druids). Everyone with decurse should use it
- Pick a tank spot. Many raids tank Noth in the middle and the ranged stand together so adds come to one place
- AoE classes ready for the add waves
]],

    phases = {
        { title = "Ground phase (first one is 90 seconds)", text = [[
- Main tank holds Noth. Everyone damages him.
- {spell:29213} goes on several players. Remove it immediately.
- Waves of Plagued Warriors spawn from the corners about every 30 seconds. The off-tank grabs them and DPS kill them (AoE works well).
- Mainly in 25-man: Noth uses {spell:29208}. He jumps to a new spot and loses all threat. The tank must taunt him back right away.
]] },
        { title = "Balcony phase (first one is 70 seconds)", text = [[
- Noth teleports to the balcony and cannot be attacked. Players near him can be crippled (slowed) as he leaves.
- Stronger adds spawn: Plagued Champions and Plagued Guardians, in waves.
- Tanks gather the adds and everyone kills them, AoE where possible. Healers watch the tanks.
- When the timer ends, Noth teleports back. The main tank picks him up again.
]] },
        { title = "Later cycles", text = [[
- The phases repeat. Each ground and balcony phase is a bit different in length, and the add waves get bigger as the fight goes on.
- Follow the DBM teleport timer. Keep up the decursing on every ground phase.
]] },
    },

    tank = [[
# Main tank
- Tank Noth where you can see the add spawns.
- If he Blinks (mostly 25-man), taunt him immediately. He resets his threat.
- When he comes back from the balcony, pick him up right away.

# Off-tank(s)
- Pick up the Plagued Warriors on the ground and all Champions and Guardians on the balcony phase. Gather them in one place for AoE.
]],

    healer = [[
- If you can remove curses (resto druid), help decurse.
- Ground phase: tank damage plus damage from curses that were not removed.
- Balcony phase: adds attack the tanks and sometimes players. Keep the off-tanks up, raid damage can spike when many adds are up.
- Stay near the group so adds run into the tanks, not into you.
]],

    dps = [[
- Mages and druids: decurse {spell:29213} as soon as you see it. This is your top job.
- Ground: kill Plagued Warriors, then go back to Noth.
- Balcony: all DPS on the adds. AoE when they are grouped. Kill what is attacking healers first.
- Do not pull threat on adds before the tanks have them.
]],

    warnings = [[
- |cffff2020Remove Curse of the Plaguebringer fast.|r Missed curses deal heavy damage to nearby players.
- After a Blink the boss has no threat target. DPS hold back for a second so the tank can taunt.
- Do not ignore the balcony adds. If they reach the healers the raid falls apart.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- 25-man: more adds per wave, more players get cursed, and Noth uses Blink, which drops his threat. Taunts must be ready.
- In 10-man the fight is mostly about decursing and AoE. Blink is mostly a 25-man problem.
- Everything has more health and hits harder in 25-man.
]],

    abilities = {
        {
            name = "Curse of the Plaguebringer",
            spellId = 29213,
            danger = "high",
            target = "Several random players",
            timing = "About every 55 seconds on ground phases",
            description = [[ A curse that turns into Wrath of the Plaguebringer if not removed, hitting nearby players with heavy damage. ]],
            response = [[ Mages and druids remove it immediately. ]],
        },
        {
            name = "Blink",
            spellId = 29208,
            danger = "medium",
            target = "Noth (threat reset)",
            timing = "About every 30 seconds on ground phases (mainly 25-man)",
            description = [[ Noth teleports a short distance and loses his threat list. ]],
            response = [[ Tank taunts him back right away. DPS pause briefly. ]],
        },
        {
            name = "Teleport (balcony phase)",
            spellId = 29216,
            danger = "medium",
            target = "Raid",
            timing = "First after 90 seconds",
            description = [[ Noth goes to the balcony and add waves attack the raid. ]],
            response = [[ Tanks gather the adds, everyone AoEs them. ]],
        },
        {
            name = "Summon Plagued adds",
            spellId = 29247,
            danger = "medium",
            target = "Raid",
            timing = "Waves during both phases",
            description = [[ Plagued Warriors on the ground; Plagued Champions and Guardians on the balcony phase. ]],
            response = [[ Tanks pick them up, DPS kill them. ]],
        },
        {
            name = "Cripple",
            spellId = 29212,
            danger = "low",
            target = "Players near Noth",
            timing = "When he teleports away",
            description = [[ Slows players near him. ]],
            response = [[ Nothing to do, it fades. Just get to the adds. ]],
        },
    },

    chat = {
        summary = {
            "Mages and druids: remove Curse of the Plaguebringer immediately, missed curses hurt everyone near.",
            "Ground phase: kill the Plagued Warriors from the corners, then back to the boss.",
            "Balcony phase: Noth leaves, tanks gather the adds, everyone AoE.",
            "If he Blinks he loses threat: tank taunts, DPS wait a second.",
        },
        tank = {
            "MT: taunt him right away after a Blink and when he comes back from the balcony.",
            "OT: pick up every add wave and gather them in one spot for AoE.",
        },
        healer = {
            "Decurse if you can. Watch off-tanks on balcony phases.",
            "Stay near the group so adds run into the tanks, not you.",
        },
        dps = {
            "Decurse first, then damage. Kill adds before the boss.",
            "Balcony phase: AoE the adds once tanks have them.",
        },
    },
})

------------------------------------------------------------------------------
-- Heigan the Unclean
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Heigan", {
    summary = "The dance: the floor erupts zone by zone. Keep moving into the zone that just erupted.",

    overview = [[
Heigan the Unclean is the second boss of the Plague Quarter, and the famous "dance" fight. The boss himself is not hard. The room floor is the danger.

The floor is split into 4 zones in strips across the room. The zones erupt one after another in a wave (1, 2, 3, 4, 3, 2, 1 ...). Anyone standing in an erupting zone takes heavy damage. The simple rule: always step into the zone that just erupted, because the next eruption is always in a different zone.

The fight switches between two phases. For 90 seconds Heigan fights on the floor and the eruptions are slow. Then he teleports to his platform for 45 seconds, fills it with {spell:30122}, and the eruptions become very fast. Everybody must dance. A normal kill takes about 4-6 minutes.
]],

    preparation = [[
- 1 tank, 2-3 healers (10-man) or 1-2 tanks, 5-6 healers (25-man)
- Healers who can remove disease (priests, paladins, shamans) are ready for Decrepit Fever
- Look at the floor before the pull. Learn where the zone borders are (DBM and many raid leaders explain it on the pull)
- Ranged DPS and healers stand on the platform at the back for the first phase
]],

    phases = {
        { title = "Phase 1 - Slow dance (90 seconds)", text = [[
- The tank holds Heigan in the zone area near the platform. Melee fight with him and move with the slow eruptions (about every 10 seconds).
- Ranged and healers stand on the platform. It is safe from eruptions in this phase.
- Heigan has Spell Disruption, an aura that slows spell casting for players close to him. Casters should not stand near him.
- Decrepit Fever (a disease) lowers maximum health. Remove it quickly.
]] },
        { title = "Phase 2 - Fast dance (45 seconds)", text = [[
- Heigan teleports onto the platform and channels {spell:30122}. Everyone must leave the platform right away.
- Everyone goes to the first zone near the platform and dances: the eruptions are now very fast (about every 3 seconds).
- Keep stepping into the zone that just erupted. Stay together as a group so healers can reach everyone.
- After 45 seconds he comes back to the floor and phase 1 starts again. Ranged and healers go back to the platform.
]] },
    },

    tank = [[
- Pick Heigan up and tank him near the first zones, close to the platform, so the ranged can reach.
- You must dance in phase 1 too. Move with the eruption wave; Heigan will follow you.
- In phase 2 there is nothing to tank. Dance with the raid, then pick him up again when he comes back.
]],

    healer = [[
- Phase 1: stand on the platform, heal the tank and melee. Remove Decrepit Fever (disease).
- Do not stand next to Heigan; Spell Disruption slows your casts.
- Phase 2: dance with the raid. Use instant heals and heal-over-time spells while you move. Movement comes first - a healer standing in an eruption dies.
]],

    dps = [[
- Melee: dance with the tank in phase 1. Attack only when you are in a safe zone.
- Ranged: stand on the platform in phase 1 and attack from there.
- Phase 2: everyone leaves the platform and dances. Do not attack if it makes you miss a move. Staying alive is your DPS.
- Use instant spells while dancing.
]],

    warnings = [[
- |cffff2020Eruptions kill.|r Never stand in a zone that is about to erupt. Step into the zone that just erupted.
- Leave the platform as soon as Heigan teleports onto it; Plague Cloud fills it.
- Do not lag behind the group in phase 2. Watch your feet, not your action bars.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- The dance and timers are the same in 10 and 25 player. In 25-man there are more people to keep alive, so raid healing in phase 2 is harder and Decrepit Fever hits more players.
- Achievement "The Safety Dance": defeat Heigan without anyone in the raid dying. This is the true test of the dance.
]],

    alternatives = {
        { title = "Whole raid dances (no platform)", text = [[
Some raids keep everyone dancing on the floor with the tank in phase 1 so the movement is the same in both phases. It is easier to learn the rhythm this way, but healers and ranged lose some throughput.
]] },
    },

    abilities = {
        {
            name = "Eruption",
            icon = "Interface\\Icons\\Spell_Nature_Earthquake",
            danger = "high",
            target = "Everyone standing in the erupting zone",
            timing = "About every 10 seconds (phase 1), about every 3 seconds (phase 2)",
            description = [[ One of the 4 floor zones erupts and deals very heavy damage to everyone standing in it. The zones erupt in a wave. ]],
            response = [[ Step into the zone that just erupted. Keep moving with the wave. ]],
        },
        {
            name = "Plague Cloud",
            spellId = 30122,
            danger = "high",
            target = "The platform",
            timing = "Phase 2, 45 seconds every 90 seconds",
            description = [[ Heigan teleports to the platform and fills it with a poison cloud. ]],
            response = [[ Leave the platform immediately and dance with the group. ]],
        },
        {
            name = "Decrepit Fever",
            icon = "Interface\\Icons\\Spell_Nature_NullifyDisease",
            danger = "medium",
            target = "Players near Heigan",
            description = [[ A disease that lowers maximum health and deals damage over time. ]],
            response = [[ Remove the disease quickly. ]],
        },
        {
            name = "Spell Disruption",
            icon = "Interface\\Icons\\Spell_Nature_Slow",
            danger = "low",
            target = "Players close to Heigan",
            description = [[ An aura that slows the casting speed of players near the boss. ]],
            response = [[ Casters stay at range, on the platform in phase 1. ]],
        },
    },

    chat = {
        summary = {
            "The floor erupts zone by zone. Always step into the zone that just erupted.",
            "Phase 1 (90 sec): ranged and healers stand on the platform, melee dance with the tank.",
            "Phase 2 (45 sec): Heigan goes to the platform, everyone leaves it and dances fast together.",
            "Remove Decrepit Fever (disease). Casters stay away from the boss.",
        },
        tank = {
            "Tank him near the first zones close to the platform and dance with the slow eruptions.",
            "Phase 2: dance with the raid, pick him up again when he comes back.",
        },
        healer = {
            "Phase 1 on the platform, remove the disease. Phase 2 dance and use instant heals.",
            "Moving comes first. A dead healer heals nobody.",
        },
        dps = {
            "Ranged on the platform in phase 1, melee dance with the tank.",
            "Phase 2: leave the platform and dance. Only attack when you are safe.",
        },
    },
})

------------------------------------------------------------------------------
-- Loatheb
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Loatheb", {
    summary = "Healing only works in short windows. Kill spores for crit, heal in the 3-second gaps and survive Inevitable Doom.",

    overview = [[
Loatheb is the last boss of the Plague Quarter. He is a giant fungus that does not move. The fight is a DPS race with a twist for healers.

Loatheb has {spell:55593}. While it is up, all healing does nothing. It lasts about 17 seconds, then drops for about 3 seconds before it comes back. Those 3 seconds are the only time healing works, so healers must save their big heals for those windows.

Spores spawn regularly. When a spore is killed, the players standing near it get a big critical strike bonus (Fungal Creep). Using spores well is how you kill him fast. From 2 minutes in (90 seconds in 25-man) he casts {spell:29204} on the whole raid, which gets more frequent over time. So the longer the fight lasts, the more likely you wipe.
]],

    preparation = [[
- 1 tank, 2-3 healers (10-man) or 2 tanks, 5-6 healers (25-man)
- Shadow resistance helps: Shadow Protection (priest) and Shadow Resistance Aura (paladin)
- Healthstones and health potions for everyone
- Make a spore rotation: which group (melee group, ranged group) goes to each spore
- Discipline priests are very strong here: absorb shields still work while healing does not
]],

    phases = {
        { title = "One phase - DPS race", text = [[
- The tank holds Loatheb where he stands. Everyone attacks him.
- Necrotic Aura blocks healing. DBM shows a timer and warns when the 3-second healing window opens.
- Spores spawn about every 36 seconds (more often in 25-man). The assigned group stands next to the spore and kills it to get the crit buff.
- Deathbloom: a debuff that damages players over time and then blooms with a small heal when it ends.
- Inevitable Doom: first at 2 minutes (90 seconds in 25-man), then about every 30 seconds. After about 5 minutes it speeds up to roughly every 15 seconds. Each one is big shadow damage on everyone 10 seconds after it is applied.
- Use Heroism/Bloodlust early with spore buffs to end the fight before Doom gets too fast.
]] },
    },

    tank = [[
- Pick Loatheb up and hold him in place. He does not move much.
- Melee damage on you is not healable outside the windows. Use defensive cooldowns when your health is low and the window is far away.
- Tanks benefit from spores too (more threat). Go to a spore when it is your turn.
]],

    healer = [[
- Healing only works in the 3-second window between Necrotic Auras. Pre-cast your big heal so it lands right when the window opens.
- Priority in the window: tank first, then players who took Doom damage.
- Absorb shields (Power Word: Shield, Divine Aegis) work during the aura. Discipline priests shield the tank and the raid before Doom.
- Out of the window, you can still help: some healers deal damage or kill spores.
]],

    dps = [[
- Main target: Loatheb. This is a damage race.
- When it is your group's turn, stand next to the spore and kill it. You get +50% critical strike chance for a while (Fungal Creep).
- Use cooldowns and Heroism/Bloodlust while the spore buff is up.
- Use healthstones and potions, and your own self-heals, after Doom hits.
]],

    warnings = [[
- |cffff2020Healing does not work most of the time.|r Use healthstones, potions and absorbs, and do not take avoidable damage.
- Stand right next to a spore when it dies, or you get no buff.
- Inevitable Doom gets faster after about 5 minutes. Slow raids run out of health.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- 25-man: spores spawn much more often, and the first Inevitable Doom comes earlier (about 90 seconds instead of 2 minutes).
- Loatheb has much more health in 25-man, so the spore rotation and DPS matter even more.
- Achievement "Spore Loser": defeat Loatheb without killing any spores. You lose the crit buff, so it needs good DPS.
]],

    abilities = {
        {
            name = "Necrotic Aura",
            spellId = 55593,
            danger = "high",
            target = "Whole raid",
            timing = "Lasts about 17 seconds, then a 3-second gap, repeating",
            description = [[ All healing on players does nothing while the aura is up. ]],
            response = [[ Healers time big heals for the 3-second windows. Use absorbs and potions. ]],
        },
        {
            name = "Inevitable Doom",
            spellId = 29204,
            danger = "high",
            target = "Whole raid",
            timing = "First at 2 min (90 sec in 25-man), then about every 30 sec, faster after about 5 min",
            description = [[ A curse that deals heavy shadow damage after 10 seconds. ]],
            response = [[ Shadow resistance buffs, shields, healthstones. Kill the boss quickly. ]],
        },
        {
            name = "Summon Spore",
            spellId = 29234,
            danger = "low",
            target = "Players near the spore",
            timing = "About every 36 seconds (more often in 25-man)",
            description = [[ A spore spawns. When it dies, players right next to it get Fungal Creep: +50% critical strike chance. ]],
            response = [[ The assigned group stands at the spore and kills it. ]],
        },
        {
            name = "Deathbloom",
            icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain",
            danger = "medium",
            target = "Whole raid",
            description = [[ Deals damage over time, then blooms and heals the player a little when it ends. ]],
            response = [[ Nothing special, heal through it in the windows. ]],
        },
    },

    chat = {
        summary = {
            "Healing only works in the 3 sec window between Necrotic Auras. Do not take extra damage.",
            "Spores: your assigned group stands next to the spore and kills it for +50 percent crit.",
            "Inevitable Doom hits the whole raid and gets faster over time: shields, healthstones, kill fast.",
            "Heroism early with spore buffs.",
        },
        tank = {
            "Hold him in place. Use cooldowns when low and the heal window is far away.",
            "Take a spore when it is your turn, it helps threat.",
        },
        healer = {
            "Pre-cast your big heal so it lands right when the 3 sec window opens. Tank first.",
            "Absorb shields work during the aura. Shield the raid before Doom.",
        },
        dps = {
            "Damage race. Kill your assigned spore while standing next to it.",
            "Use healthstones and potions after Doom. Cooldowns with the crit buff.",
        },
    },
})

------------------------------------------------------------------------------
-- Instructor Razuvious
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Razuvious", {
    summary = "Mind control the Death Knight Understudies to tank him; one Understudy tanks while the next is ready.",

    overview = [[
Instructor Razuvious is the first boss of the Military Quarter. He hits extremely hard with Unbalancing Strike, so normally he is not tanked by a player. Instead, players take control of his students, the Death Knight Understudies, and use them to tank him.

In 10-man you control an Understudy by clicking an Obedience Crystal (the orbs on the platform near the entrance). In 25-man the normal method is that priests cast {spell:605} on the Understudies. While controlled, the Understudy gets its own action bar with {spell:29060} and {spell:29061} (a big damage shield).

Controlled Understudies get tired: after control ends, the same Understudy cannot be controlled again for a while. So two players take turns. The rest of the raid kills the boss and heals through {spell:29107}. A normal kill takes about 3-4 minutes.
]],

    preparation = [[
- 10-man: 2 players assigned to the 2 Obedience Crystals (anyone can do it, often healers or ranged DPS), 1 real tank as backup, 2 healers
- 25-man: 2 or more priests assigned to Mind Control, 1-2 real tanks as backup, 5-6 healers
- Decide who controls first and who controls second
- Plan the pull: the first Understudy is controlled and pulls Razuvious
- Mana users bring mana potions; Disrupting Shout burns mana
]],

    phases = {
        { title = "Pull", text = [[
- Controller 1 takes an Understudy and runs it to Razuvious. Use Taunt on him.
- The other Understudies stay controlled or are tanked by a real tank, so they do not kill the raid.
- Everyone else waits until the Understudy has threat, then attacks the boss.
]] },
        { title = "Main phase - Understudy rotation", text = [[
- The active Understudy keeps Taunt on cooldown and uses Bone Barrier to survive Unbalancing Strike.
- Controller 2 takes the second Understudy before control 1 runs out (DBM shows a 60 second timer) and taunts the boss off the first one.
- Healers heal the active Understudy like a normal tank.
- {spell:29107} hits the raid about every 15 seconds and burns mana. Healers keep the raid up.
- Repeat until Razuvious dies. Do not kill the Understudies; you need them.
]] },
    },

    tank = [[
# Understudy controllers
- Taunt is your threat tool. Use it when it is ready and when you swap Understudies.
- Use Bone Barrier to absorb Unbalancing Strike. Keep it up as much as you can.
- Swap before your control ends, so the boss never runs free.

# Real tank (backup)
- Hold any Understudy that is not being controlled, away from the raid. Do not attack them hard.
- If the Understudy rotation fails, taunt Razuvious and use every cooldown while the controllers reset.
]],

    healer = [[
- The active Understudy is your tank. Heal it like a normal tank (you can heal it while it is controlled).
- Disrupting Shout hits everyone and burns mana about every 15 seconds. Keep the raid up and use mana tools.
- Jagged Knife puts a bleed on a random player. Heal them.
]],

    dps = [[
- Main target: Razuvious. Do not attack the Understudies.
- Wait for the Understudy to taunt before you start damage.
- Mana users: Disrupting Shout burns your mana. Use mana potions and regen tools.
]],

    warnings = [[
- |cffff2020Never let Razuvious hit a cloth player.|r Unbalancing Strike kills anything that is not an Understudy or a strong tank.
- Do not AoE or kill the Understudies. You need them to tank.
- Controllers: swap before control runs out, not after.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- 10-man: 2 Understudies and 2 Obedience Crystals.
- 25-man: 4 Understudies. Priests use Mind Control on them instead of crystals, so you need at least 2 priests (more is safer).
- In 25-man the boss has more health and Disrupting Shout costs the raid more mana.
]],

    alternatives = {
        { title = "Real tank on Razuvious (geared raids)", text = [[
Many well-geared raids skip the control rotation and let a real tank take Razuvious, using defensive cooldowns and strong healing, while Understudies are controlled or held aside. This only works with very good tank gear. New raids should use the Understudies.
]] },
    },

    abilities = {
        {
            name = "Unbalancing Strike",
            icon = "Interface\\Icons\\Ability_Warrior_DecisiveStrike",
            danger = "high",
            target = "Current tank",
            description = [[ A very heavy hit that also lowers the target's defense. ]],
            response = [[ Only an Understudy with Bone Barrier (or a very strong tank) should take it. ]],
        },
        {
            name = "Disrupting Shout",
            spellId = 29107,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 15 seconds",
            description = [[ Burns mana and deals damage to everyone. ]],
            response = [[ Healers heal the raid; mana users use potions and regen. ]],
        },
        {
            name = "Mind Control / Obedience Crystal",
            spellId = 605,
            danger = "medium",
            target = "Death Knight Understudy",
            timing = "About 60 seconds per control",
            description = [[ Lets a player take control of an Understudy (crystals in 10-man, priests in 25-man). ]],
            response = [[ Two players take turns so one Understudy is always tanking. ]],
        },
        {
            name = "Taunt (Understudy)",
            spellId = 29060,
            danger = "low",
            target = "Razuvious",
            timing = "20 second cooldown",
            description = [[ The Understudy's taunt. It forces Razuvious to attack the Understudy. ]],
            response = [[ Use it on pull and every time you swap Understudies. ]],
        },
        {
            name = "Bone Barrier (Understudy)",
            spellId = 29061,
            danger = "low",
            target = "Understudy",
            timing = "Lasts 20 seconds, 30 second cooldown",
            description = [[ A strong shield that absorbs damage on the Understudy. ]],
            response = [[ Keep it on cooldown to survive Unbalancing Strike. ]],
        },
        {
            name = "Jagged Knife",
            icon = "Interface\\Icons\\Ability_Rogue_FanOfKnives",
            danger = "low",
            target = "Random player",
            description = [[ A thrown knife that leaves a bleed. ]],
            response = [[ Heal the target. ]],
        },
    },

    chat = {
        summary = {
            "Understudies tank the boss. Controllers take turns before the 60 sec control runs out.",
            "Never attack the Understudies. Wait until the Understudy taunts before you attack.",
            "Disrupting Shout every 15 sec burns mana: use mana potions and regen.",
            "If Razuvious hits a non-tank they die. Stay away from him.",
        },
        tank = {
            "Controllers: Taunt on pull and on every swap, keep Bone Barrier up. Swap early, not late.",
            "Backup tank: hold free Understudies away from the raid, taunt the boss only if the rotation fails.",
        },
        healer = {
            "Heal the active Understudy like a normal tank.",
            "Disrupting Shout hits all: keep the raid up and save mana.",
        },
        dps = {
            "Boss only, never the Understudies. Wait for the taunt before attacking.",
            "Mana users: use potions and regen tools, the shout burns mana.",
        },
    },
})

------------------------------------------------------------------------------
-- Gothik the Harvester
------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Gothik", {
    summary = "Split the raid into a live side and a dead side; every add killed on the live side comes back as a ghost on the dead side.",

    overview = [[
Gothik the Harvester is the second boss of the Military Quarter. His room is split in two by a fence with a gate in the middle. One half is the "live side", the other is the "dead side". The raid must be split between the two halves before the pull.

For about the first 4.5 minutes, Gothik stays on his balcony and sends waves of undead adds at the live side: Unrelenting Trainees, Unrelenting Death Knights and Unrelenting Riders. Every add killed on the live side rises again as a spectral (ghost) version on the dead side. So both sides fight at the same time, and the live side controls how fast the dead side gets new work.

Then Gothik comes down and fights himself, teleporting between the two sides. The gate in the middle opens during the fight, and the whole raid can join up. A normal kill takes about 6 minutes.
]],

    preparation = [[
- Split the raid: each side needs at least one tank, healers and DPS. 10-man is often 5 live / 5 dead; 25-man often 13 live / 12 dead
- The live side needs good single-target DPS and a tank for Death Knights; the dead side needs good AoE
- Everyone must be on their side before the pull (the room splits when combat starts)
- Turn on the DBM wave timer; it tells you what is coming
]],

    phases = {
        { title = "Phase 1 - Waves (about 4.5 minutes)", text = [[
- The first wave comes about 25 seconds after the pull, then waves come every 5-20 seconds.
# Live side
- Trainees: weak, kill with AoE. Death Knights: tank them. Riders: tough, focus them down.
- Kill adds at a steady pace. If you kill too fast, the dead side gets flooded.
# Dead side
- Spectral Trainees, Spectral Death Knights, Spectral Riders and Spectral Horses appear as live adds die.
- Kill the Spectral Rider first (it buffs other ghosts and drains life). Tank and AoE the rest.
]] },
        { title = "Phase 2 - Gothik (from about 4.5 minutes)", text = [[
- Gothik teleports down and attacks. He moves between the live side and the dead side, so both sides must be ready to tank him.
- He casts Shadow Bolts and {spell:28679}, a stacking debuff that lowers everyone's stats. The longer phase 2 lasts, the weaker the raid gets.
- Finish all remaining adds, then burn Gothik. Use Heroism/Bloodlust here.
- When the gate opens, the two halves can join up.
]] },
    },

    tank = [[
# Live side tank
- Tank the Unrelenting Death Knights and Riders. Trainees can be held for AoE.
# Dead side tank
- Gather the ghosts as they spawn. Spectral Death Knights do a whirlwind - keep them away from healers.
# Both
- In phase 2, whoever is on the side Gothik teleports to picks him up right away.
]],

    healer = [[
- Each side has its own healers. Do not run to the other side.
- Live side: steady tank damage from Death Knights and Riders.
- Dead side: lots of AoE damage from ghost waves (Spectral Trainees explode with arcane damage). Watch the whole group.
- Phase 2: Harvest Soul stacks lower your stats and mana over time. Use mana tools early.
]],

    dps = [[
# Live side
- Kill adds steadily. Riders are the priority because they hit hard.
- If the dead side calls for a slower pace, hold back a little.
# Dead side
- Kill Spectral Riders first, then AoE everything else.
# Phase 2
- All DPS on Gothik once the adds are dead. Use cooldowns and Heroism.
]],

    warnings = [[
- |cffff2020Do not cross the fence before the gate opens.|r You cannot help the other side; stay on your own side.
- The live side kill speed decides how hard the dead side is. Do not burst-kill entire waves.
- Kill Spectral Riders first on the dead side.
- Phase 2 is a DPS race: Harvest Soul keeps stacking.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
- 25-man waves are bigger: DBM shows 3 Trainees per wave instead of 2, and 2 Death Knights instead of 1. Riders also come more often near the end.
- Both sides need more healing and AoE in 25-man.
- Everything has more health in 25-man, including Gothik in phase 2.
]],

    abilities = {
        {
            name = "Add waves (live side)",
            icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",
            danger = "high",
            target = "Live side",
            timing = "First wave about 25 seconds after pull, then every 5-20 seconds",
            description = [[ Unrelenting Trainees, Death Knights and Riders attack the live side. Each one comes back as a ghost on the dead side when it dies. ]],
            response = [[ Live side tanks and kills them at a steady pace. ]],
        },
        {
            name = "Spectral adds (dead side)",
            icon = "Interface\\Icons\\Spell_Shadow_DeathScream",
            danger = "high",
            target = "Dead side",
            timing = "Whenever an add dies on the live side",
            description = [[ Ghost versions of the live adds. Trainees explode with arcane damage, Death Knights whirlwind, Riders buff others and drain life, Horses stomp. ]],
            response = [[ Kill Spectral Riders first, tank and AoE the rest. ]],
        },
        {
            name = "Harvest Soul",
            spellId = 28679,
            danger = "medium",
            target = "Whole raid",
            timing = "Phase 2",
            description = [[ A stacking debuff that lowers all stats of everyone in the raid. ]],
            response = [[ Kill Gothik quickly once he comes down. ]],
        },
        {
            name = "Shadow Bolt",
            icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt",
            danger = "medium",
            target = "Current target",
            timing = "Phase 2",
            description = [[ Gothik's main attack: a shadow bolt on his target. ]],
            response = [[ Tank on his current side picks him up; healers heal the target. ]],
        },
        {
            name = "Unrelenting Rider",
            icon = "Interface\\Icons\\Ability_Mount_Undeadhorse",
            danger = "medium",
            target = "Live side",
            description = [[ The toughest add. Hits hard and on death becomes a Spectral Rider and a Spectral Horse on the dead side. ]],
            response = [[ Live side focuses it down; dead side gets ready for its ghost. ]],
        },
    },

    chat = {
        summary = {
            "Raid is split into a live side and a dead side. Stay on your side until the gate opens.",
            "Every add killed on the live side comes back as a ghost on the dead side. Live side: kill at a steady pace.",
            "Dead side: kill Spectral Riders first, then AoE the rest.",
            "After about 4.5 min Gothik comes down and teleports between sides: kill him fast, Harvest Soul stacks.",
        },
        tank = {
            "Live side: tank the Death Knights and Riders. Dead side: gather the ghosts away from healers.",
            "Phase 2: whoever is on the side Gothik teleports to picks him up right away.",
        },
        healer = {
            "Stay on your own side and heal your own group.",
            "Dead side takes a lot of AoE damage from ghost waves. Use mana tools early for phase 2.",
        },
        dps = {
            "Live side: focus Riders, do not burst whole waves at once.",
            "Dead side: Spectral Riders first, then AoE. Phase 2: all on Gothik with Heroism.",
        },
    },
})
