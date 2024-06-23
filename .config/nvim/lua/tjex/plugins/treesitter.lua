return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"query",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"typescript",
				"javascript",
				"tsx",
				"astro",
				"go",
			},
			context_commentstring = { enabled = true },
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			-- ignore_install = { "javascript" },

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<BS>",
					node_incremental = "<c-k>",
					scope_incremental = "<BS>",
					node_decremental = "<c-j>",
				},
			},

			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = { "markdown" },
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		})

		-- because there is no parser for zsh, but bash and zsh are the same syntactically.
		vim.treesitter.language.register("zsh", "bash")
	end,
}
