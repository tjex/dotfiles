local ok, _ = pcall(require, "trouble")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("plugin 'trouble' has a problem")
	vim.cmd(":set cmdheight=1") -- set back to default
	return
end

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
