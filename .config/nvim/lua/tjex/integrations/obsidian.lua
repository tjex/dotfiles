local ok, _ = pcall(require, "obsidian")
if not ok then
    print("obsidian not ok!")
    return
end

require("obsidian").setup({
    -- Required, the path to your vault directory.
    dir = "~/tjroot/obsidian/paradigm-shifted/",
    disable_frontmatter = true,

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "forrest-floor",

    -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
    -- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
    log_level = vim.log.levels.DEBUG,

    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "diaries",
        -- Optional, if you want to change the date format for daily notes.
        date_format = "%Y-%m-%d"
    },


    templates = {
        subdir = "extra/templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M"
    },
})
