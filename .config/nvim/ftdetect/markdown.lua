-- specific configs for when in Markdown files
local key = vim.keymap.set
local opts = { noremap = true, silent = true }

key("n", "fp", "mzvapgq`z", opts) -- format paragraph and leave cursor where it was
key("n", "fl", "mzgqq`z", opts) -- format line and leave cursor where it was
