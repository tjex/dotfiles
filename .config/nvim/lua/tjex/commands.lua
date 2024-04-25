--
-- user commands
--

local usr_cmd = vim.api.nvim_create_user_command
local funcs = require("tjex.funcs")

-- run a file on write and print its output to designated buf
usr_cmd("AutoRun", function()
	print("AutoRun starts now...")
	local bufnr = vim.api.nvim_get_current_buf()
	-- local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	funcs.attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

usr_cmd("Date", "norm! i" .. vim.fn.strftime("%Y-%m-%d"), {})
usr_cmd("PubDate", "norm! a " .. vim.fn.strftime("%Y-%m-%dT%XZ"), {}) -- norm command includes adding the white space
usr_cmd("Dapui", ":lua require('dapui').toggle()<CR>", {})
usr_cmd("Cs", ":lua require('telescope.builtin').find_files({cwd='~/.local/share/tref'})<CR>", {})
usr_cmd(
	"Conf",
	":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/', previewer=false})<CR>",
	{}
)
usr_cmd("Chmod", ":silent !chmod +x %", {})

-- dotfiles
usr_cmd("Dfa", function()
	local file = vim.fn.expand("%:p")
	local exists = funcs.file_tracked_in_dotfiles(file)
	if exists then
		funcs.dotfiles_stage_file(file)
	else
		local response = vim.fn.input("File is untracked in dotfiles. Stage it (y/n)? ")
		response = response.gsub(response, "%s+", "")
		if response == "y" or response == "Y" then
			funcs.dotfiles_stage_file(file)
		end
	end
end, {})
usr_cmd("Dfc", function()
	local message = vim.fn.input("Commit message:  ")
	funcs.dotfiles_commit(message)
end, {})
usr_cmd("Dfr", function()
	local file = vim.fn.expand("%:p")
	funcs.dotfiles_restore_staged_file(file)
end, {})
