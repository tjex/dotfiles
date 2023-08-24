package.loaded.funcs = nil
local funcs = {}
local diagnostics_active = true

-- LSP
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

local buf_def = function()
    vim.lsp.buf.definition()
end

-- nvim-tree open for directories and change dir
local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
end

return {
    toggle_diagnostics = toggle_diagnostics,
    buf_def = buf_def,
    open_nvim_tree = open_nvim_tree,
}
