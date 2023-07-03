-- nvim-dap
local ok, _ = pcall(require, "dap")
if not ok then
    print('nvim-dap not ok!')
    return
end

local dap = require('dap')

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
