local ok, _ = pcall(require, "telescope")
if not ok then
	print("telescope not ok!")
	return
end

-- load the extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("dap")

local key = vim.keymap.set
local opts = { noremap = true, silent = true }
local tb = require("telescope.builtin")

key("n", "ss", tb.buffers, opts)
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
key("n", "st", ":TodoTelescope<CR>", opts)
key("n", "sx", tb.git_branches, opts)
key("n", "sz", tb.git_stash, opts)

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
				width = 0.8,
				preview_cutoff = 100,
			},
            vertical = {
                prompt_position = "top",
            }
		},
	},
	extensions = {
		fzf = {
			fuzzy = false, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})
