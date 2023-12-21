local ok, _ = pcall(require, "packer")
if not ok then
	print("packer not ok!")
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
		"nvim-tree/nvim-tree.lua",
		{ "tjdevries/colorbuddy.nvim", branch = "dev" },
		"lukas-reineke/indent-blankline.nvim",
		"onsails/lspkind.nvim",
	})

	-- text
	use({
		"junegunn/vim-easy-align",
		"windwp/nvim-autopairs",
		"numToStr/Comment.nvim",
		{ "danymat/neogen", tag = "*" },
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
		"ton/vim-bufsurf",
		"nvim-treesitter/playground",
		"folke/todo-comments.nvim",
		"mbbill/undotree",
	})

	-- telescope
	use({
		{ "nvim-telescope/telescope.nvim", tag = "0.1.*" },
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-dap.nvim",
		"kiyoon/telescope-insert-path.nvim",
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
	use({
        -- "mickael-menu/zk-nvim"
        "~/.local/src/contrib/zk-nvim"
		-- "epwalsh/obsidian.nvim",
		-- requires = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
	})

	-- dap
	use({
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"mxsdev/nvim-dap-vscode-js",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	})

	-- lsp / formatting / linting
	use({
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/trouble.nvim",
		"mhartington/formatter.nvim",
		"mfussenegger/nvim-lint",
	})

	-- media
	use({
		"tidalcycles/vim-tidal",
	})
	-- development
end)
