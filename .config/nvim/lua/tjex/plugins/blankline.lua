-- :h indent_blankline.txt

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},

		config = function()
			require("ibl").setup({
				scope = { enabled = false, show_start = false, show_end = false },
			})
		end,
	},
}
