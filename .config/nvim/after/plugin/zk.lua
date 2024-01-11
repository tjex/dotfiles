local ok, _ = pcall(require, "zk")
if not ok then
	print("zk conf has a problem")
	return
end

local cmd = require("zk.commands")
local key = vim.keymap.set
local key_opts = { noremap = true, silent = true }
local zk_root = require("zk.util").notebook_root(vim.fn.expand("%:p"))


require("zk").setup({
	picker = "telescope",

	-- lsp config is dealt with here instead of lsp.lua because .setup()
	-- actually communicates directly with nvim-lsp to setup the server.
	-- trying to integrate it in mason-lsp will probably end badly.
	lsp = {
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
			on_attach = function()
				require("cmp_nvim_lsp").default_capabilities()
				key("n", "gd", function()
					vim.lsp.buf.definition()
				end, key_opts)

				-- normal mode
				key(
					"n",
					"<leader>zn",
					":ZkNew {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: '), template = vim.fn.input('Template: ') .. '.md'}<cr>"
				)
				key("n", "<leader>zd", function()
					local dir = "d/" .. vim.fn.strftime("%Y")
					cmd.get("ZkNew")({ dir = dir, group = "daily"})
				end)
				key("n", "<leader>zt", ":ZkTags<cr>")
				key("n", "<leader>zf", ":ZkNotes {excludeHrefs = {'d'}}<cr>")
				key("n", "<leader>zl", ":ZkInsertLink {title = vim.fn.input('Link text: ')}<cr>")
				key("n", "<leader>zo", ":ZkLinks<cr>")
				key("n", "<leader>zb", ":ZkBacklinks<cr>")

				-- visual mode
				key(
					"v",
					"<leader>zl",
					":ZkInsertLinkAtSelection<cr>"
				)
				key("v", "<leader>zm", ":ZkMatch<cr>")
				key("v", "<leader>zn", ":ZkNewFromTitleSelection {dir = vim.fn.input('Dir: ')}<cr>")
				key(
					"v",
					"<leader>ze",
					":ZkNewFromContentSelection {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>"
				)

                -- insert mode
                key("i", "<c-r>", function()
                    -- cmd.get("ZkInsertLink")({title = vim.fn.input('Link text: ')})
                    cmd.get("ZkInsertLink")()
                end)
			end,
		},

		-- automatically attach buffers in a zk notebook that match the given filetypes
		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
})
