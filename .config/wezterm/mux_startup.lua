local wezterm = require("wezterm")
local mux = wezterm.mux
local module = {}

function module.apply()
	wezterm.on("mux-startup", function()
		-- system
		local _, _, s1_window = mux.spawn_window({
			workspace = "system",
			cwd = "/Users/tjex/.config",
		})
		s1_window:spawn_tab({})

		-- admin
		local a1_tab, a1_pane, a1_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs",
		})
		a1_tab:set_title("neomutt")
		a1_pane:send_text("TERM=xterm-direct neomutt\n")
		a1_window:spawn_tab({})

		-- general
		local _, _, _ = mux.spawn_window({
			workspace = "general",
		})

		-- website
		local w1_tab, w1_pane, w1_window = mux.spawn_window({
			workspace = "website",
			cwd = "/Users/tjex/dev/websites/tjex.net",
		})
		w1_pane:send_text("yarn run start\n")
		w1_tab:set_title("node")

		local w2_tab = w1_window:spawn_tab({})
		w2_tab:set_title("tjex.net")

		-- thesis
		local _, _, _ = mux.spawn_window({
			workspace = "thesis",
		})

		mux.set_active_workspace("general")
	end)
end

return module
