local M = {}
local default_opts = { noremap = true, silent = true }

M.imap = function(tbl)
	if tbl[3] == nil then
		tbl[3] = default_opts
	end
	vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
	if tbl[3] == nil then
		tbl[3] = default_opts
	end
	vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.vmap = function(tbl)
	if tbl[3] == nil then
		tbl[3] = default_opts
	end
	vim.keymap.set("v", tbl[1], tbl[2], tbl[3])
end

M.xmap = function(tbl)
	if tbl[3] == nil then
		tbl[3] = default_opts
	end
	vim.keymap.set("x", tbl[1], tbl[2], tbl[3])
end

return M
