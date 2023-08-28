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

require("dap-go").setup {
    -- :help dap-configuration
    dap_configurations = {
        {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
    -- delve configurations
    delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        build_flags = "",
    },
}
