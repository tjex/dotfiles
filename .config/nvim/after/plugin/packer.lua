local ok, _ = pcall(require, "packer")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("packer not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end
-- required as I have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- never remove
	use({
		"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
			dependencies = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
	})

	-- GUI
	use({
		"stevearc/oil.nvim",
		{ "tjdevries/colorbuddy.nvim", branch = "master" },
		"lukas-reineke/indent-blankline.nvim",
		"onsails/lspkind.nvim",
		"smithbm2316/centerpad.nvim",
	})

	-- text
	use({
		"windwp/nvim-autopairs",
		"numToStr/Comment.nvim",
		{ "L3MON4D3/LuaSnip", tag = "v2.*" },
		{
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest features
			config = function()
				require("nvim-surround").setup({})
			end,
		},
	})

	-- utility
	use({
		"ThePrimeagen/harpoon",
		"tpope/vim-fugitive",
		"~/.local/plugins/git-worktree.nvim",
		"nvim-treesitter/playground",
		"folke/todo-comments.nvim",
		"mbbill/undotree",
		"axieax/urlview.nvim",
		"junegunn/vim-easy-align",
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- telescope
	use({
		{ "nvim-telescope/telescope.nvim", tag = "0.1.*" },
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-dap.nvim",
		"kiyoon/telescope-insert-path.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-bibtex.nvim",
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	})

	-- external integrations
	use({ "~/.local/src/zk-org/zk-nvim.git/main", "David-Kunz/gen.nvim" })

	-- dap
	use({
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"mxsdev/nvim-dap-vscode-js",
		{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
		"leoluz/nvim-dap-go",
	})

	-- lsp / formatting / linting
	use({
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/trouble.nvim",
		-- "mhartington/formatter.nvim",
		"~/.local/plugins/formatter.nvim", -- waiting for my pr to be merged (https://github.com/mhartington/formatter.nvim/pull/333)
		"mfussenegger/nvim-lint",
	})
end)
