local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

local function website()
	local website_tab, website_pane, website_window = mux.spawn_window({
		workspace = "website",
		cwd = "/Users/tjex/dev/websites/tjex.net",
	})
	website_pane:send_text("yarn run start\n")
	website_tab:set_title("node")

	local scss_tab = website_window:spawn_tab({ cwd = "/Users/tjex/dev/websites/pico/scss/" })
	scss_tab:set_title("scss")

	local astro_tab = website_window:spawn_tab({})
	astro_tab:set_title("tjex.net")
end

local function admin(choice)
	if choice == "widescreen" then
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
			cwd = "/Users/tjex/audio/atmos",
		})
		music_tab:set_title("atmos")

		local rss_tab, rss_pane = admin_window:spawn_tab({ args = { "newsboat" } })
		rss_tab:set_title("rss")
		rss_pane:split({ direction = "Left", cwd = "/Users/tjex/wikis/ps/" })
	else
		-- small screen
		local admin_tab, admin_pane, admin_window = mux.spawn_window({
			workspace = "admin",
			cwd = "/Users/tjex/docs/",
		})
		admin_tab:set_title("aerc")
		admin_pane:send_text("aerc\n")

		local rss_tab = admin_window:spawn_tab({ args = { "newsboat" } })
		rss_tab:set_title("rss")

		admin_tab:activate()

		local music_tab, _, _ = admin_window:spawn_tab({
			cwd = "/Users/tjex/audio/atmos",
		})
		music_tab:set_title("atmos")
	end
end

local function sys()
	local sys_tab, sys_pane, sys_window = mux.spawn_window({
		workspace = "sys",
		cwd = "/Users/tjex/.config",
	})
	sys_tab:set_title("report")
	sys_pane:send_text("~/.scripts/sys-admin/goimapnotify-mailboxorg.sh\n")
	sys_pane:split({ size = 0.5, direction = "Right" })

	local config_tab, _ = sys_window:spawn_tab({})
	config_tab:set_title("config")
end

local function dev()
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
end

local function writing()
	local writing_tab, writing_pane, _ = mux.spawn_window({
		workspace = "writing",
		cwd = "/Users/tjex/wikis/ps",
	})
	writing_tab:set_title("zk - ps")
	writing_pane:send_text("zk start\n")
end

function M.start(choice)
	wezterm.on("gui-startup", function()
		website()
		admin(choice)
		sys()
		dev()
		writing()
	end)
end

return M
