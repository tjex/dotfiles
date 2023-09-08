-- what is this and why is it here?
-- package.loaded.funcs = nil
-- local Job = require("plenary.job")
local funcs = {}
local diagnostics_active = true

funcs.toggle_diagnostics = function()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end

-- open nvim tree on directory entry
funcs.open_tree_on_dir = function(data)
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

funcs.test = function()
	print "calling tjex.funcs.test"
end

return funcs
