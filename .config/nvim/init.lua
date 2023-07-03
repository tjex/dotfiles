-- disable netrw as first step for nvimtree to work properly
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tjex.utility")
require("tjex.lsp")
require("tjex.dap")
require("tjex.text")
require("tjex.gui")
require("tjex.handrolled")
