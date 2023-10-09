local wezterm = require 'wezterm'
local module = {}

wezterm.color.get_default_colors()

-- neovim colors
-- 30% duller
-- local black = '#000000'
-- local white = '#adadad'
-- local yellow = '#a6864d'
-- local soft_red = '#936666'
-- local purple = '#c3a0ba'
-- local blue_1 = "#496c7a"
-- local blue_2 = "#566981"
-- local background = "#1a1c23"
-- local foreground = '#949494'

local black = '#000000'
local white = '#d8d8d8'
local yellow = '#d8a274'
local soft_red = '#bf7a7a'
local purple = '#ba859e'
local blue_1 = "#6492a1"
local blue_2 = "#6d86a6"
local background = "#1a1c23"
local foreground = '#b1b1b1'


function module.apply(config)
    config.bold_brightens_ansi_colors = false
    -- config.window_background_opacity = 0.6
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
            white,      -- term: white
        },
    }
end

return module
