-- custom commands (run from :commandline)
-- insert todays date
vim.api.nvim_create_user_command("Date", "norm! i " .. vim.fn.strftime('%Y-%m-%d'), {})
vim.api.nvim_create_user_command("PubDate", "norm! i " .. vim.fn.strftime('%Y-%m-%dT%XZ'), {})
vim.api.nvim_create_user_command("Dapui", ":lua require('dapui').toggle()<CR>", {})
vim.api.nvim_create_user_command("Cs",
    ":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/cheat-sheets'})<CR>", {})
vim.api.nvim_create_user_command("Conf",
    ":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/lua/tjex', previewer=false})<CR>", {})
