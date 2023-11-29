-- Pull in the wezterm API
local wezterm = require("wezterm")

-- refactored configs
local design = require("design")
local keybinds = require("keybinds")
local mux_startup = require("mux_startup")
local launch_menu = require("launch_menu")

-- This table will hold the configuration.
local config = {}
config = wezterm.config_builder()

config.unix_domains = {
	{
		name = "unix",
	},
}
config.default_gui_startup_args = { "connect", "unix" }

-- disables mac unicode symbol input via ALT/META
-- config.send_composed_key_when_left_alt_is_pressed = true
-- config.send_composed_key_when_right_alt_is_pressed = true

config.audible_bell = "Disabled"
config.default_workspace = "general"

-- exit
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"tmux",
	"qalc",
	"lf",
	"gopass",
}

-- apply the conf files required above
mux_startup.apply()
design.apply(config)
keybinds.apply(config)
launch_menu.apply(config)

return config
