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
		local o1_tab, _, _ = mux.spawn_window({
			workspace = "obsidian",
			cwd = "/Users/tjex/obsidian",
		})
		o1_tab:set_title("obsidian")

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
		local _, _, t1_window = mux.spawn_window({
			workspace = "thesis",
			cwd = "/Users/tjex/thesis",
		})
		local t1_tab2, t1_pane2, _ = t1_window:spawn_tab({
			cwd = "/Users/tjex/obsidian/paradigm-shifted/masters/thesis",
		})
		t1_tab2:set_title("obsidian")
		t1_pane2:send_text("nvim running-notes.md\n")
	end)
end

return M
