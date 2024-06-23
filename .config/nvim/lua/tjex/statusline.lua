-- required by ./plugins/statusline.lua

local generator = function(win_id)
	local segments = {}
	local builtin = require("el.builtin")
	local extensions = require("el.extensions")
	local sections = require("el.sections")

	table.insert(segments, " ")
	table.insert(segments, extensions.git_branch)
	table.insert(segments, sections.split)
	table.insert(segments, " ")
	table.insert(segments, builtin.file_relative)
	table.insert(segments, " • ")
	table.insert(segments, builtin.bufnr)
	table.insert(segments, " • ")
	table.insert(segments, "%4((%l/%L%))")
	table.insert(segments, sections.split)

	return segments
end

require("el").setup({ generator = generator })
