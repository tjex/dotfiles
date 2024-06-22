local ok, _ = pcall(require, "lazy")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("lazy not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

require("lazy").setup({
	-- never remove
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- GUI
	"stevearc/oil.nvim",
	{ "tjdevries/colorbuddy.nvim", branch = "master" },
	"lukas-reineke/indent-blankline.nvim",
	"onsails/lspkind.nvim",
	"smithbm2316/centerpad.nvim",

	-- text
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"L3MON4D3/LuaSnip",
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- utility
	"ThePrimeagen/harpoon",
	"tpope/vim-fugitive",
	{ dir = "~/.local/plugins/git-worktree.nvim" },
	"folke/todo-comments.nvim",
	"mbbill/undotree",
	"axieax/urlview.nvim",
	"junegunn/vim-easy-align",

	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	cmd = "MarkdownPreview",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },

	-- telescope
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"nvim-telescope/telescope-dap.nvim",
	"kiyoon/telescope-insert-path.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-bibtex.nvim",

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",

	-- external integrations
	"zk-org/zk-nvim",
	"David-Kunz/gen.nvim",

	-- dap
	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-dap-python",
	"mxsdev/nvim-dap-vscode-js",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
	"leoluz/nvim-dap-go",

	-- lsp / formatting / linting
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"folke/trouble.nvim",
	-- "mhartington/formatter.nvim",
	{ dir = "~/.local/plugins/formatter.nvim" }, -- waiting for my pr to be merged (https://github.com/mhartington/formatter.nvim/pull/333)
	"mfussenegger/nvim-lint",
})
