local M = {}

local paths = {
	"/bin:",
	"/usr/bin:",
	"/usr/local/bin:",
	"/opt/homebrew/bin:",
	"/Users/tjex/.local/go/bin:",
	"/Users/tjex/.local/share/nvm/versions/node/v20.5.1/bin",
}

local paths_string = table.concat(paths)

function M.apply(config)
	config.launch_menu = {
		{
			label = "tech wiki",
			cwd = "/Users/tjex/wikis/tech/",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd -E .zk -t f | fzf)" },
		},
		{
			label = "edit nvim conf",
			cwd = "/Users/tjex/.config/nvim",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd -E 'bookmarks' | fzf)" },
		},
		{
			label = "edit shell scripts",
			cwd = "/Users/tjex/.scripts",
			set_environment_variables = {
				PATH = paths_string,
			},
			args = { "zsh", "-c", "nvim $(fd | fzf)" },
		},
		{
			label = "edit navi files",
			cwd = "/Usrs/tjex/.local/share/navi",
			set_environment_variables = {
				PATH = paths_string,
			},
			-- for some reason, this command needs to be explicityly cd'd into?
			args = { "zsh", "-c", "cd /Users/tjex/.local/share/navi && nvim $(fd | fzf)" },
		},
	}
end
return M
