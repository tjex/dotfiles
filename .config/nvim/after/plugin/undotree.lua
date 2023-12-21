-- vim plugin, doesn't like pcall?

vim.g.undotree_WindowLayout = 2

vim.api.nvim_set_keymap("n", "<leader>ut", ":UndotreeToggle<CR>", {silent = true, noremap = true})
