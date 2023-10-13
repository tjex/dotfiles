-- mason and mason-lsp.
-- use this to configure mason and LSP servers.
-- configure linters and formatters in null-ls.

-- mason
local ok, _, _ = pcall(require, "mason", "mason-lspconfig")
if not ok then
	print("mason or mason-lspconfig not ok!")
	return
end

local lspconfig = require("lspconfig")
local servers = {
	"lua_ls",
	"marksman",
	"gopls",
	"pyright",
	"stylelint_lsp",
	"astro",
	"pyright",
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-----------------------
-- Begin LSP Config ---
-----------------------

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

local function lsp_keymaps(client, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local key = vim.keymap.set
	local auto = vim.api.nvim_create_autocmd
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	key("n", "gd", function()
		vim.lsp.buf.definition()
	end, bufopts)
	key("n", "[d", vim.diagnostic.goto_prev, bufopts)
	key("n", "]d", vim.diagnostic.goto_next, bufopts)
	key("n", "<C-i>", vim.lsp.buf.hover, bufopts)

	if client.name == "eslint" then
		auto("BufWritePost", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end
end

local lsp_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	lsp_keymaps(client, bufnr)
	local force_formatter = client.name == "lua_ls"
		or client.name == "tsserver"
		or client.name == "pyright"
		or client.name == "bashls"

	client.server_capabilities.document_formatting = true
	-- if lsp does not provide formatting (or has been set false, above), use formatter.nvim
	if client.server_capabilities.documentFormattingProvider and not force_formatter then
		print("format with lsp")
		vim.keymap.set({ "v", "n" }, "<leader>f", vim.lsp.buf.format, bufopts)
	else
		print("format with formatter")
		vim.keymap.set("n", "<leader>f", ":Format<cr>", bufopts)
	end
	require("cmp_nvim_lsp").default_capabilities()
	client.server_capabilities.semanticTokensProvider = nil
end

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = lsp_attach,
		})
	end,
	["cssls"] = function()
		require("lspconfig").cssls.setup({
			on_attach = lsp_attach,
			require("lspconfig").cssls.setup({
				-- cssls needs to have completion enabled via capabilities in order to give LSP comp.
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			}),
		})
	end,
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			on_attach = lsp_attach,
			settings = {
				Lua = {
					format = {
						-- NOTE: disabled in lsp_attach to make lsp / formatter.nvim if-then logic work
						-- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/lua.template.editorconfig
						defaultConfig = {
							quote_style = "single",
							max_line_length = "120",
						},
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})
	end,
	["stylelint_lsp"] = function()
		require("lspconfig").stylelint_lsp.setup({
			on_attach = lsp_attach,
			settings = {
				stylelintplus = {
					autoFixOnSave = true,
					autoFixOnFormat = true,
				},
			},
		})
	end,
})
