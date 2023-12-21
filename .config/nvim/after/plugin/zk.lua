local ok, _ = pcall(require, "zk")
if not ok then
	print("zk conf has a problem")
	return
end

local opts = { noremap = true, silent = true }
local key = vim.keymap.set

require("zk").setup({
	-- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
	-- it's recommended to use "telescope", "fzf" or "fzf_lua"
	picker = "telescope",

	lsp = {
		-- `config` is passed to `vim.lsp.start_client(config)`
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
			on_attach = function()
                require("cmp_nvim_lsp").default_capabilities()
				key("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)

                key("n", "<leader>zn", ":ZkNew {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>")
                key("v", "<leader>zil", ":ZkInsertLinkAtSelection")
                key("v", "<leader>zm", ":ZkMatch")
                key("v", "<leader>zt", ":ZkTags")


			end,
		},

		-- automatically attach buffers in a zk notebook that match the given filetypes
		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
})
