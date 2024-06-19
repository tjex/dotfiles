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
	local website_tab, website_pane, website_window = mux.spawn_window({
		workspace = "website",
		cwd = "/Users/tjex/dev/websites/tjex.net",
	})
	website_pane:send_text("yarn run start\n")
	website_tab:set_title("website")

	local tjexnet =
		website_pane:split({ direction = "Right", size = 0.666, cwd = "/Users/tjex/dev/websites/tjex.net/" })
	tjexnet:send_text("nvim .\n")
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
	local admin_tab, term, admin_window = mux.spawn_window({
		workspace = "admin",
		cwd = "/Users/tjex/docs/",
	})

	admin_tab:set_title("aerc")

	local aerc = term:split({ direction = "Right", size = 0.666 })
	aerc:send_text("aerc\n")

	local lf = aerc:split({ direction = "Right", size = 0.5 })
	lf:send_text("lf\n")

	local go_imap_tab, go_imap_pane = admin_window:spawn_tab({})
	go_imap_tab:set_title("go imap")
	go_imap_pane:send_text("~/.scripts/sys-admin/goimapnotify-mailboxorg.sh\n")

	aerc:activate()
end

local function sys(choice)
	local sys_tab, sys_pane = mux.spawn_window({
		workspace = "sys",
		cwd = "/Users/tjex/.scripts",
	})
	sys_tab:set_title("scripts")

	if choice == "laptop" then
		local config = sys_pane:spawn_tab({ cwd = "/Users/tjex/.config" })
		config:set_title("config")
		return
	end

	local config = sys_pane:split({ direction = "Right", size = 0.666, cwd = "/Users/tjex/.config" })
	config:send_text("nvim .\n")
end

local function dev(choice)
	local dev_tab, dev_pane, dev_window = mux.spawn_window({
		workspace = "dev",
		cwd = "/Users/tjex/dev",
	})
	dev_tab:set_title("tjex/dev")

	local lsrc_tab, lsrc_pane, _ = dev_window:spawn_tab({
		cwd = "/Users/tjex/.local/src",
	})
	lsrc_tab:set_title(".local/src")

	local zkorg_tab, zkorg_pane, _ = dev_window:spawn_tab({
		cwd = "/Users/tjex/.local/src/zk-org/",
	})
	zkorg_tab:set_title("zk-org")

	if choice ~= "laptop" then
		dev_pane:send_text("nvim .\n")
		lsrc_pane:send_text("nvim .\n")
		zkorg_pane:send_text("nvim .\n")
	end
end

local function writing()
	local writing_tab, writing_pane, _ = mux.spawn_window({
		workspace = "writing",
		cwd = "/Users/tjex/wikis/ps",
	})
	writing_tab:set_title("ps")
	writing_pane:send_text("zk start\n")
end

function M.start(choice)
	wezterm.on("gui-startup", function()
		website(choice)
		admin(choice)
		sys(choice)
		dev(choice)
		writing()
	end)
end

return M
