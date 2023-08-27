local ok, _ = pcall(require, "cmp")
if not ok then
    print("nvim-cmp not ok!")
    return
end

local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
    completion = {
        autocomplete = false
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        documentation = cmp.config.disable -- disable docs
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    -- performance = { max_view_entries = 10 },
    mapping = cmp.mapping.preset.insert({
        -- saving next/prev keymaps as i think typing is good enough to bring it into selection
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<c-j>'] = cmp.mapping.select_next_item(),
        ['<c-Space>'] = cmp.mapping.complete(),
        ['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ['<c-,>'] = cmp.mapping.scroll_docs(-4), -- scroll through a large preview window
        -- ['<c-m>'] = cmp.mapping.scroll_docs(4),
        -- not really needed? just keep typing...
        -- ['<c-c>'] = {
        --     i = cmp.mapping.abort(),
        --     c = cmp.mapping.close(),
        -- },

    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 5 },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
            },

        })
    }
})
