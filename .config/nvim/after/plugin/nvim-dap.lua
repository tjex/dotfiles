-- nvim-dap
local ok, _ = pcall(require, "dap")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("nvim-dap not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

local dap = require("dap")
local key = require("tjex.keymap")

key.nmap({ "<F1>", ":lua require'dap'.continue()<CR>" })
key.nmap({ "<F4>", ":lua require'dap'.step_over()<CR>" })
key.nmap({ "<F3>", ":lua require'dap'.step_into()<CR>" })
key.nmap({ "<F2>", ":lua require'dap'.step_out()<CR>" })

-- nvim-dap-go plugin
require("dap-go").setup({
	-- :help dap-configuration
	dap_configurations = {
		{
			-- Must be "go" or it will be ignored by the plugin
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
			connect = {
				host = "127.0.0.1",
				port = "38697",
			},
		},
	},
	-- delve configurations
	delve = {
		-- the path to the executable dlv which will be used for debugging.
		-- by default, this is the "dlv" executable on your PATH.
		path = "dlv",
		-- time to wait for delve to initialize the debug session.
		-- default to 20 seconds
		-- initialize_timeout_sec = 20,
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
})

-- local lua debugger vscode
dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = {
		"/Users/tjex/.local/utils/local-lua-debugger-vscode/extensions/debugAdapter.js",
	},
	enrich_config = function(config, on_config)
		if not config["extensionPath"] then
			local c = vim.deepcopy(config)
			-- 💀 If this is missing or wrong you'll see
			-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
			c.extensionPath = "/Users/tjex/.local/utils/local-lua-debugger-vscode/"
			on_config(c)
		else
			on_config(config)
		end
	end,
}

-- dap-python, use venv/sys
require("dap-python").setup("~/.local/share/venv/sys/bin/python")
require("dap-python").resolve_python = function()
	return "/Users/tjex/.local/share/venv/sys/bin/python"
end
