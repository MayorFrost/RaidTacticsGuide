-- Raid Tactics Guide - Icecrown Citadel, part 2
-- Professor Putricide, Blood Prince Council, Blood-Queen Lana'thel,
-- Valithria Dreamwalker, Sindragosa, The Lich King
-- Spell ids taken from the Warmane DBM-Icecrown modules.

local RTG = RaidTacticsGuide

---------------------------------------------------------------------------
-- Professor Putricide
---------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Putricide", {
    summary = "A three-phase add-control fight: handle the green and orange oozes, dodge gas bombs and goo, then tank-swap Mutated Plague at the end.",

    overview = [[
Professor Putricide is the last boss of the Plagueworks and the first real "everyone must do their job" fight in Icecrown Citadel. He has three phases, split at 80% and 35% health. In every phase new mechanics are added on top of the old ones, so the fight gets harder the longer it goes.

In phase 1 and phase 2 he creates two kinds of ooze adds, one at a time: a green Volatile Ooze and an orange Gas Cloud. Each one picks a player and chases them. How the raid handles these two adds decides almost every attempt. In phase 2 he also throws Choking Gas Bombs and Malleable Goo. In phase 3 the adds stop coming and the fight becomes a race: the tanks get a stacking disease that damages the whole raid.

What wipes raids: the green ooze exploding on a single player (nobody stacked with them), the orange cloud catching its target, people standing in gas bombs, and in phase 3 the healers running out of mana because the tanks did not swap. The enrage timer is about 10 minutes (shorter on some Warmane realms).
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- One player is assigned to the |cffff2020Abomination|r (see the Abomination section). In 10-man this is often the off-tank, who has little to do until phase 3.
- Decide one green-ooze stack spot (usually in front of the boss, near the main tank) and tell everyone.
- Bring plenty of ranged DPS: they kill the orange Gas Cloud while it chases its target.
- Melee and ranged stand loosely around the boss in the middle of the room. Keep the room tidy: slime puddles will appear and should not be stood in.
- Heroic: assign Unbound Plague passing pairs or groups before the pull.
]],

    phases = {
        { title = "Phase 1 - Oozes (100% to 80%)", text = [[
Putricide stays on the main tank. About every 35 seconds he casts {spell:70351}, which creates an ooze on one side of the room. The colour alternates.

# Green - Volatile Ooze
- It roots one player with {spell:70447} and slowly moves to them.
- When it reaches the player it explodes. The damage is |cffff2020split between everyone near the target|r. One player alone dies, ten players stacked take a small hit each.
- Everyone (except heroic Unbound Plague carriers) runs to the rooted player and stacks on them. DPS kill the ooze while it walks.

# Orange - Gas Cloud
- It marks one player with {spell:70672}. That player must |cffff2020run away from the cloud|r (kite = keep walking away while it follows you).
- Gaseous Bloat loses stacks as time passes. If the cloud catches the player early, the explosion is huge. Ranged DPS kill the cloud while the target kites it in a big circle.
- The Abomination slows the cloud with its Regurgitated Ooze to make this easy.

# Slime Puddles
- {spell:70341} drops growing green puddles under random players. Do not stand in them. The Abomination eats them to keep them small.

At about 83% the raid gets ready: DPS should stop pushing the boss if an ooze is just about to spawn, so you do not enter the transition with a fresh add.
]] },
        { title = "Transition at 80%", text = [[
Normal: Putricide casts {spell:71617}. The whole raid is stunned and takes very little damage. He walks to his table and drinks a potion ({spell:71621}). Any ooze that is still alive stays alive, so kill it before the stun if you can.

Heroic: there is no Tear Gas. Instead he casts Volatile Experiment, which spawns a green ooze AND an orange cloud at the same time. The raid must handle both adds while he drinks (around 30 seconds). See the Heroic section.
]] },
        { title = "Phase 2 - Bombs and goo (80% to 35%)", text = [[
Everything from phase 1 continues (oozes, puddles), plus two new attacks:
- {spell:71255}: Putricide drops gas bombs around himself. After a short timer they explode and damage everyone nearby. |cffff2020Melee: step away from the bombs|r, then come back after the explosion.
- {spell:72295}: a slow green blob thrown at the ranged players. Where it lands it deals damage and slows attack and casting speed a lot. Ranged move away from the landing spot; spread a little so one goo does not hit many people.

The raid keeps doing the stack (green) and kite (orange) routine. At about 38% get ready for the next transition.
]] },
        { title = "Transition at 35%", text = [[
Normal: Tear Gas again, then he drinks {spell:71893}. Heroic: another Volatile Experiment (green + orange at once).

After this transition no new oozes are created. Kill anything that is still up. The Abomination is no longer needed in phase 3, so its player goes back to their normal role.
]] },
        { title = "Phase 3 - Mutated Plague (35% to 0%)", text = [[
Putricide stops making oozes and hits the main tank with {spell:72451} about every 10 seconds. Each stack makes the whole raid take damage every few seconds, and the damage grows with the number of stacks.

- |cffff2020Tanks must swap|r so the stacks can fall off the other tank. A common swap point is 3-4 stacks on 10-man and 2-3 on 25-man, but healers decide what they can handle.
- When the plague expires or the tank dies, the boss is healed. Never let a tank with many stacks die.
- Slime puddles and gas bombs still happen. Keep dodging.
- This is the burn phase: use Bloodlust/Heroism here and all DPS cooldowns.
]] },
    },

    tank = [[
- Main tank: hold Putricide in the middle of the room facing away from the raid. He does not hit very hard in phases 1 and 2.
- Off-tank: in 10-man you are often the Abomination driver. In 25-man you can help pick up anything loose.
- When the green ooze roots someone, walk the boss close to the stack spot if needed so melee can stack and keep hitting.
- Phase 2: when Choking Gas Bombs drop, move the boss a few steps away from them so melee keep DPS.
- Phase 3: agree on a swap count before the pull. Taunt when the other tank reaches it. The tank without the debuff waits for their stacks to expire. Use cooldowns when the stacks are high.
]],

    healer = [[
- Green ooze: when the ooze explodes everyone stacked takes a share of the damage. Have an AoE heal ready right after the explosion.
- Orange cloud: the Gaseous Bloat target takes damage over time while kiting. Keep them topped up and give them speed spells if you have them.
- |cffff2020Never cleanse Mutated Plague|r from the tanks in phase 3. When it is removed, Putricide is healed.
- Phase 2: Malleable Goo slows casting a lot. Move away from the landing spot.
- Phase 3: raid damage climbs with every Mutated Plague stack. Save mana and big cooldowns for this phase. Tell the tanks if you need an earlier swap.
]],

    dps = [[
- Ooze priority: kill the green Volatile Ooze while it walks to its target, and the orange Gas Cloud while it chases its target. Ranged DPS are the main add killers.
- When someone is rooted by Volatile Ooze Adhesive, |cffff2020run and stack on them|r. Do not stay on the boss.
- If YOU get Gaseous Bloat, run away from the cloud in a wide circle. Do not run through the raid.
- Watch the boss health near 80% and 35%. Your raid leader may call "stop DPS" so you do not enter a transition with an ooze just spawned.
- Phase 2 melee: step out of Choking Gas Bombs. Ranged: step away from Malleable Goo.
- Phase 3 is a pure burn. Use all cooldowns. The faster the boss dies, the fewer plague stacks the tanks collect.
]],

    warnings = [[
- |cffff2020Always stack on the Volatile Ooze target.|r A lonely target dies and the extra damage can chain into a wipe.
- |cffff2020Never let the Gas Cloud catch its target early.|r Kite it and kill it.
- Do not stand in green slime puddles or near Choking Gas Bombs when they explode.
- Do not cleanse Mutated Plague. Removing it heals the boss.
- Phase 3: a tank death with high Mutated Plague stacks heals the boss a lot. Swap in time.
- Do not push the boss into a transition while an ooze has just spawned unless your raid planned for it.
]],

    heroic = [[
# Unbound Plague
- From the start of the fight, a random player gets {spell:70911}. Its damage grows every second and kills in about 15 seconds.
- Pass it: the carrier walks into another player (within about 3 yards). The new carrier gets the plague, the old one gets Plague Sickness, which makes Unbound Plague much more dangerous for them. Pass it around in your assigned group about every 10-15 seconds.
- Plague carriers should not join the green ooze stack, or the plague spreads to everyone.

# Transitions
- No Tear Gas stun and no break. Putricide casts Volatile Experiment and spawns a green ooze and an orange cloud together, then drinks for a long time (about 30 seconds in 10-man). The raid must stack for the green ooze while the orange target kites, then kill both. The Abomination keeps slowing adds through the whole transition.

# Ooze Variable and Gas Variable (25-man)
- From the first transition on (phases 2 and 3), half the raid gets {spell:70352} and half gets {spell:70353}. A player with one variable cannot damage the other kind of add. Ooze-variable players kill the green oozes, gas-variable players kill the orange clouds.

# General
- Slime puddles grow faster, oozes hit harder, and the enrage is tighter. The Abomination is much more important on Heroic.
]],

    alternatives = {
        { title = "With an Abomination (standard)", text = [[
At the start, one player clicks the table behind Putricide (the "Drink Me" table) to become a Mutated Abomination.
- Eat Ooze: walk over slime puddles and eat them. This keeps the floor clean and gives the Abomination energy.
- {spell:70539}: shoot it at the Gas Cloud (and the green ooze) to slow it down. This makes kiting very easy.
- {spell:70542}: attack the oozes with it. It weakens their armour so DPS kill them faster.
The Abomination is a big help but needs a player who knows the vehicle bar.
]] },
        { title = "No Abomination", text = [[
Some groups skip the Abomination, mostly on 10-man Normal with good gear.
- Ranged DPS must kill the Gas Cloud without the slow, so the Gaseous Bloat target kites in a large circle.
- Nobody eats the slime puddles, so everyone must keep moving away from them. The fight should be fast so the floor does not fill up.
This frees a DPS slot but is less forgiving.
]] },
        { title = "Pushing through phase 1 (heroic, strong DPS)", text = [[
Strong heroic groups often do not stop DPS before the 80% transition. They push the boss into the Volatile Experiment as soon as possible so fewer oozes and Unbound Plagues happen in phase 1. This only works if the raid can handle a green and orange add at the same time without panic.
]] },
    },

    abilities = {
        {
            name = "Volatile Ooze Adhesive",
            spellId = 70447,
            danger = "high",
            target = "Random player (green ooze target)",
            timing = "Phases 1 and 2, every other ooze spawn",
            description = [[The green Volatile Ooze roots a player and moves to them. When it arrives it explodes, and the damage is split between everyone nearby.]],
            response = [[Everyone stacks on the rooted player. DPS kill the ooze. Heroic Unbound Plague carriers stay out of the stack.]],
        },
        {
            name = "Gaseous Bloat",
            spellId = 70672,
            danger = "high",
            target = "Random player (orange cloud target)",
            timing = "Phases 1 and 2, every other ooze spawn",
            description = [[The orange Gas Cloud chases a player with a stacking damage-over-time effect. If it reaches the player, it explodes with damage based on the remaining stacks.]],
            response = [[The target kites the cloud away from the raid. Ranged DPS kill it and the Abomination slows it.]],
        },
        {
            name = "Unbound Plague",
            spellId = 70911,
            danger = "high",
            target = "Random player",
            heroicOnly = true,
            description = [[A disease whose damage grows every second. It jumps to a nearby player when you walk into them, leaving you with Plague Sickness.]],
            response = [[Pass it to another player in your group about every 10-15 seconds. Never pass it into a stack of players.]],
        },
        {
            name = "Mutated Plague",
            spellId = 72451,
            danger = "high",
            target = "Current tank",
            timing = "Phase 3, about every 10 seconds",
            description = [[A stacking disease on the tank. Every stack damages the whole raid, and the boss is healed when it falls off.]],
            response = [[Tanks swap at the agreed stack count. Never cleanse it. Raid uses Bloodlust and burns the boss.]],
        },
        {
            name = "Choking Gas Bomb",
            spellId = 71255,
            danger = "medium",
            target = "Area around the boss",
            timing = "Phase 2 and 3, about every 35 seconds",
            description = [[Putricide drops gas bombs on the ground. They explode after a short timer and damage everyone close to them.]],
            response = [[Melee step away from the bombs and come back after they explode. Tanks move the boss slightly.]],
        },
        {
            name = "Malleable Goo",
            spellId = 72295,
            danger = "medium",
            target = "Ranged players",
            timing = "Phase 2 and 3, about every 20 seconds",
            description = [[A slow green projectile. It damages and heavily slows attack and cast speed of players where it lands.]],
            response = [[Watch for the blob and move away from where it will land.]],
        },
        {
            name = "Slime Puddle",
            spellId = 70341,
            danger = "medium",
            target = "Random players",
            timing = "All phases, about every 35 seconds",
            description = [[Creates green puddles under players that keep growing and deal damage to anyone standing inside.]],
            response = [[Move out. The Abomination eats the puddles to keep them small.]],
        },
        {
            name = "Tear Gas",
            spellId = 71617,
            danger = "low",
            target = "Whole raid",
            timing = "Normal mode, at 80% and 35%",
            description = [[Stuns the whole raid while Putricide drinks his potion. You take almost no damage while stunned.]],
            response = [[Kill any ooze before the stun if possible. Get ready to move as soon as it ends.]],
        },
    },

    chat = {
        summary = {
            "Green ooze roots a player: EVERYONE stack on that player to split the explosion, DPS kill the ooze.",
            "Orange cloud: its target kites it away from the raid, ranged DPS kill it. Abomination slows it.",
            "Do not stand in green slime puddles. Melee move out of Choking Gas Bombs in phase 2.",
            "Phase 2: ranged dodge Malleable Goo (green blob thrown at you).",
            "Phase 3 (35%): no more oozes. Tanks swap Mutated Plague, everyone burn with Bloodlust.",
        },
        tank = {
            "Hold the boss in the middle facing away. Move him a few steps out of gas bombs for melee.",
            "Phase 3: swap at the agreed Mutated Plague stack count. Never die with high stacks, it heals the boss.",
        },
        healer = {
            "AoE heal right after the green ooze explosion on the stack.",
            "Keep the Gaseous Bloat target alive while they kite. Never cleanse Mutated Plague, it heals the boss.",
            "Save mana for phase 3, raid damage grows with every Mutated Plague stack.",
        },
        dps = {
            "Kill the green ooze and the orange cloud while they walk. Stack on the rooted player.",
            "If you get Gaseous Bloat, kite the cloud in a wide circle away from the raid.",
            "Watch for stop-DPS calls near 80% and 35%. Phase 3: use all cooldowns.",
        },
    },
})

---------------------------------------------------------------------------
-- Blood Prince Council
---------------------------------------------------------------------------
RTG:RegisterTactics("ICC_BloodPrinces", {
    summary = "Three princes share one health pool. Only the empowered prince takes real damage, so the raid switches targets about every 46 seconds.",

    overview = [[
The Blood Prince Council is three vampire princes: Prince Valanar, Prince Taldaram and Prince Keleseth. They share one health pool. At any time one of them is empowered by {spell:70952} (or the matching buff for the other princes). Only the empowered prince takes real damage, and his abilities become much stronger.

The empowerment moves to another prince about every 46 seconds. When it moves, all DPS must |cffff2020switch to the new empowered prince|r. Damage on the other two princes is wasted.

Each prince has his own mechanic: Valanar drops Kinetic Bombs and casts Shock Vortex, Taldaram sends balls of fire at players, and Keleseth throws shadow bolts at his tank and creates Dark Nuclei. Raids wipe when Kinetic Bombs reach the ground, when an Empowered Shock Vortex knocks the raid around, or when an Empowered Flame explodes in the middle of the raid. After the princes are freed there is a short roleplay of about 30 seconds before the first pull.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5-3healers, the rest DPS , One tank holds Valanar and Taldaram together, the other tank (or a warlock/hunter) holds Keleseth.
- Keleseth does not melee. He casts Shadow Lance at his target. His tank should collect Dark Nuclei (see below). Some groups use a warlock or a hunter tank for him.
- Assign 2-4 ranged players (hunters, mages, warlocks, elemental shamans) to the Kinetic Bombs. They keep shooting the bombs back up into the air.
- Raid stands spread (about 12 yards apart) on the ranged side of the room because of Empowered Shock Vortex. Turn on a range check (DBM range frame).
- Mark the princes or use DBM's skull on the empowered prince.
]],

    phases = {
        { title = "Single phase - target switching", text = [[
The fight has one phase that repeats until the shared health reaches zero.

- About every 46 seconds the empowerment moves. DBM shows "Target switch" and the empowered prince has a glowing effect. Switch to him immediately.
- When a prince becomes empowered, his next big ability is the empowered version. Get ready for it:
- # Valanar empowered
- {spell:72039} hits everyone. Everyone must already be spread at least 12 yards apart so nobody is knocked into others.
- # Taldaram empowered
- {spell:72040}: a ball of flame chases one player. The player runs away from the raid. The ball gets weaker the further it travels, so a long kite means a small explosion.
- # Keleseth empowered
- His Shadow Lance hits much harder. The Keleseth tank uses Dark Nuclei and cooldowns.

Kinetic Bombs keep falling from the ceiling during the whole fight no matter who is empowered.
]] },
    },

    tank = [[
- Valanar tank: keep Valanar near the Taldaram tank (or tank both in 10-man). Move out of Shock Vortex circles when they spawn under you.
- Taldaram tank: Taldaram's Glittering Sparks is a frontal cone that slows and burns. Keep him facing away from the raid.
- Keleseth tank: Keleseth casts Shadow Lance on you instead of meleeing. He also spawns {spell:71943} orbs. Each orb that stays near you gives you a stack of Shadow Resonance, which lowers shadow damage taken. Gather 3-4 orbs and keep them on you. If you are a melee tank you can stand in melee range; caster tanks can stand at range.
- All tanks: the princes are taunt-able. When a prince becomes empowered, his abilities hurt more, so pop a cooldown if he hits you.
]],

    healer = [[
- Damage spikes on the Keleseth tank when Keleseth is empowered. Have a healer assigned to him.
- Empowered Shock Vortex hits the whole raid. AoE heal after it.
- The Empowered Flames target can take a big hit at the end of the kite. Watch them.
- Kinetic Bomb explosions hurt everyone near them. If one lands, heal the area.
- Stay spread 12 yards from other players during Valanar empowerment.
]],

    dps = [[
- |cffff2020Only attack the empowered prince.|r Use DBM's "switch target" warning or the skull mark. Damage on the other princes is wasted.
- Multi-dotting the non-empowered princes is wasted damage. Do not do it.
- Assigned ranged: shoot Kinetic Bombs as they fall. Each hit pushes the bomb up. Never let a bomb reach the floor. Do not use AoE on them unless you mean to.
- Shock Vortex: a whirlwind on the ground under a random player. Move out of it.
- If an Empowered Flame chases you, run away from the raid in a long line. Do not run through other players.
- Stay 12 yards from other players when Valanar is empowered.
]],

    warnings = [[
- |cffff2020Never let Kinetic Bombs touch the ground.|r They explode and knock people around.
- |cffff2020Spread before Empowered Shock Vortex.|r Stacked players get knocked into each other and off position.
- The Empowered Flames target must run away from the raid, never into it.
- Do not attack non-empowered princes.
- Keleseth's tank must keep Dark Nuclei on them or the shadow damage becomes too much.
- Melee should not stand in front of Taldaram (Glittering Sparks).
]],

    heroic = [[
- {spell:72999}: every player gets a stacking debuff whenever they move. Each stack deals shadow damage. The stacks fade after about 10 seconds of standing still. Move only when you must (vortex, flames, bombs) and then stand still.
- Glittering Sparks and all empowered abilities hit much harder, so healers need more cooldowns.
- Bomb handlers must move as little as possible because of Shadow Prison. Pick a spot where you can see the bombs fall.
- The empowered target-swap rhythm is the same, but the DPS check is tighter.
]],

    alternatives = {
        { title = "Keleseth tank choice", text = [[
- Normal tank (Paladin/Death Knight/Warrior/Druid): gathers Dark Nuclei and tanks Keleseth in melee range. Safe and simple.
- Warlock or hunter "tank": a ranged class with high threat holds Keleseth at range and collects Dark Nuclei. This frees a tank slot in 10-man, but the player needs good stamina and healer attention when Keleseth is empowered.
]] },
    },

    abilities = {
        {
            name = "Empowered Shock Vortex",
            spellId = 72039,
            danger = "high",
            target = "Whole raid",
            timing = "When Valanar becomes empowered",
            description = [[A raid-wide burst that knocks every player back. Players standing close together are thrown into each other and take heavy damage.]],
            response = [[Everyone spreads at least 12 yards apart before it lands.]],
        },
        {
            name = "Kinetic Bomb",
            spellId = 72053,
            danger = "high",
            target = "Area (bomb falls from the ceiling)",
            timing = "About every 18-24 seconds",
            description = [[Valanar summons a bomb that slowly falls to the floor. If it touches the ground it explodes with damage and knockback.]],
            response = [[Assigned ranged players hit the bomb to push it back up until it expires.]],
        },
        {
            name = "Empowered Flames",
            spellId = 72040,
            danger = "high",
            target = "Random player",
            timing = "When Taldaram is empowered",
            description = [[A large ball of fire chases a random player and explodes on contact. It gets weaker the further it travels.]],
            response = [[The target runs far away from the raid. Others do not stand in its path.]],
        },
        {
            name = "Shadow Prison",
            spellId = 72999,
            danger = "high",
            target = "Everyone",
            heroicOnly = true,
            description = [[Every movement adds a stack. Each stack deals shadow damage. Stacks fade after a few seconds of standing still.]],
            response = [[Move only for mechanics, then stand still and let the stacks drop.]],
        },
        {
            name = "Shock Vortex",
            spellId = 72037,
            danger = "medium",
            target = "Random player",
            timing = "About every 18-22 seconds",
            description = [[Valanar places a whirlwind on the ground that knocks back anyone who walks into it.]],
            response = [[Step out of the vortex and keep away from it.]],
        },
        {
            name = "Conjure Flames",
            spellId = 71718,
            danger = "medium",
            target = "Random player",
            timing = "About every 15-30 seconds",
            description = [[Taldaram sends a ball of flame at a player. It explodes when it reaches them.]],
            response = [[Move a little away from other players so only you get hit.]],
        },
        {
            name = "Glittering Sparks",
            spellId = 71807,
            danger = "medium",
            target = "Cone in front of Taldaram",
            description = [[A frontal cone that burns and slows players.]],
            response = [[Taldaram's tank keeps him facing away. Melee stay behind him.]],
        },
        {
            name = "Dark Nucleus",
            spellId = 71943,
            danger = "low",
            target = "Keleseth's tank",
            timing = "About every 10-16 seconds",
            description = [[Keleseth creates shadow orbs. An orb that stays close to a player gives them Shadow Resonance, which reduces shadow damage taken.]],
            response = [[Keleseth's tank gathers 3-4 orbs. Other players should not pick them up.]],
        },
    },

    chat = {
        summary = {
            "Only attack the EMPOWERED prince (skull). It changes about every 46 seconds, switch fast.",
            "Ranged on bomb duty: keep hitting Kinetic Bombs so they never touch the floor.",
            "Valanar empowered: spread 12 yards for Empowered Shock Vortex. Step out of normal vortexes.",
            "Taldaram empowered: the fire ball target runs far away from the raid.",
        },
        tank = {
            "Taldaram faces away from the raid (Glittering Sparks cone).",
            "Keleseth tank: collect 3-4 Dark Nuclei and keep them on you.",
            "Use a cooldown when your prince becomes empowered.",
        },
        healer = {
            "Big spikes on the Keleseth tank when he is empowered.",
            "AoE heal after Empowered Shock Vortex. Stay 12 yards from others.",
        },
        dps = {
            "Switch to the empowered prince right away. No DoTs on the other princes.",
            "Fire ball on you: run away from the raid. Vortex under you: move out.",
        },
    },
})

---------------------------------------------------------------------------
-- Blood-Queen Lana'thel
---------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Lanathel", {
    summary = "A strict DPS race with a bite chain: bitten players must bite someone else in time or they become mind controlled.",

    overview = [[
Blood-Queen Lana'thel is the boss of the Crimson Hall. She has a short enrage timer (about 5 to 5.5 minutes depending on the realm), so the raid needs good DPS. Her signature mechanic is the |cffff2020bite chain|r.

About 15 seconds into the fight she bites a random non-tank player with Vampiric Bite. That player becomes a vampire with {spell:70867}: they deal double damage and heal themselves. Before it runs out, they get {spell:70877}. They must then bite another player within a few seconds. If they fail, they become mind controlled (Uncontrollable Frenzy) and attack the raid. Every bite creates a new vampire, so the number of vampires doubles each round: 1, 2, 4, 8 and in 25-man up to 16.

On top of this she links players with Pact of the Darkfallen, sends Swarming Shadows trails, splashes Twilight Bloodbolts and flies up for an air phase where the raid gets feared. Raids wipe from missed bites (mind controls), bad Swarming Shadows placement, too much Bloodbolt splash, or enrage.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- Write a |cffff2020bite order|r before the pull (see Alternatives). Every vampire must know who they bite next.
- Everyone binds a key or keeps the Vampiric Bite button visible. It appears on your action bar when you are a vampire.
- Melee stack behind the boss. Ranged and healers spread at least 6 yards from each other in a loose half circle (Twilight Bloodbolt splashes in 6 yards).
- Tanks: the main tank and the off-tank stand together on the boss (Blood Mirror links them).
- Agree on a place where Swarming Shadows trails are dropped, for example along the outside edge of the room.
]],

    phases = {
        { title = "Ground phase", text = [[
- Main tank holds her. The off-tank stands next to the main tank. Blood Mirror copies damage from the main tank to the off-tank.
- {spell:71340}: 2 players (10-man) or 3 players (25-man) are linked by red chains and take damage until they stand together. The linked players run to each other (meet at the middle player or the boss) and the links break.
- {spell:71266}: a player is marked and leaves a trail of shadow on the floor. That player runs to the edge of the room and walks in a line along it, so the trail is out of the way. Everyone else moves out of the trail.
- {spell:71818}: shadow bolts on random players that splash anyone within 6 yards. Stay spread.
- The bite chain runs all the time (see the next section).
]] },
        { title = "Bite chain", text = [[
- First bite: about 15 seconds after the pull, on a random non-tank player.
- Each vampire keeps the Essence for 75 seconds in 10-man and 60 seconds in 25-man.
- When Frenzied Bloodthirst appears, you have about 15 seconds (10-man) or 10 seconds (25-man) to bite. Target the next player on the list and press Vampiric Bite. You must be in melee range of them.
- Biting someone refreshes your own Essence, so once you are a vampire you stay one and bite a new player every round. Players who are already vampires cannot be bitten. Tanks should never be bitten.
- If you fail you are mind controlled (Uncontrollable Frenzy). The raid has to kill or crowd control you. That is almost always a wipe in 25-man.
]] },
        { title = "Air phase", text = [[
About every 100-120 seconds she casts {spell:73070}, which fears the whole raid for a few seconds. Then she flies to the middle of the room and casts {spell:71772}: shadow bolts on everyone for about 6 seconds.
- Before the fear: everyone gets in position near the boss so you do not run far away while feared. Fear-immune effects help (Fear Ward, Berserker Rage, Will of the Forsaken, Tremor Totem).
- During the whirl: spread 6 yards, healers use AoE heals and raid cooldowns.
- After landing she resets the Pact and Swarming Shadows timers. Go back to your normal spots.
]] },
    },

    tank = [[
- Main tank: tank her near the middle of the room. Do not move her much; melee need a stable spot.
- Off-tank: stand right on top of the main tank. You are linked by Blood Mirror and take a copy of the main tank's damage. Expect hard hits from Delirious Slash as well, so keep your health high.
- Both tanks: never get bitten. If a vampire comes near you, step away.
- After the air phase, pick her up again quickly where she lands.
- If Pact links you, walk to the other linked players; they will usually come to you.
]],

    healer = [[
- Both tanks take heavy damage: one from melee, one from Blood Mirror. Keep them both high.
- Bitten players heal themselves while dealing damage, so they need less healing.
- Twilight Bloodbolt: stay 6 yards from others. Heal the players that got splashed.
- Pact of the Darkfallen targets take damage until they meet. Heal them while they run.
- Air phase: Bloodbolt Whirl hits everyone. Use your raid cooldowns (Divine Hymn, Tranquility, Aura Mastery, etc.).
- Healers can be bitten in 10-man if the bite list runs out of DPS, but normally you are left out.
]],

    dps = [[
- Pure DPS race: use cooldowns early and again near the end. Bloodlust is often used at the start or after the first air phase.
- Bitten? You now deal double damage. When Frenzied Bloodthirst appears, |cffff2020immediately bite the next player on the list|r. Do not wait until the last second.
- Pact on you: run to the other linked players at once.
- Swarming Shadows on you: run to the edge and walk in a line. Never drop it on the melee group.
- Melee stack behind her. Ranged spread 6 yards.
]],

    warnings = [[
- |cffff2020Missed bite = mind controlled raid member.|r Watch your Frenzied Bloodthirst timer.
- Never bite the tanks.
- Drop Swarming Shadows on the edge, not in the raid or the melee stack.
- Spread 6 yards for Twilight Bloodbolt, both on the ground and during the air phase.
- Players under Pact of the Darkfallen must move together right away.
- The enrage timer is short. Every death costs time.
]],

    heroic = [[
The mechanics are the same in Heroic mode, but everything hits much harder and the boss has much more health:
- Bloodbolts, Swarming Shadows and Pact damage are much higher, so spreading and fast reactions matter more.
- The tanks need cooldowns planned, especially during the Blood Mirror damage.
- The enrage is very tight. The bite order should give the first bites to your strongest DPS.
]],

    alternatives = {
        { title = "Bite order: strongest DPS first (standard)", text = [[
Bite your highest DPS players first, because a vampire deals double damage for a long time. A common chain on 25-man:
- First bite (random) bites the top melee or caster on the list.
- Then those two bite the next two, and so on, until all DPS are vampires.
Keep the order simple: write it in raid chat or use a bite-order addon. Healers and tanks are left out unless the list runs out.
]] },
        { title = "Melee vs ranged first", text = [[
- Melee first: melee are already stacked behind the boss, so they can reach each other for bites easily.
- Ranged first: casters lose very little DPS while walking to bite, but they must leave their spread spot.
Pick one based on your raid. Most groups bite melee to melee and ranged to ranged so nobody runs far.
]] },
        { title = "10-man with few DPS", text = [[
In 10-man there are only 5-6 DPS. By the third round you may run out of DPS to bite. Many groups then bite a healer (whoever is easiest to reach), or plan the chain so the last round has enough targets.
]] },
    },

    abilities = {
        {
            name = "Frenzied Bloodthirst",
            spellId = 70877,
            danger = "high",
            target = "Bitten players",
            timing = "Near the end of Essence of the Blood Queen",
            description = [[You must bite another player within about 15 seconds (10-man) or 10 seconds (25-man). If you do not, you become mind controlled.]],
            response = [[Target the next person on the bite list and press Vampiric Bite in melee range.]],
        },
        {
            name = "Essence of the Blood Queen",
            spellId = 70867,
            danger = "low",
            target = "Bitten players",
            description = [[Doubles your damage and heals you for part of the damage you deal. Lasts 75 seconds (10-man) or 60 seconds (25-man).]],
            response = [[Use it to deal big damage. Prepare to bite.]],
        },
        {
            name = "Pact of the Darkfallen",
            spellId = 71340,
            danger = "high",
            target = "2 (10-man) or 3 (25-man) random players",
            timing = "About every 30 seconds",
            description = [[Links players with chains that deal damage until they stand close together.]],
            response = [[Linked players run to each other straight away.]],
        },
        {
            name = "Swarming Shadows",
            spellId = 71266,
            danger = "high",
            target = "Random player",
            timing = "About every 30 seconds",
            description = [[The target leaves a trail of shadow behind them that damages anyone in it.]],
            response = [[Run to the edge of the room and drop the trail in a line. Everyone avoids the trail.]],
        },
        {
            name = "Twilight Bloodbolt",
            spellId = 71818,
            danger = "medium",
            target = "Random players",
            description = [[Shadow bolts that also splash anyone within 6 yards of the target.]],
            response = [[Ranged and healers stay spread 6 yards apart.]],
        },
        {
            name = "Incite Terror",
            spellId = 73070,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 100-120 seconds",
            description = [[Fears the whole raid before the air phase. Then she flies up and casts Bloodbolt Whirl on everyone.]],
            response = [[Use fear protection if you have it. Spread and heal through the whirl.]],
        },
        {
            name = "Blood Mirror",
            spellId = 71510,
            danger = "medium",
            target = "Off-tank",
            description = [[Links the off-tank to the main tank. The off-tank takes a copy of the damage the main tank takes.]],
            response = [[Off-tank stays with the main tank. Healers heal both tanks.]],
        },
        {
            name = "Uncontrollable Frenzy",
            spellId = 70923,
            danger = "high",
            target = "A vampire who did not bite",
            description = [[The player is mind controlled by the Blood-Queen and attacks the raid.]],
            response = [[Crowd control or kill the player. Prevent it by biting on time.]],
        },
    },

    chat = {
        summary = {
            "Bitten players: bite the next player on the list as soon as Frenzied Bloodthirst appears. Never bite tanks.",
            "Pact of the Darkfallen: linked players run together right away.",
            "Swarming Shadows on you: run to the edge and drop the trail in a line.",
            "Ranged and healers spread 6 yards for Twilight Bloodbolt.",
            "Air phase: raid is feared, then spread and heal through Bloodbolt Whirl.",
        },
        tank = {
            "Off-tank stands on the main tank (Blood Mirror). Both tanks never get bitten.",
            "Pick her up quickly where she lands after the air phase.",
        },
        healer = {
            "Both tanks take heavy damage. Save raid cooldowns for the air phase Bloodbolt Whirl.",
            "Stay 6 yards from others. Heal Pact targets while they run together.",
        },
        dps = {
            "Bite the next name on the list quickly. A missed bite means a mind control.",
            "This is a DPS race. Use cooldowns and do not die.",
        },
    },
})

---------------------------------------------------------------------------
-- Valithria Dreamwalker
---------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Valithria", {
    summary = "A healing encounter: healers bring Valithria from 50% to full health while tanks and DPS control waves of undead adds.",

    overview = [[
Valithria Dreamwalker is a friendly green dragon. You do not attack her. She starts at 50% health and you win by |cffff2020healing her to 100%|r. When she is full, she casts Dreamwalker's Rage and destroys all the adds. You lose if she dies (or, on Heroic, when the berserk timer runs out after about 7 minutes).

While the healers heal her, undead adds pour out of doors around the room: two doors in 10-man, four doors in 25-man. The adds attack the raid and Valithria. Tanks and DPS must control and kill them. The add waves get faster the longer the fight goes.

About every 45 seconds she opens portals into the Emerald Dream. The boss healers go through them, fly through green clouds and come out with Emerald Vigor, a big healing buff. Most wipes come from too many adds (especially Blazing Skeletons and Suppressers), or healers not getting the portal buff.
]],

    preparation = [[
- 10-man: 2 tanks, 3 healers (2 on Valithria, 1 on the raid), 5 DPS.
- 25-man: 2-3 tanks, 5-6 healers (about 4 on Valithria and 1-2 on the raid), the rest DPS.
- Valithria sits on a platform at one end of the room. Raid healers stand near the tanks and DPS; Valithria healers stand where they can reach her and the portals.
- Split the DPS into groups for the doors, or keep one group and kill adds in a priority order.
- Interrupters are needed for the Risen Archmages (Frostbolt Volley).
- Stuns, slows and snares are useful for Suppressers and Blistering Zombies.
- There is no enrage on Normal, but taking too long means the add waves overwhelm you.
]],

    phases = {
        { title = "Single phase - heal and control adds", text = [[
- The healers on Valithria heal only her. Every heal counts. She cannot be overhealed past 100%; once she is full the fight ends.
- The raid healers keep tanks and DPS alive.
- Tanks pick up adds as they come out of the doors and bring them to the middle of the room where DPS kill them.

# Adds and what to do with them
- Risen Archmage: casts Frostbolt Volley (|cffff2020interrupt it|r), Mana Void (a purple zone that drains mana) and Column of Frost (a frost pillar on the ground). Tank it and kill it.
- Blazing Skeleton: casts {spell:69325}, a big fire AoE around itself, and Fireball. |cffff2020Kill it first|r.
- Suppresser: small adds that come in groups and channel {spell:70588} on Valithria, lowering her healing. Stun and kill them fast.
- Blistering Zombie: melee attacks give Corrosion. On death it explodes with Acid Burst. Tanks pull it away from the raid; ranged kill it, melee stay away.
- Gluttonous Abomination: casts {spell:70633}, a frontal cone on its tank. When it dies, Rot Worms come out. AoE the worms.
]] },
        { title = "Dream portals (every ~45 seconds)", text = [[
- Valithria announces "I have opened a portal into the Dream" and green portals appear near her. They become usable after about 15 seconds and stay for a short time.
- Boss healers click a portal. You enter the Dream, can fly and see green Dream Clouds.
- Fly through as many clouds as you can. Each cloud gives a stack of {spell:70873}, which increases your healing and gives mana.
- You come out after a short time. Heal Valithria with the buff. Repeat every portal.
]] },
    },

    tank = [[
- Pick up every add as soon as it comes out of its door. Keep them together in one spot so DPS can hit them, but far enough from Valithria.
- Gluttonous Abomination: point it away from everyone. Its Gut Spray is a frontal cone on you and makes you take more physical damage. Ask for a disease cleanse.
- Blistering Zombie: do not let melee DPS hit it. Its Acid Burst on death hurts everyone within 15 yards. Drag it away from the group.
- Archmages cannot be tanked in a corner forever; they still cast. Make sure an interrupter is on them.
- Late in the fight adds come very fast. Use cooldowns and call for help.
]],

    healer = [[
# Valithria healers
- Spam heals on Valithria. HoTs and big heals both work. She is the only target that matters for winning.
- Enter every portal. Fly through as many clouds as you can and get Emerald Vigor.
- Watch out for Mana Void (purple puddle) and Column of Frost (frost circle) under you. Move out.

# Raid healers
- Keep the tanks alive. Damage rises as more adds are up.
- Cleanse diseases (Gut Spray) and help heal Valithria when the raid is stable.
]],

    dps = [[
Kill priority:
- 1. Blazing Skeleton (Lay Waste hurts everyone)
- 2. Suppressers (they lower Valithria's healing, stun them)
- 3. Risen Archmage (interrupt Frostbolt Volley)
- 4. Gluttonous Abomination, then AoE the Rot Worms
- 5. Blistering Zombie (ranged only, away from the raid)
- Melee: never attack Blistering Zombies.
- Do not attack Valithria. She is friendly.
- Interrupt Frostbolt Volley every time. Assign interrupters for each Archmage.
- Stay out of Mana Void, Column of Frost and Lay Waste.
]],

    warnings = [[
- |cffff2020Do not let Blazing Skeletons live long.|r Lay Waste deals heavy raid damage.
- |cffff2020Kill Suppressers fast|r or Valithria's healing drops and the fight drags on.
- Melee must not kill Blistering Zombies in the raid. Acid Burst hits everyone nearby.
- Interrupt Frostbolt Volley.
- Valithria healers must use every portal. Missing a portal makes the fight much longer.
- Add waves speed up over time. The longer the fight, the harder it gets.
]],

    heroic = [[
- The portals are Nightmare Portals. Valithria does not announce them, and inside the Nightmare you take damage.
- The clouds are Nightmare Clouds. They still give the healing buff, but they also apply a stacking damage-over-time effect ({spell:71941}). Raid healers need to heal the portal healers when they come out.
- Clouds do not respawn inside the Nightmare, so healers should plan who flies which path.
- The adds hit harder and Frostbolt Volley burns much more mana. Interrupts are even more important.
- Blistering Zombies move much faster.
- A berserk timer of about 7 minutes is active.
]],

    alternatives = {
        { title = "One DPS group vs split groups (25-man)", text = [[
- One group: all DPS stand in the middle, tanks bring all adds there. Easy to heal and simple for new players.
- Split groups: one group for the left doors and one for the right doors. Faster at killing adds early, but harder to organise.
Most new groups do better with one group and a clear kill priority.
]] },
    },

    abilities = {
        {
            name = "Lay Waste",
            spellId = 69325,
            danger = "high",
            target = "Everyone near the Blazing Skeleton",
            timing = "After the skeleton has been alive for a while",
            description = [[The Blazing Skeleton surrounds itself with flame for 12 seconds, damaging the whole area.]],
            response = [[Kill Blazing Skeletons first, before they cast it. Heal through it if it happens.]],
        },
        {
            name = "Suppression",
            spellId = 70588,
            danger = "high",
            target = "Valithria",
            timing = "Suppresser waves",
            description = [[Suppressers channel a beam on Valithria that reduces the healing she receives. Several stack.]],
            response = [[Stun and kill Suppressers quickly.]],
        },
        {
            name = "Emerald Vigor",
            spellId = 70873,
            danger = "low",
            target = "Healers in the Dream",
            timing = "Portals about every 45 seconds",
            description = [[A stacking buff from Dream Clouds that increases healing done and restores mana.]],
            response = [[Healers enter every portal and fly through as many clouds as possible.]],
        },
        {
            name = "Gut Spray",
            spellId = 70633,
            danger = "medium",
            target = "Gluttonous Abomination's tank",
            description = [[A frontal cone that deals nature damage over time and increases physical damage taken.]],
            response = [[Tank faces it away from others. Healers cleanse the disease.]],
        },
        {
            name = "Mana Void",
            spellId = 71179,
            danger = "medium",
            target = "Random player",
            description = [[A Risen Archmage summons a void zone that drains mana from anyone inside.]],
            response = [[Healers move out immediately.]],
        },
        {
            name = "Corrosion",
            spellId = 70751,
            danger = "medium",
            target = "Blistering Zombie's tank",
            description = [[The zombie's melee attacks apply a stacking nature damage-over-time effect that lowers armor. On death the zombie explodes with Acid Burst.]],
            response = [[Tank keeps it away from the raid. Only ranged kill it.]],
        },
        {
            name = "Twisted Nightmares",
            spellId = 71941,
            danger = "medium",
            target = "Healers in the Nightmare",
            heroicOnly = true,
            description = [[On Heroic, Nightmare Clouds also apply this stacking damage-over-time effect along with the healing buff.]],
            response = [[Raid healers heal the portal healers after they come back.]],
        },
    },

    chat = {
        summary = {
            "Do NOT attack Valithria. Healers heal her to 100% to win.",
            "Kill priority: Blazing Skeleton, Suppressers, Archmage, Abomination, then Zombies (ranged only).",
            "Interrupt Frostbolt Volley. Stay out of Mana Void and Column of Frost.",
            "Boss healers: use every portal and fly through the green clouds.",
        },
        tank = {
            "Pick up adds at the doors and bring them to the middle.",
            "Drag Blistering Zombies away from the raid. Face the Abomination away.",
        },
        healer = {
            "Boss healers: heal only Valithria and take every portal.",
            "Raid healers: keep tanks alive and cleanse Gut Spray.",
        },
        dps = {
            "Kill Blazing Skeletons first, then Suppressers. Interrupt Archmages.",
            "Melee: never hit Blistering Zombies. AoE the Rot Worms.",
        },
    },
})

---------------------------------------------------------------------------
-- Sindragosa
---------------------------------------------------------------------------
RTG:RegisterTactics("ICC_Sindragosa", {
    summary = "A frost dragon with debuff management on the ground, an air phase where you hide behind ice tombs, and a final phase with stacking Mystic Buffet.",

    overview = [[
Sindragosa is the frost dragon queen in the Frostwing Halls. The fight has three parts: a ground phase, an air phase that repeats with the ground phase, and a final phase at 35% where she stays on the ground until she dies.

The whole raid takes frost damage all the time from her Frost Aura, so frost resistance helps (Frost Resistance Aura, Frost Resistance Totem, Aspect of the Wild, Mark of the Wild). Melee and casters each get a stacking debuff that they must manage by stopping attacks or casts for a few seconds.

What wipes raids: not running out of Blistering Cold after Icy Grip, bad Ice Tomb placement in the air phase (no line of sight to hide), dying to Frost Bombs, and in the final phase too many Mystic Buffet stacks.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- Frost resistance buffs: Paladin Frost Resistance Aura, Shaman Frost Resistance Totem, Hunter Aspect of the Wild, Druid Mark of the Wild. Frost resistance gear is not required on Normal.
- Tank her with her side to the raid. Never stand at her head (Cleave and Frost Breath) or tail (Tail Smash).
- Melee stand at her side, between the head and the tail. Ranged and healers stand spread out on the same side, away from the tail.
- Plan three Ice Tomb spots for the air phase (left, middle, right) and tell beacon players where to go. DBM can assign directions.
- The room has a line of sight problem: practice where to hide.
]],

    phases = {
        { title = "Phase 1 - Ground", text = [[
- Frost Breath ({spell:69649}): a cone on the tank that also slows their attack speed.
- {spell:71077}: knocks back and stuns anyone behind her. Do not stand behind her.
- Cleave: hits players in front of her. Only the tank stands in front.
- Permeating Chill: melee get {spell:70106}. When it reaches a high stack count (around 8 on Normal), stop attacking until it falls off (8 seconds).
- {spell:69762}: casters and healers marked by it get {spell:69766} whenever they cast. When it falls off, each stack deals damage to you. Stop casting at around 8 stacks on Normal (4 on Heroic) and let it drop.
- {spell:70117} then Blistering Cold: she pulls everyone to her, then 5 seconds later deals massive frost damage around herself. |cffff2020Run out at least 25 yards right after the pull.|r
- Every 110 seconds (first at about 50 seconds) she takes off for the air phase.
]] },
        { title = "Air phase", text = [[
She flies up and stops attacking the tanks. The raid gathers in the middle.
- {spell:70126}: 2 players (10-man), 5 (25-man Normal) or 6 (25-man Heroic) get a beacon. After 7 seconds they are frozen into Ice Tombs where they stand.
- Beacon players run to the assigned spots (left, middle, right) so the tombs are spread across the room, not on top of each other.
- Sindragosa then drops Frost Bombs (4 of them) at the raid. The explosion is huge. |cffff2020Hide behind an Ice Tomb|r so it blocks the line of sight from the bomb.
- After the last bomb, DPS break the tombs to free the players. She lands about 45 seconds after taking off.
]] },
        { title = "Phase 3 - Below 35%", text = [[
At 35% she yells "Now, feel my master's limitless power and despair!" and stays on the ground for the rest of the fight. No more air phases.
- {spell:70128}: every few seconds she casts this on the raid. Each stack increases magic damage taken. Stacks fall off after 8 seconds without a new one.
- About every 16 seconds she puts Frost Beacon on one player who becomes an Ice Tomb.
- The beacon player moves a little away from the raid but still near. When the tomb forms, the raid hides behind it to break line of sight with her for a few seconds. This removes Mystic Buffet stacks.
- Then DPS break the tomb and the cycle repeats.
- Blistering Cold, Unchained Magic, Tail Smash and Frost Breath continue. Use Bloodlust here.
]] },
    },

    tank = [[
- Main tank holds her with her side to the raid. The off-tank stands near and swaps if Frost Breath stacks hurt too much.
- After landing from the air phase, pick her up fast and turn her back to the right direction.
- Blistering Cold: run out with everyone. She will follow you a bit; that is fine.
- Phase 3: when a tomb forms, you may need to stay on her while the raid hides. Use cooldowns.
- Frost Breath slows your attack speed. Swap tanks if the stacks make threat or survival hard.
]],

    healer = [[
- Frost Aura damages everyone all fight. Use HoTs and AoE heals.
- With Unchained Magic you get Instability when you cast. Stop casting near 8 stacks (4 on Heroic) for a few seconds.
- After Blistering Cold, heal anyone who was slow to run out.
- Air phase: heal the tombed players after they are freed; they have taken damage.
- Phase 3: Mystic Buffet makes everyone take more magic damage. Heal hard and use cooldowns before tomb breaks.
]],

    dps = [[
- Melee: watch Chilled to the Bone. Stop attacking around 8 stacks (4 on Heroic).
- Casters: if you have Unchained Magic, stop casting before you have too many Instability stacks.
- Air phase: if you have Frost Beacon, go to your assigned spot. After the 4th Frost Bomb, break the tombs fast.
- Phase 3: break each tomb only after the raid has hidden and lost Mystic Buffet stacks. Your raid leader calls it.
- Never stand behind her (Tail Smash) or in front (Cleave, Frost Breath).
]],

    warnings = [[
- |cffff2020Icy Grip pulls you in: run out immediately.|r Blistering Cold kills most players.
- |cffff2020Hide behind an Ice Tomb during Frost Bombs.|r If you can see the bomb, it hits you.
- Do not place all tombs in one spot. Spread them so the raid has clear places to hide.
- Watch your own stacks (Chilled to the Bone or Instability). Too many stacks kill you.
- Phase 3: hide behind tombs to drop Mystic Buffet stacks. Breaking a tomb too early leaves the raid with high stacks.
]],

    heroic = [[
- Everything hits harder, and the stack limits are lower: stop at about 4 stacks of Chilled to the Bone or Instability.
- 25-man Heroic gets 6 Frost Beacons in the air phase.
- Players with Unchained Magic should be spread out, because the backlash is much more dangerous.
- Mystic Buffet stacks build faster. The tomb rotation in phase 3 must be clean.
- Frost resistance matters more: many groups use frost resistance gear for tanks.
]],

    alternatives = {
        { title = "Tomb placement in the air phase", text = [[
- Three spots (left, middle, right): DBM assigns directions. Tombs form a line, the raid stands behind them. This is the most common setup.
- One line close together: easier to see, but if a bomb lands badly, few hiding places remain.
Pick one method and keep it every attempt.
]] },
    },

    abilities = {
        {
            name = "Blistering Cold",
            spellId = 70123,
            danger = "high",
            target = "Everyone within 25 yards",
            timing = "About every 66 seconds, right after Icy Grip",
            description = [[She pulls the raid to her with Icy Grip, then deals massive frost damage around herself.]],
            response = [[Run out at least 25 yards right after the pull.]],
        },
        {
            name = "Frost Beacon",
            spellId = 70126,
            danger = "high",
            target = "Random players",
            timing = "Air phase, and about every 16 seconds in phase 3",
            description = [[Marks players who become Ice Tombs after 7 seconds.]],
            response = [[Go to your assigned spot. The raid hides behind the tombs during Frost Bombs (air phase) or to drop Mystic Buffet (phase 3).]],
        },
        {
            name = "Mystic Buffet",
            spellId = 70128,
            danger = "high",
            target = "Whole raid",
            timing = "Phase 3, every few seconds",
            description = [[A stacking debuff that increases magic damage taken.]],
            response = [[Hide behind an Ice Tomb to break line of sight and let stacks fall off.]],
        },
        {
            name = "Unchained Magic",
            spellId = 69762,
            danger = "medium",
            target = "Casters and healers",
            timing = "About every 30 seconds",
            description = [[While you have it, every spell cast adds a stack of Instability. When Instability drops, each stack hurts you.]],
            response = [[Stop casting at high stacks (about 8 on Normal, 4 on Heroic).]],
        },
        {
            name = "Chilled to the Bone",
            spellId = 70106,
            danger = "medium",
            target = "Melee",
            description = [[Melee attacks build stacks of this debuff. High stacks make you take much more damage.]],
            response = [[Stop attacking at high stacks for 8 seconds until it falls off.]],
        },
        {
            name = "Frost Breath",
            spellId = 69649,
            danger = "medium",
            target = "Tank",
            timing = "About every 22 seconds",
            description = [[A frost cone on the tank that also slows attack speed.]],
            response = [[Only the tank stands in front. Swap tanks if needed.]],
        },
        {
            name = "Tail Smash",
            spellId = 71077,
            danger = "medium",
            target = "Players behind her",
            timing = "About every 27-34 seconds",
            description = [[A tail strike that damages, stuns and knocks back anyone behind her.]],
            response = [[Never stand behind her.]],
        },
    },

    chat = {
        summary = {
            "Never stand at her head or tail. Melee at her side.",
            "Icy Grip pulls you in: RUN OUT 25 yards before Blistering Cold.",
            "Air phase: beacon players go to their spot. Everyone hides behind tombs from Frost Bombs.",
            "Melee watch Chilled to the Bone, casters watch Instability. Stop at high stacks.",
            "Phase 3 (35%): hide behind tombs to drop Mystic Buffet stacks. Bloodlust now.",
        },
        tank = {
            "Hold her with her side to the raid. Pick her up fast after she lands.",
            "Swap tanks if Frost Breath slows you too much.",
        },
        healer = {
            "Constant raid damage from Frost Aura. Stop casting at high Instability stacks.",
            "Phase 3 hurts more with Mystic Buffet. Save cooldowns.",
        },
        dps = {
            "Break tombs only after the last Frost Bomb or when the leader calls it.",
            "Stop attacking or casting at high debuff stacks, then continue.",
        },
    },
})

---------------------------------------------------------------------------
-- The Lich King
---------------------------------------------------------------------------
RTG:RegisterTactics("ICC_LichKing", {
    summary = "The final boss: three phases, two transitions and a scripted end. Every player must handle plague, ghouls, Val'kyr, Defile and Harvest Soul.",

    overview = [[
The Lich King is the last boss of Icecrown Citadel and the hardest fight of the expansion. The fight is on the Frozen Throne, a round platform with no walls. Falling off the edge is death.

The fight has three phases with a transition between each: phase 1 (100% to 70%), transition 1, phase 2 (70% to 40%), transition 2, phase 3 (40% to 10%), then a scripted ending at 10%. Each part has different mechanics, so the raid must learn them all. Fights are long (up to 15 minutes before berserk on most realms).

Common reasons for wipes: Necrotic Plague dispelled on the wrong players, Shambling Horrors not slowed down, losing players to Val'kyr, Defile growing huge, raid damage in transitions, and players dying to Harvest Soul or Vile Spirits in phase 3. After about 55 seconds of roleplay at the start, the fight begins.
]],

    preparation = [[
- 10-man: 2 tanks, 2 healers, Rest DPS
- 25-man: 2 tanks, 5healers, the rest DPS
- Have shadow resistance or protection buffs, and good movement and slow abilities (Frost Trap, Hamstring, Chains of Ice, Frost Shock).
- Positioning: tank him near the middle of the platform. Melee stand behind him. Ranged and healers stand in a loose group on one side.
- Phase 1: off-tank picks up Shambling Horrors and Drudge Ghouls at the edge where they spawn.
- Assign: Necrotic Plague dispellers, interrupters for Raging Spirits (silences), ranged on Ice Spheres in transitions, and Val'kyr groups in phase 2.
- Healers need mana-heavy raid healing; save raid cooldowns for Infest and the transitions.
]],

    phases = {
        { title = "Phase 1 (100% to 70%)", text = [[
- {spell:70337}: a disease on a random player that ticks hard. When it is dispelled or ends, it jumps to a nearby target and gains a stack. The plan is to send it to the adds: the plagued player walks to the Shambling Horror or ghouls, then a healer dispels it.
- {spell:70541}: damages the whole raid over time. It stops when a player is healed above 90% health. Healers top everyone up.
- {spell:70358}: groups of ghouls appear. Off-tank and AoE kill them.
- {spell:70372}: a big add with Shockwave (frontal stun) and {spell:72143} (Enrage). Hunters use Tranquilizing Shot, druids Soothe. Off-tank pulls it away from the raid and faces it away. Kill each one before the 70% transition starts.
- At 70% the Lich King walks to the middle and starts transition 1.
]] },
        { title = "Transition 1 (70%)", text = [[
The Lich King goes to the middle and casts {spell:68981}. A storm of ice damages everyone near him. The raid moves to the edge of the platform.
- {spell:69200}: spirits copied from random players. They have a frontal Soul Shriek that silences. Tanks pick them up and face them away.
- Ice Spheres chase random players and knock back players they reach, which can push them off the edge. Ranged kill them at once.
- Pain and Suffering: a cone of shadow on a random player. Stay spread a little.
- After about 60 seconds he casts {spell:72262}. The outer ring of the platform breaks and falls. |cffff2020Run to the middle platform immediately|r or you fall.
]] },
        { title = "Phase 2 (70% to 40%)", text = [[
- {spell:69037}: Val'kyr grab one player each (1 in 10-man Normal, 2 in 10-man Heroic, 3 in 25-man) and carry them to the edge to drop them off. DPS switch to the Val'kyr and bring them to 50% health, then they let the player go. Slows and stuns help.
- {spell:72762}: a dark pool appears under a random player and grows every time it damages someone. The target runs to the edge before it lands. Everyone else moves out.
- {spell:69409}: a debuff on the current tank that deals big shadow damage after 5 seconds. The Lich King also attacks much faster for a short time. The tank uses a defensive cooldown (or the tanks swap, see Alternatives).
- Infest continues.
- At 40% he walks to the middle again for transition 2.
]] },
        { title = "Transition 2 (40%)", text = [[
Same as transition 1: the outer ring freezes again and you stand on the edge. Remorseless Winter, Raging Spirits, Ice Spheres and Pain and Suffering. At the end the Quake breaks the edge again. |cffff2020Go back to the middle.|r
]] },
        { title = "Phase 3 (40% to 10%)", text = [[
- {spell:68980}: a random player gets a 6-second debuff that deals heavy shadow damage. |cffff2020Healers must keep them alive|r: if the player dies from it, the Lich King deals much more damage for a while. When the debuff ends, the player is pulled into Frostmourne. Inside, the player helps Terenas Menethil kill the Spirit Warden (and heals Terenas if they can). When the warden dies, the player returns to the platform.
- {spell:70498}: spirits rise and float slowly toward random players. When they reach a player they explode. Ranged kill them or the raid kites them.
- Defile and Soul Reaper continue. Defile should be dropped at the edge; it grows faster now because the raid is moving a lot.
- Bloodlust is often used at the start of this phase or at a good moment.
]] },
        { title = "Ending at 10%", text = [[
At 10% the Lich King casts Fury of Frostmourne and kills the whole raid. This is scripted. Tirion Fordring breaks free and Terenas Menethil resurrects everyone. Then you finish him. Nothing can go wrong here.
]] },
    },

    tank = [[
# Phase 1
- Main tank holds the Lich King in the middle. Off-tank picks up Drudge Ghouls and Shambling Horrors at the edge and keeps them away from the raid, facing away.
- Ask hunters/druids to remove the Shambling Horror's Enrage.

# Transitions
- Pick up Raging Spirits and face them away from the raid. Use cooldowns during Remorseless Winter if needed.

# Phase 2 and 3
- Soul Reaper: the target tank uses a defensive cooldown before the 5-second hit lands. Plan a cooldown for every Soul Reaper.
- If your raid swaps on Soul Reaper, the other tank taunts right after it is applied, so the hasted boss hits the fresh tank.
- Move the boss away from Defile pools when needed. Keep him near the middle so the raid has room.
]],

    healer = [[
- Infest: heal everyone above 90% to stop it. Use AoE heals.
- Necrotic Plague: dispel it only when the plagued player is next to the adds (ghouls or Shambling Horror), never near the raid.
- Transitions: Remorseless Winter and Pain and Suffering deal heavy damage. Use raid cooldowns.
- Phase 2: the Soul Reaper target needs a big heal within 5 seconds.
- Phase 3: heal the Harvest Soul target hard for 6 seconds. If they die, the boss hits much harder. Move away from Vile Spirits and Defile.
]],

    dps = [[
# Phase 1
- Boss and ghouls. Help kill the Shambling Horror. Slow it if you can.
- If you get Necrotic Plague, walk to the adds and wait for a dispel.

# Transitions
- Ranged: kill Ice Spheres as soon as they appear.
- Melee: kill Raging Spirits. Interrupt or stay behind them (Soul Shriek).

# Phase 2
- Switch to the Val'kyr instantly. Use slows and stuns. Stop at 50% once it drops the player.
- If Defile targets you, run to the edge.

# Phase 3
- Kill Vile Spirits before they reach the raid, or kite them.
- If Harvest Soul hits you, kill the Spirit Warden with Terenas' help.
]],

    warnings = [[
- |cffff2020Run to the middle after each transition.|r The edge falls away.
- |cffff2020Never let Defile spawn in the raid.|r Its target runs to the edge before it lands.
- Do not dispel Necrotic Plague near the raid.
- Plan a tank cooldown (or a taunt swap) for every Soul Reaper.
- Val'kyr must be slowed or killed to 50% before they reach the edge.
- Stand out of the Shambling Horror's front (Shockwave).
- In phase 3, do not let Vile Spirits reach groups of players.
]],

    heroic = [[
# Phase 1 - Shadow Trap
- {spell:73539}: a trap is placed under a random player about every 15 seconds. Anyone who touches it is thrown off the platform. Move away from it.

# Phase 2 - Val'kyr
- Heroic Val'kyr do not die at 50%. At 50% they drop the player and fly up into the air, where they cast Life Siphon on the raid. Stop attacking them at 50% and go back to the boss.
- 10-man Heroic gets 2 Val'kyr per wave instead of 1.

# Phase 3 - Harvest Souls
- {spell:73654} replaces Harvest Soul: the whole raid is pulled into Frostmourne at once. Inside, Terenas Menethil casts {spell:73650} (about 40 seconds) to bring everyone back. The raid protects him: kill the Spirit Warden and the Wicked Spirits, which explode near players.
- Cancel immunity spells (Divine Shield, Ice Block, Hand of Protection) before Restore Soul finishes. DBM has an option that does this for you.
- Defile, Soul Reaper and Vile Spirits restart when you come out, so get in position quickly.
]],

    alternatives = {
        { title = "Defile handling", text = [[
- Edge drop (standard): the target runs to the edge before the cast finishes. Pools stay small and away from the raid.
- Stack-and-move: the raid stays stacked and moves together away from each new Defile. Easier for raids with good movement and works well with Val'kyr in phase 2.
]] },
        { title = "Val'kyr handling", text = [[
- All DPS switch: every player switches to the Val'kyr. Fast but costs boss DPS.
- Assigned group: 2-3 DPS per Val'kyr with slows and stuns. The rest stays on the boss. Requires good assignments.
- Heroic: stack under the boss so Val'kyr spawn close; kill them to 50% quickly and return.
]] },
        { title = "Soul Reaper handling", text = [[
- Cooldown per Soul Reaper: the tank who gets it uses a defensive cooldown and healers spam heal. Simple and common on Warmane.
- Taunt swap: the other tank taunts right after Soul Reaper is applied, so the boss's attack speed boost goes on the fresh tank. Needs two tanks paying close attention.
]] },
        { title = "Necrotic Plague handling", text = [[
- Dispel on adds: the plagued player runs to the ghouls or Shambling Horror. A healer dispels and the plague jumps to the adds.
- Let it tick to the ghouls: the plague is not dispelled; it ticks until it jumps. Good when the adds are near.
]] },
        { title = "Vile Spirits handling", text = [[
- Kite: the raid moves away from spirits while ranged kill them.
- Burst: stack and kill them with AoE before they reach anyone. Needs strong AoE.
]] },
    },

    abilities = {
        {
            name = "Defile",
            spellId = 72762,
            danger = "high",
            target = "Random player",
            timing = "Phase 2 and 3, about every 32 seconds",
            description = [[Creates a dark pool under the target. It grows every time it damages someone.]],
            response = [[Target runs to the edge before it lands. Everyone else moves out.]],
        },
        {
            name = "Summon Val'kyr",
            spellId = 69037,
            danger = "high",
            target = "Random players",
            timing = "Phase 2, about every 45 seconds",
            description = [[Val'kyr grab players and carry them to the edge to drop them off the platform.]],
            response = [[Switch to the Val'kyr, slow and stun them, and bring them to 50% health.]],
        },
        {
            name = "Necrotic Plague",
            spellId = 70337,
            danger = "high",
            target = "Random player",
            timing = "Phase 1, about every 30 seconds",
            description = [[A disease that jumps to a nearby target and gains a stack when it ends or is dispelled.]],
            response = [[Walk to the adds and get dispelled there.]],
        },
        {
            name = "Soul Reaper",
            spellId = 69409,
            danger = "high",
            target = "Main tank",
            timing = "Phase 2 and 3, about every 30 seconds",
            description = [[A debuff on the tank that deals big shadow damage after 5 seconds. The Lich King also gains a large attack speed boost for a short time.]],
            response = [[The tank uses a defensive cooldown, or the other tank taunts. Healers heal the target hard.]],
        },
        {
            name = "Infest",
            spellId = 70541,
            danger = "medium",
            target = "Whole raid",
            timing = "Phase 1 and 2, about every 22 seconds",
            description = [[A damage-over-time effect on everyone that stops when healed above 90%.]],
            response = [[Healers top the raid up quickly.]],
        },
        {
            name = "Remorseless Winter",
            spellId = 68981,
            danger = "high",
            target = "Everyone near the Lich King",
            timing = "Start of each transition",
            description = [[A storm of ice around the Lich King that damages everyone nearby.]],
            response = [[Move to the edge of the platform during the transition.]],
        },
        {
            name = "Quake",
            spellId = 72262,
            danger = "high",
            target = "Whole raid",
            timing = "End of each transition",
            description = [[Breaks the outer ring of the platform.]],
            response = [[Run back to the middle immediately.]],
        },
        {
            name = "Harvest Soul",
            spellId = 68980,
            danger = "high",
            target = "Random player",
            timing = "Phase 3, about every 75 seconds",
            description = [[A 6-second shadow debuff on a random player. If they die from it, the Lich King's damage goes up a lot. After it ends, the player is pulled into Frostmourne to fight the Spirit Warden with Terenas Menethil.]],
            response = [[Healers keep the target alive for the 6 seconds. Inside, kill the Spirit Warden and keep Terenas alive.]],
        },
        {
            name = "Shadow Trap",
            spellId = 73539,
            danger = "high",
            target = "Random player",
            heroicOnly = true,
            timing = "Phase 1, about every 15 seconds",
            description = [[A trap on the ground. Touching it throws you off the platform.]],
            response = [[Move away from the trap.]],
        },
        {
            name = "Vile Spirits",
            spellId = 70498,
            danger = "medium",
            target = "Random players",
            timing = "Phase 3, about every 30 seconds",
            description = [[Spirits that float toward random players and explode.]],
            response = [[Kill them before they reach anyone, or kite them.]],
        },
    },

    chat = {
        summary = {
            "Phase 1: plague target walks to the adds before a dispel. Heal Infest above 90%.",
            "Transitions: kill Ice Spheres, tank Raging Spirits, run to the middle when the edge breaks.",
            "Phase 2: switch to Val'kyr and bring them to 50%. Defile target runs to the edge.",
            "Phase 3: kill Vile Spirits. Harvest Soul target kills the Spirit Warden inside Frostmourne.",
            "At 10% he kills everyone. It is scripted, you are resurrected.",
        },
        tank = {
            "Soul Reaper: use a defensive cooldown before the 5 second hit, or swap if your raid plans that.",
            "Off-tank holds ghouls and Shambling Horror in phase 1, Raging Spirits in transitions.",
        },
        healer = {
            "Heal Infest targets above 90%. Dispel plague only near the adds.",
            "Use raid cooldowns in transitions. Heal the Soul Reaper target.",
        },
        dps = {
            "Switch to Val'kyr instantly in phase 2. Use slows and stuns.",
            "Ranged kill Ice Spheres. Kill Vile Spirits in phase 3.",
        },
    },
})
