return {
	"L3MON4D3/LuaSnip",

	config = function()
		local key = require("tjex.keymap")
		local ls = require("luasnip")

		-- snippets source
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/tjex/snippets/" })

		-- stop vimwiki from blocking markdown snippets registered in luasnip
		ls.filetype_extend("vimwiki", { "markdown" })

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			-- enable_autosnippets = true,
		})

		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-l>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		key.nmap({ "<leader><leader>ls", "<cmd>Lazy reload luasnip.nvim<cr>" }) --TODO: what is the correct syntax for this command?..
		key.nmap({ "<leader><leader>es", ":lua require('luasnip.loaders').edit_snippet_files()<CR>" })

		local function map_snippet(keys, snippet_key)
			vim.keymap.set("i", keys, function()
				local ftype = vim.bo.filetype
				local function keybind_snip()
					-- ("tjex.snippets.keysnips-") is a file path:
					-- i.e, nvim/lua/tjex/snippets/keysnips-<ftype>.lua
					require("luasnip").snip_expand(require("tjex.snippets.keysnips-" .. ftype)[snippet_key])
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
	end,
}
