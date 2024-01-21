-- tjex user settings
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.BufSurfMessages = false
vim.g.noswapfile = true

-- look to implement this in wezterm directly if I ever turn back on
-- blinking cursor (append within string below): ,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
vim.opt.guicursor = "n-c-sm-ci:block,i-v-ve-r-cr-o:hor20"
vim.opt.termguicolors = true
vim.opt.updatetime = 50

-- text / typography
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.splitright = true
-- vim.opt.textwidth = 85
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.conceallevel = 2

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true -- update search highlight duting search

-- editor window
-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "both"
vim.opt.tw = 80
vim.opt.fo = "crqn1jp" -- see :h fo-table (basically format comments only)
vim.opt.scrolloff = 8 -- maintain min8 lines between cursor window start/end
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldcolumn = "auto:2"
vim.opt.signcolumn = "yes:1"
vim.opt.wildoptions = "fuzzy"
vim.opt.laststatus = 3

