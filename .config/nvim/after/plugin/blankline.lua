-- :h indent_blankline.txt

local ok, _ = pcall(require, "indent_blankline")
if not ok then
    print('blankline plug not ok!')
    return
end

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = false,
    char = '·',
    context_char = '·',
    show_trailing_blankline_indent = false,
}
