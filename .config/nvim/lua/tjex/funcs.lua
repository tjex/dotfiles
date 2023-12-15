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
	vim.cmd(":g/^On .* wrote:/d")
	vim.cmd(":g/^>/d")
end

-- M.neomutt_format_as_lines = function()
--     -- Get the selected text
--     local start_line, start_col, end_line, end_col = unpack(vim.fn.getpos("'<") + vim.fn.getpos("'>"))
--     local selected_text = vim.fn.getline(start_line, end_line)
--
--     -- Concatenate lines and remove leading/trailing whitespaces
--     local formatted_text = table.concat(selected_text, ' '):gsub("^%s*(.-)%s*$", "%1")
--
--     -- Replace the selected text with the formatted text
--     vim.api.nvim_buf_set_lines(0, start_line, end_line, false, {formatted_text})
-- end

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
