local ok, _ = pcall(require, "obsidian")
if not ok then
	print("obsidian not ok!")
	return
end

require("obsidian").setup({
	-- Required, the path to your vault directory.
	workspaces = {
		{
			name = "paradigm-shifted",
			path = "~/obsidian/paradigm-shifted",
		},
	},
	detect_cwd = false,
	disable_frontmatter = true,

	-- main notes sub dirctory
	notes_subdir = "forrest-floor",

	-- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
	-- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
	log_level = vim.log.levels.DEBUG,

	daily_notes = {
		-- Optional, if you keep daily notes in a separate directory.
		folder = "diaries",
		-- Optional, if you want to change the date format for daily notes.
		date_format = "%Y-%m-%d",
		template = "nvim-daily.md",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
		new_notes_location = "notes_subdir",
		prepend_note_id = true,
	},

	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
	},

	finder = "telescope.nvim",

	templates = {
		subdir = "extra/templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		-- {{test}} in a template folder will be replaced with "crispy"
		substitutions = {
			test = function()
				return "crispy"
			end,
		},
	},

	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		vim.fn.jobstart({ "open", url }) -- Mac OS
		-- vim.fn.jobstart({"xdg-open", url})  -- linux
	end,
})

local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap("n", "<leader>od", ":ObsidianToday<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>osf", ":ObsidianQuickSwitch<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>osg", ":ObsidianSearch<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>ol", ":ObsidianLinkNew<CR>", opts)
