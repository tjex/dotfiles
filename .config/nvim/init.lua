-- globals: setting here to be safe
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.BufSurfMessages = false;

require("tjex.inits")
require("tjex.utility")
require("tjex.lsp")
require("tjex.dap")
require("tjex.text")
require("tjex.gui")
require("tjex.integrations")
