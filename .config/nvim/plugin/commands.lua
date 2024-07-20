--
-- user commands
--

local usr_cmd = vim.api.nvim_create_user_command
local funcs = require("tjex.funcs")

-- run a file on write and print its output to designated buf
usr_cmd("AutoRun", function()
	print("AutoRun starts now...")
	-- local bufnr = vim.api.nvim_get_current_buf()
	local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	funcs.attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

usr_cmd("Date", "norm! i" .. vim.fn.strftime("%Y-%m-%d"), {})
usr_cmd("PubDate", "norm! a " .. vim.fn.strftime("%Y-%m-%dT%XZ"), {}) -- norm command includes adding the white space
usr_cmd("Dapui", ":lua require('dapui').toggle()<CR>", {})
usr_cmd(
	"Conf",
	":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/', previewer=false})<CR>",
	{}
)
usr_cmd("Chmod", ":silent !chmod +x %", {})

-- git worktree
usr_cmd("WorktreeCreate", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})
usr_cmd("Worktree", ":lua require('telescope').extensions.git_worktree.git_worktrees()", {})
usr_cmd("Rd", ":lua require('persistence').load()<cr>", {})
usr_cmd("Rs", ":lua require('persistence').load({last = true})<cr>", {})
