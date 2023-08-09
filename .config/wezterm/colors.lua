local wezterm = require 'wezterm'
local module = {}

wezterm.color.get_default_colors()

-- neovim colors
local black = '#000000'
local yellow = '#a6864d'
local burnt_yellow = '#a6794d'
local soft_red = '#936666'
local purple = '#c3a0ba'
local bg_lighter = '#202436'
local bg_light = '#1d2030'
local bg_text = '#525d8a'
local background = '#171A27'
local foreground = '#949494'

function module.apply(config)
    config.colors = {
        background = background,
        foreground = foreground,
        cursor_bg = yellow,
        selection_bg = soft_red,
        selection_fg = black,
    }
end

return module
