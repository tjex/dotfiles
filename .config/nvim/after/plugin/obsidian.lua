local ok, _ = pcall(require, "obsidian")
if not ok then
	print("obsidian not ok!")
	return
end

require("obsidian").setup({
	-- Required, the path to your vault directory.
	dir = "~/obsidian/paradigm-shifted",
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
		date_format = "%Y-%m-%d",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
		new_notes_location = "current_dir",
		prepend_note_id = true,
	},
	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = require("obsidian.mapping").gf_passthrough(),
	},

	finder = "telescope.nvim",

	templates = {
		subdir = "extra/templates",
		date_format = "%Y-%m-%d-%a",
		time_format = "%H:%M",
	},
})
vim.api.nvim_set_keymap("n", "<leader>od", ":ObsidianToday<CR>", {silent = true, noremap = true})
