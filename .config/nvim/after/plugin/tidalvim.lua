-- vim-tidal
local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap("n", "<c-s>", "mz:TidalSend<cr>`z", opts) -- (mz) and (`z) "keep" the cursor in place on execution
vim.api.nvim_set_keymap("n", "<c-h>", ":TidalHush<cr>", opts)
