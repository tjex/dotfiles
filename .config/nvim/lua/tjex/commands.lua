-- custom commands (run from :commandline)
local cmd = vim.api.nvim_create_user_command

cmd("Date", "norm! i " .. vim.fn.strftime('%Y-%m-%d'), {})
cmd("PubDate", "norm! i " .. vim.fn.strftime('%Y-%m-%dT%XZ'), {})
cmd("Dapui", ":lua require('dapui').toggle()<CR>", {})
cmd("Cs", ":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/cheat-sheets'})<CR>", {})
cmd("Conf", ":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/lua/tjex', previewer=false})<CR>", {})
cmd("EditSnippets", ":lua require('luasnip.loaders').edit_snippet_files()<CR>", {})
