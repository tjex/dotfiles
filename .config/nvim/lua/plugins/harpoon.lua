return {
	"ThePrimeagen/harpoon",

	config = function()
		local key = require("tjex.keymap")
		local mark = require("harpoon.mark")

		require("harpoon").setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 40,
			},
		})

		local ui = require("harpoon.ui")
		key.nmap({ "<leader>a", mark.add_file })
		key.nmap({ "<leader>h", ui.toggle_quick_menu })
		key.nmap({
			"<C-1>",
			function()
				ui.nav_file(1)
			end,
		})
		key.nmap({
			"<C-2>",
			function()
				ui.nav_file(2)
			end,
		})
		key.nmap({
			"<C-3>",
			function()
				ui.nav_file(3)
			end,
		})
		key.nmap({
			"<C-4>",
			function()
				ui.nav_file(4)
			end,
		})
		key.nmap({
			"<C-5>",
			function()
				ui.nav_file(5)
			end,
		})
		key.nmap({ "K", ui.nav_next })
		key.nmap({ "J", ui.nav_prev })
	end,
}
