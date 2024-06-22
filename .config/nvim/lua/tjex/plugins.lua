return {
	-- never remove

	-- GUI
	"onsails/lspkind.nvim",
	"smithbm2316/centerpad.nvim",

	-- text
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- utility
	"tpope/vim-fugitive",
	"junegunn/vim-easy-align",

	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	cmd = "MarkdownPreview",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },

	-- telescope

	-- completion

	-- external integrations

	-- dap

	-- lsp / formatting / linting
}
