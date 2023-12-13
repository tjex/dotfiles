local usr_cmd = vim.api.nvim_create_user_command
local auto = vim.api.nvim_create_autocmd
local funcs = require("tjex.funcs")
local augroup = vim.api.nvim_create_augroup

--
-- auto commands
--

auto({ "VimEnter" }, {
	group = augroup("tree", { clear = false }),
	callback = funcs.open_tree_on_dir,
})

auto({ "BufWritePost" }, {
	group = augroup("lint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})

-- TODO: run :bufdo e on telescope git_branch and git_commit load
-- auto(
-- 	{ "User TelescopeResumePost" },
-- 	{ group = augroup("telescope_git", { clear = true }), command = vim.cmd("bufdo e") }
-- )

--
-- user commands
--

-- run a file on write and print its output to designated buf
usr_cmd("AutoRun", function()
	print("AutoRun starts now...")
	-- local bufnr = vim.cmd(":echo nvim_get_current_buf()")
	local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	funcs.attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

usr_cmd("Date", "norm! i" .. vim.fn.strftime("%Y-%m-%d"), {})
usr_cmd("PubDate", "norm! i" .. vim.fn.strftime("%Y-%m-%dT%XZ"), {})
usr_cmd("Date", "norm! i" .. vim.fn.strftime("%Y-%m-%d"), {})
usr_cmd("Dapui", ":lua require('dapui').toggle()<CR>", {})
usr_cmd("Cs", ":lua require('telescope.builtin').find_files({cwd='~/.local/share/tref'})<CR>", {})
usr_cmd(
	"Conf",
	":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/', previewer=false})<CR>",
	{}
)
usr_cmd("EditSnippets", ":lua require('luasnip.loaders').edit_snippet_files()<CR>", {})
usr_cmd("Chmod", ":!chmod +x %", {})
usr_cmd("NeomuttDelQuoted", funcs.neomutt_del_quoted, {})
