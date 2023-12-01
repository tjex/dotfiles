-- for window / UI status output

local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.load()
    -- doc: https://wezfurlong.org/wezterm/config/lua/window/set_right_status.html
	wezterm.on("update-right-status", function(window, pane)
		local cells = {}
		local bg = "#1a1c23"
		local text_fg = "#c0c0c0"
		local workspace = mux.get_active_workspace()

		if workspace then
			table.insert(cells, workspace)
			-- window:set_right_status(wezterm.format({
			-- 	{ Background = { Color = background } },
			-- 	{ Text = workspace },
			-- }))
		end
		local elements = {}
		local num_cells = 0

		function push(text, is_last)
			local cell_no = num_cells + 1
			table.insert(elements, { Foreground = { Color = text_fg } })
			table.insert(elements, { Background = { Color = bg } })
			table.insert(elements, { Text = "  " .. text .. "  " })
			num_cells = num_cells + 1
		end
		while #cells > 0 do
			local cell = table.remove(cells, 1)
			push(cell, #cells == 0)
		end
		window:set_right_status(wezterm.format(elements))
	end)
end

return M
