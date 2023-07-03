-- mason and mason-lsp.
-- use this to configure mason and LSP servers.
-- configure linters and formatters in null-ls.

-- mason
local ok, _, _ = pcall(require, "mason", "mason-lspconfig")
if not ok then
    print('mason or mason-lspconfig not ok!')
    return
end

local lspconfig = require('lspconfig')
local servers = {
    "lua_ls",
    "marksman",
    "gopls",
    "pyright",
    "stylelint_lsp"
}

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-----------------------
-- Begin LSP Config ---
-----------------------
local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

local function lsp_keymaps(client, bufnr)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local funcs = require("tjex.handrolled.funcs")
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local key = vim.keymap.set
    local auto = vim.api.nvim_create_autocmd
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    key('n', 'gd', function() vim.lsp.buf.definition() end, bufopts)
    key('n', '[d', vim.diagnostic.goto_prev, bufopts)
    key('n', ']d', vim.diagnostic.goto_next, bufopts)

    key('n', '<C-i>', vim.lsp.buf.hover, bufopts)
    key('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    key("n", "<leader>!", funcs.toggle_diagnostics)

    if client.name == "eslint" then
        auto("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end
end

local lsp_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end
    lsp_keymaps(client, bufnr)
    lsp_highlight_document(client)
    client.server_capabilities.document_formatting = true
end

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
        })
    end,
    -- use this ["serverkey"] syntax to overwrite automatic setup
    -- eg when custom config is needed
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            on_attach = lsp_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        }
    end,
    ["stylelint_lsp"] = function()
        require('lspconfig').stylelint_lsp.setup {
            on_attach = lsp_attach,
            settings = {
                stylelintplus = {
                    autoFixOnSave = true,
                    autoFixOnFormat = true,
                },
            },
        }
    end,
})
