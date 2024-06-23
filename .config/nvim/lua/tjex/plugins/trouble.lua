return {
	"folke/trouble.nvim",

	config = function()
		local key = require("tjex.keymap")

		key.nmap({
			"<leader>io",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
		})
		key.nmap({
			"<leader>iw",
			function()
				require("trouble").open("workspace_diagnostics")
			end,
		})
		-- key.nmap({"<leader>lt", ":TodoTrouble<CR>", { noremap = true, silent = true }) -- liking TodoTelescope more for now
		key.nmap({
			"<leader>il",
			function()
				require("trouble").open("loclist")
			end,
		})
	end,
}
