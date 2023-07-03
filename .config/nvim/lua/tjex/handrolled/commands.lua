-- custom commands (run from :commandline)
-- insert todays date
vim.api.nvim_create_user_command("Date", "norm! i" .. vim.fn.strftime('%Y-%m-%d'), {})
vim.api.nvim_create_user_command("PubDate", "norm! i" .. vim.fn.strftime('%Y-%m-%dT%XZ'), {})
vim.api.nvim_create_user_command("Dapui", ":lua require('dapui').toggle()<CR>", {})
