local module = {}

function module.apply(config)
	config.launch_menu = {
		{
			label = "edit navi files",
			args = { "nvim", "." },
			cwd = "/Users/tjex/.local/share/navi",
		},
	}
end
return module
