local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.wide_screen()
	wezterm.on("gui-startup", function()
		-- website
		local website_tab, website_pane, website_window = mux.spawn_window({
			workspace = "website",
			cwd = "/Users/tjex/dev/websites/tjex.net",
		})
		website_pane:send_text("yarn run start\n")
		website_tab:set_title("node")

		local astro_tab, astro_pane = website_window:spawn_tab({})
		astro_tab:set_title("tjex.net")
		astro_pane:split({ size = 0.3, direction = "Left", cwd = "/Users/tjex/dev/websites/pico/scss/" })

		-- admin
		local admin_tab, admin_pane, admin_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs/",
		})
		admin_tab:set_title("admin")

		local aerc = admin_pane:split({ direction = "Right" })
		aerc:send_text("aerc\n")

		local lf = admin_pane:split({ direction = "Top" })
		lf:send_text("lf\n")

		aerc:activate()

		local music_tab, _, _ = admin_window:spawn_tab({
			cwd = "/Users/tjex/music",
		})
		music_tab:set_title("music")

		local rss_tab, rss_pane = admin_window:spawn_tab({ args = { "newsboat" } })
		rss_tab:set_title("rss")
		rss_pane:split({ direction = "Left", cwd = "/Users/tjex/wikis/ps/" })

		-- system
		local sys_tab, _, _ = mux.spawn_window({
			workspace = "sys",
			cwd = "/Users/tjex/.config",
		})
		sys_tab:set_title("config")

		-- dev
		local dev_tab, _, dev_window = mux.spawn_window({
			workspace = "dev",
			cwd = "/Users/tjex/dev",
		})
		dev_tab:set_title("tjex/dev")

		local lsrc_tab, _, _ = dev_window:spawn_tab({
			cwd = "/Users/tjex/.local/src",
		})
		lsrc_tab:set_title(".local/src")

		local zkorg_tab, _, _ = dev_window:spawn_tab({
			cwd = "/Users/tjex/.local/src/zk-org/",
		})

		zkorg_tab:set_title("zk-org")

		-- writing
		local writing_tab, writing_pane, _ = mux.spawn_window({
			workspace = "writing",
			cwd = "/Users/tjex/wikis/ps",
		})
		writing_tab:set_title("zk - ps")
		writing_pane:send_text("zk s\n")
	end)
end

function M.laptop()
	wezterm.on("gui-startup", function()
		-- website
		local website_tab, website_pane, website_window = mux.spawn_window({
			workspace = "website",
			cwd = "/Users/tjex/dev/websites/tjex.net",
		})
		website_pane:send_text("yarn run start\n")
		website_tab:set_title("node")

		local astro_tab = website_window:spawn_tab({})
		astro_tab:set_title("tjex.net")

		local scss_tab = website_window:spawn_tab({ cwd = "/Users/tjex/dev/websites/pico/scss/" })
		scss_tab:set_title("scss")

		-- admin
		local admin_tab, admin_pane, admin_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs/",
		})
		admin_tab:set_title("aerc")
		admin_pane:send_text("aerc\n")

		local music_tab, _, _ = admin_window:spawn_tab({
			cwd = "/Users/tjex/audio/atmos",
		})
		music_tab:set_title("atmos")

		local rss_tab = admin_window:spawn_tab({ args = { "newsboat" } })
		rss_tab:set_title("rss")

		admin_tab:activate()

		-- system
		local sys_tab, sys_pane, sys_window = mux.spawn_window({
			workspace = "sys",
			cwd = "/Users/tjex/.config",
		})
		sys_tab:set_title("report")
		sys_pane:send_text("~/.local/scripts/sys-admin/goimapnotify-mailboxorg\n")
		sys_pane:split({ size = 0.5, direction = "Right" })

		local config_tab, _ = sys_window:spawn_tab({})
		config_tab:set_title("config")

		-- dev
		local dev_tab, _, dev_window = mux.spawn_window({
			workspace = "dev",
			cwd = "/Users/tjex/dev",
		})
		dev_tab:set_title("tjex/dev")

		local lsrc_tab, _, _ = dev_window:spawn_tab({
			cwd = "/Users/tjex/.local/src",
		})
		lsrc_tab:set_title(".local/src")

		local zkorg_tab, _, _ = dev_window:spawn_tab({
			cwd = "/Users/tjex/.local/src/zk-org/",
		})

		zkorg_tab:set_title("zk-org")

		-- writing
		local writing_tab, writing_pane, _ = mux.spawn_window({
			workspace = "writing",
			cwd = "/Users/tjex/wikis/ps",
		})
		writing_tab:set_title("zk - ps")
		writing_pane:send_text("zk s\n")
	end)
end

return M
