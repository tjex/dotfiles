-- required by ./plugins/statusline.lua

local generator = function(win_id)
	local segments = {}
	local builtin = require("el.builtin")
	local extensions = require("el.extensions")
	local sections = require("el.sections")
	local subscribe = require("el.subscribe")

	table.insert(segments, " ")
	-- needs subscribe instead of extension.git_branch, otherwise it breaks if no branch is
	-- found.
	table.insert(
		segments,
		subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
			local branch = extensions.git_branch(win, buf)
			if branch then
				return branch
			end
		end)
	)
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
