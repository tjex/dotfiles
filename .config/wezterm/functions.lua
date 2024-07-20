local b = require("balance")
local util = require("util")
local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

M.balance = b.balance_panes("x")

M.kill_workspace = function(workspace)
	local success, stdout =
		wezterm.run_child_process({ "/opt/homebrew/bin/wezterm", "cli", "list", "--format=json" })

	if success then
		local json = wezterm.json_parse(stdout)
		if not json then
			return
		end

		local workspace_panes = util.filter(json, function(p)
			return p.workspace == workspace
		end)

		for _, p in ipairs(workspace_panes) do
			wezterm.run_child_process({
				"/opt/homebrew/bin/wezterm",
				"cli",
				"kill-pane",
				"--pane-id=" .. p.pane_id,
			})
		end
	end
end

M.launch_website = function()
	local dev_tab, dev_pane, dev_window = mux.spawn_window({
		workspace = "dev",
		cwd = "/Users/tjex/dev/websites/tjex.net/",
	})
	dev_pane:send_text("yarn run start\n")
	dev_tab:set_title("website")
end
return M
