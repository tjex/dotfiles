local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.load()
	wezterm.on("mux-startup", function()
		-- dev
		local d1_tab, _, d1_window = mux.spawn_window({
			workspace = "dev",
			cwd = "/Users/tjex/.config",
		})
		d1_tab:set_title("config")

		d1_window:spawn_tab({
			cwd = "/Users/tjex/dev",
		})

		-- admin
		local a1_tab, a1_pane, a1_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs",
		})
		a1_tab:set_title("neomutt")
		a1_pane:send_text("TERM=xterm-direct neomutt\n")
		local a2_tab, _, _ = a1_window:spawn_tab({})
		a2_tab:set_title("docs")

		local a3_tab, _, _ = a1_window:spawn_tab({
			cwd = "/Users/tjex/music",
		})
		a3_tab:set_title("music")

		-- general
		local z1_tab, z1_pane, _ = mux.spawn_window({
			workspace = "zk",
			cwd = "/Users/tjex/wikis/ps",
		})
		z1_tab:set_title("zk - ps")
        z1_pane:send_text("zk open\n")


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
			cwd = "/Users/tjex/thesis",
		})
	end)
end

return M
