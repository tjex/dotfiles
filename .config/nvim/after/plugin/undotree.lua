-- vim plugin, doesn't like pcall?

vim.g.undotree_WindowLayout = 4

vim.api.nvim_set_keymap("n", "<leader>z", ":UndotreeToggle<CR>", {silent = true, noremap = true})
