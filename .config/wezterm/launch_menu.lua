local vars = require("variables")
local M = {}

local paths_string = vars.env_paths()

function M.apply(config)
	config.launch_menu = {
		{
			label = "tech wiki",
			cwd = "/Users/tjex/wikis/tech/",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd -t f | fzf)" },
		},
		{
			label = "edit .config",
			cwd = "/Users/tjex/.config",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd -t f | fzf)" },
		},
		{
			label = "edit nvim conf",
			cwd = "/Users/tjex/.config/nvim",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd -t f | fzf)" },
		},
		{
			label = "edit shell scripts",
			cwd = "/Users/tjex/.scripts",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd -t f | fzf)" },
		},
		{
			label = "edit navi files",
			cwd = "/Usrs/tjex/.local/share/navi",
			set_environment_variables = {
				PATH = paths_string,
			},
			-- for some reason, this command needs to be explicityly cd'd into?
			args = { "zsh", "-c", "cd /Users/tjex/.local/share/navi && nvim $(fd -t f | fzf)" },
		},
	}
end
return M
