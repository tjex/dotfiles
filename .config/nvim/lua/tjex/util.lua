-- utilities for nvim config

local M = {}

M.file_exists = function(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

M.build_md_link = function(link, title)
	if title == "" or title == nil then
		title = "ref"
	end
	local result = "([" .. title .. "](" .. link .. "))"
	return result
end

M.strip_home_from_filepath = function(filepath)
	filepath = filepath:gsub("/Users/tjex/", "")
	filepath = filepath:gsub("~/", "")
	return filepath
end

return M
