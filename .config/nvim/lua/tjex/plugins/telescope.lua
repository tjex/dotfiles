return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-telescope/telescope-dap.nvim",
		"kiyoon/telescope-insert-path.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-bibtex.nvim",
	},

	config = function()
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

		key.nmap({
			"sf",
			function()
				require("telescope.builtin").find_files({ previewer = false })
			end,
		})
		key.nmap({ "sc", tb.commands })
		key.nmap({ "sd", tb.lsp_document_symbols })
		key.nmap({ "sg", tb.live_grep })
		key.nmap({ "sG", tb.grep_string })
		key.nmap({ "sh", tb.help_tags })
		key.nmap({ "si", tb.lsp_incoming_calls })
		key.nmap({ "sl", tb.resume })
		key.nmap({ "so", tb.lsp_outgoing_calls })
		key.nmap({ "sp", tb.registers })
		key.nmap({ "sr", tb.lsp_references })
		key.nmap({ "ss", tb.buffers })
		key.nmap({ "sY", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>" })
		key.nmap({ "sy", tb.git_branches })
		key.nmap({ "sz", tb.git_stash })

		-- load the extensions
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("dap")
		require("telescope").load_extension("ui-select")
		-- require("telescope").load_extension("git_worktree")
		require("telescope").load_extension("bibtex")

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
			pickers = {
				find_files = {
					disable_devicons = true,
				},
				buffers = {
					disable_devicons = true,
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
	end,
}
