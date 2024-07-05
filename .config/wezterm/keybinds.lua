local balance = require("balance")
local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

-- custom events
require("events")

function M.apply(config)
	config.leader = { key = "o", mods = "ALT", timeout_milliseconds = 700 }

	-- LEADER KEYBINDS
	config.keys = {
		-- Send "CTRL-o" to the terminal when pressing <CTRL-o, CTRL-o>
		{
			key = "o",
			mods = "LEADER|CTRL",
			action = act.SendKey({ key = "o", mods = "CTRL" }),
		},
		{
			key = "b",
			mods = "LEADER",
			action = wezterm.action.Multiple({
				wezterm.action_callback(balance.balance_panes("x")),
				-- wezterm.action_callback(balance.balance_panes("y")),
			}),
		},
		{
			key = "y",
			mods = "LEADER",
			action = act.ActivateCopyMode,
		},
		{
			key = "s",
			mods = "LEADER",
			action = act.EmitEvent("trigger-nvim-with-scrollback"),
		},

		-- TABS
		{
			key = "t",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "tabs",
				one_shot = false,
			}),
		},
		{
			key = "l",
			mods = "LEADER",
			action = act.ActivateLastTab,
		},
		{
			key = "r",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		{ key = "1", mods = "SUPER", action = act.ActivateTab(0) },
		{ key = "2", mods = "SUPER", action = act.ActivateTab(1) },
		{ key = "3", mods = "SUPER", action = act.ActivateTab(2) },
		{ key = "4", mods = "SUPER", action = act.ActivateTab(3) },
		{ key = "5", mods = "SUPER", action = act.ActivateTab(4) },
		{ key = "6", mods = "SUPER", action = act.ActivateTab(5) },
		{ key = "7", mods = "SUPER", action = act.ActivateTab(6) },
		{ key = "8", mods = "SUPER", action = act.ActivateTab(7) },
		{ key = "9", mods = "SUPER", action = act.ActivateTab(8) },

		-- LAUNCHER / FILES / DIRECTORIES
		{
			key = "e",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
		{
			key = "k",
			mods = "CMD",
			action = act.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS" }),
		},
		-- WINDOWS / TABS
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},

		-- PANES
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "pane",
				one_shot = false,
			}),
		},
		{
			key = "x",
			mods = "LEADER",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "%",
			mods = "LEADER|SHIFT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "h",
			mods = "ALT",
			action = act.ActivatePaneDirection("Prev"),
		},
		{
			key = "l",
			mods = "ALT",
			action = act.ActivatePaneDirection("Next"),
		},

		-- WORKSPACES
		{
			key = "4",
			mods = "ALT",
			action = act.SwitchToWorkspace({
				name = "admin",
			}),
		},
		{
			key = "5",
			mods = "ALT",
			action = act.SwitchToWorkspace({
				name = "dev",
			}),
		},
		{
			key = "6",
			mods = "ALT",
			action = act.SwitchToWorkspace({
				name = "writing",
			}),
		},
	}

	-- KEYTABLES
	-- https://wezfurlong.org/wezterm/config/key-tables.html
	config.key_tables = {
		pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },
			{ key = "r", action = act.RotatePanes("Clockwise") },
			{
				key = "s",
				action = act.PaneSelect({ mode = "SwapWithActive", alphabet = "1234567890" }),
			},
			{ key = "t", action = act.PaneSelect({ mode = "MoveToNewTab" }) },

			-- exits the mode
			{ key = "Escape", action = "PopKeyTable" },
		},
		tabs = {
			{ key = "h", action = act.MoveTabRelative(-1) },
			{ key = "l", action = act.MoveTabRelative(1) },

			{ key = "Escape", action = "PopKeyTable" },
		},
	}
end

return M
