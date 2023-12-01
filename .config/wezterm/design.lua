local wezterm = require("wezterm")
local M = {}

wezterm.color.get_default_colors()

local black = "#000000"
local white = "#d8d8d8"
local yellow = "#d8a274"
local soft_red = "#bf7a7a"
local purple = "#ba859e"
local blue_1 = "#6492a1"
local blue_2 = "#6d86a6"
local background = "#1a1c23"
local foreground = "#b1b1b1"

local function tab_title(tab_info)
	local usr_title = tab_info.tab_title
    local index = tab_info.tab_index + 1 .. " : "

	if usr_title and #usr_title > 0 then
		return index .. usr_title
	end
	return tab_info.tab_index + 1
end

wezterm.on("format-tab-title", function(tab)
	local title = tab_title(tab)
    foreground = "#737373" -- foreground (above)
    background = background

	if tab.is_active then
        foreground = yellow
	end
	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
	}
end)



function M.apply(config)
	-- WINDOWS
	config.window_decorations = "RESIZE" -- hide the title bar
	config.window_padding = {
		left = 10,
		right = 10,
		top = 15,
		bottom = 10,
	}
	config.window_frame = {
		active_titlebar_bg = background,
	}

	-- CURSOR
	config.cursor_blink_rate = 0
	config.cursor_thickness = 2

	-- FONTS
	config.font = wezterm.font("Fira Code")
	config.font_size = 15
	-- for now, setting variations of 'i' is buggy with cv06 etc
	-- https://github.com/tonsky/FiraCode/issues/1497
	config.harfbuzz_features =
		{ "ss01", "ss02", "ss03", "ss04", "ss05", "ss07", "cv02", "cv14", "cv27", "cv29", "cv30" }

	-- COLORS
	config.bold_brightens_ansi_colors = false
	config.colors = {
		background = background,
		foreground = foreground,
		cursor_bg = foreground,
		selection_bg = soft_red,
		selection_fg = black,
		ansi = {
			black, -- term: black
			soft_red, -- term: red
			foreground, -- term: green (i don't want any green in my term! yuck)
			yellow, -- term: yellow
			blue_1, -- term: blue
			purple, -- term: magenta
			blue_2, -- term: cyan
			white, -- term: white
		},
	}
end

return M
