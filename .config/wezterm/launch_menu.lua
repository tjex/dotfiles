local M = {}

function M.apply(config)
	config.launch_menu = {
		{
			label = "edit navi files",
			args = { "nvim", "." },
			cwd = "/Users/tjex/.local/share/navi",
		},
		{
			label = "edit shell scripts",
			cwd = "/Users/tjex/.local/scripts",
			args = { "zsh", "-c", "nvim $(fzf)" },
		},
		{
			label = "edit nvim conf",
			cwd = "/Users/tjex/.config/nvim",
			args = { "zsh", "-c", "nvim $(fzf)" },
		},
	}
end
return M
