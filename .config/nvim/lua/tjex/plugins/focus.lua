return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		local key = require("tjex.keymap")
		require("focus").setup({})

		key.nmap({ "<c-b>", "<cmd>FocusToggle<cr>" })
	end,
}
