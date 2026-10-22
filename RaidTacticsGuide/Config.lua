--[[
    Raid Tactics Guide - Configuration
    ----------------------------------
    Everything in this file is safe to change. It is loaded before any other
    addon file, so the values here become the defaults for every player.
    (Players' own choices made in-game are stored in SavedVariables and take
    priority where noted.)
]]

RaidTacticsGuideConfig = {

    ------------------------------------------------------------------------
    -- General
    ------------------------------------------------------------------------
    title           = "Raid Tactics Guide",
    windowWidth     = 940,
    windowHeight    = 600,
    windowScale     = 1.0,      -- players can change this with /rtg scale <0.6-1.4>
    showBossModels  = true,     -- try to show a 3D boss portrait (falls back to an icon)
    showMinimapButton = true,

    -- Which raid / tab is opened the very first time the book is opened.
    defaultRaid     = "ICC",
    defaultTab      = "tactics",   -- "tactics", "abilities" or "loot"

    ------------------------------------------------------------------------
    -- Raid chat sharing ("Send to Raid Chat" button on the Tactics tab)
    ------------------------------------------------------------------------
    chat = {
        -- Which modes appear in the drop-down next to the button, in order.
        -- Remove a line to hide that option from players.
        --   summary = short summary + key warnings (recommended)
        --   full    = summary + tank + healer + dps instructions
        --   tank / healer / dps = only that role's instructions
        --   warnings = only the "Important Warnings" section
        modes = { "summary", "full", "tank", "healer", "dps", "warnings" },

        defaultMode     = "summary",

        channel         = "RAID",   -- "RAID" is required by the spec; "PARTY" also works
        allowPartyFallback = false, -- true = send to /party when in a 5-man group instead of a raid

        -- WoW 3.3.5a hard limit is 255 bytes per chat message. We stay a bit
        -- under it so the prefix and "(1/2)" counters always fit.
        maxLength       = 240,
        prefix          = "[RTG]",  -- put "" to send messages without a prefix

        delay           = 0.7,      -- seconds between messages (avoids the server spam filter)
        maxMessages     = 18,       -- safety cap per click; extra lines are dropped with a notice
        numberLines     = true,     -- "1) ...", "2) ..." in front of each instruction
        includeHeader   = true,     -- first line: "=== Lord Marrowgar - Summary ==="
    },

    ------------------------------------------------------------------------
    -- Loot viewer
    ------------------------------------------------------------------------
    loot = {
        defaultSize     = 25,       -- 10 or 25
        defaultHeroic   = false,
        queryUncached   = true,     -- ask the server for items not yet in your item cache
        queryPerTick    = 4,        -- how many uncached items to request every 0.2 s
    },

    ------------------------------------------------------------------------
    -- Class guide
    ------------------------------------------------------------------------
    classGuide = {
        iconSize        = 36,       -- size of rotation icons
        iconsPerRow     = 7,        -- rotation chains wrap after this many icons
        allowInGameEditing = true,  -- show the "Edit Mode" toggle in the Class Guide
    },
}
