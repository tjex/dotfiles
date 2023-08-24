local ok, _ = pcall(require, "harpoon")
if not ok then
    print('harpoon not ok!')
    return
end

local key = vim.keymap.set
local mark = require("harpoon.mark")

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 40,
    }
})


local ui = require("harpoon.ui")
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
