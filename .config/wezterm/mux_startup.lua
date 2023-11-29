local wezterm = require("wezterm")
local mux = wezterm.mux
local module = {}

function module.apply()
	-- default startup behaviour
	wezterm.on("mux-startup", function()
		local sys_tab, sys_pane, sys_window = mux.spawn_window({
			workspace = "system",
			cwd = "/Users/tjex/.config",
		})
		sys_window:spawn_tab({})

		local admin_tab, admin_pane, admin_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs",
			args = { "TERM=xterm-direct neomutt" },
		})
		admin_window:spawn_tab({})

		local general_tab, general_pane, gen_window = mux.spawn_window({
			workspace = "general",
		})
		local web_tab, web_pane, web_window = mux.spawn_window({
			workspace = "website",
		})
		local thesis_tab, thesis_pane, thesis_window = mux.spawn_window({
			workspace = "thesis",
		})

		mux.set_active_workspace("general")
	end)
end

return module
