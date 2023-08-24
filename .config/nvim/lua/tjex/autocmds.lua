local funcs = require("tjex.funcs")
local auto = vim.api.nvim_create_autocmd

auto("VimEnter", { callback = funcs.open_nvim_tree })

-- show last used buffer if bdelete leaves you with nvim-tree only
auto({ "VimEnter" }, {
    nested = true,
    callback = function()
        local api = require('nvim-tree.api')

        -- Only 1 window with nvim-tree left: we probably closed a file buffer
        if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
            -- Required to let the close event complete. An error is thrown without this.
            vim.defer_fn(function()
                -- close nvim-tree: will go to the last hidden buffer used before closing
                api.tree.toggle({ find_file = true, focus = true })
                -- re-open nivm-tree
                api.tree.toggle({ find_file = true, focus = true })
                -- nvim-tree is still the active window. Go to the previous window.
                vim.cmd("wincmd p")
            end, 0)
        end
    end
})

auto("BufWritePre", { callback = function() vim.lsp.buf.format() end })
