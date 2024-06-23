local function status_line()
	local center = "%=%="
	local file_type = "%y"
	local file_name = "%-.45f "

	local buf_nr = "• %n • "
	local modified = "%-m "
	local line_no = "%4((%l/%L%)) "
	local pct_thru_file = "%4p%% "
	local fugitive = "%{FugitiveStatusline()} "

	return string.format("%s%s%s%s%s%s%s", center, modified, file_name, buf_nr, line_no, fugitive, center)
end

vim.opt.statusline = status_line()
