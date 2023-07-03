-- nvim-tree nvim-tree/nvim-tree.lua
local ok, _ = pcall(require, "nvim-tree")
if not ok then
    print('nvim-tre not ok!')
    return
end


-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    local key = vim.keymap.set
    local event = api.events.Event

    -- enter file on creation
    api.events.subscribe(event.FileCreated, function(file)
        vim.cmd("edit " .. file.fname)
    end)

    -- refresh tree on delete
    api.events.subscribe(event.FileRemoved, function()
        api.tree.reload()
    end)

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- loads the default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    key('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    key('n', 'i', api.tree.change_root_to_node, opts('CD'))
    key('n', 'l', api.node.open.no_window_picker, opts('Open'))
    key('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    key('n', '<leader>m', api.marks.bulk.move, opts('Move Bookmarked'))
    key('n', 'C', api.tree.collapse_all, opts('Collapse'))
    key('n', 'X', api.tree.expand_all, opts('Collapse'))
end

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.4  -- You can change this too

require("nvim-tree").setup({
    on_attach = on_attach,
    sort_by = "case_sensitive",
    hijack_cursor = false,
    disable_netrw = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    view = {
        number = true,
        relativenumber = true,
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
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                    - vim.opt.cmdheight:get()
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
        group_empty = true,
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
                folder = {
                    default = "•",
                    open = "•",
                    empty = "-",
                    empty_open = "-",
                },
            }
        }
    },
    hijack_directories = {
        enable = false,
        auto_open = false,
    },
    filters = {
        custom = {
            '.DS.Store',
            '.git',
        }
    },
    ui = {
        confirm = {
            remove = true,
            trash = false,
        }
    },
    actions = {
        expand_all = {
            exclude = {
                ".git",
            }
        },
        file_popup = {
            open_win_config = {
                border = "rounded",
            }
        }
    }
})
