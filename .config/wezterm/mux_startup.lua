local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.load()
	wezterm.on("mux-startup", function()
		-- system
		local s1_tab, _, s1_window = mux.spawn_window({
			workspace = "system",
			cwd = "/Users/tjex/.config",
		})
        s1_tab:set_title("system")
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
		local g1_tab, _, _ = mux.spawn_window({
			workspace = "general",
		})
        g1_tab:set_title("general")

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
		local t1_tab, _, t1_window = mux.spawn_window({
			workspace = "thesis",
            cwd = "/Users/tjex/thesis"
		})
        t1_tab:set_title("thesis")
        local t1_tab2, t1_pane2 = t1_window:spawn_tab({
            cwd = "/Users/tjex/obsidian/paradigm-shifted/masters/thesis"
        })
        t1_tab2:set_title("obsidian")
        t1_pane2:send_text("nvim running-notes.md\n")


		mux.set_active_workspace("general")
	end)
end

return M
