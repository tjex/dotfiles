local ok, _ = pcall(require, "trouble")
if not ok then
    print("plugin 'trouble' has a problem")
    return
end

local key = vim.keymap.set

key("n", "<leader>iq", function() require("trouble").open("quickfix") end)
key("n", "<leader>id", function() require("trouble").open("document_diagnostics") end)
key("n", "<leader>iw", function() require("trouble").open("workspace_diagnostics") end)
key("n", "<leader>il", function() require("trouble").open("loclist") end)
key("n", "<leader>io", function() require("trouble").open() end)
