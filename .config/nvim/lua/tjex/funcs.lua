-- open nvim tree on directory entry

local M = {}

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

-- writes output of go programs to set buffnr
M.attach_to_buffer = function(output_bufnr, pattern, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("tjex", { clear = true }),
		pattern = pattern,
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end
			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "output of AutoRun:" })
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

return M
