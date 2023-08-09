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

-- apply configs
-- config.color_scheme = 'Batman'
hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95

-- apply modules required above to config table
font.apply(config)
colors.apply(config)

-- and finally, return the configuration to wezterm
return config
