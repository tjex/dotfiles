local key = vim.keymap.set
local opts = { noremap = true, silent = true }


key("n", "fp", "mzvapgq`z", opts) -- format paragraph and leave cursor where it was
key("n", "fl", "mzgqq`z", opts) -- format line and leave cursor where it was

-- markdown style for Zk ref note taking... this is for sure the hack way...
key("i", "<c-c>", function()
	local loc = vim.fn.input("loc: ")
    local stamp = "~ " .. loc
    vim.api.nvim_put({stamp}, "c", true, true)
    vim.fn.feedkeys("\n\n", "n")
    vim.fn.feedkeys("...", "n")
    vim.fn.feedkeys("\n\n", "n")
end)


