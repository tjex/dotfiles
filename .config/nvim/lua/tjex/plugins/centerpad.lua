return {
	"smithbm2316/centerpad.nvim",

	init = function()
		local key = require("tjex.keymap")
		key.nmap({ "<c-ESC>", ":Centerpad 105<cr>" })
	end,
}
