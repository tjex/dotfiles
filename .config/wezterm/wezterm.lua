-- Pull in the wezterm API
local wezterm = require("wezterm")

-- refactored configs
local design = require("design")
local mux_startup = require("mux_startup")
local keybinds = require("keybinds")

-- This table will hold the configuration.
local config = {}
config = wezterm.config_builder()


config.unix_domains = {
	{
		name = "unix",
	},
}
config.default_gui_startup_args = { "connect", "unix" }
config.switch_to_last_active_tab_when_closing_tab = true

-- disables mac unicode symbol input via ALT/META
-- config.send_composed_key_when_left_alt_is_pressed = true
-- config.send_composed_key_when_right_alt_is_pressed = true

config.audible_bell = "Disabled"

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

-- apply modules required above to config table
design.apply(config)
keybinds.apply(config)
mux_startup.apply()

return config
