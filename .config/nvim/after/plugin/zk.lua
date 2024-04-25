local ok, _ = pcall(require, "zk")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("zk conf has a problem")
	vim.cmd(":set cmdheight=1") -- set back to default
	return
end

local tjutil = require("tjex.util")

local cmd = require("zk.commands")
local util = require("zk.util")
local zk = require("zk")
local key = vim.keymap.set
local key_opts = { noremap = true, silent = true }

local year = vim.fn.strftime("%Y")
local dateISO = vim.fn.strftime("%Y-%m-%d")
local diary_dir = "d/" .. year

cmd.add("ZkOrphans", function(options)
	options = vim.tbl_extend("force", { orphan = true }, options or {})
	zk.edit(options, { title = "Zk Orphans" })
end)

local keymaps = function()
	key("n", "gd", function()
		vim.lsp.buf.definition()
	end, key_opts)
	-- normal mode
	key("n", "zn", ":ZkNew {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>")
	key("n", "zd", function()
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
				title = '"' .. filename .. ":" .. " " .. subheading .. '"'
			end
			cmd.get("ZkNew")({ dir = diary_dir, group = "d", title = title })
		end
	end)
	key("n", "zt", ":ZkTags<cr>")
	key("n", "sf", ":ZkNotes<cr>")
	key("n", "zl", ":ZkInsertLink {title = vim.fn.input('Link text: ')}<cr>")
	key("n", "zo", ":ZkLinks<cr>")
	key("n", "zb", ":ZkBacklinks<cr>")

	-- visual mode
	key("v", "zl", ":ZkInsertLinkAtSelection<cr>")
	key("v", "zm", ":ZkMatch<cr>")
	key("v", "zn", ":ZkNewFromTitleSelection {dir = vim.fn.input('Dir: ')}<cr>")
	key(
		"v",
		"ze",
		":ZkNewFromContentSelection {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>"
	)

	key("i", "<c-r>", function()
		cmd.get("ZkInsertLink")()
	end)
	-- insert mode
	key("i", "<c-r>", function()
		vim.cmd("norm! i") -- otherwise link gets inserted after cursor
		-- should use nvim_put({}, true, true) in ZkInsertLink. see help
		cmd.get("ZkInsertLink")()
		-- after the inserted link?..
	end)
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
