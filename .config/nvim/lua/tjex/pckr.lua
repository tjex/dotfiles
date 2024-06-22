local ok, _ = pcall(require, "pckr")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("packer not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

require("pckr").add({
	-- never remove
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		requires = {
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
	"~/.local/plugins/git-worktree.nvim",
	"folke/todo-comments.nvim",
	"mbbill/undotree",
	"axieax/urlview.nvim",
	"junegunn/vim-easy-align",

	"iamcco/markdown-preview.nvim",
	run = "cd app && yarn install",
	cmd = "MarkdownPreview",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },

	-- telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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
	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"leoluz/nvim-dap-go",

	-- lsp / formatting / linting
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"folke/trouble.nvim",
	-- "mhartington/formatter.nvim",
	"~/.local/plugins/formatter.nvim", -- waiting for my pr to be merged (https://github.com/mhartington/formatter.nvim/pull/333)
	"mfussenegger/nvim-lint",
})
