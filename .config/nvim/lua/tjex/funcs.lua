-- open nvim tree on directory entry
local util = require("tjex.util")

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

-- returns table of all tracked dotfiles as absolute paths
local tracked_dotfiles = function()
	local files = vim.fn.system("cd $HOME && git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME ls-files")
	local files_list = {}
	--split the output of "ls-files" command by newline and trim spaces from both sides.
	for line in files:gmatch("[^\r\n]+") do
		line = line.gsub(line, "%s+", "")
		table.insert(files_list, line)
	end
	return files_list
end

-- checks current buf file against filepaths from tracked_dotfiles()
-- dotfiles are returned as relative paths from $HOME. Hence, the
M.file_tracked_in_dotfiles = function(file)
	if not (string.find(file, "/Users/") or string.find(file, "~/")) then
		print("file_tracked_in_dotfiles() requires absolute file path or from $HOME")
		return
	end
	local files_list = tracked_dotfiles()
	-- files_list entries are relative from $HOME, e.g '.config/nvim', while
	-- file should be absolute or maybe '~/'.
	-- could not concatonate $HOME with '/'..?! have to hard code till
	-- I get smart...
	file = util.strip_home_from_filepath(file)
	local found = false
	for _, filename in pairs(files_list) do
		if filename == file then
			found = true
			break
		end
	end
	if found then
		found = true
	else
		found = false
	end
	return found
end

M.dotfiles_stage_file = function(file)
	file = util.strip_home_from_filepath(file)
	vim.cmd(":silent !cd $HOME && git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME add " .. file)
end

M.dotfiles_restore_staged_file = function(file)
	file = util.strip_home_from_filepath(file)
	vim.cmd(":!cd $HOME && git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME restore --staged " .. file)
end

M.dotfiles_commit = function(message)
	vim.cmd(
		":silent !cd $HOME && git --git-dir=$HOME/.dotf-cfg/ --work-tree=$HOME commit -m "
			.. '"'
			.. message
			.. '"'
	)
end

return M
