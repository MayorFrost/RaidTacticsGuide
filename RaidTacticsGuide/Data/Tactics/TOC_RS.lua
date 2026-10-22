local RTG = RaidTacticsGuide

---------------------------------------------------------------------------
-- TRIAL OF THE CRUSADER
---------------------------------------------------------------------------

RTG:RegisterTactics("TOC_Beasts", {
    summary = "Three beast encounters back to back: Gormok, then the twin worms Acidmaw and Dreadscale, then Icehowl.",

    overview = [[
The Beasts of Northrend is the first encounter of Trial of the Crusader. It is really three fights in a row with no break: Gormok the Impaler, then the two worms Acidmaw and Dreadscale, then Icehowl. The encounter counts as one boss, so a wipe at Icehowl means starting again from Gormok.

Gormok is a tank swap fight with small adds (Snobolds) that jump on players. The worms test your raid's awareness: two different debuffs must be "combined" by players walking to each other. Icehowl tests movement: he charges at a random player and you must get out of the way.

On Normal the next beast only arrives when the previous one dies. On Heroic the next beast arrives on a timer whether you are ready or not, so DPS matters a lot. The whole encounter usually takes 5 to 7 minutes.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers, 5-6 DPS. 25-man: 2-3 tanks, 5-6 healers, the rest DPS
- A third tank in 25-man helps pick up the worm that is not being tanked and Snobolds
- Bring stuns and interrupts for the Snobolds (they are small and can be stunned)
- Hunters or rogues with Tranquilizing Shot or Anesthetic Poison for Icehowl's enrage
- Assign two worm tanks before the pull, one for each side of the arena
- Ranged and healers stand loosely spread behind Gormok, about 10 yards apart (DBM range frame)
]],

    phases = {
        { title = "Stage 1 - Gormok the Impaler", text = [[
Two tanks take turns on Gormok. He puts a stacking bleed called {spell:66331} on his current target. Swap tanks at about 3 stacks.

Gormok carries several Snobold Vassals on his back. Every so often one jumps off onto a random player and starts hitting them and casting Fire Bomb. Each time a Snobold leaves, Gormok gains a stack of Rising Anger (more damage).
- Melee and ranged kill the Snobold quickly. Stun it when it casts
- The player with a Snobold should move to the melee group so it can be killed fast
- Move out of the fire on the ground (Fire Bomb) right away

Every 20 seconds Gormok casts {spell:66330}. It damages and knocks nearby players and interrupts spell casting. Casters should stop casting just before it lands (DBM gives a 3 second warning).
]] },
        { title = "Stage 2 - Acidmaw and Dreadscale", text = [[
Two worms enter. One is stationary (burrowed in place and spitting) and one is mobile (moves and bites). About every 45 seconds both submerge for a few seconds and come back up in the opposite role.

# Acidmaw (green)
- Applies {spell:66823}: a poison that slows you more and more until you are paralyzed

# Dreadscale (yellow/orange)
- Applies {spell:66869}: fire damage over time on random players

# The key trick
Burning Bile removes Paralytic Toxin from players standing near the Bile player. So: |cffff2020players with Toxin run to a player with Bile|r. Bile players stand still in a known spot (usually near the center) so Toxin players can find them.

Both worms leave green Slime Pools on the ground. Do not stand in them. Kill the two worms at about the same time: when one dies the other becomes enraged.
]] },
        { title = "Stage 3 - Icehowl", text = [[
Icehowl is a big yeti. He breathes frost in front of him ({spell:66689}), so only the tank stands in front.

About once a minute he jumps to the middle of the room and casts {spell:66683}, which damages and knocks back everyone and dazes them (slows them) for a short time. Then he glares at a random player and charges at them.
- If you are the target, run away from Icehowl and to the side
- Everyone else: get out of the line between Icehowl and the target
- If the charge hits nobody, Icehowl slams into the wall and is stunned with {spell:66758} for 15 seconds and takes extra damage. This is when DPS use every cooldown
- If the charge hits players, Icehowl gets {spell:66759} (a big enrage). Hunters or rogues must remove it right away
]] },
    },

    tank = [[
# Gormok
- Main tank and off tank swap at about 3 stacks of Impale. Taunt when the other tank's stacks get high
- Keep Gormok facing away from the raid. Rising Anger makes him hit harder over time, so use cooldowns late

# Worms
- Assign one tank per worm. The mobile worm moves around: pick it up as soon as it surfaces
- Tank the mobile worm away from the stationary worm so their spits and sweeps do not overlap
- The stationary worm cannot be moved. Melee stays at its side, never in front

# Icehowl
- Face Icehowl away from the raid (Arctic Breath)
- After Massive Crash, run back to him quickly and pick him up again after the charge
- Use a defensive cooldown if he gets Frothing Rage and it is not removed quickly
]],

    healer = [[
- Gormok: the tank with Impale stacks takes heavy bleed damage. Snobold targets take steady damage until the Snobold dies
- Worms: Burning Bile ticks on several players and Paralytic Toxin players slow down. Bile players should not be dispelled; they are the cure
- Toxin players must keep moving to a Bile player. If you get Toxin, run to the Bile group too, healing on the way
- Icehowl: Massive Crash does raid-wide damage. Top everyone off before the charge
- If someone is hit by the charge, expect heavy damage on the tank during the enrage
]],

    dps = [[
- Gormok: switch to Snobolds as soon as they jump off. Stun and interrupt them. Then back to Gormok
- Casters: stop casting before Staggering Stomp (every 20 seconds) or you get locked out
- Worms: split DPS so both worms die within about 10 seconds of each other. Watch their health and slow down on the lower one if needed
- Never stand in Slime Pools. Stay out of the front of the stationary worm
- Icehowl: get out of the charge line. Save cooldowns and Bloodlust/Heroism for Staggered Daze (he takes extra damage while stunned)
]],

    warnings = [[
- |cffff2020Paralytic Toxin players must run to a Burning Bile player.|r If you stand still you become paralyzed and die
- Do not let one worm die long before the other: the survivor enrages
- Icehowl's charge: if it hits anyone, Icehowl enrages. Move early, do not wait to see who is targeted
- Casters losing casts to Staggering Stomp is the most common reason for low DPS on Gormok
- Do not stand in Fire Bomb or Slime Pool patches, they tick hard
]],

    heroic = [[
- Each wipe costs one of the 50 Heroic attempts (Trial of the Grand Crusader)
- The next beast arrives on a timer of about 2 minutes 30 seconds, even if the current one is still alive. Weak DPS means fighting two beasts at once
- Snobolds, Impale, Bile and Toxin all hit much harder
- On Heroic, Massive Crash also gives players Surge of Adrenaline (faster movement) to help them escape the charge
- Icehowl's charge and crash are more dangerous. Use the stun window well, because there is an enrage timer on the whole fight
- Many raids use Bloodlust/Heroism on the worms or on the first Icehowl stun to beat the timers
]],

    alternatives = {
        { title = "Bile in the middle", text = [[
All Burning Bile players go to a marked spot in the middle of the room and stand there. Everyone who gets Paralytic Toxin runs to that spot. Simple and good for new raids.
]] },
        { title = "Raid stacks loosely for worms", text = [[
Ranged and healers stack in one loose group, so Bile and Toxin players are always close to each other. Faster, but Bile damage spreads to more people and needs strong healing.
]] },
    },

    abilities = {
        {
            name = "Paralytic Toxin",
            spellId = 66823,
            danger = "high",
            target = "Random players (Acidmaw)",
            description = [[ A poison that slows you more and more until you are completely paralyzed and helpless. ]],
            response = [[ Run to a player with Burning Bile. Standing near them removes the Toxin. ]],
        },
        {
            name = "Burning Bile",
            spellId = 66869,
            danger = "medium",
            target = "Random players (Dreadscale)",
            description = [[ Fire damage over time. It also cures Paralytic Toxin from nearby players. ]],
            response = [[ If you have Bile, go to the agreed Bile spot and stand still so Toxin players can find you. ]],
        },
        {
            name = "Furious Charge",
            spellId = 52311,
            danger = "high",
            target = "Random player (Icehowl)",
            timing = "After each Massive Crash, about every 60 seconds",
            description = [[ Icehowl glares at a player and charges at them, hitting everyone in the path. ]],
            response = [[ Run away and to the side. If he hits the wall he is stunned and takes extra damage. ]],
        },
        {
            name = "Massive Crash",
            spellId = 66683,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 63 seconds",
            description = [[ Icehowl jumps to the center, damages and knocks back everyone, and dazes them for a short time. ]],
            response = [[ Healers top the raid. Get ready to dodge the charge that follows. ]],
        },
        {
            name = "Impale",
            spellId = 66331,
            danger = "medium",
            target = "Current tank (Gormok)",
            timing = "About every 8-10 seconds",
            description = [[ A stacking bleed on the tank. ]],
            response = [[ Tanks swap at about 3 stacks. ]],
        },
        {
            name = "Staggering Stomp",
            spellId = 66330,
            danger = "medium",
            target = "Players near Gormok",
            timing = "Every 20 seconds",
            description = [[ Damages nearby players and interrupts spell casting. ]],
            response = [[ Casters stop casting just before it lands. ]],
        },
        {
            name = "Frothing Rage",
            spellId = 66759,
            danger = "high",
            target = "Icehowl",
            description = [[ An enrage Icehowl gains when his charge hits players. He deals much more damage. ]],
            response = [[ Remove it at once with Tranquilizing Shot or Anesthetic Poison. ]],
        },
        {
            name = "Rising Anger",
            spellId = 66636,
            danger = "low",
            target = "Gormok",
            description = [[ Each time a Snobold jumps off, Gormok gains a stacking damage increase. ]],
            response = [[ Kill Gormok efficiently. Tanks use cooldowns late in Stage 1. ]],
        },
        {
            name = "Slime Pool",
            spellId = 66883,
            danger = "low",
            target = "Ground under the worms",
            description = [[ Green pools that damage players standing in them. ]],
            response = [[ Step out of them right away. Tanks move the mobile worm away from pools. ]],
        },
    },

    chat = {
        summary = {
            "Gormok: tanks swap at 3 Impale stacks. Kill Snobolds fast, stun them. Casters stop casting before Stomp.",
            "Worms: Paralytic Toxin players run to Burning Bile players to remove it. Bile players stand still at the marked spot.",
            "Kill both worms within about 10 seconds of each other or the survivor enrages. Stay out of Slime Pools.",
            "Icehowl: after Massive Crash he charges a random player. Run away and sideways, nobody in the line.",
            "If Icehowl hits the wall he is stunned: everyone use cooldowns. If he enrages, hunters Tranq Shot right away.",
        },
        tank = {
            "Swap Gormok at 3 Impale stacks. Keep him facing away from the raid.",
            "One tank per worm. Pick up the mobile worm when it surfaces and keep it away from the stationary one.",
            "Face Icehowl away from the raid and pick him up quickly after each charge.",
        },
        healer = {
            "Impale bleed on the Gormok tank hurts. Heal Snobold targets until it dies.",
            "Do not panic on Bile. Toxin players need to run to Bile players, remind them.",
            "Top off the raid before Icehowl's Massive Crash and charge.",
        },
        dps = {
            "Switch to Snobolds when they jump off, stun and interrupt them. Casters stop casting before Stomp.",
            "Balance damage so both worms die close together. Never stand in green pools.",
            "Save cooldowns for Icehowl's Staggered Daze after he hits the wall.",
        },
    },
})

RTG:RegisterTactics("TOC_Jaraxxus", {
    summary = "A demon lord with a moving fire trail, a big heal-absorb debuff, and demon adds from portals and volcanoes.",

    overview = [[
Lord Jaraxxus is an eredar demon summoned by a gnome warlock. The fight has one phase, but it gets busier over time as he summons demon adds.

The raid must handle four things: a fire trail that follows a random player ({spell:66197}), a huge heal-absorb on a random player ({spell:66237}), interrupts on his Fel Fireball, and two kinds of adds: Felflame Infernals from a volcano and a Mistress of Pain from a portal.

Jaraxxus also gains {spell:67009} stacks that make his spells much stronger. Mages and dispellers removing those stacks makes the fight much easier. There is a hard enrage at 10 minutes.
]],

    preparation = [[
- 10-man: 2 tanks, 3 healers, 5 DPS. 25-man: 2-3 tanks, 6 healers, the rest DPS
- Assign 2-3 interrupters for Fel Fireball on the boss
- Assign mages (Spellsteal) and priests/shamans/paladins with Dispel Magic or Purge for Nether Power
- One tank on Jaraxxus in the middle of the room, one tank for the Mistress of Pain
- Ranged and healers spread loosely behind the boss. Leave room at the edges for Legion Flame trails
]],

    phases = {
        { title = "The whole fight (one phase)", text = [[
Jaraxxus is tanked in the middle of the room. He casts Fel Fireball on his tank: interrupt it every time. If it lands, dispel the debuff from the tank.

# Legion Flame (every 30 seconds)
A random player gets {spell:66197}. A trail of green fire follows behind them. Run to the edge of the room and walk slowly along the wall, so the fire is left where nobody stands. Never run through the raid.

# Incinerate Flesh (every 30 seconds)
A random player gets {spell:66237}. It absorbs a large amount of healing. Healers must burn through it within 12 seconds. If they do not, it explodes as Burning Inferno and damages the whole raid.

# Nether Power (every 45 seconds)
Jaraxxus gains stacks that boost his spell damage. Remove them with Spellsteal, Dispel Magic or Purge as soon as they appear.

# Fel Lightning
A chain lightning that jumps between players. Spread a little so it jumps less.
]] },
        { title = "Infernal Volcano (every 2 minutes)", text = [[
Jaraxxus summons a volcano that erupts and throws out several Felflame Infernals. They cast Fel Streak (charge with fire trail) and pulse {spell:66496} around them.
- Kill them quickly with AoE or focus fire. The off tank or a death knight/paladin can gather them
- Move away from them when they pulse Fel Inferno
]] },
        { title = "Nether Portal (every 2 minutes, alternating with the volcano)", text = [[
Jaraxxus opens a portal that summons a Mistress of Pain.
- The off tank picks her up immediately
- She casts Spinning Pain Spike on random players (big damage) and Shivan Slash on her tank
- DPS kill her quickly. Interrupts and stuns help
]] },
    },

    tank = [[
- Main tank holds Jaraxxus in the center. Ask your interrupters to cover every Fel Fireball, and use a cooldown if one lands with Nether Power stacks up
- Off tank picks up the Mistress of Pain the moment she appears and holds her near the boss so cleave helps
- Off tank (or a paladin/death knight) can gather Felflame Infernals so they can be AoE'd
- If you get Legion Flame, move the boss a little and lead the fire away from the raid. Do not walk through melee
]],

    healer = [[
- Incinerate Flesh is your main job: everyone heal that target hard. Break the absorb in 12 seconds or the whole raid takes Burning Inferno damage
- Have a dispeller ready for Fel Fireball on the tank if an interrupt is missed
- Spellsteal or dispel Nether Power if you have Dispel Magic
- Fel Lightning and Fel Inferno cause steady raid damage while adds are up
- Players walking a Legion Flame trail may take damage from the debuff itself, keep them up
]],

    dps = [[
- Interrupters: kick Fel Fireball every time. Rotate interrupts
- Mages: Spellsteal Nether Power. Priests/shamans: dispel or purge it
- Switch to the Mistress of Pain when she spawns. Kill the Infernals fast with AoE
- If you get Legion Flame, run to the edge of the room and walk slowly along the wall. Keep the fire out of the raid
- Do not stand in the green fire (Legion Flame trail) or near pulsing Infernals
]],

    warnings = [[
- |cffff2020Legion Flame: move to the edge, never through the raid.|r Green fire left in the middle ruins the fight
- Incinerate Flesh not broken in time = raid-wide Burning Inferno damage
- Unremoved Nether Power stacks make every Jaraxxus spell hit much harder
- A missed Fel Fireball on the tank can kill them. Interrupt or dispel it
- Spread loosely for Fel Lightning, but do not spread so far that healers lose range
]],

    heroic = [[
- Each wipe costs one of the 50 Heroic attempts
- The Infernal Volcano and Nether Portal stay up and keep summoning adds until they are destroyed. DPS must kill the volcano and the portal, not only the adds
- The Mistress of Pain also casts {spell:66334} on Heroic: it silences casters who are casting when it ends. Casters with the debuff should stop casting until it fades
- Incinerate Flesh absorbs far more healing and Legion Flame hits much harder
- Many raids tank the volcano and portal spawn spots near the boss so cleave and AoE can hit them
]],

    alternatives = {
        { title = "Kill or ignore the Infernals (Normal)", text = [[
On Normal some raids simply kill the Infernals with AoE when they come out. Others let one tank gather them and keep them away from the raid while DPS stays on Jaraxxus, then AoE them later. New raids should kill them right away.
]] },
    },

    abilities = {
        {
            name = "Incinerate Flesh",
            spellId = 66237,
            danger = "high",
            target = "Random player",
            timing = "Every 30 seconds",
            description = [[ Absorbs a large amount of healing for 12 seconds. If not broken, it explodes as Burning Inferno on the raid. ]],
            response = [[ All healers focus the target and break the absorb before it expires. ]],
        },
        {
            name = "Legion Flame",
            spellId = 66197,
            danger = "high",
            target = "Random player",
            timing = "Every 30 seconds",
            description = [[ The target leaves a trail of green fire behind them for several seconds. ]],
            response = [[ Run to the edge of the room and walk along the wall. Never through the raid. ]],
        },
        {
            name = "Fel Fireball",
            spellId = 66532,
            danger = "medium",
            target = "Tank",
            description = [[ A big fire bolt with a burning debuff. ]],
            response = [[ Interrupt every cast. If it lands, dispel the tank. ]],
        },
        {
            name = "Nether Power",
            spellId = 67009,
            danger = "medium",
            target = "Jaraxxus",
            timing = "Every 45 seconds",
            description = [[ Stacking buff that increases Jaraxxus's spell damage. ]],
            response = [[ Spellsteal, Dispel Magic or Purge the stacks right away. ]],
        },
        {
            name = "Infernal Eruption",
            spellId = 66258,
            danger = "medium",
            target = "Raid",
            timing = "About every 2 minutes",
            description = [[ Summons a volcano that throws out Felflame Infernals. ]],
            response = [[ Kill Infernals with AoE. On Heroic, destroy the volcano too. ]],
        },
        {
            name = "Nether Portal",
            spellId = 66269,
            danger = "medium",
            target = "Raid",
            timing = "About every 2 minutes",
            description = [[ Opens a portal that summons a Mistress of Pain. ]],
            response = [[ Off tank picks her up, DPS kill her. On Heroic, destroy the portal too. ]],
        },
        {
            name = "Fel Lightning",
            spellId = 66528,
            danger = "low",
            target = "Random players",
            timing = "Every 10-17 seconds",
            description = [[ Chain lightning that jumps to nearby players. ]],
            response = [[ Stand loosely spread so it jumps less. ]],
        },
        {
            name = "Mistress' Kiss",
            spellId = 66334,
            danger = "medium",
            target = "Casters",
            heroicOnly = true,
            description = [[ A debuff from the Mistress of Pain. If you are casting when it ends, you are silenced. ]],
            response = [[ Stop casting until the debuff fades. ]],
        },
        {
            name = "Fel Inferno",
            spellId = 66496,
            danger = "low",
            target = "Players near an Infernal",
            description = [[ Felflame Infernals pulse fire damage around themselves. ]],
            response = [[ Melee step away when it pulses. Ranged kill them. ]],
        },
    },

    chat = {
        summary = {
            "Legion Flame: run to the edge of the room and walk along the wall. Never lead the fire through the raid.",
            "Incinerate Flesh: healers break the absorb within 12 seconds or the whole raid takes damage.",
            "Interrupt every Fel Fireball. Spellsteal or dispel Nether Power stacks off the boss.",
            "Adds: kill Felflame Infernals with AoE, off tank grabs the Mistress of Pain and DPS kill her.",
        },
        tank = {
            "Main tank holds Jaraxxus in the center. Use a cooldown if Fel Fireball lands.",
            "Off tank picks up the Mistress of Pain right away and keeps her near the boss.",
        },
        healer = {
            "Everyone heal the Incinerate Flesh target until the absorb breaks.",
            "Dispel Fel Fireball from the tank if an interrupt is missed. Dispel Nether Power if you can.",
        },
        dps = {
            "Kick every Fel Fireball. Mages Spellsteal Nether Power.",
            "Switch to the Mistress of Pain and Infernals when they spawn.",
            "If you get Legion Flame, run to the wall and walk slowly along it.",
        },
    },
})

RTG:RegisterTactics("TOC_Champions", {
    summary = "A PvP-style fight against a team of enemy player characters: crowd control, interrupts, dispels and focus fire.",

    overview = [[
Faction Champions is a fight against a team of NPC champions from the opposite faction: 6 in 10-man and 10 in 25-man. Each champion is a class with a specific spec (for example a Holy Paladin, a Restoration Druid, a Frost Mage, a Warrior). They use real player abilities: crowd control, heals, bubbles, Bloodlust/Heroism and so on.

There is no traditional tank. The champions switch targets constantly and attack whoever they like, often your healers. The fight is won by playing like a battleground team: crowd control (CC = stun, fear, polymorph, etc.) some champions, focus fire one target at a time, interrupt heals and dispel their buffs.

All champions must die. The fight ends when the last one dies. This is usually the hardest fight of Trial of the Crusader for new raids.
]],

    preparation = [[
- 10-man: 1-2 tanks (often in DPS or tank gear), 2-3 healers, the rest DPS. 25-man: 2 tanks, 5-6 healers, the rest DPS
- Bring lots of CC and interrupts: mages, rogues, hunters, warlocks, priests, shamans
- Bring dispellers: Priests (Dispel Magic, Mass Dispel), Shamans (Purge), Mages (Spellsteal)
- Diminishing returns apply: the same CC on the same target gets shorter each time. Rotate different CC types
- Talk to your raid leader: which champion is the first kill target, who CCs whom
- Most raids pull and fight in a corner or against a wall so the champions bunch up for AoE
]],

    phases = {
        { title = "Opening (first 20-30 seconds)", text = [[
The champions run in and bunch up at the start. This is the best AoE window of the fight.
- Everyone uses AoE while they are stacked (Blizzard, Consecration, Volley, Hurricane, Death and Decay etc.)
- CC players apply their CC to the assigned champions (Polymorph, Hex, Fear, Freezing Trap, Repentance)
- Tanks and melee pick up the dangerous melee champions (Warrior, Death Knight, Rogue, Retribution Paladin)
]] },
        { title = "Focus fire (rest of the fight)", text = [[
Kill champions one at a time with marks (skull = kill target).

# A common kill order
- 1. A healer first: Restoration Druid, Discipline Priest or Restoration Shaman are usually easiest
- 2. The other healers. The Holy Paladin uses {spell:66010} and is often left later or killed after Mass Dispel
- 3. Casters with low armor (Shadow Priest, Warlock, Mage, Balance Druid)
- 4. Melee and Hunters last

# During the fight
- Interrupt healing spells on the kill target and on other healers
- Dispel or purge their buffs: Hand of Freedom, Earth Shield, Bloodlust/Heroism, Avenging Wrath
- Mass Dispel Divine Shield and Ice Block so the target can be killed
- Re-apply CC on assigned targets when it breaks
]] },
    },

    tank = [[
- There is no threat in a normal sense. Your job is to peel: taunt, stun, slow and hold the dangerous melee champions (Warrior, Death Knight, Rogue, Retribution Paladin) away from healers
- Use Shield Wall or similar cooldowns when several champions focus you
- When the Warrior uses {spell:65947}, move away from him (or get melee out) and stun or disarm him after it ends
- Help the raid's focus fire when nothing needs peeling
]],

    healer = [[
- Healers are the champions' favorite targets. Stay near the tanks and melee so they can peel for you
- Use your own defensive cooldowns early (Pain Suppression, Divine Shield, Barkskin)
- Dispel CC on your raid: Polymorph, Hex, Repentance, Fear, Hammer of Justice, Frost Trap effects
- Priests: Mass Dispel Divine Shield / Ice Block on the kill target when the raid leader calls it
- Move out of the Warlock's {spell:65816} (fire around the warlock)
]],

    dps = [[
- Follow the kill target (skull). Do not spread damage across many champions
- Interrupt healing casts (Holy Light, Healing Wave, Nourish, Penance, Tranquility)
- Keep your assigned CC up. Do not break someone else's CC with AoE once the opening AoE window ends
- Purge or spellsteal buffs: Hand of Freedom, Earth Shield, Bloodlust/Heroism, Avenging Wrath
- Melee: step away from Bladestorm. Ranged: get away from Hellfire and Frost Trap
- Use defensives when focused (Ice Block, Cloak of Shadows, Divine Shield)
]],

    warnings = [[
- |cffff2020Interrupt Tranquility|r from the Restoration Druid. It heals all champions a lot
- Do not split damage. Killing one champion at a time is the whole fight
- Divine Shield and Ice Block make champions immune: Mass Dispel them or switch target, do not keep hitting them
- Bladestorm (Warrior) and Hellfire (Warlock) kill careless melee and casters
- Dispel your own healers from CC quickly, a feared healer is a dead tank
- Watch Diminishing Returns: the third fear on the same champion barely lasts
]],

    heroic = [[
- Each wipe costs one of the 50 Heroic attempts
- Champions have much more health and deal much more damage. Healers can die in seconds if not protected
- CC, interrupts and dispels are not optional on Heroic. Assign them before the pull
- The opening AoE window is even more important. Plan Bloodlust/Heroism for the first kill target
- Many Heroic raids use a stack-in-a-corner AoE strategy with heavy melee cleave
]],

    alternatives = {
        { title = "Single target focus with CC", text = [[
The classic strategy: CC several champions, kill one healer at a time, then casters, then melee. Works for any raid but needs good CC and interrupt players.
]] },
        { title = "Corner AoE strategy", text = [[
The raid stacks in a corner or along a wall. Champions bunch up near the raid, and everyone uses AoE (Blizzard, Consecration, Death and Decay, Volley, Hurricane) while still focus firing a healer. Works well for raids with many AoE classes. Do not CC champions that sit in the AoE because the damage breaks it.
]] },
    },

    abilities = {
        {
            name = "Tranquility",
            spellId = 66086,
            danger = "high",
            target = "All champions (Restoration Druid)",
            description = [[ A channeled heal that restores a lot of health to every champion. ]],
            response = [[ Interrupt or stun the druid immediately. ]],
        },
        {
            name = "Divine Shield",
            spellId = 66010,
            danger = "high",
            target = "Paladin champion",
            description = [[ Makes the paladin immune to all damage. ]],
            response = [[ Priests use Mass Dispel to remove it, or the raid switches targets. ]],
        },
        {
            name = "Bladestorm",
            spellId = 65947,
            danger = "high",
            target = "Players near the Warrior",
            timing = "About every 90 seconds",
            description = [[ The Warrior spins for about 8 seconds and hits everyone nearby hard. ]],
            response = [[ Melee and healers move away. Stun or disarm him after. ]],
        },
        {
            name = "Hellfire",
            spellId = 65816,
            danger = "medium",
            target = "Players near the Warlock",
            description = [[ Fire damage around the Warlock. ]],
            response = [[ Move away, interrupt or stun the Warlock. ]],
        },
        {
            name = "Bloodlust / Heroism",
            spellId = 65980,
            danger = "medium",
            target = "All champions (Shaman)",
            description = [[ The enemy Shaman boosts all champions' attack and casting speed. ]],
            response = [[ Purge or Spellsteal it off the champions, and use defensives. ]],
        },
        {
            name = "Hand of Protection",
            spellId = 66009,
            danger = "medium",
            target = "A champion (Paladin)",
            description = [[ Makes a champion immune to physical attacks. ]],
            response = [[ Dispel it, or casters keep hitting that target. ]],
        },
        {
            name = "Polymorph",
            spellId = 65801,
            danger = "medium",
            target = "Random players (Mage)",
            description = [[ Turns a player into a sheep for several seconds. ]],
            response = [[ Dispel it from healers and important DPS. ]],
        },
        {
            name = "Psychic Scream",
            spellId = 65543,
            danger = "medium",
            target = "Players near the Priest",
            timing = "About every 30 seconds",
            description = [[ Fears nearby players. ]],
            response = [[ Use Fear Ward, Tremor Totem or a racial. Dispel feared healers. ]],
        },
    },

    chat = {
        summary = {
            "Use AoE at the start while the champions are stacked, then focus fire one target at a time (skull).",
            "Kill order: healers first (Druid, Priest or Shaman), then casters, melee last.",
            "Interrupt heals, especially Tranquility. Purge or spellsteal Bloodlust, Earth Shield and Hand of Freedom.",
            "Mass Dispel Divine Shield and Ice Block. Dispel CC off our healers fast.",
            "Move away from Bladestorm and Hellfire.",
        },
        tank = {
            "Peel melee champions off the healers: taunt, stun, slow. Use cooldowns when focused.",
            "Move away from Bladestorm, then stun or disarm the Warrior.",
        },
        healer = {
            "Stay near the tanks so they can peel for you. Use your defensive cooldowns early.",
            "Dispel Polymorph, Hex, Fear and Repentance from other healers first.",
        },
        dps = {
            "Hit only the skull target. Interrupt its heals.",
            "Keep your assigned CC up and do not break other CC after the opening AoE.",
            "Purge or spellsteal enemy buffs when you can.",
        },
    },
})

RTG:RegisterTactics("TOC_Twins", {
    summary = "Two Val'kyr sisters, one light and one dark. Pick the right color essence, collect the right orbs, break shields and interrupt heals.",

    overview = [[
The Twin Val'kyr are Fjola Lightbane (white, light) and Eydis Darkbane (black, dark). They share one health pool, so damage on either sister counts toward both.

The fight is about colors. Near the edge of the arena there are portals that give you an essence: Light Essence (white) or Dark Essence (black). You can click a portal to switch essence at any time. Your essence protects you from damage of the same color.

About every 45 seconds one of the sisters uses a special ability: a Vortex (light or dark) that only hurts players with the wrong essence, or a Shield plus a big heal that must be stopped. Small light and dark orbs also float around the arena. There is a hard enrage timer, so DPS matters.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers, 5-6 DPS. 25-man: 2 tanks, 5-6 healers, the rest DPS
- One tank on each sister. Tank them near each other in the middle so the raid can cleave between them
- Split the raid into two groups: half take Light Essence, half take Dark Essence. Usually each half attacks the sister of the OPPOSITE color of their essence
- Assign interrupters for the heal (Twin's Pact)
- Assign a few players to collect orbs of their color
]],

    phases = {
        { title = "The whole fight (one phase)", text = [[
# Essences
Click a white portal for Light Essence or a black portal for Dark Essence. Matching color means that color does not hurt you.

# Orbs
Light orbs and dark orbs move across the arena.
- Touching an orb of YOUR color gives you stacks. At 100 stacks you get {spell:65748} or {spell:65724} (a big damage boost)
- Touching an orb of the OTHER color makes it explode and damages you and nearby players. Avoid them

# Special ability (about every 45 seconds, random)
- Light Vortex ({spell:66046}): Fjola hits the whole raid with light damage. Everyone must have |cffff2020Light Essence|r
- Dark Vortex ({spell:66058}): Eydis hits the whole raid with dark damage. Everyone must have |cffff2020Dark Essence|r
- Shield and Pact: one sister puts up a shield and casts a big heal for both. Everyone switches to the shielded sister, breaks the shield and interrupts the heal

When a sister starts a Vortex, players with the wrong essence must click a portal of the correct color right away. DBM shows "Change color".
]] },
    },

    tank = [[
- One tank on each sister. Keep them close to each other in the middle of the room
- Tanks usually take the essence matching the sister they tank, but follow your raid leader's assignment
- When a sister shields, the OTHER sister gets {spell:65916} and hits harder. Use a defensive cooldown if you tank that sister
- Switch essence for Vortexes like everyone else, then return to your boss quickly
]],

    healer = [[
- Vortex damage is huge on anyone with the wrong essence. Remind players to switch
- Players who hit orbs of the wrong color take a burst of damage
- During Shield and Pact, the tank of the non-shielded sister takes much more damage (Power of the Twins)
- You can also switch essence: make sure YOU have the right color before each Vortex
]],

    dps = [[
- Attack your assigned sister. Both share one health pool
- Light orb/dark orb collectors: walk into orbs of your own color to reach Empowered. Dodge orbs of the other color
- Vortex: when DBM says change color, click the right portal at once
- Shield and Pact: everyone switch to the shielded sister and burst through the shield. Interrupters kick the heal as soon as the shield breaks
- Return to your normal target after the heal is stopped
]],

    warnings = [[
- |cffff2020Wrong essence during a Vortex is a near-certain death.|r Watch who is casting and switch fast
- Touching orbs of the other color hurts you and everyone near you
- If the Twin's Pact heal goes through, the sisters gain a lot of health back and you may hit the enrage
- Do not stand on top of other players when you might explode orbs
- Leave the portals clear: players need to click them in a hurry
]],

    heroic = [[
- Each wipe costs one of the 50 Heroic attempts
- New debuffs: {spell:65950} and {spell:66001}. They hit you hard over time unless you have the matching essence (Touch of Light needs Light Essence, Touch of Darkness needs Dark Essence). Switch essence when you get one
- The shields absorb much more damage, so the whole raid must switch to break them
- Vortexes and orbs hit much harder. Mistakes are rarely survivable
- The enrage timer is tight. Good orb collection and Empowered buffs are very important on Heroic
]],

    alternatives = {
        { title = "All on one sister", text = [[
Some raids put all DPS on one sister and only switch for shields. Since health is shared it does not matter much which sister takes damage. This keeps the raid together and makes essence switching easier.
]] },
    },

    abilities = {
        {
            name = "Light Vortex",
            spellId = 66046,
            danger = "high",
            target = "Whole raid (Fjola)",
            timing = "Special ability, about every 45 seconds",
            description = [[ Light damage to the whole raid. Deadly without Light Essence. ]],
            response = [[ Click a white portal to get Light Essence before it lands. ]],
        },
        {
            name = "Dark Vortex",
            spellId = 66058,
            danger = "high",
            target = "Whole raid (Eydis)",
            timing = "Special ability, about every 45 seconds",
            description = [[ Dark damage to the whole raid. Deadly without Dark Essence. ]],
            response = [[ Click a black portal to get Dark Essence before it lands. ]],
        },
        {
            name = "Twin's Pact",
            spellId = 65875,
            danger = "high",
            target = "Both sisters",
            timing = "Special ability, about every 45 seconds",
            description = [[ A shielded sister casts a 15 second heal for both twins. ]],
            response = [[ Everyone switches to her, breaks the shield, and interrupters kick the heal. ]],
        },
        {
            name = "Shield of Lights / Darkness",
            spellId = 65858,
            danger = "medium",
            target = "The healing sister",
            description = [[ A damage-absorbing shield that protects the sister while she casts the Pact. ]],
            response = [[ Burst it down with the whole raid. ]],
        },
        {
            name = "Power of the Twins",
            spellId = 65916,
            danger = "medium",
            target = "The other sister",
            description = [[ While one sister heals, the other gets a big damage boost. ]],
            response = [[ That sister's tank uses a cooldown and healers focus them. ]],
        },
        {
            name = "Empowered Light / Darkness",
            spellId = 65748,
            danger = "low",
            target = "Orb collectors",
            description = [[ Collecting 100 stacks from orbs of your color gives a large damage boost. ]],
            response = [[ Walk into orbs of your color, avoid the other color. ]],
        },
        {
            name = "Touch of Light",
            spellId = 65950,
            danger = "high",
            target = "Random players",
            heroicOnly = true,
            description = [[ Heavy damage over time unless you have Light Essence. ]],
            response = [[ Switch to Light Essence. ]],
        },
        {
            name = "Touch of Darkness",
            spellId = 66001,
            danger = "high",
            target = "Random players",
            heroicOnly = true,
            description = [[ Heavy damage over time unless you have Dark Essence. ]],
            response = [[ Switch to Dark Essence. ]],
        },
    },

    chat = {
        summary = {
            "Click a white portal for Light Essence or a black portal for Dark Essence. Your color protects you.",
            "Light Vortex: everyone needs Light Essence. Dark Vortex: everyone needs Dark Essence. Switch fast.",
            "Shield and heal: everyone switch to the shielded sister, break the shield, interrupt the heal.",
            "Walk into orbs of your color, avoid orbs of the other color.",
        },
        tank = {
            "One tank per sister, both near the middle.",
            "When one sister shields, the other hits harder. Use a cooldown if you tank her.",
        },
        healer = {
            "Switch your own essence before each Vortex.",
            "The non-shielded sister's tank takes big damage during the heal.",
        },
        dps = {
            "Break the shield fast and interrupt the heal as soon as it breaks.",
            "Collect orbs of your color for the damage buff.",
        },
    },
})

RTG:RegisterTactics("TOC_Anubarak", {
    summary = "The final TOC boss: tank adds and the boss, kite Pursuing Spikes over frost patches, then burn through the Leeching Swarm phase.",

    overview = [[
Anub'arak is the last boss of Trial of the Crusader, fought on a frozen floor deep under the Coliseum. The fight has three phases.

In Phase 1 the boss is tanked while Nerubian Burrower adds spawn. In Phase 2 he burrows underground and chases a random player with spikes, while small Scarab adds swarm the raid. Phases 1 and 2 repeat until he reaches 30% health. Then Phase 3 starts: {spell:66118} drains health from everyone and heals the boss, so it becomes a DPS and healing race.

Frost Spheres float above the room. When killed they fall and leave a Permafrost patch on the ground. Permafrost slows the adds, stops Burrowers from burrowing, and stops the Pursuing Spikes. Using these patches well is the core of the fight.
]],

    preparation = [[
- 10-man: 2 tanks, 3 healers, 5 DPS. 25-man: 3 tanks, 6 healers, the rest DPS
- One tank on Anub'arak, one (or two) for Nerubian Burrowers
- Assign 1-2 ranged DPS (hunters are good) to shoot down Frost Spheres into planned spots
- Fight near the middle-edge with Permafrost patches under the boss and under the add tank
- Paladins: Hand of Protection can make a Pursue target safe on Heroic (DBM tracks it)
- Assign stuns for Burrowers on Heroic
]],

    phases = {
        { title = "Phase 1 - Above ground (about 80 seconds)", text = [[
The main tank holds Anub'arak on a Permafrost patch. He uses {spell:66012} on his tank, which freezes them briefly.

He puts {spell:66013} on several random players: heavy frost damage for 15 seconds. Healers must focus them.

Nerubian Burrowers spawn about every 45 seconds. The off tank picks them up and holds them on Permafrost. On Permafrost they cannot dig underground to heal. They also get stronger when close to each other, so kill them quickly.
]] },
        { title = "Phase 2 - Burrowed (about 65 seconds)", text = [[
Anub'arak digs underground. He picks a random player and chases them with spikes ({spell:67574}).
- If you are chased: |cffff2020run|r. Run over a Permafrost patch. The spikes stop when they hit Permafrost and Anub'arak picks a new target
- Everyone else: get out of the path of the spikes and the chased player

Scarabs crawl out of the ground and attack. Tanks and AoE classes gather and kill them. They stack a damage-increase debuff on players they bite.

After about 65 seconds he comes back up and Phase 1 starts again.
]] },
        { title = "Phase 3 - Leeching Swarm (30% health)", text = [[
At 30% Anub'arak stops burrowing and casts {spell:66118}. It drains a percentage of every player's current health each second and heals the boss.
- DPS: use every cooldown and Bloodlust/Heroism now. The boss heals if you are slow
- Healers: heal steadily. The swarm takes a percentage of current health, so very low players lose less. Do not overheal
- Penetrating Cold and Freezing Slash continue
]] },
    },

    tank = [[
- Main tank: hold Anub'arak on a Permafrost patch. Use a cooldown after Freezing Slash if you take heavy damage
- Add tank: pick up Burrowers quickly and keep them on Permafrost so they cannot burrow and heal
- Phase 2: gather Scarabs and keep them together for AoE. Watch for Pursuing Spikes coming your way
- Phase 3: the boss hits hard while the swarm drains you. Save big defensive cooldowns for this phase
]],

    healer = [[
- Penetrating Cold targets need focus heals for 15 seconds
- Tanks: Freezing Slash plus Burrower damage can spike the off tank
- Phase 2: Scarab bites cause steady damage. Heal the chased player while they run
- Phase 3: healing is the hardest part. Leeching Swarm drains everyone every second. Heal steadily and use mana cooldowns before 30%
]],

    dps = [[
- Ranged with the assignment: shoot Frost Spheres in planned spots to make Permafrost patches
- Phase 1: kill Burrowers when they spawn, then back to the boss
- Phase 2: AoE the Scarabs. If you are chased by spikes, run over Permafrost
- Phase 3: burn the boss with all cooldowns. Do not stop DPSing for anything
]],

    warnings = [[
- |cffff2020Pursuing Spikes kill whoever they touch.|r Run toward a Permafrost patch, not around the raid
- Without Permafrost under them, Burrowers dig underground and come back at full health
- Do not waste Permafrost patches: shoot spheres only where they are needed
- Phase 3 is a race. Slow DPS means the boss heals and the healers run out of mana
]],

    heroic = [[
- Each wipe costs one of the 50 Heroic attempts. This is the final boss of the Heroic run
- Frost Spheres do not respawn on Heroic. Use each Permafrost patch carefully
- Burrowers cast {spell:66134} on Heroic: they dig underground and strike a player hard. Stun them to stop it
- Burrowers keep spawning in Phase 3 on Heroic, which makes Phase 3 much harder
- Many raids use paladins' Hand of Protection on Pursue targets so the spikes do nothing
]],

    alternatives = {
        { title = "Skip Phase 2 damage on Normal", text = [[
On Normal some raids push Anub'arak to 30% very fast, so they see only one or two burrow phases. This works with strong DPS and fewer chances for mistakes.
]] },
    },

    abilities = {
        {
            name = "Pursuing Spikes",
            spellId = 67574,
            danger = "high",
            target = "Random player",
            timing = "During Phase 2",
            description = [[ Anub'arak chases a player with spikes under the ground. Being hit is often deadly. ]],
            response = [[ Run over a Permafrost patch to stop the spikes. Others move out of the way. ]],
        },
        {
            name = "Leeching Swarm",
            spellId = 66118,
            danger = "high",
            target = "Whole raid",
            timing = "Phase 3 (30%)",
            description = [[ Drains a percentage of everyone's current health every second and heals the boss. ]],
            response = [[ DPS use cooldowns and Bloodlust, healers heal steadily. ]],
        },
        {
            name = "Penetrating Cold",
            spellId = 66013,
            danger = "medium",
            target = "Several random players",
            description = [[ Heavy frost damage for 15 seconds. ]],
            response = [[ Healers focus the targets. ]],
        },
        {
            name = "Freezing Slash",
            spellId = 66012,
            danger = "medium",
            target = "Tank",
            timing = "About every 20 seconds",
            description = [[ A big hit on the tank that freezes them in place. ]],
            response = [[ Heal the tank. Tank uses cooldowns if needed. ]],
        },
        {
            name = "Nerubian Burrower",
            spellId = 66332,
            danger = "medium",
            target = "Raid",
            timing = "About every 45 seconds in Phase 1",
            description = [[ Adds that dig underground to heal unless they stand on Permafrost. ]],
            response = [[ Off tank holds them on Permafrost, DPS kill them. ]],
        },
        {
            name = "Shadow Strike",
            spellId = 66134,
            danger = "high",
            target = "Random player",
            heroicOnly = true,
            timing = "About every 30 seconds",
            description = [[ A Burrower digs under the ground and strikes a player for huge damage. ]],
            response = [[ Stun or interrupt the Burrower. ]],
        },
        {
            name = "Submerge",
            spellId = 65981,
            danger = "low",
            target = "Anub'arak",
            timing = "About 80 seconds after each emerge",
            description = [[ Anub'arak digs into the ground, starting Phase 2. ]],
            response = [[ Get ready to kite spikes and AoE Scarabs. ]],
        },
    },

    chat = {
        summary = {
            "Phase 1: tank boss and Burrowers on Permafrost patches. Kill Burrowers fast.",
            "Phase 2: boss burrows. If spikes chase you, run over a Permafrost patch. Everyone AoE Scarabs.",
            "Phase 3 at 30 percent: Leeching Swarm drains everyone. DPS use all cooldowns and Bloodlust.",
            "Shoot Frost Spheres only where Permafrost is needed.",
        },
        tank = {
            "Hold boss and Burrowers on Permafrost so Burrowers cannot dig down.",
            "Phase 2: gather Scarabs together for AoE. Save cooldowns for Phase 3.",
        },
        healer = {
            "Focus Penetrating Cold targets for 15 seconds.",
            "Phase 3: heal steadily against Leeching Swarm, use mana cooldowns before 30 percent.",
        },
        dps = {
            "Kill Burrowers as they spawn. AoE Scarabs in Phase 2.",
            "If chased by spikes, run over Permafrost. Phase 3: all cooldowns on the boss.",
        },
    },
})

---------------------------------------------------------------------------
-- THE RUBY SANCTUM
---------------------------------------------------------------------------

RTG:RegisterTactics("RS_Baltharus", {
    summary = "A warrior dragon that splits into clones. Spread out for Enervating Brand and off-tank the clones.",

    overview = [[
Baltharus the Warborn guards the captive dragon Xerestrasza. He is a simple fight with two things to watch: {spell:74505}, a debuff that punishes players standing close together, and his clones.

In 10-man he splits once (around 50% health). In 25-man he splits twice (around 66% and 33%). Each split knocks everyone back with {spell:74509} and creates a clone that must be tanked and killed.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers. 25-man: 2 tanks, 5-6 healers
- Spread out about 12 yards from each other (DBM shows a range frame)
- Off tank is ready to pick up each clone
]],

    phases = {
        { title = "The whole fight", text = [[
Tank Baltharus facing away from the raid. He uses {spell:75125} (a whirlwind) about every 24 seconds: melee should step out for its duration.

{spell:74505} goes on random players. Players within 12 yards of the branded player take damage and Baltharus gains strength. Branded players move away from others.

At each split, everyone is knocked back by Repelling Wave and briefly stunned. A clone appears: the off tank picks it up and holds it away from the main boss. Kill the clone, then go back to Baltharus.
]] },
    },

    tank = [[
- Face Baltharus away from the raid
- Off tank picks up the clone right after Repelling Wave and keeps it apart from the boss
- Blade Tempest hurts: use a cooldown if you cannot move out
]],

    healer = [[
- Brand damage hits the target's neighbors. Spread out so it does not chain
- Repelling Wave stuns everyone for a few seconds, so top off the tanks before a split
]],

    dps = [[
- Spread out 12 yards. If you get Brand, move away from others
- Melee step out of Blade Tempest
- Kill each clone quickly, then return to Baltharus
]],

    warnings = [[
- |cffff2020Do not stand close to an Enervating Brand target.|r It makes the boss stronger
- Do not ignore the clone: two Baltharus whirlwinds at once hurt a lot
]],

    heroic = [[
- Same mechanics with more health and much more damage
- Enervating Brand and Blade Tempest are far more punishing; spreading is mandatory
]],

    abilities = {
        {
            name = "Enervating Brand",
            spellId = 74505,
            danger = "high",
            target = "Random players",
            description = [[ Damages players within 12 yards of the target and makes Baltharus stronger. ]],
            response = [[ Spread out 12 yards. Branded players move away from others. ]],
        },
        {
            name = "Blade Tempest",
            spellId = 75125,
            danger = "medium",
            target = "Players near the boss",
            timing = "About every 24 seconds",
            description = [[ A whirlwind that hits everyone in melee range. ]],
            response = [[ Melee step out until it ends. ]],
        },
        {
            name = "Repelling Wave",
            spellId = 74509,
            danger = "medium",
            target = "Whole raid",
            timing = "At each split",
            description = [[ Knocks back and briefly stuns everyone when Baltharus splits. ]],
            response = [[ Top off tanks, then pick up the clone. ]],
        },
    },

    chat = {
        summary = {
            "Spread out 12 yards. If you get Enervating Brand, move away from others.",
            "Melee step out of Blade Tempest (whirlwind).",
            "Boss splits (once in 10, twice in 25). Off tank takes the clone, kill it fast.",
        },
        tank = {
            "Face boss away from the raid. Off tank picks up each clone after the knockback.",
        },
        healer = {
            "Top off tanks before a split, the knockback stuns everyone.",
        },
        dps = {
            "Kill clones quickly, then back to Baltharus. Stay spread.",
        },
    },
})

RTG:RegisterTactics("RS_Saviana", {
    summary = "A fire dragon with a frontal breath, an enrage to remove, and an air phase where marked players must spread.",

    overview = [[
Saviana Ragefire is a red dragon on the way to Halion. She alternates between a ground phase and a short air phase.

On the ground she breathes fire in front of her ({spell:74403}) and enrages ({spell:78722}), which hunters or rogues must remove. In the air she marks several players with {spell:74453}. A few seconds later those players are hit by Conflagration, which also hurts anyone standing near them.
]],

    preparation = [[
- 10-man: 1-2 tanks, 2-3 healers. 25-man: 2 tanks, 5-6 healers
- Bring a hunter (Tranquilizing Shot) or rogue (Anesthetic Poison) for the enrage
- Tank Saviana facing away from the raid. Ranged spread around her at about 10 yards
]],

    phases = {
        { title = "Ground phase (about 50 seconds)", text = [[
Saviana is tanked with her head away from the raid. Never stand in front of her (Flame Breath).

She becomes enraged from time to time. Remove the enrage right away with Tranquilizing Shot or Anesthetic Poison. If nobody can, the tank uses a defensive cooldown.
]] },
        { title = "Air phase (short)", text = [[
Saviana flies up and marks several players (up to 5 in 25-man) with Flame Beacon. After about 5 seconds she hits them with Conflagration.
- Marked players: move away from everyone else, at least 10 yards
- Unmarked players: stay away from marked players
After a few seconds she lands and the ground phase begins again.
]] },
    },

    tank = [[
- Face Saviana away from the raid so Flame Breath only hits you
- Use a cooldown if she enrages and nobody removes it
- Pick her up again quickly after she lands
]],

    healer = [[
- Flame Breath hits the tank hard
- Conflagration targets take heavy fire damage. Heal them right after it lands
]],

    dps = [[
- Hunters and rogues: remove the enrage every time
- Stay out of the front of the dragon
- If you get Flame Beacon, move away from other players
]],

    warnings = [[
- |cffff2020Spread out when Flame Beacons go out.|r Stacked players share the Conflagration damage
- Never stand in front of her during Flame Breath
]],

    heroic = [[
- Same mechanics with more health and damage
- Unremoved enrage and stacked Conflagration targets are much more dangerous
]],

    abilities = {
        {
            name = "Flame Beacon",
            spellId = 74453,
            danger = "high",
            target = "Several random players",
            timing = "Air phase",
            description = [[ Marks players for Conflagration, which hits them and players near them. ]],
            response = [[ Marked players spread 10 yards away from everyone. ]],
        },
        {
            name = "Enrage",
            spellId = 78722,
            danger = "medium",
            target = "Saviana",
            description = [[ Saviana deals much more damage for a short time. ]],
            response = [[ Tranquilizing Shot or Anesthetic Poison removes it. ]],
        },
        {
            name = "Flame Breath",
            spellId = 74403,
            danger = "medium",
            target = "Frontal cone",
            description = [[ Fire breath in front of the dragon. ]],
            response = [[ Only the tank stands in front. ]],
        },
        {
            name = "Conflagration",
            spellId = 74452,
            danger = "medium",
            target = "Beacon targets",
            timing = "About every 60 seconds",
            description = [[ The fire attack that hits players marked with Flame Beacon. ]],
            response = [[ Stay spread so only the marked player is hit. ]],
        },
    },

    chat = {
        summary = {
            "Tank faces Saviana away from the raid. Never stand in front of her.",
            "Hunters and rogues remove her Enrage with Tranq Shot or Anesthetic Poison.",
            "Air phase: Flame Beacon targets spread at least 10 yards from everyone.",
        },
        tank = {
            "Keep her facing away. Use a cooldown if Enrage is not removed.",
        },
        healer = {
            "Heal the Conflagration targets after it lands, and watch the tank during breaths.",
        },
        dps = {
            "If you get Flame Beacon, move away from others. Remove the Enrage.",
        },
    },
})

RTG:RegisterTactics("RS_Zarithrian", {
    summary = "A tank swap fight with an AoE fear and waves of Onyx Flamecaller adds.",

    overview = [[
General Zarithrian is the last mini-boss before Halion. He stacks {spell:74367} on his tank, so two tanks must swap. He fears the whole raid with {spell:74384} about every 30 seconds.

About every 40 seconds he calls Onyx Flamecaller adds that run in from the sides of the room. They cast fire spells (Blast Nova and Lava Gout) on the raid. Kill them before they pile up.
]],

    preparation = [[
- 10-man: 2 tanks, 2-3 healers. 25-man: 2 tanks, 5-6 healers
- Fear Ward (priests) on the tanks, Tremor Totem (shamans) helps a lot
- Assign interrupters for the adds
- Tank the boss in the middle of the room so the adds have to run to you
]],

    phases = {
        { title = "The whole fight", text = [[
The main tank holds Zarithrian. Each Cleave Armor lowers the tank's armor. Swap tanks at about 2 stacks.

Intimidating Roar fears everyone nearby every 30 seconds. Fear Ward, Tremor Totem and racials (Will of the Forsaken, Berserker Rage) help.

Every 40 seconds Onyx Flamecallers arrive from the sides. The off tank picks them up and brings them to the boss. Interrupt Blast Nova, kill the adds with focus fire or AoE, then go back to the boss.
]] },
    },

    tank = [[
- Swap the boss at about 2 stacks of Cleave Armor
- The tank without stacks grabs the Flamecallers when they arrive
- Use Berserker Rage or ask for Fear Ward before Intimidating Roar
]],

    healer = [[
- Cleave Armor makes the tank take more damage, watch for missed swaps
- The fear can break your casting, use Tremor Totem or Fear Ward if you have them
- Adds cause raid damage if they stay alive
]],

    dps = [[
- Switch to Flamecallers as soon as they arrive. Interrupt Blast Nova
- Go back to the boss after the adds die
]],

    warnings = [[
- |cffff2020Missing a tank swap is the most common wipe.|r Watch Cleave Armor stacks
- Do not let several waves of Flamecallers stack up
]],

    heroic = [[
- Same mechanics with more health and damage
- Flamecallers hit much harder, so interrupts and fast add kills matter more
]],

    abilities = {
        {
            name = "Cleave Armor",
            spellId = 74367,
            danger = "high",
            target = "Tank",
            description = [[ Stacking armor reduction on the tank, lasts 30 seconds. ]],
            response = [[ Tanks swap at about 2 stacks. ]],
        },
        {
            name = "Intimidating Roar",
            spellId = 74384,
            danger = "medium",
            target = "Whole raid",
            timing = "Every 30 seconds",
            description = [[ An AoE fear. ]],
            response = [[ Fear Ward, Tremor Totem, racials. Tanks Berserker Rage. ]],
        },
        {
            name = "Summon Flamecaller",
            spellId = 74398,
            danger = "medium",
            target = "Raid",
            timing = "About every 40 seconds",
            description = [[ Onyx Flamecaller adds arrive from the sides and cast fire spells. ]],
            response = [[ Off tank picks them up, interrupt, kill them fast. ]],
        },
    },

    chat = {
        summary = {
            "Tanks swap at about 2 Cleave Armor stacks.",
            "AoE fear every 30 seconds: Fear Ward tanks, shamans drop Tremor Totem.",
            "Flamecaller adds every 40 seconds: off tank picks them up, interrupt and kill them fast.",
        },
        tank = {
            "Swap at 2 Cleave Armor stacks. The tank without stacks grabs the adds.",
        },
        healer = {
            "Watch the tank with Cleave Armor stacks. Expect damage while adds are alive.",
        },
        dps = {
            "Switch to Flamecallers when they arrive. Interrupt their casts.",
        },
    },
})

RTG:RegisterTactics("RS_Halion", {
    summary = "A two-realm dragon: fight him in the physical realm, then inside the Twilight realm, then in both realms at once while balancing damage.",

    overview = [[
Halion the Twilight Destroyer is the end boss of the Ruby Sanctum. He exists in two places: the normal "physical" realm and the Twilight realm (a shadowy copy of the room you enter through portals).

The fight has three phases:
- Phase 1 (100% to 75%): Halion in the physical realm
- Phase 2 (75% to 50%): Halion moves into the Twilight realm and the whole raid follows him through portals
- Phase 3 (50% to 0%): Halion is in BOTH realms at once. The raid splits into two groups. He shares one health pool, and the Corporeality bar shows which realm is pulling ahead in damage

The big ideas: dodge fire and beams, run out with your debuff, and in Phase 3 keep damage in both realms balanced. There is a hard enrage at 8 minutes.
]],

    preparation = [[
- 10-man: 2 tanks, 3 healers, 5 DPS. 25-man: 2 tanks, 6 healers, the rest DPS
- Before the pull, split the raid into a Physical group and a Twilight group for Phase 3 (each with one tank and about half of the healers)
- Tank Halion facing away from the raid. Nobody stands behind him (Tail Lash)
- Ranged spread around him. Leave space at the edge of the room for debuffed players to run to
- Dispellers ready for Fiery Combustion and Soul Consumption
]],

    phases = {
        { title = "Phase 1 - Physical realm (100% to 75%)", text = [[
Tank Halion with his head away from the raid. He breathes fire in front ({spell:74525}) and sweeps his tail behind him ({spell:74531}) about every 10 seconds, stunning and hurting players there. Stand at his sides.

# Fiery Combustion (every 25 seconds)
A random player gets {spell:74562}. It ticks fire damage and gives stacks of Mark of Combustion. When the debuff ends or is dispelled, you explode and leave a patch of fire on the ground. More stacks = bigger fire.
- |cffff2020Run to the edge of the room right away|r, then get dispelled
- Dispel early, once the player is at the edge, so the fire patch stays small and out of the way

# Meteor Strike (every 40 seconds)
Halion yells and a meteor lands on a marked spot after a few seconds. Fire then spreads out from it in lines. Move away from the impact and out of the fire lines.
]] },
        { title = "Phase 2 - Twilight realm (75% to 50%)", text = [[
At 75% Halion goes into the Twilight realm. Everyone clicks one of the Twilight portals to follow him.

Inside, he uses {spell:74806} instead of fire breath and the same Tail Lash.

# Soul Consumption (every 20 seconds)
{spell:74792} is the shadow version of Fiery Combustion. Same rule: run to the edge, then get dispelled.

# Twilight Cutter (about every 30 seconds)
Two dark orbs circle the room. Every so often a purple beam ({spell:74769}) connects them and sweeps around for about 10 seconds. Being touched by the beam is usually death.
- Watch the orbs and stay between them on the side away from the beam
- Move with the rotation to stay in the safe gap
]] },
        { title = "Phase 3 - Both realms (50% to 0%)", text = [[
At 50% Halion appears in both realms. Your Physical group goes back out through the portal (or stays out), the Twilight group stays inside. Both groups fight their copy of Halion. Health is shared.

# Corporeality
A bar (Corporeality) shows how "solid" Halion is in your realm. Every few seconds the game compares damage done in each realm.
- If your realm does MORE damage, corporeality in your realm goes DOWN: Halion takes less damage from you and deals less. Slow down
- If your realm does LESS damage, corporeality in your realm goes UP: Halion takes more damage and hits harder. DPS harder, tank uses cooldowns
- The goal is to keep it near 50%. DBM tells you "DPS more" or "stop DPS"

Physical group handles Fiery Combustion, Meteor Strike, Flame Breath. Twilight group handles Soul Consumption, Twilight Cutter, Dark Breath. Tail Lash happens in both.
]] },
    },

    tank = [[
- Face Halion away from the raid at all times. Nobody should be behind him except during movement
- Phase 1: move Halion out of Meteor Strike fire if it lands near him
- Phase 2: one tank takes Halion in the Twilight realm. Move with the raid to avoid the Twilight Cutter beam
- Phase 3: each realm has one tank. If corporeality in your realm is high (above 60%), Halion hits much harder: use cooldowns
- If you get Combustion or Consumption, move a little to the side and ask for a quick dispel instead of running across the room
]],

    healer = [[
- Dispel Fiery Combustion / Soul Consumption once the player reaches the edge. Waiting too long makes the explosion bigger
- Combustion and Consumption tick hard while on the player. Heal them while they run
- Tail Lash hits anyone behind the boss. Heal stunned players
- Phase 3: you heal only your own realm. Split healers evenly before the pull
- High corporeality in your realm means much more tank damage
]],

    dps = [[
- Never stand in front of or behind Halion. Stay at his sides
- If you get Combustion or Consumption: run to the edge, away from the raid, and wait for the dispel
- Dodge Meteor Strike fire (Phase 1 and the Physical side of Phase 3)
- Twilight realm: watch the orbs and never touch the Twilight Cutter beam
- Phase 3: watch the Corporeality number. Below 50% in your realm, slow down. Above 50%, DPS harder
]],

    warnings = [[
- |cffff2020Twilight Cutter kills on contact.|r Always know where the two orbs are
- Do not get dispelled in the middle of the raid: the fire or shadow patch will cover the raid
- Fire patches from Meteor Strike and Combustion grow the room's danger zones: keep them at the edges
- Phase 3 wipes usually come from one realm overdoing damage. Watch Corporeality
- Do not stand behind Halion: Tail Lash stuns, and stunned players die to the next mechanic
]],

    heroic = [[
- Same three phases and mechanics with much more health and damage
- Fiery Combustion and Soul Consumption explosions are much larger: dispel timing and edge running are critical
- Corporeality swings matter more because the tank in the high-corporeality realm takes huge damage
- Meteor Strike and Twilight Cutter mistakes are rarely survivable
- The 8 minute enrage is a real limit, so the raid needs strong DPS in both realms
]],

    alternatives = {
        { title = "Phase 3 group split", text = [[
Common split: Physical group gets the main tank, half the healers and the melee. Twilight group gets the other tank, the other healers and most ranged (ranged handle the Twilight Cutter movement easier). Some raids swap ranged and melee. Whatever you choose, keep the damage roughly equal between realms.
]] },
    },

    abilities = {
        {
            name = "Twilight Cutter",
            spellId = 74769,
            danger = "high",
            target = "Players in the Twilight realm",
            timing = "About every 30 seconds in Phase 2 and 3",
            description = [[ A dark beam between two orbs that sweeps around the room for about 10 seconds. ]],
            response = [[ Stay in the gap between the orbs and move with the rotation. ]],
        },
        {
            name = "Fiery Combustion",
            spellId = 74562,
            danger = "high",
            target = "Random player (physical realm)",
            timing = "Every 25 seconds",
            description = [[ Fire damage over time that stacks Mark of Combustion. When it ends you explode and leave fire. ]],
            response = [[ Run to the edge of the room, then get dispelled. ]],
        },
        {
            name = "Soul Consumption",
            spellId = 74792,
            danger = "high",
            target = "Random player (Twilight realm)",
            timing = "Every 20 seconds",
            description = [[ Shadow version of Fiery Combustion. Explodes and leaves a shadow patch. ]],
            response = [[ Run to the edge of the room, then get dispelled. ]],
        },
        {
            name = "Meteor Strike",
            spellId = 74648,
            danger = "high",
            target = "Marked area (physical realm)",
            timing = "Every 40 seconds",
            description = [[ A meteor lands a few seconds after Halion yells, then fire spreads in lines. ]],
            response = [[ Move away from the impact and out of the spreading fire. ]],
        },
        {
            name = "Corporeality",
            spellId = 74826,
            danger = "medium",
            target = "Both realms (Phase 3)",
            description = [[ Shows how solid Halion is in your realm. High = takes and deals more damage. ]],
            response = [[ Keep near 50%. Low in your realm: slow DPS. High: DPS harder. ]],
        },
        {
            name = "Tail Lash",
            spellId = 74531,
            danger = "medium",
            target = "Players behind Halion",
            timing = "About every 10 seconds",
            description = [[ A tail sweep that damages and stuns players behind him. ]],
            response = [[ Stand at his sides, never behind. ]],
        },
        {
            name = "Flame Breath",
            spellId = 74525,
            danger = "medium",
            target = "Frontal cone (physical realm)",
            timing = "About every 13-17 seconds",
            description = [[ Fire breath in front of Halion. ]],
            response = [[ Only the tank stands in front. ]],
        },
        {
            name = "Dark Breath",
            spellId = 74806,
            danger = "medium",
            target = "Frontal cone (Twilight realm)",
            timing = "About every 13-17 seconds",
            description = [[ Shadow breath in front of Twilight Halion. ]],
            response = [[ Only the tank stands in front. ]],
        },
    },

    chat = {
        summary = {
            "Tank faces Halion away. Stand at his sides: breath in front, Tail Lash behind.",
            "Fiery Combustion or Soul Consumption: run to the edge of the room, then get dispelled.",
            "Phase 1: dodge Meteor Strike and the fire lines. Phase 2 at 75 percent: everyone into the Twilight portal.",
            "Twilight realm: never touch the purple beam between the two orbs. Stay in the safe gap.",
            "Phase 3 at 50 percent: split into groups. Keep Corporeality near 50. Low in your realm means slow down.",
        },
        tank = {
            "Face Halion away from the raid. Move him out of Meteor fire.",
            "Phase 3: if Corporeality in your realm is above 60, use defensive cooldowns.",
        },
        healer = {
            "Dispel Combustion and Consumption only when the player reaches the edge.",
            "Phase 3: heal your own realm only. High Corporeality means big tank damage.",
        },
        dps = {
            "Stay at the sides. Run to the edge with Combustion or Consumption.",
            "Phase 3: watch Corporeality. Below 50 in your realm slow down, above 50 DPS harder.",
        },
    },
})
