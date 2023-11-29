local wezterm = require("wezterm")
local module = {}

function module.apply(config)
	config.leader = { key = "o", mods = "CTRL", timeout_milliseconds = 500 }

	-- LEADER KEYBINDS
	config.keys = {
		-- Send "CTRL-o" to the terminal when pressing <CTRL-o, CTRL-o>
		{
			key = "o",
			mods = "LEADER|CTRL",
			action = wezterm.action.SendKey({ key = "o", mods = "CTRL" }),
		},
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "x",
			mods = "LEADER",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},

		-- MUX / DOMAINS / WORKSPACES
		{
			key = "e",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
		},
	}
end

return module
