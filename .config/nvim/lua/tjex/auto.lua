-- auto commands --
-------------------

local auto = vim.api.nvim_create_autocmd
local funcs = require("tjex.funcs")
local augroup = vim.api.nvim_create_augroup

augroup("tree", { clear = false })
augroup("lint", { clear = true })
augroup("formatter", { clear = true })
augroup("format_options", { clear = true })
augroup("windows", { clear = true })

-- Startup --
--------------

auto({ "VimEnter" }, {
	group = "tree",
	callback = funcs.open_tree_on_dir,
})

-- Windows --
-------------

-- Open all new windows as vertical splits. THIS IS A NEEDED FEATURE!
-- local excludes = { "NvimTree", "Trouble", "qf" }
-- auto({ "WinNew" }, {
-- 	group = "windows",
-- 	pattern = "*",
-- 	callback = function()
-- 		print(vim.bo.filetype)
-- 		local ftype = vim.bo.filetype
-- 		if not vim.tbl_contains(excludes, ftype) then
-- 			vim.cmd("wincmd L")
-- 		end
-- 	end,
-- })

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
			vim.opt.fo = "crqn1jp"
		end
	end,
})

-- All windows open vertically (see NewWin autocmd)
-- if the buffer is one of horizontal_ftypes, move to bottom
-- horizontal window.
local horizontal_ftypes = { "qf", "trouble" }
auto({ "BufEnter" }, {
	group = "windows",
	callback = function()
		local ftype = vim.bo.filetype
		if vim.tbl_contains(horizontal_ftypes, ftype) then
			vim.cmd("wincmd J")
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
