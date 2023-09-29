-- :h indent_blankline.txt

local ok, _ = pcall(require, "ibl")
if not ok then
	print("blankline plug not ok!")
	return
end

require("ibl").setup({
	scope = { enabled = false },
	indent = {
		show_current_context = true,
		show_current_context_start = false,
		show_trailing_blankline_indent = false,
	},
})
