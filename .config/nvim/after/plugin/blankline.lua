-- :h indent_blankline.txt

local ok, _ = pcall(require, "ibl")
if not ok then
    vim.cmd(':set cmdheight=0') -- makes messages persist
	print("blankline plug not ok!")
    vim.cmd(':set cmdheight=1') -- set to default
	return
end

require("ibl").setup({
	scope = { enabled = false, show_start = false, show_end = false },
})
