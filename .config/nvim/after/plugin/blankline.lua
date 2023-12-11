-- :h indent_blankline.txt

local ok, _ = pcall(require, "ibl")
if not ok then
	print("blankline plug not ok!")
	return
end

require("ibl").setup({
	scope = { enabled = false, show_start = false, show_end = false },
})
