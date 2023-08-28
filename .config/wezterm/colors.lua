local wezterm = require 'wezterm'
local module = {}

wezterm.color.get_default_colors()

-- neovim colors
local black = '#000000'
local white = 'FFFFFF'
local yellow = '#a6864d'
local soft_red = '#936666'
local purple = '#c3a0ba'
local blue_1 = "#496c7a"
local blue_2 = "#566981"
local background = "#161923"
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
            black,      -- term: black
            soft_red,   -- term: red
            foreground, -- term: green (i don't want any green in my term! yuck)
            yellow,     -- term: yellow
            blue_1,     -- term: blue
            purple,     -- term: magenta
            blue_2,     -- term: cyan
            white       -- term: white
        },
    }
end

return module
