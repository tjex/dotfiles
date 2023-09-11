-- what is this and why is it here?
-- just uncommenting for now in case it breaks something later
-- package.loaded.funcs = nil
-- local Job = require("plenary.job")
local M = {}

-- open nvim tree on directory entry
M.open_tree_on_dir = function(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

-- removes quoted text when editing email replies with Neomutt
M.neomutt_del_quoted = function()
	local buf = vim.api.nvim_get_current_buf

	vim.cmd ":g/^On .* wrote:/d"
	vim.cmd ":g/^>/d"
end

return M
