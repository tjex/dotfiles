local ok, _ = pcall(require, "harpoon")
if not ok then
    print('harpoon not ok!')
    return
end

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 40,
    }
})
