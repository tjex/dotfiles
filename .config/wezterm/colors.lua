local wezterm = require 'wezterm'
local module = {}

wezterm.color.get_default_colors()

-- neovim colors
local black = '#000000'
local yellow = '#a6864d'
local burnt_yellow = '#a6794d'
local soft_red = '#936666'
local purple = '#c3a0ba'
local blue_1 = "#496c7a"
local blue_2 = "#566981"
local bg_lighter = '#202436'
local bg_light = '#1d2030'
local bg_text = '#525d8a'
local background = '#171A27'
local foreground = '#949494'

function module.apply(config)
    config.bold_brightens_ansi_colors = false
    config.colors = {
        background = background,
        foreground = foreground,
        cursor_bg = yellow,
        selection_bg = soft_red,
        selection_fg = black,
        ansi = {
            "#1b1d1e",    -- Dark Gray
            yellow,       -- Lemon Yellow
            burnt_yellow, -- Olive Green
            "#f4fd22",    -- Electric Lime
            blue_1,       -- Slate Gray
            "#747271",    -- Storm Gray
            "#62605f",    -- Iron Gray
            "#c6c5bf"     -- Silver
        },
    }
end

return module
