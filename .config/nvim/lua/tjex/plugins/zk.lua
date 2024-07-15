return {
	-- "zk-org/zk-nvim",
	dir = "~/.local/src/zk-org/zk-nvim.git/hoofcushion/",
	name = "zk-nvim-local",

	event = "BufEnter *.md",
	config = function()
		local tjutil = require("tjex.util")

		local cmd = require("zk.commands")
		local key = require("tjex.keymap")
		local util = require("zk.util")
		local zk = require("zk")

		local year = vim.fn.strftime("%Y")
		local dateISO = vim.fn.strftime("%Y-%m-%d")
		local diary_dir = "d/" .. year

		cmd.add("ZkOrphans", function(options)
			options = vim.tbl_extend("force", { orphan = true }, options or {})
			zk.edit(options, { title = "Zk Orphans" })
		end)

		local keymaps = function()
			-- normal mode
			-- make daily note
			key.nmap({
				"zd",
				function()
					local notebook_root = util.notebook_root(vim.fn.expand("%:p"))
					local filename = dateISO
					local path_table = { notebook_root, diary_dir, filename }
					local filepath = table.concat(path_table, "/") .. ".md"
					local title = ""
					if tjutil.file_exists(filepath) then
						vim.cmd(":e " .. filepath)
					else
						local subheading = vim.fn.input("Subheading: ")
						if subheading == "" then
							title = filename
						else
							title = "'" .. filename .. ":" .. " " .. subheading .. "'"
						end
						cmd.get("ZkNew")({ dir = diary_dir, group = "d", title = title })
					end
				end,
			})
			key.nmap({ "zn", ":ZkNew {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>" })
			key.nmap({ "st", ":ZkTags<cr>" })
			key.nmap({ "sf", ":ZkNotes<cr>" })
			key.nmap({ "so", ":ZkLinks<cr>" })
			key.nmap({ "si", ":ZkBacklinks<cr>" })

			-- visual mode
			key.vmap({ "sm", ":ZkMatch<cr>" })
			key.vmap({ "zn", ":ZkNewFromTitleSelection {dir = vim.fn.input('Dir: ')}<cr>" })
			key.vmap({ "zl", ":ZkInsertLinkAtSelection<cr>" })
			key.vmap({
				"ze",
				":ZkNewFromContentSelection {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>",
			})

			-- insert mode
			key.imap({
				"<c-r>",
				function()
					vim.cmd("norm! i") -- otherwise link gets inserted after cursor
					cmd.get("ZkInsertLink")()
				end,
			})
		end

		require("zk").setup({
			picker = "telescope",

			-- lsp config is dealt with here instead of lsp.lua because .setup()
			-- actually communicates directly with nvim-lsp to setup the server.
			-- trying to integrate it in mason-lsp will probably end badly.
			lsp = {
				config = {
					cmd = { "zk", "lsp", "--log", "/tmp/zk-lsp.log" },
					name = "zk",
					on_attach = function()
						require("cmp_nvim_lsp").default_capabilities()
						keymaps()
					end,
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})
	end,
}
