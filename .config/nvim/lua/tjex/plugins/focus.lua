return {
	"nvim-focus/focus.nvim",
	version = "*",
	init = function()
		local key = require("tjex.keymap")
		require("focus").setup({})

		key.nmap({ "<c-b>", "<cmd>FocusToggle<cr>" })
		key.nmap({
			"<c-ESC>",
			function()
				vim.cmd(":FocusSplitNicely")
				vim.cmd(":FocusSplitNicely")
				vim.cmd(":FocusToggle")
				vim.cmd(":wincmd h")
			end,
		})
	end,
}
