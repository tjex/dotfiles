-- neovim keypings
local key = vim.keymap.set
local opts = { noremap = true, silent = true }

-- plug vars
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
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
key("n", "k", "gk", opts)               -- cursor up inline key("n", ";gd", funcs.buf_def) -- go to definition
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


--------------
-- PLUGINS ---
--------------
-- telescope
-- pickers: https://github.com/nvim-telescope/telescope.nvim#vim-pickers
key("n", "sb", tb.buffers, opts)
key("n", "sc", tb.commands, opts)
key("n", "sd", tb.diagnostics, opts)
-- setting previewer false here instead of in setup so that it can be enabled selectively for other commands
key("n", "sf", function() require('telescope.builtin').find_files({ previewer = false }) end, opts)
key("n", "sF", function() require('telescope').extensions.recent_files.pick() end, opts)
key("n", "sg", tb.live_grep, opts)
key("n", "sh", tb.help_tags, opts)
key("n", "sm", tb.marks, opts)
key("n", "sp", tb.registers, opts)
key("n", "sr", tb.lsp_references, opts)
key("n", "sx", tb.git_branches, opts)
key("n", "sz", tb.git_stash, opts)


-- easy-align --
key("n", "ga", ":EasyAlign", opts)
key("v", "ga", ":EasyAlign", opts)

-- nvim-tree
key("n", "<leader>e", ":NvimTreeToggle<CR>", opts)    --toggle sidebar
key("n", "<ESC>", ":NvimTreeClose<CR>", opts)         --toggle sidebar
key("n", "<leader>l", ":NvimTreeFindFile!<CR>", opts) --toggle sidebar

-- harpoon
key("n", "<leader>a", mark.add_file)
key("n", "<leader>h", ui.toggle_quick_menu)
key("n", "<C-1>", function()
    ui.nav_file(1)
end)
key("n", "<C-2>", function()
    ui.nav_file(2)
end)
key("n", "<C-3>", function()
    ui.nav_file(3)
end)
key("n", "<C-4>", function()
    ui.nav_file(4)
end)
key("n", "K", ui.nav_next)
key("n", "J", ui.nav_prev)

-- DAP
key("n", "<leader>b", ":DapToggleBreakpoint<CR>", opts)
key("n", "%", ":DapStepOver<CR>", opts)
key("n", "$", ":DapStepInto<CR>", opts)
key("n", "#", ":DapStepOut<CR>", opts)
key("n", "<leader>d", function() require 'telescope'.extensions.dap.commands {} end, opts)

-- bufsurf
key("n", "L", ":BufSurfForward<CR>", opts)
key("n", "H", ":BufSurfBack<CR>", opts)
