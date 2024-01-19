local key = vim.keymap.set
local opts = { noremap = true, silent = true }


-- markdown style for Zk ref note taking... this is for sure the hack way...
key("i", "<c-c>", function()
	local loc = vim.fn.input("loc: ")
    local stamp = "~ " .. loc
    vim.api.nvim_put({stamp}, "c", true, true)
    vim.fn.feedkeys("\n\n", "n")
    vim.fn.feedkeys("...", "n")
    vim.fn.feedkeys("\n\n", "n")
end)


