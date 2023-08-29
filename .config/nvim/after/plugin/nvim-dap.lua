-- nvim-dap
local ok, _ = pcall(require, "dap")
if not ok then
    print('nvim-dap not ok!')
    return
end

-- local dap = require('dap')
local key = vim.keymap.set
local opts = { noremap = true, silent = true }

key("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
key("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
key("n", "<F1>", ":lua require'dap'.continue()<CR>", opts)
key("n", "<F4>", ":lua require'dap'.step_over()<CR>", opts)
key("n", "<F3>", ":lua require'dap'.step_into()<CR>", opts)
key("n", "<F2>", ":lua require'dap'.step_out()<CR>", opts)
key("n", "<leader>d", function() require 'telescope'.extensions.dap.commands {} end, opts)


-- nvim-dap-go plugin
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
