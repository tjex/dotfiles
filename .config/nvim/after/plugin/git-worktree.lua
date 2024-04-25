local ok, _ = pcall(require, "git-worktree")
if not ok then
    vim.cmd(':set cmdheight=0') -- makes messages persist
	print("git_worktree conf has a problem")
    vim.cmd(':set cmdheight=1') -- set back to default
	return
end

local usr_cmd = vim.api.nvim_create_user_command

require("git-worktree").setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false,
})

usr_cmd("WorktreeCreate", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})
usr_cmd("Worktree", ":lua require('telescope').extensions.git_worktree.git_worktrees()", {})
