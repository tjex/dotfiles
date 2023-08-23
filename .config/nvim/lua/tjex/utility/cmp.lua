local ok, _ = pcall(require, "cmp")
if not ok then
    print("nvim-cmp not ok!")
    return
end

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<c-j>'] = cmp.mapping.select_next_item(),
        ['<c-b>'] = cmp.mapping.scroll_docs(-4), -- scroll through a large preview window
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-Space>'] = cmp.mapping.complete(),
        ['<c-e>'] = {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim-lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 5 },
    }, {
        { name = 'buffer' },
    })
})


-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--     }, {
--         { name = 'buffer' },
--     })
-- })
--
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['lua_ls'].setup {
--     capabilities = capabilities
-- }
-- require('lspconfig')['stylelint_lsp'].setup {
--     capabilities = capabilities
-- }
