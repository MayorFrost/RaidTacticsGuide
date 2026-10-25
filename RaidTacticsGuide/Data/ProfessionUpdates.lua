-- RTG 1.6 - profession routes supplied by the addon author.
-- Sources are Warmane Forum threads; quantities are forum authors' plans,
-- not guaranteed skill-ups. Do NOT divide quantities for 3x realms.
local RTG = RaidTacticsGuide
local by = RTG.ProfessionsByKey

-- Entirely remove unrequested gathering professions and Inscription from menu.
local remove = {fishing=true, inscription=true, herbalism=true, mining=true, skinning=true}
local remaining = {}
for _, p in ipairs(RTG.Professions) do
    if not remove[p.key] then remaining[#remaining+1]=p else by[p.key]=nil end
end
RTG.Professions = remaining

local function route(key, source, note, coverage, entries, groups)
    local p=assert(by[key], 'Unknown profession '..key)
    p.kind='craft'
    p.source=source
    p.note=note
    p.coverage=coverage
    p.steps={}
    p.recipeRows={}
    p.groups=groups or {}
    for _,s in ipairs(entries) do
        local item = {low=s[1],high=s[2],name=s[3],count=s[4],mats=s[5]}
        p.recipeRows[#p.recipeRows+1]=item
        p.steps[#p.steps+1]={s[1],s[2],s[3],s[4]}
    end
    return p
end

route('alchemy','https://forum.warmane.com/showthread.php?t=402175',
    'Warmane 3x Alchemy plan; extra materials can be required on yellow crafts. Vials and choice of Alchemist Stone may need extra materials.',450,{
    {1,61,'Minor Healing Potion',20,'Peacebloom, Silverleaf, Empty Vial'},
    {61,106,'Lesser Healing Potion',15,'Minor Healing Potion, Briarthorn'},
    {106,112,'Elixir of Wisdom',2,'Mageroyal, Briarthorn, Empty Vial'},
    {112,136,'Healing Potion',8,'Bruiseweed, Briarthorn, Leaded Vial'},
    {136,160,'Lesser Mana Potion',9,'Mageroyal, Stranglekelp, Empty Vial'},
    {160,196,'Greater Healing Potion',12,'Liferoot, Kingsblood, Leaded Vial'},
    {196,220,'Elixir of Agility',8,'Stranglekelp, Goldthorn, Leaded Vial'},
    {220,250,'Superior Healing Potion',10,'Sungrass, Khadgar\'s Whisker, Crystal Vial'},
    {250,271,'Elixir of Greater Intellect',7,'Blindweed, Khadgar\'s Whisker, Crystal Vial'},
    {271,295,'Superior Mana Potion',8,'Sungrass, Blindweed, Crystal Vial'},
    {295,301,'Major Healing Potion',2,'Golden Sansam, Mountain Silversage, Crystal Vial'},
    {301,322,'Volatile Healing Potion',7,'Golden Sansam, Felweed, Imbued Vial'},
    {322,343,'Elixir of Draenic Wisdom',7,'Felweed, Terocone, Imbued Vial'},
    {343,349,'Super Healing Potion',2,'Netherbloom, Felweed, Imbued Vial'},
    {349,352,'Super Mana Potion',1,'Dreaming Glory, Felweed, Imbued Vial'},
    {352,370,'Resurgent Healing Potion',6,'Goldclover, Imbued Vial'},
    {370,376,'Wrath Elixir',2,'Goldclover, Deadnettle, Imbued Vial'},
    {376,385,'Pygmy Oil','4-5','Pygmy Suckerfish'},
    {385,397,'Elixir of Spirit',4,'Talandra\'s Rose, Imbued Vial'},
    {397,424,'Indestructible Potion',9,'Icethorn, Imbued Vial'},
    {424,427,'Alchemist Stone (choose 1)',1,'Mats depend on chosen Stone'},
    {427,445,'Flask of the North',6,'Frost Lotus, Enchanted Vial'},
    {445,450,'Flask of Pure Mojo',2,'Icethorn, Pygmy Oil, Frost Lotus, Enchanted Vial'},
    },{{low=1,high=450,partial=true,items={
    {'Peacebloom',20},{'Silverleaf',20},{'Briarthorn',27},{'Mageroyal',11},
    {'Bruiseweed',8},{'Stranglekelp',17},{'Liferoot',12},{'Kingsblood',12},
    {'Goldthorn',8},{'Sungrass',26},{"Khadgar's Whisker",17},{'Blindweed',24},
    {'Golden Sansam',11},{'Mountain Silversage',2},{'Felweed',17},
    {'Terocone',7},{'Dreaming Glory',2},{'Netherbloom',4},
    {'Goldclover',14},{'Deadnettle',4},{'Pygmy Suckerfish',5},
    {"Talandra's Rose",12},{'Icethorn',32},{'Frost Lotus',26},
    }}})
by.alchemy.unquantifiedMaterials={'Empty Vial','Leaded Vial','Crystal Vial','Imbued Vial','Enchanted Vial'}

route('firstaid','https://forum.warmane.com/showthread.php?t=418973',
    'Warmane Icecrown 3x bandage guide. The source skips the 365-375 range; confirm those skill-ups in-game.',450,{
    {1,40,'Linen Bandage',14,'Linen Cloth'},
    {40,80,'Heavy Linen Bandage',18,'Linen Cloth'},
    {80,115,'Wool Bandage',15,'Wool Cloth'},
    {115,150,'Heavy Wool Bandage',15,'Wool Cloth'},
    {150,180,'Silk Bandage',13,'Silk Cloth'},
    {180,210,'Heavy Silk Bandage',11,'Silk Cloth'},
    {210,240,'Mageweave Bandage',13,'Mageweave Cloth'},
    {240,260,'Heavy Mageweave Bandage',7,'Mageweave Cloth'},
    {260,290,'Runecloth Bandage',11,'Runecloth'},
    {290,330,'Heavy Runecloth Bandage',19,'Runecloth'},
    {330,345,'Netherweave Bandage',11,'Netherweave Cloth'},
    {345,365,'Heavy Netherweave Bandage',25,'Netherweave Cloth'},
    {375,400,'Frostweave Bandage',15,'Frostweave Cloth'},
    {400,450,'Heavy Frostweave Bandage',36,'Frostweave Cloth'},
    },{{low=1,high=450,items={
    {'Linen Cloth',50},{'Wool Cloth',45},{'Silk Cloth',35},
    {'Mageweave Cloth',27},{'Runecloth',49},{'Netherweave Cloth',61},
    {'Frostweave Cloth',87},
    }}})

-- This Enchanting source explicitly covers standard-rate materials, not a 3x route.
-- Show its recipe route but DO NOT claim its quantities are exact for Warmane 3x.
local ench=route('enchanting','https://forum.warmane.com/showthread.php?t=99736',
    'Warmane 1-450 Enchanting recipe route (standard-rate, NOT 3x). Listed craft counts are source examples, not 3x requirements; exact 3x shopping totals unavailable.',450,{
    {1,2,'Runed Copper Rod',1,'Copper Rod, Strange Dust, Lesser Magic Essence'},
    {2,50,'Enchant Bracer: Minor Health',48,'Strange Dust'},
    {50,90,'Enchant Bracer: Minor Health',40,'Strange Dust'},
    {90,100,'Enchant Bracer: Minor Stamina',10,'Strange Dust'},
    {100,101,'Runed Silver Rod',1,'Silver Rod, Strange Dust, Greater Magic Essence'},
    {101,110,'Greater Magic Wand',9,'Simple Wood, Greater Magic Essence'},
    {110,135,'Enchant Cloak: Minor Agility',25,'Lesser Astral Essence'},
    {135,155,'Enchant Bracer: Lesser Stamina',20,'Soul Dust'},
    {155,156,'Runed Golden Rod',1,'Golden Rod, Iridescent Pearl, Greater Astral Essence, Soul Dust'},
    {156,185,'Enchant Bracer: Lesser Strength',40,'Soul Dust'},
    {185,219,'Enchant Bracer: Strength',40,'Vision Dust'},
    {219,220,'Runed Truesilver Rod',1,'Truesilver Rod, Black Pearl, Greater Mystic Essence, Vision Dust'},
    {220,225,'Enchant Cloak: Greater Defense',5,'Vision Dust'},
    {225,230,'Enchant Gloves: Agility',5,'Lesser Nether Essence, Vision Dust'},
    {230,235,'Enchant Boots: Stamina',5,'Vision Dust'},
    {235,240,'Enchant Chest: Superior Health',5,'Vision Dust'},
    {240,250,'Enchant Boots: Lesser Accuracy',10,'Vision Dust, Lesser Nether Essence'},
    {250,260,'Lesser Mana Oil',10,'Dream Dust, Purple Lotus, Crystal Vial'},
    {260,265,'Enchant Bracer: Greater Intellect',5,'Lesser Eternal Essence'},
    {265,299,'Enchant Shield: Greater Stamina',40,'Dream Dust'},
    {299,300,'Runed Arcanite Rod',1,'Arcanite Rod, Illusion Dust, Greater Eternal Essence, Large Brilliant Shard'},
    {300,301,'Runed Fel Iron Rod',1,'Fel Iron Rod, Greater Eternal Essence, Large Brilliant Shard'},
    {301,310,'Enchant Bracer: Assault',9,'Arcane Dust'},
    {310,320,'Enchant Bracer: Brawn',10,'Arcane Dust'},
    {320,330,'Enchant Gloves: Assault',12,'Arcane Dust'},
    {330,335,'Enchant Shield: Major Stamina',5,'Arcane Dust'},
    {335,340,'Enchant Shield: Resilience',5,'Large Prismatic Shard, Lesser Planar Essence'},
    {340,350,'Superior Wizard Oil',15,'Arcane Dust, Nightmare Vine, Crystal Vial'},
    {350,351,'Runed Adamantite Rod',1,'Adamantite Rod, Greater Planar Essence, Large Prismatic Shard, Primal Might'},
    {351,360,'Enchant Cloak: Speed',9,'Infinite Dust'},
    {360,375,'Enchant Bracer: Striking',18,'Infinite Dust'},
    {375,376,'Runed Eternium Rod',1,'Eternium Rod, Greater Planar Essence, Arcane Dust'},
    {376,380,'Enchant Bracer: Striking',6,'Infinite Dust'},
    {380,385,'Enchant Bracer: Exceptional Intellect',5,'Infinite Dust'},
    {385,395,'Enchant Boots: Icewalker',10,'Infinite Dust, Crystallized Water'},
    {395,410,'Enchant Cloak: Superior Agility',15,'Infinite Dust'},
    {410,415,'Enchant Gloves: Expertise',5,'Infinite Dust'},
    {415,420,'Enchant Boots: Greater Spirit',5,'Infinite Dust, Greater Cosmic Essence'},
    {420,425,'Enchant Chest: Greater Mana Restore',5,'Infinite Dust, Greater Cosmic Essence'},
    {425,426,'Runed Titanium Rod',1,'Titanium Rod, Infinite Dust, Greater Cosmic Essence, Dream Shard'},
    {426,440,'Enchant Chest: Super Health',14,'Infinite Dust, Greater Cosmic Essence'},
    {440,450,'Enchant Boots: Greater Assault',15,'Greater Cosmic Essence, Dream Shard'},
    },{})
-- Shopping names only; without a Warmane 3x total, numeric requirements are unknown.
ench.unquantifiedMaterials={
 'Strange Dust','Greater Magic Essence','Lesser Astral Essence','Soul Dust',
 'Greater Astral Essence','Vision Dust','Lesser Nether Essence','Dream Dust',
 'Purple Lotus','Crystal Vial','Lesser Eternal Essence','Illusion Dust',
 'Greater Eternal Essence','Large Brilliant Shard','Arcane Dust',
 'Large Prismatic Shard','Lesser Planar Essence','Nightmare Vine',
 'Greater Planar Essence','Primal Might','Infinite Dust','Crystallized Water',
 'Greater Cosmic Essence','Dream Shard','Iridescent Pearl','Black Pearl',
 'Simple Wood','Copper Rod','Silver Rod','Golden Rod',
 'Truesilver Rod','Arcanite Rod','Fel Iron Rod','Adamantite Rod','Eternium Rod','Titanium Rod'
}

local cook=route('cooking','https://forum.warmane.com/showthread.php?t=463052',
    'Alliance Icecrown 1-400 farming/cooking route, not a complete 1-450 guide. No per-recipe skill endpoints or reliable exact craft counts are published; item amounts are approximate.',400,{
    {1,400,'Spice Bread',nil,'Simple Flour, Mild Spices'},
    {1,400,'Spiced Wolf Meat',nil,'Stringy Wolf Meat'},
    {1,400,'Coyote Steak',nil,'Coyote Meat'},
    {1,400,'Dry Pork Ribs',nil,'Boar Ribs'},
    {1,400,'Curiously Tasty Omelette',nil,'Raptor Egg'},
    {1,400,'Roast Raptor',nil,'Raptor Flesh'},
    {1,400,'Tender Wolf Steak',nil,'Tender Wolf Meat'},
    {1,400,'Poached Sunscale Salmon',nil,'Raw Sunscale Salmon'},
    {1,400,'Nightfin Soup',nil,'Raw Nightfin Snapper'},
    {1,400,'Lobster Stew',nil,'Darkclaw Lobster'},
    {1,400,'Ravager Dog',nil,'Ravager Flesh'},
    {1,400,'Talbuk Steak',nil,'Talbuk Venison'},
    {1,400,'Rhino Dogs',nil,'Rhino Meat'},
    {1,400,'Mammoth Meal',nil,'Chunk o\' Mammoth'},
    },{{low=1,high=400,partial=true,items={
    {'Raw Sunscale Salmon / Raw Nightfin Snapper (combined)',15},
    {'Darkclaw Lobster',10},{'Stringy Wolf Meat',12},{'Boar Ribs',10},
    {'Coyote Meat',20},{'Raptor Egg',18},{'Raptor Flesh',20},
    {'Tender Wolf Meat',10},{'Ravager Flesh',12},{'Talbuk Venison',12},
    }}})
cook.unquantifiedMaterials={'Rhino Meat',"Chunk o' Mammoth",'Simple Flour','Mild Spices'}
cook.hasSkillBrackets=false

-- The addon author explicitly requested no fabricated Leatherworking route.
local leather=assert(by.leatherworking)
leather.kind='unavailable'
leather.note='Guide unavailable - no Warmane Forum 3x Leatherworking guide provided.'
leather.source=''
leather.steps={}
leather.recipeRows={}
leather.groups={}
leather.unquantifiedMaterials=nil

-- Accurate material icons where the 3.3.5 item ID is reliably known.
local ids=RTG.MaterialIDs
local known={
    ['Empty Vial']=3371,['Leaded Vial']=3372,['Crystal Vial']=8925,
    ['Imbued Vial']=18256,
    ['Peacebloom']=2447,['Silverleaf']=765,['Briarthorn']=2450,
    ['Mageroyal']=785,['Bruiseweed']=2453,['Stranglekelp']=3820,
    ['Liferoot']=3357,['Kingsblood']=3356,['Goldthorn']=3821,
    ['Sungrass']=8838,["Khadgar's Whisker"]=3358,['Blindweed']=8839,
    ['Golden Sansam']=13464,['Mountain Silversage']=13465,
    ['Felweed']=22785,['Terocone']=22789,['Dreaming Glory']=22786,
    ['Netherbloom']=22791,['Goldclover']=36901,['Deadnettle']=37921,
    ['Pygmy Suckerfish']=40199,["Talandra's Rose"]=36907,
    ['Icethorn']=36906,['Frost Lotus']=36908,
    ['Strange Dust']=10940,['Greater Magic Essence']=10939,
    ['Lesser Astral Essence']=10998,['Soul Dust']=11083,
    ['Vision Dust']=11137,['Dream Dust']=11176,['Illusion Dust']=16204,
    ['Greater Cosmic Essence']=34055,['Dream Shard']=34052,
    ['Raw Sunscale Salmon']=13760,['Raw Nightfin Snapper']=13759,
    ['Darkclaw Lobster']=13888,['Stringy Wolf Meat']=2672,
    ['Boar Ribs']=2677,['Coyote Meat']=2673,['Raptor Egg']=3685,
    ['Raptor Flesh']=12184,['Tender Wolf Meat']=12208,
    ['Ravager Flesh']=27674,['Talbuk Venison']=27682,
    ['Rhino Meat']=43012,["Chunk o' Mammoth"]=34736,
    ['Simple Flour']=30817,['Mild Spices']=2678,
}
for name,id in pairs(known) do ids[name]=id end
