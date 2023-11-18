local ok, _ = pcall(require, "formatter")
if not ok then
	print("formatter conf has a problem")
	return
end

local bufopts = { noremap = true, silent = true }
vim.keymap.set({ "v", "n" }, "<leader>f", ":Format<cr>", bufopts)

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		-- formatters are executed in order within their own tables
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		bash = {
			require("formatter.filetypes.sh").shfmt,
		},
		javascript = {
			require("formatter.filetypes.javascript").eslint_d,
		},
		css = {
			require("formatter.filetypes.css").prettierd,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
		},

		-- for any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
			-- formatting logic: See if formatter.nvim can do it, then check if lsp can do it,
			-- then notify if neither can do it. The keybind is then universally ":Format", as this
			-- logic is run when formatter.nvim is run.
			function()
				local formatters = require("formatter.util").get_available_formatters_for_ft(vim.bo.filetype)
				if #formatters > 0 then
					print("formatted with formatter.nvim")
					return
				end
				-- check if there are any LSP formatters
				local lsp_clients = vim.lsp.buf_get_clients()
				for _, client in pairs(lsp_clients) do
					if client.server_capabilities.document_formatting then
						print("formatted with lsp")
						vim.lsp.buf.format()
						return
					end
				end
				print("no formatters found from formatter.nvim OR lsp")
			end,
		},
	},
})
