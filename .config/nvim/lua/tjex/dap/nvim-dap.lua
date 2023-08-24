-- nvim-dap
local ok, _ = pcall(require, "dap")
if not ok then
    print('nvim-dap not ok!')
    return
end

local dap = require('dap')
local key = vim.keymap.set
local opts = { noremap = true, silent = true }

key("n", "<leader>b", ":DapToggleBreakpoint<CR>", opts)
key("n", "%", ":DapStepOver<CR>", opts)
key("n", "$", ":DapStepInto<CR>", opts)
key("n", "#", ":DapStepOut<CR>", opts)
key("n", "<leader>d", function() require 'telescope'.extensions.dap.commands {} end, opts)

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = { os.getenv('HOME') .. "/.config/nvim/debuggers/vscode-js-debug/out/src/vsDebugServer.js", "${port}" },
    }
}

dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file-vs-js",
        program = "${file}",
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach-vs-js",
        processId = require 'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
    },
}
