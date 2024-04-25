local M = {}
local opts = { noremap = true, silent = true }

M.imap = function(tbl)
	if tbl[3] == nil then
		tbl[3] = opts
	end
	vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
	vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

return M
