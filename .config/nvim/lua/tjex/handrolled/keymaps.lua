-- neovim keypings
local key = vim.keymap.set
local opts = { noremap = true, silent = true }
local funcs = require("tjex.handrolled.funcs")

-- plug vars
local mark = require("harpoon.mark")
local tb = require("telescope.builtin")

-- main functionality remaps
key("", "<Space>", "<Nop>", opts)
key("n", "<ESC>", "<Nop>")
key("i", "kj", "<ESC>", opts)
key("i", "KJ", "<ESC>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--  normal mode = 'n'
--  insert mode = 'i'
--  viaul mode = 'v'
--  visual block mode - 'x'
--  term mode = 't'
--  command mode = 'c'

-- file operations
key("n", "W", ":w!<CR>", opts)
-- key("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)
key("n", "<leader>cd", ":cd %:h<CR>", opts)

-- text operations
key("n", "<M-k>", "mzJ`z", opts)          -- append below to current line and leave cursor where it is
key("x", "<leader>p", '"_d<Left>p', opts) -- paste over text and keep same item in paste buffer
key("n", "<leader>y", '"+y', opts)        -- copy to sys clipboard
key("v", "<leader>y", '"+y', opts)
key("n", "x", '"_x', opts)                -- stop 'x' from adding to paste regsiter
key("n", "Z", "1z=e", opts)
key("n", "fp", "mzvapgq`z", opts)         -- format paragraph and leave cursor where it was
key("n", "fl", "mzgqq`z", opts)           -- format line and leave cursor where it was

-- thanks Prime. Replace mode using the word you were currently on
key("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/<Left>")

-- naviagtion
key("n", "j", "gj", opts)               -- cursor down inline
key("n", "k", "gk", opts)               -- cursor up inline
key("v", "J", ":m '>+1<CR>gv=gv", opts) -- move selected visual lines down
key("v", "K", ":m '<-2<CR>gv=gv", opts) -- move selected visual lines up
key("n", "<C-d>", "<C-d>zz", opts)      -- keep cursor in middle when jumping
key("n", "<C-u>", "<C-u>zz", opts)      -- keep cursor in middle when jumping
key("n", "n", "nzzzv", opts)            -- keep cursor in middle during search
key("n", "N", "Nzzzv", opts)

-- windows
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-l>", "<C-w>l", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-j>", "<C-w>j", opts)


-- plugins without their own conf file

-- bufsurf
key("n", "L", ":BufSurfForward<CR>", opts)
key("n", "H", ":BufSurfBack<CR>", opts)

-- easy-align --
key("n", "ga", ":EasyAlign", opts)
key("v", "ga", ":EasyAlign", opts)
