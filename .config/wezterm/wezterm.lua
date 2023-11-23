-- Pull in the wezterm API
local wezterm = require 'wezterm'
local font = require 'font'
local colors = require 'colors'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- window
-- config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE" -- hide the title bar
config.window_padding = {
    left = 10,
    right = 10,
    top = 15,
    bottom = 10,
}

-- cursor
config.cursor_blink_rate = 0
config.cursor_thickness = 2

-- disables mac unicode symbol input via ALT/META
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.audible_bell = "Disabled"

-- exit
config.skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    'zsh',
    'tmux',
    'qalc',
    'lf',
}


wezterm.on("format-window-title", function(tab, tabs, panes, config, hover, max_width)
  local pane_title = tab.active_pane.title
  local user_title = tab.active_pane.user_vars.window_title

  if user_title ~= nil and #user_title > 0 then
    pane_title = user_title
  end

    return pane_title
end)

-- apply modules required above to config table
font.apply(config)
colors.apply(config)

return config
