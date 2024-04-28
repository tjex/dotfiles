local M = {}

function M.apply(config)
	config.launch_menu = {
		{
			label = "edit nvim conf",
			cwd = "/Users/tjex/.config/nvim",
			set_environment_variables = {
				PATH = "/bin:/usr/bin:/usr/local/bin:/opt/homebrew/bin",
			},
			args = { "zsh", "-c", "nvim $(fd -E 'bookmarks' | fzf)" },
		},
		{
			label = "edit shell scripts",
			cwd = "/Users/tjex/.scripts",
			set_environment_variables = {
				PATH = "/bin:/usr/bin:/usr/local/bin:/opt/homebrew/bin",
			},
			args = { "zsh", "-c", "nvim $(fd | fzf)" },
		},
		{
			label = "edit navi files",
			cwd = "/Usrs/tjex/.local/share/navi",
			set_environment_variables = {
				PATH = "/bin:/usr/bin:/usr/local/bin:/opt/homebrew/bin",
			},
			-- for some reason, this command needs to be explicityly cd'd into?
			args = { "zsh", "-c", "cd /Users/tjex/.local/share/navi && nvim $(fd | fzf)" },
		},
	}
end
return M
