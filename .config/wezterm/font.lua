local wezterm = require("wezterm")
local module = {}

function module.apply(config)
	-- config.font = wezterm.font 'Hack Nerd Font Mono'
	-- config.font_size = 15
	config.font = wezterm.font("Fira Code")
	config.font_size = 15
	-- for now, setting variations of 'i' is buggy with cv06 etc
	-- https://github.com/tonsky/FiraCode/issues/1497
	config.harfbuzz_features =
		{ "ss01", "ss02", "ss03", "ss04", "ss05", "ss07", "cv27", "cv29", "cv30" }
end

return module
