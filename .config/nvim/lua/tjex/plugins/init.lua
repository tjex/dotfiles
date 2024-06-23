return {
	"nvim-lua/plenary.nvim",

	-- GUI
	"onsails/lspkind.nvim",

	-- text
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- utility
	"tpope/vim-fugitive",

}
