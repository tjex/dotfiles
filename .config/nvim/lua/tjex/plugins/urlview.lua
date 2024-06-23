return {

	"axieax/urlview.nvim",
	cmd = "UrlView",
	config = function()
		require("urlview").setup({
			default_title = "URLs:",
			default_picker = "telescope",
			default_prefix = "https://",
			default_action = "system", -- or 'clipboard', 'opera', 'firefox', etc
			default_register = "+", -- yank register
			default_include_branch = false, -- Whether plugin URLs should link to the branch used by your package manager
			unique = true, -- ensure unique links
			sorted = true, -- alphabetically
			log_level_min = vim.log.levels.INFO,
			jump = {
				prev = "[u",
				next = "]u",
			},
		})
	end,
}
