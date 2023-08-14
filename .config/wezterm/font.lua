local wezterm = require 'wezterm'
local module = {}

function module.apply(config)
    config.font = wezterm.font 'Hack Nerd Font Mono'
    config.font_size = 14
    config.line_height = 1
end

return module
