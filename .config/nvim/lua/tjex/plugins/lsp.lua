-- mason and mason-lsp.
-- use this to configure mason and LSP servers.
-- configure linters and formatters in null-ls.

return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "onsails/lspkind.nvim" },

	config = function()
		-- NOTE: zk lsp is managed by /plugin/zk.lua
		local servers = {
			"lua_ls",
			"marksman",
			"gopls",
			"pyright",
			"stylelint_lsp",
			"astro",
			"pyright",
			"jsonls",
		}

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
		})
	end,
	init = function()
		local lspconfig = require("lspconfig")
		------------------------
		--- Begin LSP Config ---
		------------------------

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		local function lsp_keymaps(bufnr)
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			local key = require("tjex.keymap")
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			key.nmap({
				"gd",
				function()
					vim.cmd("norm! ml")
					require("telescope.builtin").lsp_definitions()
				end,
				bufopts,
			})
			key.nmap({ "[d", vim.diagnostic.goto_prev, bufopts })
			key.nmap({ "]d", vim.diagnostic.goto_next, bufopts })
			key.nmap({ "<c-p>", vim.lsp.buf.hover, bufopts })
			key.nmap({ "<c-x>", vim.lsp.buf.code_action, bufopts })
		end

		local lsp_attach = function(client, bufnr)
			lsp_keymaps(bufnr)

			-- see ./formatter.lua for formatting provider logic
			client.server_capabilities.document_formatting = true
			-- why was this disabled? Seems to be a good thing...
			-- was something from chris@themachine
			-- client.server_capabilities.semanticTokensProvider = nil
			require("cmp_nvim_lsp").default_capabilities()
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
					-- cssls needs to have completion enabled via capabilities in
					-- order to give LSP comp.
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
	end,
}
