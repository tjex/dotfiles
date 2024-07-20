return {
	"mhartington/formatter.nvim",
	dev = true,

	config = function()
		local util = require("formatter.util")
		local bufopts = { noremap = true, silent = true }
		vim.keymap.set({ "v", "n" }, "<leader>f", ":FormatWrite<cr>", bufopts)

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				-- formatters are executed in order within their own tables
				cpp = {
					require("formatter.filetypes.cpp").clangformat,
				},
				tex = {
					require("formatter.filetypes.tex").latexindent,
				},
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
				scss = {
					require("formatter.filetypes.css").prettierd,
				},
				html = {
					require("formatter.filetypes.html").prettierd,
				},
				json = {
					require("formatter.filetypes.json").prettierd,
				},
				markdown = {
					function()
						return {
							exe = "prettierd",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
								"--print-width=80",
								"--prose-wrap=always",
							},
							stdin = true,
						}
					end,
				},
				-- Unwrap prose in markdown. Execute via `:Fmt unwrap`, see user command.
				unwrap = {
					function()
						return {
							exe = "prettierd",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
								"--prose-wrap=never",
							},
							stdin = true,
						}
					end,
				},

				mail = {
					function()
						vim.opt_local.tw = 5000
						vim.cmd("norm! Vgggq")
					end,
				},

				-- for any filetype
				["*"] = {
					function()
						local ft = vim.bo.filetype
						-- white space is required for signatures "-- " and paragraph breaks
						if ft == "mail" then
							return
						end
						require("formatter.filetypes.any").remove_trailing_whitespace()
					end,

					-- formatting logic: See if formatter.nvim can do it, then check if lsp can do it,
					-- then notify if neither can do it. The keybind is then universally ":Format", as this
					-- logic is run when formatter.nvim is run.
					function()
						local lsp_clients = vim.lsp.buf_get_clients()
						local formatters = util.get_available_formatters_for_ft(vim.bo.filetype)
						if #formatters > 0 then
							return
						end
						-- check if there are any LSP formatters
						for _, client in pairs(lsp_clients) do
							if client.server_capabilities.document_formatting then
								vim.lsp.buf.format()
								print("formatted with lsp")
								return
							end
						end
					end,
				},
			},
		})

		-- :Fmt <key> allows creation of custom formatters, called from withing
		-- setup.filetype
		-- see: https://github.com/mhartington/formatter.nvim/issues/229#issuecomment-1445318174
		vim.api.nvim_create_user_command("Fmt", function(opts)
			local params = vim.split(opts.args, "%s+", { trimempty = true })
			local filetype = vim.bo.filetype
			vim.cmd("set filetype=" .. params[1]) -- fake filetype
			vim.cmd(":Format")
			vim.cmd("set filetype=" .. filetype) -- restore original filetype
		end, {
			nargs = 1,
			complete = function()
				local languages = {
					markdown = { "unwrap", "mail" },
				}
				return languages[vim.bo.filetype] or {}
			end,
		})
	end,
}
