local ok, _ = pcall(require, "oil")
if not ok then
	vim.cmd(":set cmdheight=0") -- hack to persist the below message
	print("oil conf has a problem")
	vim.cmd(":set cmdheight=1") -- set back to default
	return
end

local keymap = require("tjex.keymap")

keymap.nmap({ "<leader>l", "<CMD>Oil --float<CR>" })

require("oil").setup({
	-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
	-- Set to false if you still want to use netrw.
	default_file_explorer = true,
	-- Id is automatically added at the beginning, and name at the end
	-- See :help oil-columns
	columns = {
		-- "icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},
	-- Buffer-local options to use for oil buffers
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
	delete_to_trash = false,
	-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
	skip_confirm_for_simple_edits = false,
	-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
	-- (:help prompt_save_on_select_new_entry)
	prompt_save_on_select_new_entry = true,
	-- Oil will automatically delete hidden buffers after this delay
	-- You can set the delay to false to disable cleanup entirely
	-- Note that the cleanup process only starts when none of the oil buffers are currently displayed
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		-- Time to wait for LSP file operations to complete before skipping
		timeout_ms = 1000,
		-- Set to true to autosave buffers that are updated with LSP willRenameFiles
		-- Set to "unmodified" to only save unmodified buffers
		autosave_changes = false,
	},
	-- Constrain the cursor to the editable parts of the oil buffer
	-- Set to `false` to disable, or "name" to keep it on the file names
	constrain_cursor = "editable",
	-- Set to true to watch the filesystem for changes and reload oil
	experimental_watch_for_changes = false,
	-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
	-- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
	-- Additionally, if it is a string that matches "actions.<name>",
	-- it will use the mapping at require("oil.actions").<name>
	-- Set to `false` to remove a keymap
	-- See :help oil-actions for a list of all available actions
	keymaps = {
		["g?"] = "actions.show_help",
		["i"] = "actions.select",
		["<C-s>"] = "actions.select_vsplit",
		["<C-h>"] = "actions.select_split",
		["<C-t>"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["u"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
	-- Configuration for the floating window in oil.open_float
	float = {
		-- Padding around the floating window
		padding = 2,
		max_width = 60,
		max_height = 90,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		-- This is the config that will be passed to nvim_open_win.
		-- Change values here to customize the layout
		override = function(conf)
			return conf
		end,
	},
})
