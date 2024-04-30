-- neovim keypings
local key = require("tjex.keymap")
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- main functionality remaps
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
key("n", "<ESC>", "<Nop>")
key("n", "<F1>", "<Nop>", opts)
key("i", "kj", "<ESC>", opts)
key("i", "KJ", "<ESC>", opts)
key("i", "<c-l>", "<Nop>", opts)

-- Modes
--  normal mode = 'n'
--  insert mode = 'i'
--  viaul mode = 'v'
--  visual block mode - 'x'
--  term mode = 't'
--  command mode = 'c'

-- file operations
key("n", "W", ":w<CR>", opts)
key("n", "<leader>cd", ":cd %:h<CR>", opts)

-- text operations
key("n", "˚", "mzJ`z", opts) -- append below to current line and leave cursor where it is
key("x", "<leader>p", '"_d<Left>p', opts) -- paste over text and keep same item in paste buffer
key("n", "<leader>y", '"+y', opts) -- copy to sys clipboard
key("v", "<leader>y", '"+y', opts)
key("n", "x", '"_x', opts) -- stop 'x' from adding to paste
key("n", "Z", "1z=e", opts)

-- Replace mode using the word you were currently on (thanks to the Primeageon).
key("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/<Left>")

-- naviagtion
key("n", "j", "gj", opts) -- cursor down inline
key("n", "k", "gk", opts) -- cursor up inline
key("v", "J", ":m '>+1<CR>gv=gv", opts) -- move selected visual lines down
key("v", "K", ":m '<-2<CR>gv=gv", opts) -- move selected visual lines up
key("n", "<C-d>", "<C-d>zz", opts) -- keep cursor in middle when jumping
key("n", "<C-u>", "<C-u>zz", opts) -- keep cursor in middle when jumping
key("n", "n", "nzzzv", opts) -- keep cursor in middle during search
key("n", "N", "Nzzzv", opts)
key("n", "`o", '`"', opts) -- jump to where cursor was on file close (`" sucks to type)

-- windows
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)

-- tabs
key("n", "gh", ":tabp<CR>", opts) -- previous tab
key("n", "gl", ":tabn<CR>", opts) -- next tab

-- buffers
key("n", "<leader>bd", ":bn<bar>sp<bar>bp<bar>bd<CR>")

-- plugins without their own conf file

-- easy-align
key("n", "ga", ":EasyAlign", opts)
key("v", "ga", ":EasyAlign", opts)

-- centerpad
key("n", "<c-ESC>", ":Centerpad 20<cr>", opts)
