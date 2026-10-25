# Raid Tactics Guide (WoW 3.3.5a / Warmane)

An in-game raid guidebook for Wrath of the Lich King 3.3.5a: beginner-friendly boss
tactics, an ability list, a Normal/Heroic loot viewer, one-click sharing of tactics to
raid chat, and a visual, icon-based rotation guide for every class and specialization.

## Installation

1. Copy the `RaidTacticsGuide` folder into `World of Warcraft\Interface\AddOns\`.
   The folder name must stay exactly `RaidTacticsGuide` (the `.toc` file is inside it).
2. Restart the game (or log out to the character screen) and make sure the addon is
   enabled in the AddOns list. If it shows "out of date", tick "Load out of date AddOns".

## Using it

| Action | How |
|---|---|
| Open / close the guidebook | Left-click the book icon on the minimap, or type `/rtg` |
| Open the Class Guide | Right-click the minimap icon, or `/rtg classes` |
| Move the minimap icon | Drag it around the minimap |
| Move the window | Drag the title bar |
| Close | `X`, or press Escape |

**Raids:** pick a raid on the left (tier headers can be collapsed), a boss in the middle,
then use the **Tactics / Abilities / Loot** tabs. The arrows in the header step to the
previous/next boss, **Back** returns to the raid overview. Your raid, boss, tab and loot
settings are remembered between sessions.

**Loot:** choose 10/25 player and Normal/Heroic. In Trial of the Crusader and Vault of
Archavon (Koralon) the faction button switches between Alliance and Horde loot.
Hover an item for its tooltip, click to pin it, Shift-click to link it in chat,
Ctrl-click to preview it. Items your client has never seen are requested from the
server automatically and appear after a moment.

**Send to Raid Chat:** on the Tactics tab choose what to share (Summary, Full strategy,
Tanks / Healers / DPS only, Warnings) and click the button. Messages are numbered, split
under the 255-character limit and sent with a short delay. Right-click the button to
preview the messages in your own chat window. If you are not in a raid, the addon tells
you instead of sending.

**Class Guide:** choose a class, then a specialization. Each spec shows rotation chains
(icon -> icon -> icon), numbered priority lists, cooldowns and situational abilities.
Hover any icon for the spell tooltip. Specs with several categories (Single Target, AoE,
Tank/DPS, ...) show category tabs.

**Editing in-game:** tick **Edit Mode** on a spec page. Every text section gets an
**Edit** button; you can change, clear (hides the section) or reset it, and add your own
notes. Edits are saved in `WTF\...\SavedVariables\RaidTacticsGuide.lua`. Type
`/rtg export` to get your edits as a Lua file you can drop into `Data\Rotations\` so
they become part of the addon.

### Slash commands

- `/rtg` - open/close
- `/rtg raids`, `/rtg classes`, `/rtg professions`, `/rtg rolls` - open a section
- `/rtg minimap` - show/hide the minimap button
- `/rtg scale 0.9` - window size (0.6 - 1.4)
- `/rtg reset` - reset window position and size
- `/rtg verify` - check every spell id in the data files against your client
- `/rtg export` - copy your in-game Class Guide edits as Lua

## Editing the content (no UI code needed)

All content lives in `Data\`. The interface reads it automatically; you never need to
touch the `UI\` files.

| What | File |
|---|---|
| Raid list, boss order, boss icons | `Data\Raids.lua` |
| Boss tactics, abilities, chat lines | `Data\Tactics\*.lua` |
| Loot tables | `Data\Loot\Loot_<RAID>.lua` |
| Class / spec list | `Data\Classes.lua` |
| Rotations and notes | `Data\Rotations\<Class>.lua` |
| Window size, chat options, defaults | `Config.lua` |

New files must also be listed in `RaidTacticsGuide.toc`. After editing, type `/reload`
in game. If a file has a mistake, the addon shows a clear message on that page instead
of breaking; `/rtg verify` lists spell ids that do not exist or do not match their name.

### Boss tactics (`Data\Tactics\*.lua`)

```lua
local RTG = RaidTacticsGuide

RTG:RegisterTactics("ICC_Marrowgar", {          -- key from Data\Raids.lua
    summary     = "One line under the boss name.",
    overview    = [[Text...]],
    preparation = [[- bullet
- bullet]],
    phases = {
        { title = "Phase 1", text = [[...]] },
    },
    tank = [[...]], healer = [[...]], dps = [[...]],
    warnings = [[...]],
    heroicTitle = "Heroic Mode",   -- optional label
    heroic = [[...]],              -- optional
    alternatives = { { title = "Stack strategy", text = [[...]] } },  -- optional
    extra = { { title = "Anything else", text = [[...]] } },          -- optional
    abilities = {
        { name = "Bone Storm", spellId = 69076, danger = "high",   -- high / medium / low
          target = "Whole raid", timing = "Every ~90 sec",
          description = [[What it does]], response = [[What to do]] },
    },
    chat = {   -- short lines for "Send to Raid Chat"; no "|" characters
        summary = { "line", "line" },
        tank = { "..." }, healer = { "..." }, dps = { "..." },
        warnings = { "..." },   -- optional; otherwise taken from the warnings text
    },
})
```

Text formatting: a blank line starts a new paragraph, `- ` starts a bullet, `# ` starts a
small heading, `{spell:69076}` inserts that spell's icon and name, and WoW colour codes
like `|cffff2020red|r` work. Keep text to plain ASCII (the game font cannot draw every
Unicode symbol).

### Rotations (`Data\Rotations\<Class>.lua`)

```lua
RTG:RegisterSpec("PALADIN", "Holy", {
    summary = "One line about the spec.",
    categories = {
        { name = "Single Target", sections = {
            { type = "rotation", key = "opener", title = "Opener",
              text = [[Shown above the icons]], footer = [[Shown below]],
              spells = {
                  { id = 53563, name = "Beacon of Light", label = "Tank" },
                  { id = 53601, name = "Sacred Shield" },
                  { rowBreak = true },                -- continue on the next row
                  { id = 48782, name = "Holy Light", note = "Tooltip extra line" },
              } },
            { type = "priority", key = "prio", title = "Priority", spells = { ... } },
            { type = "icons",    key = "cds",  title = "Cooldowns", spells = { ... } },
            { type = "text",     key = "tips", title = "Tips", text = [[...]] },
        } },
        { name = "AoE", sections = { ... } },
    },
    notes = {
        { key = "notes",       title = "Rotation Notes",        text = [[...]] },
        { key = "important",   title = "Important Tips",        text = [[...]] },
        { key = "cooldowns",   title = "Cooldowns",             text = [[...]], spells = { ... } },
        { key = "situational", title = "Situational Abilities", text = [[...]], spells = { ... } },
    },
})
```

Spell `id` should be the max-rank 3.3.5a spell id; `name` is shown if the id is unknown
and is checked by `/rtg verify`. An optional `icon = "Interface\\Icons\\..."` overrides
the icon. A spec registered here that is not in `Data\Classes.lua` is added automatically.

### Loot (`Data\Loot\*.lua`)

```lua
RTG:RegisterLoot("ICC_Marrowgar", {
    ["10N"] = { { 50764, "Shawl of Nerubian Silk", 4, "Back" }, ... },
    ["25H"] = { { header = "Hard Mode" }, { 45293, "Item name", 4, "Hands, Leather" } },
})
```

Keys: `10N`, `10H`, `25N`, `25H`. For faction-specific loot wrap them in
`Alliance = { ... }, Horde = { ... }`. The included tables were generated from AtlasLoot
Enhanced's 3.3.5a data.

## Credits

Loot data: AtlasLoot Enhanced (3.3.5a). Boss spell ids and timings were cross-checked
with the Warmane fork of Deadly Boss Mods.

## v1.7 update (2026-10-25)

- Removed Buff Tracker, its chat commands and saved settings, and unused Buff Caller/dungeon files.
- Combined profession data into `Data/Professions.lua`, removing obsolete routes and overrides.
- Added published reagent quantities for Alchemy, Enchanting, Engineering and First Aid.
- Added missing Alchemy vial totals and Engineering Netherweave Cloth from the guides.
- Enchanting shows the source's standard-rate quantities; they are not converted to 3x.
- Custom ranges retain intersecting source brackets and label wider-bracket totals.
- Cooking's unpublished amounts and the First Aid 365-375 gap stay clearly marked.
- Leatherworking remains unavailable because no guide data was supplied.

Only the Warmane Forum guides supplied by the addon author are used.
Each profession records its source link and notes in `Data/Professions.lua`.
Alchemy Stone choices add only the selected variant's materials.
Unpublished quantities stay unknown; no other guide or database fills those gaps.
Shopping progress tracks the displayed published amounts; yellow crafts can need extras.
