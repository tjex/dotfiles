-- markdown specific settings
-- local key = vim.api.nvim_set_keymap
local key = require("tjex.keymap")
local util = require("tjex.util")

vim.opt_local.fo = "trn1p"
vim.opt_local.spell = true

key.imap({ "<c-d>", vim.fn.strftime("%Y-%m-%d") }) -- insert iso date
key.imap({
	"<c-e>",
	function()
		local url = vim.fn.input("link: ")
		-- local title = vim.fn.input("ref type: ")
		local link = util.build_md_link(url)
		vim.api.nvim_put({ link }, "c", false, true)
	end,
})
key.imap({
	"<c-c>",
	function()
		local ref = vim.fn.input("ref: ")
		vim.api.nvim_put({ "~ " .. ref, "", "...", "" }, "l", false, true)
	end,
})
