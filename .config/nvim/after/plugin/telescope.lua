local ok, _ = pcall(require, "telescope")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("telescope not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

local actions = require("telescope.actions")
local key = require("tjex.keymap")
local path_actions = require("telescope_insert_path")
local tb = require("telescope.builtin")

-- setting previewer false here instead of in setup so that it can be enabled selectively for other commands
key.imap({
	"<c-f>",
	function()
		require("telescope.builtin").find_files({ previewer = false })
	end,
})

key.nmap({ "sc", tb.commands })
key.nmap({ "sd", tb.lsp_document_symbols })
key.nmap({
	"sf",
	function()
		require("telescope.builtin").find_files({ previewer = false })
	end,
})
key.nmap({ "sg", tb.live_grep })
key.nmap({ "sG", tb.grep_string })
key.nmap({ "sh", tb.help_tags })
key.nmap({ "si", tb.lsp_incoming_calls })
key.nmap({ "sl", tb.resume })
key.nmap({ "so", tb.lsp_outgoing_calls })
key.nmap({ "sp", tb.registers })
key.nmap({ "sr", tb.lsp_references })
key.nmap({ "ss", tb.buffers })
key.nmap({ "st", ":Trouble<cr>" }) -- not very useful?
key.nmap({ "sX", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>" })
key.nmap({ "sx", tb.git_branches })
key.nmap({ "sz", tb.git_stash })

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
				height = 0.9,
				width = 0.6,
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
						width_ = 0.2,
					},
				},
			}),
		},
		bibtex = {
			global_files = { "~/zotero/my_library.bib" },
			search_keys = { "title", "author", "label" },
		},
	},
})

-- load the extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("dap")
require("telescope").load_extension("ui-select")
-- require("telescope").load_extension("git_worktree")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("bibtex")
