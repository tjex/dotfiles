local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("tjex.funcs")
require("tjex.commands")
require("tjex.auto")
require("tjex.globals")
require("tjex.vim-opt")
require("tjex.keybinds")
require("tjex.pckr")
