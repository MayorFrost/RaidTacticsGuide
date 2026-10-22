--[[
    Raid Tactics Guide - Ulduar, part 1
    The Siege of Ulduar and The Antechamber:
    Flame Leviathan, Ignis, Razorscale, XT-002, Assembly of Iron, Kologarn, Auriaya.
]]

local RTG = RaidTacticsGuide

---------------------------------------------------------------------------
-- Flame Leviathan
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Leviathan", {
    summary = "A vehicle fight: the whole raid drives siege vehicles, runs from the boss when it pursues you and shuts it down for burst damage.",

    overview = [[
Flame Leviathan is the first boss of Ulduar and it is unlike any other fight: nobody fights on foot. Every player gets into one of the Salvaged vehicles near the raid entrance and the vehicles fight the boss. Your own gear barely matters here, because vehicle damage and health do not scale with your gear.

The boss is a huge siege machine that drives around a big open courtyard. Every 30 seconds it picks one vehicle and chases it ({spell:62374}). The chased vehicle must run away while everyone else shoots the boss from behind. Passengers can be launched onto the boss, kill the turrets on its back and then overload it, which stuns the boss and makes it take much more damage.

The fight usually takes 5-8 minutes. Raids wipe when vehicles are caught and destroyed one by one, when nobody collects Pyrite ammo, or when Flame Vents are not interrupted.
]],

    preparation = [[
- Everyone picks a vehicle before the gate opens. Your raid leader assigns seats.
- # Salvaged Siege Engine (2 seats)
- Driver: Ram, Electroshock (interrupts Flame Vents) and a speed boost. Best given to tanks.
- Passenger: the turret. Fires a cannon at the boss and rockets at flying things.
- # Salvaged Demolisher (2 seats)
- Driver: hurls boulders and Pyrite barrels at the boss from long range. Your main damage.
- Passenger: picks up Liquid Pyrite to refill the driver and can be launched onto the boss.
- # Salvaged Chopper (1 seat, plus a sidecar)
- Fast bike. Drops tar to slow the boss and can carry a passenger in the sidecar.
- Learn your vehicle buttons before the pull. Your normal spell bar is replaced by the vehicle bar.
- Vehicles have a health bar and their own energy or ammo bar. Watch both.
- Four towers stand on the road to the boss. Each tower you destroy before the fight makes the boss weaker (see Hard Mode).
]],

    phases = {
        { title = "Phase 1 - The chase", text = [[
- The boss picks a vehicle and pursues it for about 30 seconds. You get a raid warning with the name.
- If you are pursued: drive away in a big circle around the edge of the courtyard. Do not run into other vehicles. Use your speed boost.
- Everyone else: stay behind or to the side of the boss and keep shooting. Never stand in its path.
- Demolishers stay at long range and throw Pyrite barrels. Passengers keep them stocked with Pyrite.
- Siege Engine drivers interrupt {spell:62396} with Electroshock every time it starts.
- Turret gunners and Demolisher passengers shoot down the flying Pyrite carriers so the Pyrite crates drop to the ground.
]] },
        { title = "Launch and System Shutdown", text = [[
- Demolisher passengers can be launched onto the boss with the catapult seat.
- On top of the boss there are Defense Turrets. Kill them (they have low health), then click the Overload Control Device.
- This causes {spell:62475}: the boss stops moving and casting for about 20 seconds and takes much more damage.
- Everyone fires everything during System Shutdown. Passengers fall off when the boss shuts down; get back into your vehicle quickly.
- The Defense Turrets shoot at you while you are on top. Kill them fast so you do not die up there.
- Repeat chase, launch and shutdown until the boss dies.
]] },
    },

    tank = [[
On this fight "tanks" are usually the Siege Engine drivers.
- Your most important job is Electroshock: it interrupts {spell:62396}. Assign who interrupts first and who is backup.
- Ram the boss when it is not chasing you, but do not stand directly in front of it.
- If the boss pursues you, use Steam Rush (speed) and lead it around the edge of the room, away from the Demolishers.
- Siege Engines have the most health. You can survive a hit or two from the boss, but its ram knocks you back and does heavy damage. Do not sit in front of it.
]],

    healer = [[
Your healing spells do not work here. You play a vehicle like everyone else.
- If you are a Siege Engine or Demolisher passenger, follow the same rules as the DPS.
- Demolisher passengers keep their driver stocked with Pyrite. If that is your seat, collect it all fight.
- Watch your vehicle health bar. A destroyed vehicle means you sit out for the rest of the fight.
]],

    dps = [[
- Demolisher drivers: stay at maximum range behind the boss. Use Pyrite barrels when you have Pyrite, boulders when you do not.
- Demolisher passengers: pick up Pyrite crates from the ground and load them into your driver. When asked, get launched onto the boss, kill the Defense Turrets and click the Overload Control Device.
- Turret gunners: shoot the boss and shoot down Pyrite carriers and incoming missiles with rockets.
- Chopper riders: drop tar in front of the boss to slow it, especially while it chases a slow vehicle. Pick up players who fall off the boss.
- During System Shutdown everyone uses their strongest attacks on the boss.
]],

    warnings = [[
- |cffff2020If the boss pursues you, run at once.|r Demolishers are slow; start turning away before the boss is close.
- |cffff2020Interrupt Flame Vents.|r Every Flame Vents that goes through burns every vehicle and stacks up a lot of damage.
- Do not leave your vehicle by accident. Your normal action bar buttons do nothing useful here.
- Do not drive in front of the boss when it is not chasing you. Its ram and fire hit anything in its path.
- Demolishers that run out of Pyrite do much less damage. Passengers must keep collecting it.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
Flame Leviathan's hard mode is controlled by the four towers along the road to the boss. At the start of the instance the Lore Keeper of Norgannon lets the raid activate the secondary defense systems. For each tower you leave standing, the boss gets more health and damage, gains a new ability from that tower and drops more loot. Destroying a tower removes its ability.
- # Tower of Flames
- Mimiron's Inferno: a moving pillar of fire roams the arena and leaves fire on the ground. Drive around it.
- # Tower of Frost
- {spell:62297}: frost beacons wander the arena and drift toward vehicles. Where they strike, vehicles are frozen and take heavy damage. Drive away from them.
- # Tower of Life
- Ward of Life: Freya's wards spawn large adds that attack vehicles. Kill them with Siege Engines and turrets.
- # Tower of Storms
- Thorim's Hammer: lightning strikes land on marked spots. Move out of the blue circles.

All four towers up is the hardest version and drops the most loot. Most new raids destroy all four towers and kill the boss on normal difficulty first.
]],

    alternatives = {
        { title = "Kill all towers vs. keep some", text = [[
Many raids destroy all four towers for an easy kill. Experienced raids leave one or two towers standing for extra loot. The Tower of Life is often the easiest to leave up, the Tower of Frost and Tower of Flames are usually destroyed first because they cause the most vehicle deaths.
]] },
    },

    abilities = {
        {
            name = "Pursued",
            spellId = 62374,
            danger = "high",
            target = "One random vehicle",
            timing = "About every 30 seconds",
            description = [[ The boss locks on to one vehicle and chases it for 30 seconds. It hits very hard if it catches you. ]],
            response = [[ If it is you, drive away around the edge of the arena at once and use your speed boost. Everyone else keeps shooting from behind. ]],
        },
        {
            name = "Flame Vents",
            spellId = 62396,
            danger = "high",
            target = "All vehicles",
            timing = "About every 20 seconds, lasts 10 seconds",
            description = [[ Fire bursts out of the boss and burns all vehicles around it. ]],
            response = [[ A Siege Engine driver interrupts it with Electroshock. Have a backup interrupter. ]],
        },
        {
            name = "Systems Shutdown",
            spellId = 62475,
            danger = "low",
            target = "Boss",
            timing = "After the Overload Control Device is used",
            description = [[ The boss is stunned for about 20 seconds and takes extra damage. This is the raid's damage window. ]],
            response = [[ Launch passengers, kill the Defense Turrets and click the Overload Control Device. Then everyone burns the boss. ]],
        },
        {
            name = "Hodir's Fury",
            spellId = 62297,
            danger = "medium",
            target = "Random vehicles",
            heroicOnly = true,
            description = [[ Hard mode only (Tower of Frost alive). Frost beacons strike near vehicles, freezing and damaging them. ]],
            response = [[ Keep moving and drive away from the beacons. ]],
        },
        {
            name = "Ward of Life",
            spellId = 62907,
            danger = "medium",
            target = "Raid",
            heroicOnly = true,
            timing = "About every 30 seconds",
            description = [[ Hard mode only (Tower of Life alive). Summons large Ward of Life adds that attack vehicles. ]],
            response = [[ Siege Engines and turrets kill the wards quickly. Demolishers stay away from them. ]],
        },
    },

    chat = {
        summary = {
            "Every 30 sec the boss chases one vehicle - if it is you, drive away around the edge of the room at once.",
            "Siege Engine drivers interrupt Flame Vents with Electroshock every time.",
            "Demolisher passengers collect Pyrite for their driver and get launched onto the boss to kill turrets.",
            "After the turrets die, click the Overload Control Device - boss shuts down 20 sec, everyone burns it.",
            "Never drive in front of the boss when it is not chasing you.",
        },
        tank = {
            "Siege Engine drivers: Electroshock every Flame Vents cast, have a backup ready.",
            "Ram the boss from the side, never from the front.",
            "If pursued, use Steam Rush and lead the boss around the edge, away from the Demolishers.",
        },
        healer = {
            "Your heals do not work here - you drive or ride a vehicle like everyone else.",
            "Help collect Pyrite and keep your vehicle out of the boss path.",
        },
        dps = {
            "Demolisher drivers: max range behind the boss, throw Pyrite barrels when you have Pyrite.",
            "Passengers: grab Pyrite crates, get launched, kill the turrets, click the Overload Control Device.",
            "Turrets: shoot down Pyrite carriers and missiles, then shoot the boss.",
            "Use everything during System Shutdown.",
        },
    },
})

---------------------------------------------------------------------------
-- Ignis the Furnace Master
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Ignis", {
    summary = "A tank-heavy fight: drag the Iron Constructs through fire, cool them in the water, then shatter them.",

    overview = [[
Ignis the Furnace Master stands in a large hall full of inactive Iron Constructs. During the fight he wakes them up one at a time. Every construct that is alive makes Ignis stronger, so the raid must destroy them. A construct cannot just be killed: it has to be heated up, cooled down and then broken.

The trick: Ignis breathes {spell:63473} on the ground. A construct standing in the fire heats up. When it is fully heated (Molten), the off-tank drags it into one of the two water pools at the sides of the room. The water turns it Brittle ({spell:62382}), and then one big hit shatters it.

Meanwhile Ignis grabs a random player and throws them into his {spell:63477}. That player takes heavy fire damage for 10 seconds and needs strong healing. The fight lasts about 4-6 minutes.
]],

    preparation = [[
- 2 tanks (10-man) or 2-3 tanks (25-man). 2-3 healers (10) or 5-6 healers (25).
- Main tank holds Ignis in the middle of the room. Off-tank picks up the constructs.
- Know where the two water pools are (left and right side of the hall).
- Assign 1-2 players with big single hits (rogues, warriors, ret paladins, hunters with cooldowns) to shatter brittle constructs.
- Casters: know your interrupt-proof timing. Flame Jets locks out any spell school you are casting.
]],

    phases = {
        { title = "Single phase - constructs and fire", text = [[
- Ignis wakes up an Iron Construct about every 30-40 seconds ({spell:62488}).
- The off-tank taunts it and drags it into the Scorch fire on the ground. The construct gains Heat stacks while it stands in the fire.
- At 10 Heat stacks the construct becomes Molten: it does fire damage to people near it and moves faster.
- The off-tank immediately drags the Molten construct into a water pool. It becomes Brittle.
- Hit the Brittle construct with one big attack (at least 5000 damage in one hit) to shatter it.
- {spell:63472}: Ignis casts this raid-wide fire burst. Stop casting right before it lands, or you get locked out of your spells for a few seconds.
- {spell:63477}: a random player is thrown into the pot. Heal them hard for 10 seconds.
- Repeat until Ignis dies. The fewer constructs alive, the less damage he does.
]] },
    },

    tank = [[
# Main tank (Ignis)
- Hold Ignis near the middle of the room so the Scorch fire lands where the off-tank can use it.
- Scorch is cast in front of Ignis. Move him a few steps out of his own fire puddle so you are not standing in it.
- Ignis hits harder for every construct alive. Use cooldowns if two or more constructs are up.
# Off-tank (constructs)
- Pick up every new construct as soon as it activates.
- Drag it into the Scorch fire and wait for 10 Heat stacks (Molten).
- Then run it into a water pool at once. Molten constructs burn you and nearby players.
- Call out when a construct is Brittle so the shatter team hits it.
]],

    healer = [[
- The main tank takes steady damage that grows with each living construct.
- The off-tank takes extra fire damage while dragging a Molten construct to the water.
- {spell:63477}: the player in the pot takes very heavy fire damage for 10 seconds. Spam heal and shield them. They cannot be freed early.
- Flame Jets hits the whole raid. Stop casting just before it lands so you are not locked out, then top everyone up.
- Holy paladins can use Aura Mastery with Fire Resistance Aura to reduce Flame Jets damage.
]],

    dps = [[
- Most DPS stays on Ignis. That is your main job.
- Assigned shatter players: when a construct turns Brittle in the water, hit it with your biggest single attack. A normal small hit will not shatter it.
- Do not damage constructs before they are Brittle unless the raid leader asks. Normal damage just wastes your time.
- Casters: stop casting when Flame Jets is about to land, or you are locked out of that spell school.
- Stay out of the Scorch fire and away from Molten constructs.
]],

    warnings = [[
- |cffff2020Shatter the constructs.|r Each living construct makes Ignis hit harder. Several alive at once can kill the main tank.
- |cffff2020Do not stand in Scorch fire.|r It is for the constructs, not for you.
- Stop casting when Flame Jets starts. Being locked out at the wrong moment can kill the Slag Pot target.
- Keep Molten constructs away from the raid. They burn everyone near them.
- Brittle does not last forever. Shatter quickly or the construct must be heated again.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Ignis has no hard mode. The mechanics are the same in both sizes.
- 25-man: Ignis has much more health and constructs are activated on a shorter timer, so the off-tank is busier. Many raids use two construct tanks.
- 25-man: Flame Jets and Scorch hit harder and are on slightly different timers.
- Achievement "Shattered": shatter two constructs within 5 seconds of each other.
- Achievement "Stokin' the Furnace": kill Ignis within 4 minutes.
]],

    alternatives = {
        { title = "Double shatter", text = [[
For the "Shattered" achievement the off-tank heats two constructs, drags both into the same water pool and the shatter team breaks them within 5 seconds of each other. It is harder on the off-tank and healers, so learn the normal kill first.
]] },
    },

    abilities = {
        {
            name = "Slag Pot",
            spellId = 63477,
            danger = "high",
            target = "Random raid member",
            description = [[ Ignis throws a player into his pot. They take heavy fire damage for 10 seconds. ]],
            response = [[ Healers focus the player in the pot until they are released. Use shields and big heals. ]],
        },
        {
            name = "Activate Construct",
            spellId = 62488,
            danger = "high",
            target = "An Iron Construct",
            timing = "About every 30-40 seconds",
            description = [[ Wakes an Iron Construct. Each living construct makes Ignis stronger. ]],
            response = [[ Off-tank picks it up, heats it in Scorch, cools it in water, then the shatter team breaks it. ]],
        },
        {
            name = "Flame Jets",
            spellId = 63472,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 45 seconds",
            description = [[ A raid-wide fire burst that also interrupts and locks out spellcasters. ]],
            response = [[ Stop casting right before it lands. Healers top up the raid after it. ]],
        },
        {
            name = "Scorch",
            spellId = 63473,
            danger = "medium",
            target = "Area in front of Ignis",
            timing = "About every 25-30 seconds",
            description = [[ Ignis breathes fire in front of him and leaves a burning patch on the ground. ]],
            response = [[ Players step out. The off-tank drags constructs into it to heat them up. ]],
        },
        {
            name = "Brittle",
            spellId = 62382,
            danger = "low",
            target = "Iron Construct in water",
            description = [[ A Molten construct that enters water becomes Brittle. One hit of 5000 or more damage shatters it. ]],
            response = [[ Assigned players hit Brittle constructs with their biggest single attack. ]],
        },
    },

    chat = {
        summary = {
            "Every living Iron Construct makes Ignis stronger - we must shatter them all.",
            "Off-tank drags constructs into Scorch fire to 10 stacks, then into the water to make them Brittle.",
            "Brittle construct: shatter team hits it with one big attack of 5000+ damage.",
            "Slag Pot: random player burns for 10 sec - healers focus them.",
            "Stop casting when Flame Jets starts or you get locked out.",
        },
        tank = {
            "Main tank: hold Ignis mid room and step out of his Scorch.",
            "Off-tank: grab each new construct, heat it in Scorch to Molten, then run it into the water.",
            "Call out Brittle so the shatter team can break it.",
        },
        healer = {
            "Slag Pot target needs heavy healing for 10 sec.",
            "Stop casting before Flame Jets lands, then heal the raid.",
            "Main tank damage goes up with each living construct.",
        },
        dps = {
            "Stay on Ignis. Shatter team only: hit Brittle constructs with your biggest attack.",
            "Do not stand in Scorch fire or near Molten constructs.",
            "Casters stop casting when Flame Jets starts.",
        },
    },
})

---------------------------------------------------------------------------
-- Razorscale
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Razorscale", {
    summary = "Survive the add waves while engineers build harpoons, chain the dragon to the ground, and finish her when she stays grounded.",

    overview = [[
Razorscale is a proto-dragon that starts the fight in the air. While she flies above you, waves of Dark Rune dwarves come out of the ground and attack. At the same time the friendly Expedition Engineers repair the Harpoon Turrets at the north side of the arena. When the harpoons are ready, players fire them to chain Razorscale to the ground.

While she is chained down, the whole raid damages her. After a while she breaks free, breathes fire in front of her and flies up again. This repeats until she reaches 50% health. Then she cannot fly any more and fights on the ground until she dies.

The fight has a 10 minute enrage timer. Most wipes come from add waves killing the engineers or healers, from people standing in {spell:64733} on the ground, or from tanks not swapping on {spell:64771}.
]],

    preparation = [[
- 2-3 tanks (10-man) or 3 tanks (25-man). 3 healers (10) or 5-6 healers (25).
- Assign players to fire the harpoons: 2 turrets in 10-man, 4 in 25-man. Each harpoon gunner needs to know which turret is theirs.
- Ranged players spread out so one Devouring Flame does not hit many people.
- Tanks agree on who picks up which add type.
]],

    phases = {
        { title = "Phase 1 - Air phase (add waves)", text = [[
- Razorscale flies above the arena and throws fireballs and {spell:64733} (purple fire on the ground). Move out of the fire.
- Dark Rune adds jump out of mole machines in waves:
- Dark Rune Watchers: casters with Chain Lightning. Interrupt and kill them.
- Dark Rune Sentinels: hit hard and Whirlwind. Tanks hold them, melee step out of the whirlwind.
- Dark Rune Guardians: smaller melee adds. Kill them fast.
- Keep the adds away from the engineers so the harpoons get repaired.
- The first harpoon is ready after about 54 seconds, then one more every ~21 seconds.
]] },
        { title = "Grounded - chained to the floor", text = [[
- When all harpoons are ready, the gunners click their turrets and fire. All harpoons must hit to pull her down.
- Razorscale is stunned on the ground for a short time. Everyone attacks her. Use cooldowns and Heroism/Bloodlust if the raid leader calls for it.
- After about 45 seconds she gets up. Right before she flies, she breathes fire in a cone in front of her ({spell:64021}) and knocks back people near her.
- Get away from her front. Then the air phase starts again with new adds.
]] },
        { title = "Phase 2 - Permanently grounded (below 50%)", text = [[
- At 50% health Razorscale can no longer fly. She lands and fights on the ground until she dies.
- {spell:64771} stacks on the tank and lowers armor and attack speed. Tanks swap.
- She keeps breathing fire in front of her and keeps casting Devouring Flame. Remaining adds still need to die.
- Nuke her before the 10 minute enrage.
]] },
    },

    tank = [[
- Air phase: pick up the Sentinels and Guardians as they spawn. Keep them away from the engineers and the ranged group.
- Move adds out of Devouring Flame on the ground.
- Grounded: one tank stands in front of Razorscale, but get out of her front when she gets up (Flame Breath).
- Phase 2: she applies {spell:64771} to her tank. Swap tanks at about 2 stacks. Never let one tank get too many stacks.
- Keep her facing away from the raid at all times.
]],

    healer = [[
- Air phase: adds hit the tanks and Watchers cast Chain Lightning. Watch everyone, not just the tanks.
- Devouring Flame hurts a lot if people stand in it. Do not stand in it yourself; move and keep healing.
- Grounded and phase 2: her Flame Breath can nearly kill anyone in front of her. Keep the tank topped off.
- Phase 2 tank damage is high. Be ready when the tanks swap because of Fuse Armor.
]],

    dps = [[
- Air phase: kill Watchers first (interrupt Chain Lightning), then Guardians, then Sentinels.
- Ranged spread out so Devouring Flame hits only one person at a time.
- Harpoon gunners: watch for "Harpoon Turret is ready" and fire when your raid leader calls it. All turrets must fire.
- Grounded: switch to Razorscale at once and do maximum damage. This is the most important damage of the fight.
- Melee: when she starts to get up, run out from in front of her.
]],

    warnings = [[
- |cffff2020Move out of Devouring Flame (purple fire) immediately.|r It ticks very hard.
- |cffff2020Never stand in front of Razorscale.|r Her Flame Breath can kill anyone except a geared tank.
- Protect the engineers. If they die, the harpoons are not repaired and you cannot ground her.
- Harpoon gunners must not miss their turret. One missing harpoon means she stays in the air.
- Tanks swap on Fuse Armor in phase 2 or the tank will die.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Razorscale has no hard mode.
- 10-man: 2 harpoon turrets need to be fired. Fewer adds per wave.
- 25-man: 4 harpoon turrets need to be fired, more adds per wave and more Devouring Flames at once. Assign a backup gunner for each turret.
- Achievement "A Quick Shave": kill her without letting her fly up more than once.
- Achievement "Iron Dwarf, Medium Rare": kill 25 Dark Rune Guardians with Razorscale's own breath.
]],

    alternatives = {
        { title = "One ground phase (Quick Shave)", text = [[
Geared raids save Heroism/Bloodlust and every cooldown for the first ground phase and try to get her below 50% before she flies again. This skips most of the add waves.
]] },
    },

    abilities = {
        {
            name = "Devouring Flame",
            spellId = 64733,
            danger = "high",
            target = "Random players (ground area)",
            description = [[ Razorscale breathes purple fire at the ground. The fire stays for a while and burns anyone in it. ]],
            response = [[ Move out of the fire immediately. Ranged spread out. Tanks drag adds out of it. ]],
        },
        {
            name = "Flame Breath",
            spellId = 64021,
            danger = "high",
            target = "Cone in front of Razorscale",
            timing = "When she gets up from the ground, and often in phase 2",
            description = [[ A huge cone of fire in front of her. ]],
            response = [[ Only the tank may stand in front of her. Everyone else stays at her sides or behind her. ]],
        },
        {
            name = "Fuse Armor",
            spellId = 64771,
            danger = "high",
            target = "Current tank (phase 2)",
            timing = "About every 10-20 seconds",
            description = [[ Stacking debuff on the tank that lowers armor, attack speed and movement speed. ]],
            response = [[ The other tank taunts at about 2 stacks. Let stacks fall off before taking her back. ]],
        },
        {
            name = "Harpoon Turrets",
            spellId = 48642,
            danger = "medium",
            target = "Raid (friendly turrets)",
            timing = "First after about 54 seconds, then every ~21 seconds",
            description = [[ The engineers repair Harpoon Turrets. When all are ready, firing them chains Razorscale to the ground. ]],
            response = [[ Assigned gunners click their turret and fire. Protect the engineers from the adds. ]],
        },
        {
            name = "Dark Rune adds",
            icon = "Interface\\Icons\\INV_Misc_Head_Dwarf_01",
            danger = "medium",
            target = "Raid",
            timing = "Waves during every air phase",
            description = [[ Watchers (Chain Lightning casters), Sentinels (Whirlwind) and Guardians spawn from mole machines. ]],
            response = [[ Tanks pick them up, DPS kill Watchers first. Keep them away from engineers and out of Devouring Flame. ]],
        },
    },

    chat = {
        summary = {
            "Air phase: kill the dwarf adds, Watchers first. Protect the engineers who repair the harpoons.",
            "Move out of purple fire (Devouring Flame) at once. Ranged spread out.",
            "When harpoons are ready, gunners fire ALL turrets - she gets chained down, everyone burns her.",
            "Never stand in front of her - Flame Breath when she gets up.",
            "Below 50% she stays on the ground. Tanks swap on Fuse Armor.",
        },
        tank = {
            "Pick up Sentinels and Guardians, keep them away from engineers and out of fire.",
            "Keep Razorscale facing away from the raid.",
            "Phase 2: swap tanks at about 2 stacks of Fuse Armor.",
        },
        healer = {
            "Air phase: Chain Lightning and adds hit everyone, not just tanks.",
            "Do not stand in purple fire, keep moving and healing.",
            "Phase 2 tank damage is high, watch for tank swaps.",
        },
        dps = {
            "Kill order on adds: Watchers, Guardians, Sentinels. Interrupt Chain Lightning.",
            "When she is grounded, switch to her at once and use cooldowns.",
            "Harpoon gunners: fire your turret when called, every turret must hit.",
        },
    },
})

---------------------------------------------------------------------------
-- XT-002 Deconstructor
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_XT002", {
    summary = "A spread-out fight: move away with bombs, heal through Tympanic Tantrum, and burn the heart when it is exposed.",

    overview = [[
XT-002 Deconstructor is a giant, childish robot that throws tantrums. The raid spreads out in a big circle around him. He marks players with two kinds of bombs: {spell:65121} hurts people near the target, and {spell:64234} explodes and pulls nearby players in. Marked players run away from the group.

About every 60 seconds he throws a {spell:62776}: an 8 second raid-wide damage pulse that healers must heal through.

At 75%, 50% and 25% health XT-002 shuts down and opens his chest, showing his heart ({spell:63849}) for about 30 seconds. Damage on the heart goes to the boss. During this time small robots pour out of the scrap piles on the walls. Kill or control them, then the boss wakes up again. Whether you destroy the heart decides whether you are doing hard mode (see below). The fight has a 10 minute enrage.
]],

    preparation = [[
- 2 tanks, 3 healers (10-man) or 2-3 tanks, 5-6 healers (25-man).
- Everyone spreads out in a wide circle around the boss, at least 12 yards apart. Use the DBM range frame.
- Choose a place where bomb targets run: the edges of the room, away from the group.
- Decide before the pull: normal mode (do not kill the heart) or hard mode (kill the heart).
]],

    phases = {
        { title = "Phase 1 - Boss active", text = [[
- The main tank holds XT-002 in the middle. Everyone else spreads out.
- {spell:65121}: the target damages everyone around them for about 9 seconds. Run out of the group.
- {spell:64234}: after 9 seconds it explodes, damages and pulls everyone nearby toward the target. Run far away from everyone.
- {spell:62776}: every ~60 seconds, 8 seconds of heavy raid damage and a daze. Healers heal through it, everyone uses a personal defensive if needed.
]] },
        { title = "Phase 2 - Heart exposed (75%, 50%, 25%)", text = [[
- XT-002 stops moving and his heart is exposed for about 30 seconds. Damage on the heart is passed to the boss.
- Robots come out of the four scrap piles:
- XS-013 Scrapbots: walk to the boss and repair him. Kill or slow them before they reach him.
- XE-321 Boombots: explode when they reach the raid or die. Kill them away from the group.
- XM-024 Pummellers: big robots. Tanks pick them up.
- Normal mode: DPS the heart, but do not kill it (stop if it gets low). After 30 seconds the boss wakes up and phase 1 starts again.
- Hard mode: kill the heart (see Hard Mode).
]] },
    },

    tank = [[
- Main tank: hold XT-002 in the center of the room. Nothing special to swap for.
- When you get a bomb, move the boss with you only if needed. Usually you just step out of the group; melee should give you room.
- Off-tank: during heart phase pick up the XM-024 Pummellers as they come from the scrap piles. Keep them away from the raid.
- Tympanic Tantrum also hits you. Use a cooldown if your healers are low on mana.
]],

    healer = [[
- Spread out yourself. Bomb targets will run away from you.
- {spell:65121} targets take damage and hurt others near them; heal them while they run out.
- {spell:62776} is the big healing check: 8 seconds of raid damage. Use AoE heals and raid cooldowns (Divine Hymn, Tranquility, Aura Mastery are common choices).
- Heart phase gives some downtime. Use it to regain mana, but watch Boombot explosions.
]],

    dps = [[
- Phase 1: full damage on XT-002, but stay spread.
- If you are a bomb target, run out at once and come back after it ends.
- Heart phase: in normal mode put damage on the heart (it goes to the boss) but never kill it. Ranged and AoE classes kill the robots: Scrapbots and Boombots first.
- Slows, roots and stuns work on the small robots. Frost and AoE are strong here.
- Kill Boombots away from the raid: they explode when they die.
]],

    warnings = [[
- |cffff2020Run away from the raid with Gravity Bomb.|r The pull-in can drag several players into the explosion and kill them.
- |cffff2020Run away with Searing Light (Light Bomb).|r Everyone near you takes damage.
- Stay spread at all times. Clumped raids die to bombs.
- Do not kill the heart unless your raid has decided to do hard mode.
- Do not let Scrapbots reach the boss: they heal him.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
To start hard mode, destroy the heart during any heart phase (at 75% is best). This is called "Heartbreaker".
- XT-002 gains Heartbreak: he gets much more health and deals much more damage.
- There are no more heart phases. You must kill him in one long phase 1.
- Searing Light now spawns a Life Spark at the target: an add that pulses damage near it. A tank picks it up or it is killed away from the raid.
- Gravity Bomb now leaves a black void zone on the ground ({spell:64206}). Never stand in it.
- Tympanic Tantrum hits harder.
- Hard mode gives extra and better loot, and the achievement "Heartbreaker".

Other achievements: "Nerf Engineering" (10-man) and "Must Deconstruct Faster" (25-man) for a kill within 205 seconds, plus "Nerf Scrapbots" and "Nerf Gravity Bombs".
]],

    abilities = {
        {
            name = "Gravity Bomb",
            spellId = 64234,
            danger = "high",
            target = "Random player",
            timing = "Explodes after 9 seconds",
            description = [[ Explodes after 9 seconds, damages and pulls in everyone nearby. ]],
            response = [[ Run far away from everyone before it explodes. In hard mode move out of the void zone it leaves. ]],
        },
        {
            name = "Searing Light",
            spellId = 65121,
            danger = "high",
            target = "Random player",
            timing = "Lasts 9 seconds",
            description = [[ The Light Bomb damages the target and everyone close to them for 9 seconds. ]],
            response = [[ Run out of the group. Healers heal the target while they stand alone. ]],
        },
        {
            name = "Tympanic Tantrum",
            spellId = 62776,
            danger = "high",
            target = "Whole raid",
            timing = "About every 60 seconds, 8 second channel",
            description = [[ Raid-wide damage and daze for 8 seconds. ]],
            response = [[ Healers use AoE heals and cooldowns. Everyone uses a personal defensive if low. ]],
        },
        {
            name = "Exposed Heart",
            spellId = 63849,
            danger = "medium",
            target = "Boss",
            timing = "At 75%, 50% and 25% health, lasts about 30 seconds",
            description = [[ The boss shuts down and his heart opens. Damage on the heart goes to the boss. Robots spawn from scrap piles. ]],
            response = [[ Normal mode: damage the heart but do not kill it. Kill the robots. Hard mode: kill the heart. ]],
        },
        {
            name = "Void Zone (Consumption)",
            spellId = 64206,
            danger = "medium",
            target = "Ground where a Gravity Bomb exploded",
            heroicOnly = true,
            description = [[ Hard mode only. A black zone that damages anyone standing in it. ]],
            response = [[ Gravity Bomb targets explode at the edge of the room so the zones do not block the raid. ]],
        },
    },

    chat = {
        summary = {
            "Spread out, at least 12 yards from each other.",
            "Light Bomb or Gravity Bomb on you: run away from everyone until it ends.",
            "Tympanic Tantrum every ~60 sec: 8 sec raid damage, healers use cooldowns.",
            "At 75, 50 and 25 percent the heart opens for 30 sec: kill Scrapbots and Boombots, do not kill the heart (normal mode).",
        },
        tank = {
            "Main tank holds XT-002 in the center, melee give the tank room for bombs.",
            "Off-tank picks up the big Pummeller robots during heart phase.",
        },
        healer = {
            "Stay spread. Heal bomb targets while they run out.",
            "Tympanic Tantrum is the healing check - plan your AoE heals and raid cooldowns.",
        },
        dps = {
            "Bomb on you: run out, come back after.",
            "Heart phase: ranged and AoE kill Scrapbots before they reach the boss, kill Boombots away from the raid.",
            "Normal mode: damage the heart but stop before it dies.",
        },
    },
})

---------------------------------------------------------------------------
-- The Assembly of Iron
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_IronCouncil", {
    summary = "Three bosses at once: kill them one by one, and the survivors get stronger and gain new abilities each time.",

    overview = [[
The Assembly of Iron (also called the Iron Council) is three iron giants fought together:
- Steelbreaker: a melee bruiser who hits the tank very hard.
- Runemaster Molgeim: a rune caster who places runes on the floor and shields himself.
- Stormcaller Brundir: a lightning caster with chain lightning and a deadly Overload.

You kill them one at a time. When one dies, the others gain {spell:61920}: they heal to full, deal more damage and learn a new ability. So the order you kill them in matters a lot. The order also decides your loot: killing Steelbreaker last is the hard mode.

The fight has a 15 minute enrage. Wipes usually come from Overload hitting the raid, from people standing in Rune of Death, or from tanks not swapping on Overwhelming Power late in the fight.
]],

    preparation = [[
- 3 tanks are common: one for each boss (some raids tank Brundir with a ranged tank or just let him follow someone).
- 3 healers (10-man) or 6 healers (25-man).
- Decide your kill order before the pull. Easy order: Steelbreaker, then Molgeim, then Brundir.
- Assign interrupters for Brundir's Chain Lightning (and later Lightning Whirl).
- Assign dispellers or a mage to remove Molgeim's Shield of Runes.
- Ranged spread out (DBM range frame) because of Chain Lightning.
]],

    phases = {
        { title = "All three alive", text = [[
- Each tank holds their boss apart from the others, so their abilities do not stack on the raid.
- Steelbreaker: {spell:61903} hits his tank very hard. Healers watch that tank.
- Molgeim: {spell:62274} shields him. Dispel or spellsteal it. Rune of Power appears under a boss and buffs it: tanks move the bosses out of it.
- Brundir: interrupt Chain Lightning. When he casts {spell:63481}, every player in range must run far away (6 second cast).
- All DPS on the first kill target.
]] },
        { title = "One boss dead (first Supercharge)", text = [[
- The two survivors heal to full and get stronger.
- Steelbreaker (if alive) gains Static Disruption: a debuff that bounces to players and increases nature damage. Stay spread.
- Molgeim (if alive) gains {spell:63490} Rune of Death. Move out of it.
- Brundir (if alive) gains {spell:63483}: a channeled lightning attack. Interrupt it.
]] },
        { title = "Two bosses dead (second Supercharge)", text = [[
- The last boss heals to full and gains its final ability.
- Steelbreaker: {spell:61888} on his tank. When it ends the tank explodes (Meltdown). The other tank must taunt before it runs out.
- Molgeim: Rune of Summoning spawns Lightning Elementals that run at the raid and explode. AoE them or kill them before they reach you.
- Brundir: {spell:63486}. He floats and follows a random player, hitting everyone near him. Run away from him.
]] },
    },

    tank = [[
- Hold your boss away from the other two. Molgeim's Rune of Power buffs the boss standing in it: move your boss out of it at once.
- Steelbreaker tank: {spell:61903} hits very hard. Use cooldowns when it is cast (3 second cast).
- If Steelbreaker is last: {spell:61888} gives him a huge damage boost against his tank, and the tank dies when it ends. Swap before it expires every time.
- Brundir tank: keep him away from the raid so everyone can outrun Overload. Run out yourself when he casts it.
- If Brundir is last, his Lightning Tendrils make him fly after players. You cannot really tank him then; the raid kites him.
]],

    healer = [[
- Steelbreaker's tank takes the most damage, especially from Fusion Punch. Fusion Punch is magic and can be dispelled.
- Steelbreaker also has High Voltage, a constant small damage aura on the raid. Expect steady raid damage the whole fight.
- Dispel Shield of Runes from Molgeim if you can (priests, shamans with Purge, mages with Spellsteal).
- Stay spread and out of Rune of Death. Run with everyone when Brundir casts Overload.
]],

    dps = [[
- Attack only the current kill target. Damage on the wrong boss is wasted, because they heal to full on Supercharge.
- Interrupt Brundir's Chain Lightning and later Lightning Whirl. He is a caster: kicks, counterspells and stuns help.
- Overload: when Brundir casts it, everyone runs far away from him (about 30 yards). Come back after it goes off.
- Remove Molgeim's Shield of Runes (dispel, purge, spellsteal).
- Move out of Rune of Death at once. Kill Lightning Elementals if Molgeim is the last boss.
]],

    warnings = [[
- |cffff2020Run from Overload.|r Brundir's Overload deals huge damage to everyone close to him after a 6 second cast.
- |cffff2020Move out of Rune of Death.|r It ticks very hard.
- Tanks must swap on Overwhelming Power. If it expires on the same tank, that tank explodes.
- Keep the bosses apart and out of Rune of Power.
- Stay spread because of Chain Lightning and Static Disruption.
]],

    heroicTitle = "Hard Mode",
    heroic = [[
The Assembly of Iron has no switch: the hard mode is the kill order. Whoever dies last decides the loot and the achievement.
- # Steelbreaker last (hard mode)
- Kill order: Brundir, then Molgeim, then Steelbreaker. Best loot and the achievement "I Choose You, Steelbreaker".
- Brundir dies first, so his Overload is only seen at the start.
- Steelbreaker reaches full power with Static Disruption and {spell:61888}. Tanks swap on every Overwhelming Power. Healers must be ready for very high tank damage.
- # Molgeim last
- Kill order usually Steelbreaker or Brundir first, Molgeim last. Achievement "I Choose You, Runemaster Molgeim". Normal loot.
- # Brundir last (easiest)
- Kill order: Steelbreaker, Molgeim, Brundir. Achievement "I Choose You, Stormcaller Brundir". Normal loot. Brundir follows players with Lightning Tendrils; kite him and stay away from him.
]],

    alternatives = {
        { title = "Easy kill order", text = [[
Steelbreaker first (he is the biggest danger to tanks), then Molgeim, then Brundir. Brundir alone is mostly a running fight: interrupt, run from Overload and run from Lightning Tendrils.
]] },
        { title = "Hard mode kill order", text = [[
Brundir first, then Molgeim, then Steelbreaker. You need strong tanks with clean swaps on Overwhelming Power and healers that can handle the last phase.
]] },
    },

    abilities = {
        {
            name = "Overload",
            spellId = 63481,
            danger = "high",
            target = "Everyone near Brundir",
            timing = "About every 60 seconds, 6 second cast",
            description = [[ Brundir charges up and then explodes, dealing huge damage to everyone close to him. ]],
            response = [[ Run far away (about 30 yards) from Brundir during the cast. Come back after it goes off. ]],
        },
        {
            name = "Overwhelming Power",
            spellId = 61888,
            danger = "high",
            target = "Steelbreaker's tank",
            heroicOnly = false,
            description = [[ Only when Steelbreaker is the last boss. Big damage increase; when it ends the tank dies in a Meltdown. ]],
            response = [[ The other tank taunts before it expires. Swap every time. ]],
        },
        {
            name = "Fusion Punch",
            spellId = 61903,
            danger = "high",
            target = "Steelbreaker's tank",
            timing = "3 second cast",
            description = [[ A very heavy hit plus a magic damage effect on the tank. ]],
            response = [[ Tank uses a cooldown. Healers top off and dispel the magic effect. ]],
        },
        {
            name = "Rune of Death",
            spellId = 63490,
            danger = "high",
            target = "Ground under players",
            timing = "About every 30 seconds after Molgeim's first Supercharge",
            description = [[ A dark rune on the ground that deals heavy shadow damage to anyone in it. ]],
            response = [[ Move out of it at once. ]],
        },
        {
            name = "Shield of Runes",
            spellId = 62274,
            danger = "medium",
            target = "Molgeim",
            description = [[ A shield that absorbs damage on Molgeim. ]],
            response = [[ Dispel, purge or spellsteal it. ]],
        },
        {
            name = "Lightning Whirl",
            spellId = 63483,
            danger = "medium",
            target = "Raid",
            timing = "After Brundir's first Supercharge, about every 30 seconds",
            description = [[ A channeled spell that hits random players with lightning. ]],
            response = [[ Interrupt it. Brundir is the most important interrupt target. ]],
        },
        {
            name = "Lightning Tendrils",
            spellId = 63486,
            danger = "high",
            target = "Random player",
            timing = "When Brundir is the last boss",
            description = [[ Brundir floats up and follows a player, hurting everyone near him. ]],
            response = [[ The followed player runs away (kites) and everyone else stays clear of him. ]],
        },
        {
            name = "Supercharge",
            spellId = 61920,
            danger = "medium",
            target = "The surviving bosses",
            timing = "When any boss dies",
            description = [[ When one boss dies, the others heal to full, get stronger and learn a new ability. ]],
            response = [[ Stick to the kill order. Do not damage the other bosses before their turn. ]],
        },
    },

    chat = {
        summary = {
            "Kill order: Steelbreaker, Molgeim, Brundir (easy). Only damage the current target.",
            "When one dies, the others heal to full and learn a new ability.",
            "Brundir casts Overload: run about 30 yards away from him, come back after.",
            "Move out of Rune of Death. Tanks move bosses out of Rune of Power.",
            "Interrupt Brundir Chain Lightning. Dispel or spellsteal Molgeim Shield of Runes.",
        },
        tank = {
            "Keep the three bosses apart and out of Rune of Power.",
            "Steelbreaker tank: use cooldowns on Fusion Punch.",
            "If Steelbreaker is last: swap tanks on every Overwhelming Power before it expires.",
        },
        healer = {
            "Steelbreaker's tank takes huge hits from Fusion Punch - dispel the magic effect.",
            "Constant raid damage from High Voltage. Stay spread.",
            "Run from Overload too.",
        },
        dps = {
            "Only hit the kill target. Interrupt Brundir.",
            "Purge, dispel or spellsteal Shield of Runes on Molgeim.",
            "Run from Overload and from Brundir when he flies after players.",
        },
    },
})

---------------------------------------------------------------------------
-- Kologarn
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Kologarn", {
    summary = "A stone giant that cannot move: kill his arms to hurt his body, free gripped players and run the eye beams away from the raid.",

    overview = [[
Kologarn is a giant stone head and body built into the edge of a bridge. He cannot move. He has two arms that are separate targets:
- The Right Arm grabs players with {spell:62166} and squeezes them.
- The Left Arm slams the ground with {spell:63982}, hitting the whole raid.

When an arm dies, Kologarn's body loses a large chunk of health and a group of Rubble adds falls from the arm. After about 30 seconds the arm grows back.

He also shoots two {spell:63346} beams at a random player. The beams follow that player and burn anyone they touch. The fight has a 10 minute enrage and usually takes 4-6 minutes.
]],

    preparation = [[
- 2 tanks, 3 healers (10-man) or 2 tanks, 5-6 healers (25-man).
- Main tank on Kologarn's body. Off-tank picks up the Rubble adds when an arm dies.
- Melee and most ranged stand in a group in front of the boss.
- Pick a running path for Focused Eyebeam: along the side of the platform, away from the raid.
- Assign a few DPS to the Right Arm to free gripped players.
]],

    phases = {
        { title = "Single phase - body and arms", text = [[
- Main tank holds the body. The body hits hard with {spell:64003} and stacks {spell:64002} on the tank.
- {spell:62166}: the Right Arm grabs 1 player (10-man) or 3 players (25-man) and squeezes them. DPS on the Right Arm until it releases them.
- {spell:63982}: the Left Arm hits the whole raid. Healers top everyone off after it.
- {spell:63346}: a player is marked. Two beams follow that player. Run them away from the raid in a straight line along the edge, then come back.
- When an arm dies: Kologarn loses a big chunk of health and Rubble adds spawn. Off-tank grabs them, AoE kills them.
- The arm comes back after about 30 seconds. Repeat.
]] },
    },

    tank = [[
- Main tank: stand in front of the body. Overhead Smash hits hard and Crunch Armor lowers your armor.
- 25-man: swap tanks when Crunch Armor stacks get high (the DBM warning starts at 2 stacks).
- Make sure someone is always in melee range of the body. If nobody is close, Kologarn uses Petrifying Breath on the raid.
- Off-tank: when an arm dies, pick up the Rubble that falls from it and hold it in the AoE zone.
]],

    healer = [[
- Players caught by {spell:62166} take heavy damage. Heal them until they are released.
- {spell:63982} hits everyone. Keep the raid high so it never kills anyone.
- The main tank takes big hits from Overhead Smash. Do not let them drop low.
- Eyebeam targets run away; heal them while they are out of the group.
]],

    dps = [[
- Most raids kill the Right Arm whenever it is up (it releases gripped players and takes health off the body), then go back to the body.
- Some raids also kill the Left Arm to stop Shockwave. Follow your raid leader.
- When the Rubble adds spawn, AoE classes kill them quickly.
- Focused Eyebeam on you: run away from the raid at once in a straight line and keep running until it ends. Do not run through other players.
- Melee: you can stand on the body's front; do not run off the edge of the bridge.
]],

    warnings = [[
- |cffff2020Run the eye beams away from the raid.|r If the beam crosses the group it hurts everyone.
- |cffff2020Free gripped players fast.|r Stone Grip can kill them if the Right Arm is not damaged.
- Always keep someone in melee range of the body, or he breathes on the raid.
- Do not stand at the edge of the platform where you could be knocked off.
- Rubble adds hurt the healers if they are not picked up.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Kologarn has no hard mode.
- 10-man: Stone Grip catches 1 player. The arms and body have less health.
- 25-man: Stone Grip catches 3 players at once, so more damage must go into the Right Arm to free them. More healers are needed for Shockwave.
- Achievement "With Open Arms": kill Kologarn without killing either arm.
- Achievement "Disarmed": kill both arms within 12 seconds (10-man) or 10 seconds (25-man) of each other.
- 25-man: Crunch Armor stacks on the tank and needs tank swaps. In 10-man it does not stack the same way.
- Achievement "If Looks Could Kill": kill him without anyone being hit by Focused Eyebeam.
- Achievement "Rubble and Roll": kill 25 Rubble during the fight.
]],

    abilities = {
        {
            name = "Focused Eyebeam",
            spellId = 63346,
            danger = "high",
            target = "Random player",
            timing = "About every 15-35 seconds",
            description = [[ Two eye beams follow the marked player and burn anyone they touch. ]],
            response = [[ Run in a straight line away from the raid along the edge until the beams fade. ]],
        },
        {
            name = "Stone Grip",
            spellId = 62166,
            danger = "high",
            target = "1 player (10) or 3 players (25)",
            timing = "About every 25 seconds while the Right Arm is up",
            description = [[ The Right Arm grabs and squeezes players. ]],
            response = [[ DPS the Right Arm to free them. Healers keep gripped players alive. ]],
        },
        {
            name = "Shockwave",
            spellId = 63982,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 25 seconds while the Left Arm is up",
            description = [[ The Left Arm slams the ground and hits the whole raid. ]],
            response = [[ Healers keep the raid topped up. Killing the Left Arm stops it for a while. ]],
        },
        {
            name = "Overhead Smash",
            spellId = 64003,
            danger = "medium",
            target = "Main tank",
            timing = "About every 15 seconds",
            description = [[ A very heavy hit on the tank. Weaker if one arm is dead. ]],
            response = [[ Tank uses cooldowns, healers keep the tank high. ]],
        },
        {
            name = "Crunch Armor",
            spellId = 64002,
            danger = "medium",
            target = "Main tank",
            description = [[ A stacking debuff that lowers the tank's armor. ]],
            response = [[ Swap tanks if the stacks get high. ]],
        },
    },

    chat = {
        summary = {
            "Kill the Right Arm to free gripped players. Each dead arm takes a big chunk of the body's health.",
            "Focused Eyebeam on you: run away from the raid in a straight line along the edge.",
            "Left Arm Shockwave hits everyone - healers keep the raid high.",
            "When an arm dies, Rubble adds spawn - off-tank picks them up, AoE them.",
        },
        tank = {
            "Main tank on the body, use cooldowns for Overhead Smash.",
            "Off-tank picks up Rubble when an arm dies, swap if Crunch Armor stacks get high.",
            "Someone must always be in melee range of the body.",
        },
        healer = {
            "Heal gripped players until they are released.",
            "Shockwave hits everyone, keep the raid topped.",
            "Eyebeam targets run out, heal them while they run.",
        },
        dps = {
            "Kill the Right Arm whenever it is up, then back to the body.",
            "AoE the Rubble adds.",
            "Eyebeam on you: run in a straight line away from the raid.",
        },
    },
})

---------------------------------------------------------------------------
-- Auriaya
---------------------------------------------------------------------------
RTG:RegisterTactics("ULD_Auriaya", {
    summary = "A cat-lady fight: kill her Sanctum Sentries first, interrupt the blasts after her fear, stack for Sonic Screech and handle the nine-life Feral Defender.",

    overview = [[
Auriaya is a night elf-like keeper who walks around the room with her pet cats, the Sanctum Sentries. You pull her together with them. The sentries buff each other and pounce on players, so they die first.

During the fight she fears the raid with {spell:64386} and then casts {spell:64389}, which must be interrupted. She also casts {spell:64688}: a frontal cone whose damage is split between everyone standing in it, so the raid stacks in front of her.

After about a minute she summons the Feral Defender, a big cat with nine lives. Each time it dies it leaves a void zone on the floor and comes back about 30 seconds later with one life fewer. The fight has a 10 minute enrage.
]],

    preparation = [[
- 2-3 tanks, 3 healers (10-man) or 3 tanks, 6 healers (25-man).
- There are 2 Sanctum Sentries in 10-man and 4 in 25-man. Tanks agree who picks up which.
- Fear Ward (priests) on the main tank and Tremor Totem (shamans) help against Terrifying Screech.
- Assign interrupters for Sentinel Blast.
- The raid stacks in front of Auriaya with the tank for Sonic Screech.
]],

    phases = {
        { title = "Part 1 - Sentries", text = [[
- Pull Auriaya and her Sanctum Sentries together. Auriaya patrols, so wait until she is in a good spot.
- Tanks pick up the sentries and keep them stacked near Auriaya. Sentries near each other buff each other (Strength of the Pack).
- DPS kill the sentries first. Cleave and AoE help since they are stacked.
- {spell:64386}: everyone is feared for a few seconds. Right after it, {spell:64389} starts. Interrupt it.
]] },
        { title = "Part 2 - Auriaya, swarms and the Feral Defender", text = [[
- {spell:64688}: a cone in front of Auriaya. Its damage is split among everyone inside it. The whole raid stands in front of her with the tank.
- {spell:64396}: a random player is attacked by a swarm of small cats. AoE the cats, heal the target.
- After about 60 seconds the Feral Defender joins. A tank picks it up, DPS kill it.
- Each time it dies it leaves a void zone and comes back after about 30 seconds with one fewer life ({spell:64455}). Move Auriaya and the raid out of the void zones.
- Continue on Auriaya between Feral Defender spawns.
]] },
    },

    tank = [[
- Pick up the Sanctum Sentries at the start and keep them close together so the raid can cleave them.
- Main tank holds Auriaya facing the raid, because the raid stacks in front of her for Sonic Screech.
- Off-tank picks up the Feral Defender every time it revives.
- Move Auriaya away from void zones left by the Feral Defender. Plan a path around the room before the pull.
- Use Fear Ward or Berserker Rage against Terrifying Screech if you can.
]],

    healer = [[
- Terrifying Screech fears everyone, including you. Fear Ward and Tremor Totem help. After the fear, heal the raid quickly because Sentinel Blast hits everyone if not interrupted.
- {spell:64688} damage is shared. The more people stand in front of her, the less each one takes. Stack with the raid.
- Guardian Swarm targets take damage from many small cats. Heal them.
- Keep the Feral Defender tank alive, the cat hits hard and jumps on players.
]],

    dps = [[
- Kill the Sanctum Sentries first. Cleave or AoE them.
- Interrupt {spell:64389} after every Terrifying Screech. Interrupters should have a fear break or Fear Ward so they are not feared.
- Stack in front of Auriaya with the tank for Sonic Screech.
- When Guardian Swarm cats appear, AoE them.
- When the Feral Defender is up, switch to it and kill it, then go back to Auriaya.
- Do not stand in the Feral Defender void zones.
]],

    warnings = [[
- |cffff2020Interrupt Sentinel Blast.|r If it goes through after the fear, the whole raid takes heavy damage.
- |cffff2020Stand in front of her for Sonic Screech.|r The damage is split; if only the tank stands there, the tank dies.
- Never stand in the Feral Defender void zones (Seeping Feral Essence).
- Kill the sentries first. They make the fight much harder while alive.
- The Feral Defender keeps coming back. Kill it every time, or plan to kite it.
]],

    heroicTitle = "10 vs 25 player",
    heroic = [[
Auriaya has no hard mode.
- 10-man: 2 Sanctum Sentries come with her.
- 25-man: 4 Sanctum Sentries, more Guardian Swarm cats and higher damage overall. More interrupts are needed for Sentinel Blast.
- Achievement "Nine Lives": kill the Feral Defender nine times.
- Achievement "Crazy Cat Lady": kill Auriaya without killing any of her Sanctum Sentries.
]],

    abilities = {
        {
            name = "Sentinel Blast",
            spellId = 64389,
            danger = "high",
            target = "Whole raid",
            timing = "Right after Terrifying Screech",
            description = [[ A raid-wide damage spell Auriaya casts right after her fear. ]],
            response = [[ Interrupt it every time. Assign interrupters before the pull. ]],
        },
        {
            name = "Sonic Screech",
            spellId = 64688,
            danger = "high",
            target = "Cone in front of Auriaya",
            timing = "About every 30 seconds",
            description = [[ Damage is split among all players in the cone in front of her. ]],
            response = [[ Everyone stacks in front of her with the tank. ]],
        },
        {
            name = "Terrifying Screech",
            spellId = 64386,
            danger = "medium",
            target = "Whole raid",
            timing = "About every 30-35 seconds",
            description = [[ Fears the raid for a few seconds. ]],
            response = [[ Use Fear Ward, Tremor Totem or fear breaks. Interrupt Sentinel Blast right after it. ]],
        },
        {
            name = "Guardian Swarm",
            spellId = 64396,
            danger = "medium",
            target = "Random player",
            timing = "About every 30 seconds",
            description = [[ Summons a swarm of small cats that attack one player. ]],
            response = [[ AoE the cats. Healers heal the target. ]],
        },
        {
            name = "Feral Defender (Feral Essence)",
            spellId = 64455,
            danger = "medium",
            target = "Raid",
            timing = "First after about 60 seconds, revives 30 seconds after each death",
            description = [[ A big cat with nine lives. Each death leaves a void zone and costs one life. ]],
            response = [[ Off-tank picks it up, DPS kill it. Move out of the void zones. ]],
        },
        {
            name = "Seeping Feral Essence",
            spellId = 64459,
            danger = "medium",
            target = "Ground where the Feral Defender died",
            description = [[ A void zone that damages anyone standing in it. ]],
            response = [[ Move out of it. Tanks move the bosses away from it. ]],
        },
    },

    chat = {
        summary = {
            "Kill the Sanctum Sentries first, tanks keep them stacked for cleave.",
            "After every fear (Terrifying Screech) interrupt Sentinel Blast.",
            "Sonic Screech: everyone stacks in front of Auriaya with the tank to split the damage.",
            "Feral Defender has nine lives: kill it each time it returns, stay out of its void zones.",
        },
        tank = {
            "Keep the sentries stacked together at the start.",
            "Main tank faces Auriaya toward the raid, off-tank picks up the Feral Defender.",
            "Move Auriaya away from void zones.",
        },
        healer = {
            "Fear Ward and Tremor Totem help against the fear.",
            "Stack in front for Sonic Screech, heal Guardian Swarm targets.",
        },
        dps = {
            "Sentries first, then Auriaya. Switch to the Feral Defender when it is up.",
            "Interrupt Sentinel Blast after every fear.",
            "AoE the swarm cats and stay out of void zones.",
        },
    },
})
