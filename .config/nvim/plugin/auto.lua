-- auto commands --
-------------------

local auto = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("tree", { clear = false })
augroup("lint", { clear = true })
augroup("formatter", { clear = true })
augroup("format_options", { clear = true })
augroup("windows", { clear = true })
augroup("term", { clear = true })

-- Buffers --
--------------

-- setting format options in init.lua is still buggy
-- ft specific foptions in after/ftplugin
local fo_ftypes = { "mail", "markdown" }
auto({ "BufEnter", "BufNewFile" }, {
	group = "format_options",
	callback = function()
		local ftype = vim.bo.filetype
		if not vim.tbl_contains(fo_ftypes, ftype) then
			vim.opt_local.fo = "crqn1jp"
		end
	end,
})

auto({ "BufWritePost" }, {
	group = "lint",
	callback = function()
		require("lint").try_lint()
	end,
})

auto({ "BufWritePost" }, {
	group = "formatter",
	callback = function()
		local ftype = vim.bo.filetype
		if ftype ~= "markdown" and ftype ~= "mail" then
			vim.cmd(":FormatWrite")
		end
	end,
})

-- Term --
----------

auto({ "TermOpen" }, {
	group = "term",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
	end,
})
