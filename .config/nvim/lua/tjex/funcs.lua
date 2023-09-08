-- what is this and why is it here?
-- package.loaded.funcs = nil
-- local Job = require("plenary.job")
local funcs = {}
local diagnostics_active = true

funcs.format = function()
	vim.cmd ":Format"
	-- if pcall(vim.cmd("FormatWrite")) then
	--     print("formatted with formatter.nvim")
	-- else
	--  vim.lsp.buf.format({ async = true })
	--     print("formatted with lsp")
	-- end
end

-- tried to make my own clean format call
-- funcs.bash = function(opts)
-- 	opts = opts or {}
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local errors = {}
-- 	local job = Job:new({
-- 		command = "beautysh",
-- 		args = {},
-- 		writer = vim.api.nvim_buf_get_lines(0, 0, -1, false),
-- 		on_stderr = function(_, data)
-- 			table.insert(errors, data)
-- 		end,
-- 	})
-- 	Job:start()
--
-- 	local output = Job:sync()
-- 	if job.code ~= 0 then
-- 		vim.schedule(function()
-- 			error(string.format("[beautysh] failed to format"))
-- 		end)
-- 		return
-- 	end
-- 	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output)
-- end

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
