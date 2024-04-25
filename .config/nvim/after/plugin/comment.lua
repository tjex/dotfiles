local ok, _ = pcall(require, "Comment")
if not ok then
    vim.cmd(':set cmdheight=0') -- makes messages persist
	print "comment not ok!"
    vim.cmd(':set cmdheight=1') -- set to default
	return
end
-- comment numToStr/Comment.nvim
require("Comment").setup()

local ft = require "Comment.ft"

ft.set("astro", "<!--%s-->")
