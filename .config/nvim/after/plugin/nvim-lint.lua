local ok, _ = pcall(require, "lint")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("nvim-lint conf has a problem")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
}
