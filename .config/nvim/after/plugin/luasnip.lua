local ok, _ = pcall(require, "luasnip")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("luasnip not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

local ls = require("luasnip")
local key = vim.keymap.set

-- snippets source
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

-- stop vimwiki from blocking markdown snippets registered in luasnip
ls.filetype_extend("vimwiki", { "markdown" })

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	-- enable_autosnippets = true,
})

key({ "i", "s" }, "<c-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

key({ "i", "s" }, "<c-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

key({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

key("n", "<leader><leader>ls", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>")
key("n", "<leader><leader>es", ":lua require('luasnip.loaders').edit_snippet_files()<CR>")

local function map_snippet(keys, snippet_key)
	vim.keymap.set("i", keys, function()
		local ftype = vim.bo.filetype
		local function keybind_snip()
			require("luasnip").snip_expand(require("snippets.keysnips-" .. ftype)[snippet_key]) -- nvim/lua/keybind-snips
		end
		local snip_found, _ = pcall(keybind_snip)
		if not snip_found then
			print("no keybind snippets for this filetype")
			return
		end
	end)
end

map_snippet("<C-k>", "print")
map_snippet("<C-e>", "error")
