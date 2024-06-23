-- comment numToStr/Comment.nvim
return {
	"numToStr/Comment.nvim",

	config = function()
		require("Comment").setup()

		local ft = require("Comment.ft")

		ft.set("astro", "<!--%s-->")
	end,
}
