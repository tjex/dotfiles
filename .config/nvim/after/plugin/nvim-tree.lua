-- nvim-tree nvim-tree/nvim-tree.lua
local ok, _ = pcall(require, "nvim-tree")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("nvim-tree not ok!")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

local key = require("tjex.keymap")

-- key.nmap({ "<ESC>", ":NvimTreeClose<CR>" })
-- key.nmap({ "<leader>e", ":NvimTreeToggle<CR>" })
-- key.nmap({ "<leader>l", ":NvimTreeFindFile!<CR>" })

-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local event = api.events.Event

	-- enter file on creation
	api.events.subscribe(event.FileCreated, function(file)
		vim.cmd("edit " .. file.fname)
	end)

	-- refresh tree on delete
	api.events.subscribe(event.FileRemoved, function()
		api.tree.reload()
	end)

	local function tree_opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	local function up_and_collapse()
		api.tree.change_root_to_parent()
		api.tree.collapse_all({ false })
	end

	-- loads the default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	key.nmap({ "h", up_and_collapse, tree_opts("up and collapse") })
	key.nmap({ "l", api.tree.change_root_to_node, tree_opts("cd") })
	key.nmap({ "e", api.node.open.no_window_picker, tree_opts("open") })
	key.nmap({ "r", api.fs.rename_basename, tree_opts("rename basename") })
	key.nmap({ "R", api.fs.rename, tree_opts("rename") })
	key.nmap({ "H", api.node.navigate.parent_close, tree_opts("close directory") })
	key.nmap({ "<leader>m", api.marks.bulk.move, tree_opts("Move Bookmarked") })
	key.nmap({ "<leader>m", api.marks.bulk.move, tree_opts("Move Bookmarked") })
end

local HEIGHT_RATIO = 0.6 -- You can change this
local WIDTH_RATIO = 0.4 -- You can change this too

require("nvim-tree").setup({
	on_attach = on_attach,
	sort_by = "case_sensitive",
	hijack_cursor = false,
	disable_netrw = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	view = {
		number = false,
		relativenumber = false,
		adaptive_size = true,
		cursorline = true,
		float = {
			enable = true,
			open_win_config = function()
				-- thanks to Mario Carrion (https://github.com/MarioCarrion)
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	renderer = {
		group_empty = false,
		indent_markers = {
			enable = true,
		},
		icons = {
			git_placement = "before",
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false,
			},
			glyphs = {
				bookmark = "†",
				folder = {
					default = "•",
					open = "•",
					empty = "-",
					empty_open = "-",
				},
			},
		},
	},
	hijack_directories = {
		-- this autoopens nvim, but only in sidebar mode
		-- i do this with autocmds instead
		enable = false,
		auto_open = false,
	},
	filters = {
		custom = {
			".DS.Store",
		},
	},
	ui = {
		confirm = {
			remove = true,
			trash = false,
		},
	},
	actions = {
		expand_all = {
			exclude = {
				".git",
			},
		},
		file_popup = {
			open_win_config = {
				border = "rounded",
			},
		},
	},
})
