local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.wide_screen()
	wezterm.on("mux-startup", function()
		-- dev
		local a1_tab, _, a1_window = mux.spawn_window({
			workspace = "dev",
			cwd = "/Users/tjex/.config",
		})
		a1_tab:set_title("config")

		local a2_tab, _, _ = a1_window:spawn_tab({
			cwd = "/Users/tjex/.local/src/zk-org/",
		})

		a2_tab:set_title("zk-org")

		-- admin
		local b1_tab, b1_pane, b1_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs/logs",
		})
		b1_tab:set_title("admin")
        b1_pane:send_text("nvim .\n")

		local neomutt = b1_pane:split({direction = "Right"})
        neomutt:send_text("TERM=xterm-direct neomutt\n")

        local lf = b1_pane:split({direction = "Top", cwd = "/Users/tjex/docs/"})
        lf:send_text("lf\n")

        neomutt:activate()

		local b3_tab, _, _ = b1_window:spawn_tab({
			cwd = "/Users/tjex/music",
		})
		b3_tab:set_title("music")

		-- writing
		local c1_tab, c1_pane, _ = mux.spawn_window({
			workspace = "writing",
			cwd = "/Users/tjex/wikis/ps",
		})
		c1_tab:set_title("zk - ps")
		c1_pane:send_text("zk open\n")

		-- website
		local d1_tab, d1_pane, d1_window = mux.spawn_window({
			workspace = "website",
			cwd = "/Users/tjex/dev/websites/tjex.net",
		})
		d1_pane:send_text("yarn run start\n")
		d1_tab:set_title("node")

		local d2_tab, d2_pane = d1_window:spawn_tab({})
		d2_tab:set_title("tjex.net")
		d2_pane:split({ size = 0.3, direction = "Left", cwd = "/Users/tjex/dev/websites/pico/scss/" })
	end)
end

return M
