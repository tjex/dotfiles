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
	-- define tabs
	local admin_tab, admin_pane, admin_window = mux.spawn_window({
		workspace = "admin",
		cwd = "/Users/tjex/docs/",
	})

	local rss_tab, rss_pane = admin_window:spawn_tab({})

	local matrix_tab, matrix_pane = admin_window:spawn_tab({})

	local music_tab = admin_window:spawn_tab({
		cwd = "/Users/tjex/audio/atmos",
	})

	-- change layout depending on monitor choice
	if choice == "laptop" then
		admin_tab:set_title("aerc")
		admin_pane:send_text("aerc\n")
	else
		admin_tab:set_title("admin")

		local aerc = admin_pane:split({ direction = "Right" })
		aerc:send_text("aerc\n")

		local lf = admin_pane:split({ direction = "Top" })
		lf:send_text("lf\n")
	end
	music_tab:set_title("atmos")

	rss_tab:set_title("rss")
	rss_pane:send_text("newsboat\n")

	matrix_tab:set_title("matrix")
	matrix_pane:send_text("iamb\n")
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
