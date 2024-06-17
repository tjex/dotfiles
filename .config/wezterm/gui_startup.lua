local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

local function website(choice)
	if choice == "laptop" then
		local website_tab, website_pane, website_window = mux.spawn_window({
			workspace = "website",
			cwd = "/Users/tjex/dev/websites/tjex.net",
		})
		website_pane:send_text("yarn run start\n")
		website_tab:set_title("node")

		local scss_tab = website_window:spawn_tab({ cwd = "/Users/tjex/dev/websites/pico/scss/" })
		scss_tab:set_title("scss")

		local astro_tab = website_window:spawn_tab({ cwd = "/Users/tjex/dev/websites/tjex.net/" })
		astro_tab:set_title("tjex.net")
		return
	end
	local node_tab, node_pane, node_window = mux.spawn_window({
		workspace = "website",
		cwd = "/Users/tjex/dev/websites/tjex.net",
	})
	node_pane:send_text("yarn run start\n")
	node_tab:set_title("node")

	local tjex_tab = mux.spawn_window({
		workspace = "website",
		cwd = "/Users/tjex/dev/websites/tjex.net",
	})
	tjex_tab:set_title("tjex.net")

	local scss_tab = mux.spawn_window({
		workspace = "website",
		cwd = "/Users/tjex/dev/websites/pico/scss",
	})
	scss_tab:set_title("scss")
end

local function admin(choice)
	if choice == "laptop" then
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
		admin_tab:set_title("aerc")
		admin_pane:send_text("aerc\n")
		music_tab:set_title("atmos")

		rss_tab:set_title("rss")
		rss_pane:send_text("newsboat\n")

		matrix_tab:set_title("matrix")
		matrix_pane:send_text("iamb\n")
		return
	end
	local admin_tab, rss = mux.spawn_window({
		workspace = "admin",
		cwd = "/Users/tjex/docs/",
	})

	admin_tab:set_title("aerc")
	rss:send_text("newsboat\n")

	local aerc = rss:split({ direction = "Right", size = 0.666 })
	aerc:send_text("aerc\n")

	local lf = aerc:split({ direction = "Right", size = 0.5 })
	lf:send_text("lf\n")
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
		website(choice)
		admin(choice)
		sys()
		dev()
		writing()
	end)
end

return M
