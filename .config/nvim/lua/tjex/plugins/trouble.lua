return {
	"folke/trouble.nvim",
    cmd = "Trouble",
	opts = {
		warn_no_results = false,
		open_no_results = true,
	},

	init = function()
		local key = require("tjex.keymap")

		key.nmap({
			"<leader>io",
			"<cmd>Trouble diagnostics toggle<cr>",
		})
		key.nmap({
			"<leader>il",
			function()
				require("trouble").open("loclist")
			end,
		})
	end,
}
