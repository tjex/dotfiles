local ok, _ = pcall(require, "telescope")
if not ok then
	print("telescope not ok!")
	return
end

-- load the extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("dap")
-- require('telescope').load_extension('bookmarks')

local key = vim.keymap.set
local opts = { noremap = true, silent = true }
local actions = require("telescope.actions")
local path_actions = require("telescope_insert_path")
local tb = require("telescope.builtin")
-- local te = require("telescope").extensions

-- key("n", "sb", te.bookmarks.list, opts)
key("n", "sc", tb.commands, opts)
key("n", "sd", function()
	require("telescope").extensions.dap.commands({})
end)
-- setting previewer false here instead of in setup so that it can be enabled selectively for other commands
key("n", "sf", function()
	require("telescope.builtin").find_files({ previewer = false })
end, opts)
key("n", "sg", tb.live_grep, opts)
key("n", "sh", tb.help_tags, opts)
key("n", "sm", tb.marks, opts)
key("n", "sp", tb.registers, opts)
key("n", "sr", tb.lsp_references, opts)
key("n", "ss", tb.buffers, opts)
key("n", "st", ":TodoTelescope<CR>", opts)
key("n", "sx", tb.git_branches, opts)
key("n", "sz", tb.git_stash, opts)

key("i", "<c-f>", function()
	require("telescope.builtin").find_files({ previewer = false })
end, opts)

require("telescope").setup({
	defaults = {
		path_display = { "truncate" },
		results_title = "",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				height = 0.8,
				width = 0.4,
				preview_cutoff = 100,
			},
			vertical = {
				prompt_position = "top",
				height = 0.8,
				width = 0.4,
			},
		},
		mappings = {
			-- when in normal mode within telescope prompt
			n = {
				-- https://github.com/kiyoon/telescope-insert-path.nvim
				["r"] = path_actions.insert_reltobufpath_i_normal,
				["a"] = path_actions.insert_abspath_i_normal,
				["d"] = actions.delete_buffer + actions.move_to_top,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "ignore_case",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						prompt_position = "top",
						height = 0.4,
						width_= 0.2,
					},
				},
			}),
		},
	},
})

-- must be after setup
require("telescope").load_extension("ui-select")
