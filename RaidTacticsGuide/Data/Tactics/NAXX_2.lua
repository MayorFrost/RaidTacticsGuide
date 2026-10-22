--[[
    Raid Tactics Guide - Naxxramas (level 80, 10 and 25 player)
    Part 2: Four Horsemen, Construct Quarter, Frostwyrm Lair.
    Spell ids taken from the Warmane DBM-Naxx module where possible.
]]

local RTG = RaidTacticsGuide

-------------------------------------------------------------------------------
-- The Four Horsemen
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Horsemen", {
    summary = "Four bosses at once in four corners. Every horseman stacks a Mark on nearby players, so tanks and back-holders must rotate before the stacks get deadly.",

    overview = [[
The Four Horsemen are four death knight bosses fought at the same time: Thane Korth'azz, Baron Rivendare, Lady Blaumeux and Sir Zeliek. Thane and Baron are melee bosses at the front of the room. Lady Blaumeux and Sir Zeliek are casters at the back of the room.

Every few seconds each horseman puts its own Mark (for example {spell:28835}) on the players near it. One or two stacks are harmless, but every extra stack hurts much more than the last one. The whole fight is about |cffff2020never letting anyone build too many stacks|r of one Mark.

The caster bosses at the back must always have someone standing within their range. If nobody is in range they punish the whole raid with heavy damage.

You kill the horsemen one at a time. The fight usually lasts 4-6 minutes and is mostly about discipline: be in the right corner at the right time.
]],

    preparation = [[
- 2 tanks for Thane and Baron (25-man often uses 3-4 tanks so they can rotate more)
- 2 "back holders" for Lady and Zeliek. These are ranged players or healers who stand at long range and let the caster boss hit them. In 25-man you usually want 2 per back corner so they can swap
- Your raid leader must assign: who tanks which horseman, who holds the back, and the kill order
- Turn on DBM: it warns before every Mark and when you have 4 or more stacks
- Learn the corners before the pull. The raid leader will usually mark the spots with raid markers
]],

    phases = {
        { title = "Pull and positioning", text = [[
All four horsemen aggro together. Each tank grabs a front horseman and keeps it in its own corner. The two back holders run to the back corners and stand at max range of Lady Blaumeux and Sir Zeliek, so the casters target them.

The rest of the raid goes to the horseman that dies first (usually Thane Korth'azz).
]] },
        { title = "Killing the horsemen", text = [[
- Kill one horseman at a time. A common order is Thane, then Baron, then Lady and Zeliek
- Melee stand together with the Thane tank, because {spell:28884} damage is split among everyone close to the target. More people = less damage each
- Ranged and healers spread out (about 12 yards apart) because {spell:28883} jumps between players who stand close
- Move out of {spell:28863} on the ground right away
]] },
        { title = "Mark rotation (the whole fight)", text = [[
Every Mark adds one stack to everyone near that horseman. When a tank or back holder reaches about 3 stacks, they trade places with their partner so their old Mark can fall off.

- Front tanks: run to the other front horseman and taunt it, while the other tank does the same in reverse
- Back holders: walk along the back wall and swap corners with each other
- When a horseman dies, its Mark stops. The rotation gets easier as you go
]] },
    },

    tank = [[
- Pick up your assigned front horseman and keep it in its corner, facing away from the raid
- Watch your Mark stacks. Swap with the other tank at the stack count your raid leader says (usually 3)
- To swap: run to the other horseman, taunt it, and use a defensive cooldown if the new Mark stacks are high
- On Thane, stand still so melee can stack on you for Meteor
- Baron hits hard with a shadow damage over time effect. Keep defensive cooldowns ready
- In 10-man a tank may need to hold a back horseman too. Stay at range and let it cast at you
]],

    healer = [[
- Heal the front tanks hardest right after a swap, when their new Mark stacks are fresh and the boss hits them
- Spread out about 12 yards from other ranged players so Holy Wrath does not jump between you
- If you are a back holder, you stand alone. Heal yourself and swap corners on time
- Meteor targets (the Thane tank and melee next to him) take big spikes. Keep melee topped up
- Watch your own Mark stacks. Healers who drift close to the wrong horseman get marked too
]],

    dps = [[
- Attack only the horseman your raid leader calls. Switching early wastes damage
- Melee: stack together on the Thane tank to share Meteor damage
- Ranged: spread out about 12 yards apart for Holy Wrath
- Move out of black Void Zones on the ground immediately
- Do not walk near a horseman you are not killing. You will pick up its Mark stacks
- After a horseman dies, follow the raid to the next one together
]],

    warnings = [[
- |cffff2020Never let your Mark stacks climb past 4.|r Every stack hurts more than the last one and high stacks kill instantly
- |cffff2020Lady Blaumeux and Sir Zeliek must always have someone in range.|r If nobody is close enough, they hit the whole raid with Unyielding Pain or Condemnation
- Do not stand in Void Zones (black circles)
- Ranged must spread or Holy Wrath bounces through the group
- Do not run past the front horsemen when changing corners. You will collect extra Marks
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. The 25-player version has the same mechanics with more health and damage:

- Meteor ({spell:57467}) and Holy Wrath ({spell:57466}) hit much harder, so stacking for Meteor and spreading for Holy Wrath matter even more
- With more tanks available, many 25-man raids put 2 tanks on each front horseman and 2 back holders in each back corner, so nobody has to run far
- Mark damage is higher, so swaps must be on time
- In 10-man you only have 2 tanks, so back holders are usually a healer and a ranged DPS
]],

    alternatives = {
        { title = "Who holds the back corners", text = [[
Some raids use healers as back holders: they can heal themselves while the caster boss hits them. Other raids use ranged DPS (hunters, mages, warlocks) who keep damaging the back horseman. Both work. Healers are safer, DPS is faster.
]] },
        { title = "Kill order", text = [[
Most raids kill Thane first because Meteor is the most dangerous mechanic. Some raids kill Baron first to remove his heavy tank damage. Ask your raid leader before the pull.
]] },
    },

    abilities = {
        {
            name = "Marks of the Horsemen",
            spellId = 28835,
            danger = "high",
            target = "Everyone near that horseman",
            timing = "About every 15 seconds",
            description = [[ Each horseman places its own Mark (Korth'azz, Blaumeux, Rivendare, Zeliek) on nearby players. Each new stack deals more damage than the last. ]],
            response = [[ Rotate between horsemen before you reach about 4 stacks. Only stand near the horseman you are assigned to. ]],
        },
        {
            name = "Meteor (Thane Korth'azz)",
            spellId = 28884,
            danger = "high",
            target = "Thane's current target and players near it",
            timing = "About every 15 seconds",
            description = [[ A meteor hits Thane's target. The damage is split between everyone close to the target. ]],
            response = [[ Melee stack on the Thane tank so the damage is shared. Never leave the tank alone. ]],
        },
        {
            name = "Holy Wrath (Sir Zeliek)",
            spellId = 28883,
            danger = "medium",
            target = "Random player, then jumps",
            timing = "About every 13 seconds",
            description = [[ A holy bolt that jumps from player to player. It gets stronger with every jump. ]],
            response = [[ Ranged and healers spread out about 12 yards apart. ]],
        },
        {
            name = "Void Zone (Lady Blaumeux)",
            spellId = 28863,
            danger = "medium",
            target = "Random player",
            description = [[ A black circle of shadow appears under a player and hurts anyone standing in it. ]],
            response = [[ Step out of it immediately. ]],
        },
        {
            name = "Mark of Rivendare",
            spellId = 28834,
            danger = "medium",
            target = "Everyone near Baron Rivendare",
            timing = "About every 15 seconds",
            description = [[ Baron's Mark. Combined with his heavy melee and shadow damage it makes his tank the hardest to heal. ]],
            response = [[ Baron's tank swaps on time and uses cooldowns. Healers focus this tank. ]],
        },
    },

    chat = {
        summary = {
            "Every horseman stacks a Mark on nearby players. Never go above 3-4 stacks - swap corners on time.",
            "Lady and Zeliek in the back must always have someone in range or the raid takes heavy damage.",
            "Melee stack on the Thane tank to share Meteor damage.",
            "Ranged spread 12 yards apart for Holy Wrath. Move out of black Void Zones.",
            "Kill one horseman at a time in the called order. Do not walk near horsemen you are not assigned to.",
        },
        tank = {
            "Hold your front horseman in its corner, facing away from the raid.",
            "Swap with the other tank at 3 Mark stacks: run over and taunt, use a cooldown if needed.",
            "Stand still on Thane so melee can stack with you for Meteor.",
        },
        healer = {
            "Heal tanks hard right after each swap. Baron's tank takes the most damage.",
            "Spread 12 yards from other ranged for Holy Wrath.",
            "Back holders: stay in range of your caster, heal yourself, swap corners at 3 stacks.",
        },
        dps = {
            "Attack only the called horseman. Melee stack on the Thane tank for Meteor.",
            "Ranged spread 12 yards. Move out of Void Zones.",
            "Do not wander near other horsemen - you will collect their Marks.",
        },
    },
})

-------------------------------------------------------------------------------
-- Patchwerk
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Patchwerk", {
    summary = "A pure damage race: tanks soak Hateful Strike, healers keep the soakers alive, DPS kill him before the 6 minute enrage.",

    overview = [[
Patchwerk is a giant abomination and a classic "gear check". He has no tricky movement mechanics. He just hits very hard and has a lot of health.

His special attack is {spell:28308}. Instead of hitting his main tank, it hits one of the players at the top of his threat list who are in melee range, picking the one with the most health. These players are called "soakers" (they soak = absorb the hits). The soakers are usually off-tanks.

After 6 minutes he goes berserk and kills the raid. Near the end (at 5% health) he becomes frenzied and hits faster. If your raid does enough damage and healers keep the tanks alive, this boss is simple.
]],

    preparation = [[
- 10-man: 2 tanks (main tank + 1 soaker) and 3 healers is common
- 25-man: 3-4 tanks (main tank + 2-3 soakers) and 6-7 healers
- Soakers need high health and good armor. Plate classes with high stamina are best
- Melee DPS must have lower health than the soakers, or Hateful Strike may hit them
- Use flasks, food and potions. This is a damage race
- Clear the trash and the slime in the hallway before the pull
]],

    phases = {
        { title = "The whole fight (one phase)", text = [[
- The main tank holds Patchwerk where he stands, facing away from the raid
- Soakers stand in melee range next to the main tank and build enough threat to stay at the top of his threat list
- Hateful Strike hits one of the soakers every few seconds
- DPS attack the boss from behind and to the sides
- Ranged and healers stand behind him at range
]] },
        { title = "Frenzy at 5% health", text = [[
At 5% health Patchwerk becomes frenzied and attacks much faster. Use your last cooldowns here and finish him quickly.
]] },
        { title = "Berserk at 6 minutes", text = [[
If Patchwerk is still alive after 6 minutes he goes berserk and wipes the raid. If you are close to 6 minutes and he has a lot of health left, the raid lead may call a wipe to save repair costs.
]] },
    },

    tank = [[
- Main tank: build threat fast and stay first on threat. You are not hit by Hateful Strike, just by his normal hits
- Soakers: stand in melee range and build threat so you stay 2nd, 3rd or 4th on threat. Never fall out of the top
- Soakers: keep your health as high as possible. You want to be the highest-health player in melee range
- Use defensive cooldowns in turn so the healers always have one tank that is easy to heal
- At 5% Frenzy, the main tank should use a big cooldown
]],

    healer = [[
- Assign healers: some on the main tank, most on the soakers. Soakers take the biggest hits
- Hateful Strike hits very hard. Keep soakers near full health at all times
- There is almost no raid damage. Focus on tanks
- Stay out of melee range. Being close to the boss with high health can make you a Hateful Strike target
- Use mana regeneration cooldowns early. This fight is long and tank-heavy
]],

    dps = [[
- Full damage from the pull. This fight is a pure damage race
- Melee: attack from behind. Melee with high health (for example a warrior in tank gear) can get hit by Hateful Strike
- Do not pull threat from the tanks. Wait a few seconds after the pull before going all out
- Save cooldowns like Bloodlust / Heroism for the start or for the Frenzy at 5%
]],

    warnings = [[
- |cffff2020Soakers must stay high on threat.|r If a soaker drops off, Hateful Strike can hit a melee DPS and kill them in one hit
- |cffff2020Berserk at 6 minutes wipes the raid.|r Bring enough damage
- Melee DPS should not have more health than the soakers
- Do not stand in front of the boss
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. In 25-man:

- Patchwerk has much more health and Hateful Strike ({spell:59192}) hits harder
- You need more soakers: usually 2-3 soakers plus the main tank
- More healers are needed on the soakers
- The 6 minute berserk is the same
- Achievement: "Make Quick Werk of Him" - kill Patchwerk within 3 minutes (in 10 or 25 man)
]],

    abilities = {
        {
            name = "Hateful Strike",
            spellId = 28308,
            danger = "high",
            target = "Highest-health player among the top threat targets in melee range (not the main tank)",
            timing = "Every few seconds",
            description = [[ A huge hit on one of the soakers. It can one-shot a DPS or healer. ]],
            response = [[ Soakers stay high on threat and high on health. Healers keep them topped up at all times. ]],
        },
        {
            name = "Frenzy",
            icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
            danger = "medium",
            target = "Patchwerk",
            timing = "At 5% health",
            description = [[ Patchwerk attacks much faster for the rest of the fight. ]],
            response = [[ Tanks use cooldowns, DPS burn him down quickly. ]],
        },
        {
            name = "Berserk",
            icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
            danger = "high",
            target = "Patchwerk",
            timing = "6 minutes after the pull",
            description = [[ Patchwerk's damage goes up massively and he kills the raid. ]],
            response = [[ Kill him before 6 minutes. ]],
        },
    },

    chat = {
        summary = {
            "Damage race: kill Patchwerk before the 6 minute berserk.",
            "Hateful Strike hits a soaker in melee: soakers stay high on threat and high on health.",
            "Melee DPS attack from behind and must have less health than the soakers.",
            "At 5% he frenzies and hits faster - use cooldowns and finish him.",
        },
        tank = {
            "Main tank holds first on threat, facing away from the raid.",
            "Soakers stay in melee and in the top threat spots, health as high as possible.",
            "Rotate defensive cooldowns, main tank saves one for the 5% Frenzy.",
        },
        healer = {
            "Most healing goes to the soakers - Hateful Strike hits very hard.",
            "Stay out of melee range. There is almost no raid damage.",
            "Use mana cooldowns early, it is a long tank-healing fight.",
        },
        dps = {
            "Full damage from the start, but give tanks a few seconds of threat first.",
            "Melee attack from behind. Do not go over the soakers in health.",
            "Save Heroism or Bloodlust for the pull or the 5% Frenzy.",
        },
    },
})

-------------------------------------------------------------------------------
-- Grobbulus
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Grobbulus", {
    summary = "The tank slowly kites Grobbulus around the room to avoid his poison clouds, while injected players run away to drop their clouds somewhere safe.",

    overview = [[
Grobbulus is a big slime abomination. The fight is about not filling the room with poison.

He regularly drops a {spell:28240} under himself. The cloud stays for a while and hurts everyone in it. To avoid this, the tank slowly walks him around the edge of the room (this is called kiting = moving the boss while it follows you). The raid follows behind.

He also gives random players a {spell:28169}. After 10 seconds the injection explodes and leaves another poison cloud where that player stands. The injected player must |cffff2020run away from the raid|r before it ends. As the boss loses health, injections come more often.

His {spell:28157} is a frontal attack that spawns small slimes for every player it hits. Off-tanks and DPS kill the slimes. After 12 minutes he enrages.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers. 25-man: 2-3 tanks, 5-6 healers
- Agree on the kiting direction before the pull (clockwise or counter-clockwise) and where injected players should run (usually behind the raid, to the side the boss already passed)
- Turn on DBM so you get a clear warning when you are injected
- Healers: |cffff2020do not dispel Mutating Injection|r. Dispelling makes it explode at once
]],

    phases = {
        { title = "The whole fight (one phase)", text = [[
- The tank picks up Grobbulus and starts moving him slowly along the edge of the room, always to fresh ground away from old clouds
- The raid stays behind and to the sides of the boss, never in front of him
- Every 15 seconds a new Poison Cloud drops under the boss. The tank moves on a little
- Injected players run out, wait for the explosion away from everyone, then come back
- Off-tank and DPS kill Fallout Slimes created by Slime Spray
- Keep going around the room until he dies
]] },
        { title = "Low health", text = [[
Injections come more often as Grobbulus loses health. Below about 30% there may be several injected players at once. Keep calm, each one runs out to a different spot.
]] },
    },

    tank = [[
- Main tank: move Grobbulus slowly and steadily along the room edge. Small steps are better than big runs
- Always face him away from the raid so Slime Spray only hits you
- Never walk him back through old clouds. Plan the circle so clouds are behind you
- Off-tank: pick up the Fallout Slimes after each Slime Spray and bring them to the DPS
- If you get injected, keep tanking but step away from the raid; the poison cloud will drop where you stand, which is fine if you keep moving the boss
]],

    healer = [[
- Never dispel Mutating Injection. It explodes immediately and puts a cloud on the raid
- Heal injected players when it explodes; they take a burst of damage
- Keep moving with the raid. Do not stand in green clouds while healing
- Slime Spray hits anyone in front of the boss. Stay behind or to the side
]],

    dps = [[
- Attack the boss from behind or the sides, never from the front
- When Fallout Slimes appear, kill them quickly (AoE works well)
- If you are injected: run away from the raid to the agreed spot, wait for it to pop, then come back
- Follow the boss as it moves. Do not stay in old clouds
]],

    warnings = [[
- |cffff2020Injected? Run away from the raid before it explodes (10 seconds).|r
- |cffff2020Do not dispel Mutating Injection.|r
- Never stand in front of Grobbulus (Slime Spray)
- Do not stand in green poison clouds
- Enrage after 12 minutes
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. In 25-man:

- Grobbulus has more health and hits harder
- Slime Spray ({spell:54364}) hits harder and more Fallout Slimes may spawn, because more players stand near the boss
- More players get injected over the fight, so plan clear drop spots for injected players
- The 12 minute enrage is the same
]],

    abilities = {
        {
            name = "Mutating Injection",
            spellId = 28169,
            danger = "high",
            target = "Random player",
            timing = "More often as the boss loses health",
            description = [[ After 10 seconds the injection explodes, damaging the player and leaving a poison cloud where they stand. ]],
            response = [[ Run away from the raid before it ends. Do not dispel it. ]],
        },
        {
            name = "Poison Cloud",
            spellId = 28240,
            danger = "medium",
            target = "Under the boss",
            timing = "Every 15 seconds",
            description = [[ A green poison cloud that stays on the ground and damages anyone inside. ]],
            response = [[ The tank keeps moving the boss around the room so clouds stay behind the raid. ]],
        },
        {
            name = "Slime Spray",
            spellId = 28157,
            danger = "medium",
            target = "Frontal cone",
            timing = "About every 30-60 seconds",
            description = [[ Sprays slime in front of the boss. A Fallout Slime spawns for every player hit. ]],
            response = [[ Only the tank stands in front. Off-tank and DPS kill the slimes. ]],
        },
        {
            name = "Enrage",
            icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
            danger = "low",
            target = "Grobbulus",
            timing = "12 minutes after the pull",
            description = [[ After 12 minutes Grobbulus enrages and kills the raid. ]],
            response = [[ Rarely a problem. Keep dps going while moving. ]],
        },
    },

    chat = {
        summary = {
            "Tank kites Grobbulus slowly along the room edge so his Poison Clouds stay behind us.",
            "Injected? Run away from the raid before it pops after 10 seconds. Never dispel it.",
            "Never stand in front of the boss (Slime Spray). Kill Fallout Slimes fast.",
            "Do not stand in green clouds. Follow the boss as it moves.",
        },
        tank = {
            "Move the boss slowly along the edge, always onto clean ground, facing away from the raid.",
            "Off-tank picks up Fallout Slimes after every Slime Spray.",
        },
        healer = {
            "Do NOT dispel Mutating Injection - it explodes on the raid.",
            "Heal injected players when it pops. Move with the raid, out of clouds.",
        },
        dps = {
            "Attack from behind or the sides. AoE the Fallout Slimes.",
            "Injected? Run to the agreed spot away from the raid, wait for it to pop, come back.",
        },
    },
})

-------------------------------------------------------------------------------
-- Gluth
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Gluth", {
    summary = "Zombies flood the room; a kiter keeps them away from Gluth. Decimate drops everyone to 5% health, then the raid kills the weak zombies before Gluth eats them.",

    overview = [[
Gluth is a huge plague dog. Zombie Chow (zombies) keep pouring into the room through the gates. If Gluth eats a zombie, he heals.

The key mechanic is {spell:28374}. About every 1 minute 45 seconds, Gluth drops |cffff2020every player and every zombie to 5% health|r. Right after Decimate, the zombies all walk towards Gluth to be eaten. The raid must kill the zombies quickly (they are at 5% health, so area damage kills them fast) while healers bring everyone back up.

Between Decimates, one or two players "kite" the zombies (kite = keep them following you while you run around the room) so they do not reach Gluth or the healers.

Gluth also enrages from time to time ({spell:28371}). A hunter should remove it with Tranquilizing Shot. His tank gets a Mortal Wound that lowers healing, so two tanks swap. He goes berserk after 7 minutes.
]],

    preparation = [[
- 2 tanks for Gluth (they swap on Mortal Wound stacks)
- 1-2 zombie kiters: classes with slows and self-healing are best (frost mage, hunter, frost death knight, paladin, druid)
- A hunter assigned to Tranquilizing Shot on Enrage (a rogue with Anesthetic Poison also works)
- Area damage classes ready to kill zombies after Decimate
- Healers ready with fast group heals right after each Decimate
]],

    phases = {
        { title = "Between Decimates", text = [[
- Tanks hold Gluth in the center of the room
- Zombies keep entering from the gates. The kiter grabs them and runs them around the outside of the room, slowing them
- DPS attack Gluth. Ranged may help slow or kill stray zombies
- Tanks swap when Mortal Wound stacks get high
- Hunter removes Enrage with Tranquilizing Shot as soon as it appears
]] },
        { title = "Decimate (about every 105 seconds)", text = [[
- Everyone and every zombie drops to 5% health. This damage cannot be avoided
- Healers: heal the tanks first, then the raid, with your fastest group heals
- DPS: switch to the zombies right away. Use area damage. They die in one or two hits
- Stun, slow and root the zombies so they cannot reach Gluth. Each zombie he eats heals him
- Once the zombies are dead, go back to Gluth
]] },
        { title = "Berserk at 7 minutes", text = [[
After 7 minutes Gluth goes berserk and kills the raid. Most raids kill him after 3 or 4 Decimates.
]] },
    },

    tank = [[
- Hold Gluth in the middle of the room, facing away from the raid
- Mortal Wound stacks on you and reduces healing you receive. Swap with the other tank at about 3-5 stacks, as your raid leader decides
- After Decimate you are at 5% health. Use a defensive cooldown just before Decimate is due (DBM shows a timer)
- If zombies reach you, they hurt you. Ask the kiter to keep them away
]],

    healer = [[
- Right before Decimate, make sure the tanks have heal-over-time effects running
- After Decimate everyone is at 5%. Heal tanks first, then everyone else with group heals
- Your own health also drops. Do not stand near zombies after Decimate
- Kiters run around the room taking hits. Give them some healing between Decimates
]],

    dps = [[
- Between Decimates: attack Gluth
- Kiters: pick up zombies at the gates, slow them and run them around the outside of the room. Never bring them near Gluth
- After Decimate: |cffff2020switch to the zombies at once|r. Area damage, stuns and slows. Do not let them reach Gluth
- Hunters: use Tranquilizing Shot on Gluth's Enrage right away
- Then switch back to Gluth
]],

    warnings = [[
- |cffff2020After Decimate, kill the zombies before Gluth eats them.|r Every eaten zombie heals him
- Remove Enrage quickly or the tank can die
- Tanks must swap on Mortal Wound
- Do not use self-damaging abilities (like Life Tap) right before Decimate
- Berserk at 7 minutes
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. In 25-man:

- More zombies enter the room, so most raids use 2 kiters (or a kiter plus extra slows and frost traps)
- Gluth has more health and hits harder
- After Decimate there are more zombies to clean up, so area damage is very important
- The Decimate timer and the 7 minute berserk are the same
]],

    alternatives = {
        { title = "Kite vs tank the zombies", text = [[
The most common way is kiting: one player runs the zombies in a big circle around the room. Some 10-man groups with strong area damage instead let an off-tank hold the zombies near the edge and kill them with area damage. This needs high damage and is harder for healers.
]] },
    },

    abilities = {
        {
            name = "Decimate",
            spellId = 28374,
            danger = "high",
            target = "Everyone in the room (players and zombies)",
            timing = "First at about 1:50, then about every 1:45",
            description = [[ Drops every player and every zombie to 5% health. Afterwards the zombies walk to Gluth to be eaten. ]],
            response = [[ Healers heal tanks first, then the raid. DPS kill the zombies with area damage before they reach Gluth. ]],
        },
        {
            name = "Enrage",
            spellId = 28371,
            danger = "medium",
            target = "Gluth",
            timing = "Lasts 8 seconds",
            description = [[ Gluth attacks faster and hits harder. ]],
            response = [[ A hunter removes it with Tranquilizing Shot right away. ]],
        },
        {
            name = "Mortal Wound",
            icon = "Interface\\Icons\\Ability_CriticalStrike",
            danger = "medium",
            target = "Current tank",
            description = [[ A stacking wound that lowers the healing the tank receives. ]],
            response = [[ The two tanks swap at about 3-5 stacks. ]],
        },
        {
            name = "Zombie Chow",
            icon = "Interface\\Icons\\Ability_Rogue_FeignDeath",
            danger = "medium",
            target = "Raid",
            timing = "Constantly from the gates",
            description = [[ Zombies enter all fight. Gluth heals every time he eats one. ]],
            response = [[ Kiters keep them away from Gluth. After Decimate everyone kills them. ]],
        },
        {
            name = "Berserk",
            icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
            danger = "high",
            target = "Gluth",
            timing = "7 minutes after the pull",
            description = [[ Gluth's damage goes up massively and he kills the raid. ]],
            response = [[ Kill him before 7 minutes. ]],
        },
    },

    chat = {
        summary = {
            "Kiters run the zombies around the room - never bring them to Gluth.",
            "Decimate drops everyone to 5% health about every 1:45. Healers heal tanks first, then raid.",
            "After Decimate, everyone AoE the zombies right away - Gluth heals for each one he eats.",
            "Hunters remove his Enrage with Tranquilizing Shot. Berserk at 7 minutes.",
        },
        tank = {
            "Hold Gluth in the middle, facing away from the raid.",
            "Swap tanks at 3-5 Mortal Wound stacks.",
            "Use a defensive cooldown just before Decimate.",
        },
        healer = {
            "Put heal-over-time effects on tanks before Decimate.",
            "After Decimate: heal tanks first, then the raid with group heals.",
            "Give the kiters some healing between Decimates.",
        },
        dps = {
            "Attack Gluth between Decimates.",
            "After Decimate switch to the zombies: AoE, stuns and slows.",
            "Hunters: Tranquilizing Shot on Enrage immediately.",
        },
    },
})

-------------------------------------------------------------------------------
-- Thaddius
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Thaddius", {
    summary = "First kill Stalagg and Feugen at the same time, then jump to Thaddius and stand on the correct side for your plus or minus charge.",

    overview = [[
Thaddius has two phases.

In phase 1 you fight his two helpers, Stalagg and Feugen, on two separate platforms. They must die at about the same time (within a few seconds). If one dies too early, the other one brings it back to life. Every 20 seconds or so, {spell:28338} swaps the tanks between the platforms, and the tanks must taunt right away.

In phase 2 Thaddius himself wakes up. The raid jumps across the gap to his platform. Every 30 seconds he casts {spell:28089}. Each player gets either a |cffff2020positive (plus)|r or a |cffff2020negative (minus)|r charge. Players with the same charge should stand together. Standing near players with the opposite charge hurts you and them. Standing with your own charge makes you deal more damage.

So the rule is simple: |cffff2020plus goes to the plus side, minus goes to the minus side|r. This boss is mostly about not panicking when your charge changes.
]],

    preparation = [[
- 2 tanks (one for each platform in phase 1, the main tank takes Thaddius in phase 2)
- Split the raid into two groups, one per platform, with similar damage on each side
- Decide which side is plus and which is minus before the pull. A common choice: plus on the right, minus on the left when facing Thaddius
- Enable DBM. It warns you when your charge changed and can show an arrow. DBM can also yell your charge
- Practise the jump: run straight at the gap from the edge of the platform and jump at the last moment
]],

    phases = {
        { title = "Phase 1 - Stalagg and Feugen", text = [[
- One tank and half the raid on each platform. Keep each add on its own platform
- Every 20 seconds or so, Magnetic Pull swaps the two tanks. The tank who lands on the other platform taunts the add there immediately
- Stalagg hits the tank hard, especially during Power Surge
- Feugen has a Static Field that drains mana and hurts players near him. Casters stand back from Feugen
- Bring both adds to low health and kill them within a few seconds of each other. Watch the raid leader's call
]] },
        { title = "Transition - the jump", text = [[
When both adds die, Thaddius starts to wake up. The raid runs to the edge of the platform and jumps over the gap to his platform. If you fall, you die. Then go to your starting side.
]] },
        { title = "Phase 2 - Thaddius and Polarity Shift", text = [[
- About every 30 seconds Thaddius casts Polarity Shift (3 second cast)
- After the cast, look at your debuff: a plus icon or a minus icon
- If your charge stayed the same, do not move. If it changed, walk to the other side right away
- Stay close to people with the same charge; you get a damage bonus for every nearby ally with the same charge
- Thaddius casts Chain Lightning on the raid. If nobody is in melee range, he casts Ball Lightning instead
- After 6 minutes in phase 2 he goes berserk
]] },
    },

    tank = [[
- Phase 1: hold your add in the middle of its platform. When Magnetic Pull throws you across, taunt the new add at once
- Use cooldowns when Stalagg uses Power Surge (he attacks much faster)
- Phase 2: the main tank takes Thaddius and stands in front of him, between the two sides
- Your charge matters too. After each shift, step to the side of the boss that matches your charge, keeping him facing away from the raid
- Someone must always be in melee range, or Thaddius casts Ball Lightning
]],

    healer = [[
- Phase 1: heal the tank on your platform. After Magnetic Pull, the new tank needs instant healing
- Stay away from Feugen's Static Field so you do not lose mana
- Phase 2: Chain Lightning hits groups. Keep everyone topped up
- After each Polarity Shift, players who stand on the wrong side take damage. Heal them while they move
- Move with your own charge group like everyone else
]],

    dps = [[
- Phase 1: balance damage. Do not kill your add until the raid leader calls it, so both die close together
- Casters: stay away from Feugen to avoid Static Field
- Transition: jump straight over the gap. Do not run at an angle
- Phase 2: after every Polarity Shift check your charge. Changed? Move to the other side. Same? Stay
- Melee: someone must always stay in melee range so he does not cast Ball Lightning
]],

    warnings = [[
- |cffff2020Kill Stalagg and Feugen at the same time.|r If one dies alone, the other revives it
- |cffff2020Check your charge after every Polarity Shift.|r Standing with the wrong group hurts you and everyone near you
- Do not fall into the gap when jumping
- Someone must always be in melee range of Thaddius
- Berserk after 6 minutes of phase 2
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. In 25-man:

- All bosses have more health and deal more damage
- Chain Lightning and the damage from wrong charges hit harder, so mistakes are deadlier
- With more players there is more crowding. Each side group should stand spread over a wide area
- Achievement: "Shocking!" - kill Thaddius without anyone being hit by an opposite charge (no one standing near the wrong group)
]],

    alternatives = {
        { title = "Two-camp strategy (most common)", text = [[
Plus on one side, minus on the other. After a Polarity Shift, only players whose charge changed move to the other side. Simple and easy to learn.
]] },
        { title = "Four-camp strategy", text = [[
The raid uses four spots (two per side). After every Polarity Shift, players move left if their charge changed and right if not (or the other way around). This keeps everyone moving the same direction and avoids crossing paths. DBM can show the left / right arrows for this.
]] },
    },

    abilities = {
        {
            name = "Polarity Shift",
            spellId = 28089,
            danger = "high",
            target = "Everyone",
            timing = "About every 30 seconds in phase 2 (3 second cast)",
            description = [[ Gives every player a positive or negative charge. Players near the opposite charge take damage. Players near the same charge deal more damage. ]],
            response = [[ Check your charge. If it changed, move to the other side. If not, stay. ]],
        },
        {
            name = "Magnetic Pull",
            spellId = 28338,
            danger = "high",
            target = "Both tanks in phase 1",
            timing = "About every 20 seconds",
            description = [[ Stalagg and Feugen throw their tanks to the other platform. ]],
            response = [[ The tanks taunt the new add right away. Healers heal the new tank fast. ]],
        },
        {
            name = "Revive",
            icon = "Interface\\Icons\\Spell_Holy_Resurrection",
            danger = "high",
            target = "Stalagg or Feugen",
            description = [[ If one add dies and the other is still alive a few seconds later, the dead one comes back to life. ]],
            response = [[ Balance damage and kill both within a few seconds of each other. ]],
        },
        {
            name = "Chain Lightning",
            icon = "Interface\\Icons\\Spell_Nature_ChainLightning",
            danger = "medium",
            target = "Random players, jumps",
            timing = "Phase 2",
            description = [[ Lightning that jumps between nearby players. ]],
            response = [[ Healers keep the raid topped up. Stay spread out inside your charge group. ]],
        },
        {
            name = "Berserk",
            icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
            danger = "medium",
            target = "Thaddius",
            timing = "6 minutes into phase 2",
            description = [[ Thaddius kills the raid. ]],
            response = [[ Use cooldowns well and kill him before 6 minutes. ]],
        },
    },

    chat = {
        summary = {
            "Phase 1: kill Stalagg and Feugen within a few seconds of each other or they revive.",
            "Magnetic Pull swaps the tanks between platforms - tanks taunt immediately.",
            "Phase 2: jump straight over the gap to Thaddius.",
            "Polarity Shift every 30 seconds: plus side and minus side. Charge changed = move, same charge = stay.",
            "Someone must always be in melee range of Thaddius.",
        },
        tank = {
            "Hold your add on its platform. After Magnetic Pull taunt the new add at once.",
            "Use a cooldown on Stalagg's Power Surge.",
            "Phase 2: main tank stays in front of Thaddius between the two groups.",
        },
        healer = {
            "After Magnetic Pull heal the new tank right away.",
            "Stay away from Feugen (Static Field drains mana).",
            "Phase 2: heal Chain Lightning damage and players moving after a shift.",
        },
        dps = {
            "Phase 1: balance damage, kill the adds together on the raid lead's call.",
            "Phase 2: check your charge after every shift. Changed = go to the other side.",
        },
    },
})

-------------------------------------------------------------------------------
-- Sapphiron
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_Sapphiron", {
    summary = "A frost dragon: remove Life Drain curses, dodge Blizzards on the ground, and hide behind ice blocks when he takes a deep breath in the air.",

    overview = [[
Sapphiron is a frost wyrm (an undead dragon). The fight switches between a ground phase and an air phase.

On the ground he casts {spell:28542}, a curse on several players that drains their health. Decursers must remove it fast. Moving {spell:28547} storms wander around the room. Do not stand in them. He has a tail sweep behind him and a cleave in front, so stand at his sides.

About once a minute he flies up into the air. He freezes a few random players into {spell:28522} ice blocks. Then he takes a deep breath and casts {spell:28524}, a huge frost blast that kills anyone who can see him. |cffff2020Hide behind an ice block|r so it is between you and Sapphiron. After the breath he lands and the ground phase starts again.

Below 10% health he stops flying. After 15 minutes he goes berserk.
]],

    preparation = [[
- 2 tanks (10-man and 25-man), 3 healers (10) or 6 healers (25)
- Players who can remove curses: mages, druids, and restoration shamans (Cleanse Spirit)
- Assign decursers so every Life Drain is removed fast
- The whole raid takes constant frost damage from his Frost Aura. Healers need to plan for steady raid healing
- Frost resistance gear is not needed at level 80 for normal raids
- Enable DBM: it warns for air phase, Deep Breath and Blizzard under you
]],

    phases = {
        { title = "Ground phase", text = [[
- The tank holds Sapphiron facing away from the raid
- Melee attack from his sides. Do not stand behind him (Tail Sweep) or in front of him (Cleave)
- Ranged and healers spread out at range
- Life Drain curses several players. Decursers remove it right away
- Blizzards move around the room. Walk out of them
- The first air phase comes about 50 seconds after the pull
]] },
        { title = "Air phase (about every minute)", text = [[
- Sapphiron flies up. Spread out about 12 yards apart, so Icebolt does not hit others
- He freezes several players in ice blocks. Players in a block are safe
- Then he takes a deep breath (DBM warns you). You have a few seconds
- |cffff2020Run behind an ice block|r so the block is between you and Sapphiron. If you can see him, you die
- After the breath he lands. Tanks pick him up again
]] },
        { title = "Below 10% health", text = [[
Sapphiron no longer flies. Everyone uses their cooldowns and kills him. Keep dodging Blizzards and removing curses.
]] },
    },

    tank = [[
- Pick him up and turn him so his head faces away from the raid and his tail faces a wall or empty space
- Keep him in one spot. Moving him around spreads Blizzards everywhere
- When he lands, he resets his threat. Taunt and pick him up fast
- During the air phase you hide like everyone else
]],

    healer = [[
- Frost Aura damages everyone constantly. Use efficient group heals
- Life Drain targets lose health quickly until the curse is removed. Spot-heal them
- Decursing healers (druids, shamans): help remove Life Drain
- In the air phase spread out, then hide behind an ice block for the breath. Do not stop to finish a cast
- Heal players who come out of ice blocks
]],

    dps = [[
- Melee: attack from the sides only
- Ranged: spread out and keep away from Blizzards
- Mages and druids: remove Life Drain curses as soon as they appear
- Air phase: spread, then hide behind an ice block before the breath
- Save cooldowns for the last 10% when he cannot fly
]],

    warnings = [[
- |cffff2020Hide behind an ice block for Frost Breath.|r If you can see Sapphiron when it lands, you die
- |cffff2020Remove Life Drain curses fast.|r
- Walk out of Blizzards
- Never stand behind him (Tail Sweep) or in front (Cleave)
- Spread out in the air phase
- Berserk after 15 minutes
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. In 25-man:

- Life Drain ({spell:55665}) hits more players, so you need more decursers
- More Blizzards ({spell:55699}) move around the room
- More players are frozen in the air phase, giving more blocks to hide behind, but you must still spread so Icebolt does not hit others
- Frost Aura and Tail Sweep ({spell:55696}) hit harder
- Achievement: "The Hundred Club" - kill Sapphiron with no one in the raid above 100 frost resistance
]],

    abilities = {
        {
            name = "Frost Breath",
            spellId = 28524,
            danger = "high",
            target = "Everyone who can see Sapphiron",
            timing = "End of every air phase",
            description = [[ A massive frost blast that kills anyone in line of sight of Sapphiron. ]],
            response = [[ Hide behind an ice block so it blocks your view of Sapphiron. ]],
        },
        {
            name = "Life Drain",
            spellId = 28542,
            danger = "high",
            target = "Several random players",
            timing = "About every 24 seconds in the ground phase",
            description = [[ A curse that drains a lot of health from the target every few seconds until it is removed. ]],
            response = [[ Mages, druids and shamans remove the curse immediately. ]],
        },
        {
            name = "Icebolt (Ice Block)",
            spellId = 28522,
            danger = "medium",
            target = "Random players in the air phase",
            description = [[ Freezes a player in an ice block and damages players close to them. ]],
            response = [[ Spread out about 12 yards apart. Use the blocks as cover for Frost Breath. ]],
        },
        {
            name = "Blizzard",
            spellId = 28547,
            danger = "medium",
            target = "Moves around the room",
            timing = "Ground phase",
            description = [[ A moving frost storm that deals damage and slows anyone inside. ]],
            response = [[ Walk out of it right away. ]],
        },
        {
            name = "Tail Sweep",
            spellId = 55696,
            danger = "medium",
            target = "Players behind Sapphiron",
            timing = "About every 9 seconds",
            description = [[ Hits players behind him and knocks them back. ]],
            response = [[ Never stand behind him. Melee attack from the sides. ]],
        },
    },

    chat = {
        summary = {
            "Melee on the sides only: Tail Sweep behind, Cleave in front.",
            "Remove Life Drain curses at once (mages, druids, shamans).",
            "Walk out of moving Blizzards.",
            "Air phase: spread 12 yards. On Deep Breath hide behind an ice block or you die.",
            "Below 10% he stays on the ground - use all cooldowns.",
        },
        tank = {
            "Face him away from the raid, tail to empty space, keep him in one spot.",
            "Taunt him right away when he lands from the air phase.",
        },
        healer = {
            "Constant raid damage from Frost Aura - use efficient group heals.",
            "Spot heal Life Drain targets and help decurse if you can.",
            "Air phase: stop casting and hide behind an ice block before the breath.",
        },
        dps = {
            "Melee from the sides. Ranged spread out and dodge Blizzards.",
            "Mages and druids: decurse Life Drain first, damage second.",
            "Air phase: spread, then hide behind an ice block for Frost Breath.",
        },
    },
})

-------------------------------------------------------------------------------
-- Kel'Thuzad
-------------------------------------------------------------------------------
RTG:RegisterTactics("NAXX_KelThuzad", {
    summary = "Three phases: kill waves of adds for almost 4 minutes, then fight Kel'Thuzad while dodging Shadow Fissures and spreading out, and handle Guardians of Icecrown at 45%.",

    overview = [[
Kel'Thuzad is the final boss of Naxxramas. The fight has three phases.

Phase 1 (about 3 minutes 48 seconds): Kel'Thuzad does not fight yet. Waves of undead come out of the alcoves around the room: weak skeletons, big abominations and slow Soul Weavers. The raid stands in the middle of the room and kills them.

Phase 2: Kel'Thuzad joins the fight. He casts Frostbolts that must be interrupted. He drops {spell:27810} under players (a dark circle that kills you after a few seconds), freezes several players with {spell:27808}, and turns a healer or caster into a mana bomb with {spell:27819}. Spread out and react fast.

Phase 3 starts at 45% health. Guardians of Icecrown join the fight. Tanks or priests must handle them while the raid keeps damaging Kel'Thuzad.
]],

    preparation = [[
- 10-man: 2-3 tanks, 3 healers. 25-man: 3-4 tanks, 6-7 healers
- Assign an interrupt rotation for Frostbolt (rogues, warriors, death knights, shamans, mages)
- 25-man: assign crowd control for Chains of Kel'Thuzad (mind control). Priests should be ready with Shackle Undead for the Guardians
- Enable DBM. It warns about Shadow Fissure under you, Detonate Mana on you and Frost Blast targets
- Agree where ranged players spread out in phase 2 (usually in a ring around the boss)
]],

    phases = {
        { title = "Phase 1 - Adds (about 3:48)", text = [[
- Everyone stands in the middle of the room. Do not walk into the alcoves around the edge, you will pull more adds
- Soldiers of the Frozen Wastes (skeletons): weak, but they explode when they reach someone. Kill them with ranged and area damage before they arrive
- Unstoppable Abominations: big and slow. A tank picks them up. They give the tank a stacking Mortal Wound
- Soul Weavers: slow, lots of health, and hit players in front of them with a wail. Kill them as they come in
- After about 3 minutes 48 seconds Kel'Thuzad becomes active
]] },
        { title = "Phase 2 - Kel'Thuzad (100% to 45%)", text = [[
- Main tank picks up Kel'Thuzad. Kill any adds still alive
- Ranged and healers spread out about 12 yards apart around the room
- Interrupt every Frostbolt. A missed one can kill a player. He also casts a Frostbolt Volley on the whole raid that cannot be interrupted, so healers stay ready
- Shadow Fissure: a dark red circle under a player. Move out immediately, it erupts after about 5 seconds
- Detonate Mana: the target must run away from everyone before it explodes
- Frost Blast: several players are frozen and lose a lot of health. Healers heal them fast
- 25-man: Chains of Kel'Thuzad mind controls a few players every 90 seconds. Crowd control them, do not kill them
]] },
        { title = "Phase 3 - Guardians of Icecrown (45% to 0%)", text = [[
- Kel'Thuzad calls for help and Guardians of Icecrown come out of the alcoves
- Off-tanks pick them up, or priests keep them shackled with Shackle Undead
- Do not try to kill the Guardians. Keep damaging Kel'Thuzad
- All phase 2 mechanics continue. Keep spreading, interrupting and dodging fissures
]] },
    },

    tank = [[
- Phase 1: pick up Unstoppable Abominations as they arrive. Tank them where the raid can hit them. Watch your Mortal Wound stacks
- Phase 2: main tank picks up Kel'Thuzad quickly. He is not hard to tank, but watch for Shadow Fissure under you
- Phase 3: off-tanks pick up the Guardians of Icecrown and hold them away from the raid. They hit harder over time, so use cooldowns
- 25-man: if you are mind controlled, you will attack the raid. Your team will crowd control you
]],

    healer = [[
- Phase 1: heal the abomination tank and anyone hit by exploding skeletons
- Phase 2: Frost Blast is the biggest danger. Frozen players lose a lot of health in 4 seconds. Heal them right away
- Detonate Mana drains your mana and explodes on players near you. If it is on you, run away from the group
- Spread out about 12 yards apart
- Move out of Shadow Fissures even if it cancels a heal
]],

    dps = [[
- Phase 1: kill skeletons first (they explode), then Soul Weavers, then abominations
- Phase 2: full damage on Kel'Thuzad. Interrupt Frostbolt if you are in the rotation
- Spread out, move out of Shadow Fissures, and run away if you get Detonate Mana
- 25-man: crowd control mind-controlled players (polymorph, fear, stuns). Never kill them
- Phase 3: ignore the Guardians unless your raid leader says otherwise. Stay on Kel'Thuzad
]],

    warnings = [[
- |cffff2020Move out of Shadow Fissure at once.|r It kills almost anyone after a few seconds
- |cffff2020Interrupt every Frostbolt.|r
- |cffff2020Stay spread out in phase 2 and 3.|r Frost Blast and Detonate Mana hit everyone nearby
- Do not walk into the alcoves in phase 1
- 25-man: do not kill mind-controlled raid members
- Do not attack shackled Guardians, it breaks the shackle
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
There is no Heroic mode in Naxxramas. In 25-man:

- {spell:28410} (Chains of Kel'Thuzad) appears only in 25-man. About every 90 seconds, a few players are mind controlled for 20 seconds. They get stronger and attack the raid. Crowd control them. Some melee remove their weapons (DBM has an option for this) so they hit less hard while controlled
- More adds spawn in phase 1
- More Guardians of Icecrown appear in phase 3, so you need more off-tanks or Shackle Undead
- Frost Blast and Detonate Mana hit harder
]],

    alternatives = {
        { title = "Guardians: tank or shackle", text = [[
Some raids tank the Guardians of Icecrown with off-tanks. Others use priests with Shackle Undead to keep them out of the fight. Shackle Undead can break, so a tank should be ready to pick up a Guardian that gets loose.
]] },
    },

    abilities = {
        {
            name = "Shadow Fissure",
            spellId = 27810,
            danger = "high",
            target = "Random player",
            timing = "About every 17-35 seconds",
            description = [[ A dark circle appears under a player and erupts after about 5 seconds, killing almost anyone in it. ]],
            response = [[ Move out of it immediately. ]],
        },
        {
            name = "Frost Blast",
            spellId = 27808,
            danger = "high",
            target = "Several players",
            timing = "About every 35-43 seconds",
            description = [[ Freezes several players for about 4 seconds and deals heavy damage to them and players close to them. ]],
            response = [[ Spread out. Healers heal frozen players fast. ]],
        },
        {
            name = "Frostbolt",
            icon = "Interface\\Icons\\Spell_Frost_FrostBolt02",
            danger = "high",
            target = "Current target",
            timing = "Phase 2 and 3",
            description = [[ A strong single-target frostbolt that can kill a player. ]],
            response = [[ Interrupt every cast with an interrupt rotation. ]],
        },
        {
            name = "Detonate Mana",
            spellId = 27819,
            danger = "medium",
            target = "Random mana user",
            timing = "About every 25-55 seconds",
            description = [[ Burns the target's mana and then explodes, damaging nearby players. ]],
            response = [[ The target runs away from everyone. ]],
        },
        {
            name = "Chains of Kel'Thuzad",
            spellId = 28410,
            danger = "high",
            target = "A few random players (25-man only)",
            timing = "About every 90 seconds, lasts 20 seconds",
            description = [[ Mind controls players. They attack the raid with extra power. ]],
            response = [[ Crowd control them with polymorph, fear or stuns. Do not kill them. ]],
        },
        {
            name = "Guardians of Icecrown",
            spellId = 29897,
            danger = "medium",
            target = "Raid",
            timing = "Phase 3 (from 45% health)",
            description = [[ Large undead guardians that join the fight and hit harder over time. ]],
            response = [[ Off-tanks hold them or priests shackle them. DPS stay on Kel'Thuzad. ]],
        },
    },

    chat = {
        summary = {
            "Phase 1 (about 4 min): stay in the middle, kill skeletons before they reach us, tank abominations.",
            "Phase 2: spread 12 yards apart. Move out of Shadow Fissure (dark circle) right away.",
            "Interrupt every Frostbolt. Detonate Mana on you: run away from the raid.",
            "Frost Blast freezes players: healers heal them fast.",
            "At 45% Guardians of Icecrown come: off-tanks or Shackle Undead, DPS stay on the boss.",
        },
        tank = {
            "Phase 1: pick up Abominations, watch Mortal Wound stacks.",
            "Phase 2: main tank grabs Kel'Thuzad fast. Move out of fissures.",
            "Phase 3: off-tanks hold Guardians away from the raid, use cooldowns.",
        },
        healer = {
            "Frost Blast targets lose a lot of health in 4 seconds - heal them first.",
            "Stay spread 12 yards. Detonate Mana on you: run away from the group.",
            "Move out of Shadow Fissure even if it cancels a heal.",
        },
        dps = {
            "Phase 1: skeletons first, then Soul Weavers, then Abominations.",
            "Phase 2-3: full damage on Kel'Thuzad, interrupt Frostbolt in your turn.",
            "25-man: crowd control mind-controlled players, never kill them.",
            "Ignore the Guardians unless the raid leader says otherwise.",
        },
    },
})
