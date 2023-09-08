local ok, _ = pcall(require, "formatter")
if not ok then
	print "formatter conf has a problem"
	return
end

-- Utilities for creating configurations
-- local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
 require("formatter").setup {
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		-- formatters are executed in order within their own tables
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		bash = {
			require("formatter.filetypes.sh").shfmt,
		},

		-- for any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
}
