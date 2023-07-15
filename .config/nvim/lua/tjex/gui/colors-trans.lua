local ok, _ = pcall(require, "noirbuddy")
if not ok then
    print('noirbuddy not ok!')
    return
end

local yellow = '#a6864d'
local burnt_yellow = '#a6794d'
local soft_red = '#936666'
local purple = '#c3a0ba'
local bg_lighter = '#202436'
local bg_light = '#1d2030'
local bg_text = '#525d8a'
local background = '#171A27'
local diagnostic_error = '#662a25'
local diagnostic_info = '#949494'
local diagnostic_warning = '#665025'
local diagnostic_hint = '#25662a'
local blue_1 = "#496c7a"
local blue_2 = "#566981"
local black = "#000000"

require('noirbuddy').setup {
    preset = 'slate',
    styles = {
        italic = true,
        bold = false,
        underline = false,
        undercurl = false,
    },
    colors = {
        background = background,
        diagnostic_error = diagnostic_error,
        diagnostic_info = diagnostic_info,
        diagnostic_warning = diagnostic_warning,
        diagnostic_hint = diagnostic_hint,
        primary = blue_2,
        secondary = blue_1,
        noir_0 = '#a0a0a0',
        noir_1 = '#a0a0a0',
        noir_2 = '#a0a0a0',
        noir_3 = '#a7a7a7',
        noir_4 = '#949494',
        noir_5 = '#737373',
        noir_6 = '#535353',
        noir_7 = '#323232',
        noir_8 = '#212121',
        noir_9 = '#212121',
        diff_add = '#f5f5f5',
        diff_change = '#737373',
        diff_delete = '#EC0034',
    }
}

-- color buddy is working together with noirbuddy
local Color, colors, Group, groups, styles = require('colorbuddy').setup()

-- define color variables
Color.new('yellow', yellow)
Color.new('purple', purple)
Color.new('bg_light', bg_light)
Color.new('bg_lighter', bg_lighter)
Color.new('bg_text', bg_text)
Color.new('burnt_yellow', burnt_yellow)
Color.new('soft_red', soft_red)
Color.new('blue_1', blue_1)
Color.new('blue_2', blue_2)
Color.new('black', black)

-- Group Sets
Group.new('hl_1', colors.blue_1)
Group.new('hl_2', colors.blue_2)
Group.new('border_1', colors.burnt_yellow)
Group.new('border_2', colors.soft_red)
Group.new('ui_sel_bg_1', nil, colors.yellow)
Group.new('ui_sel_bg_2', nil, colors.soft_red)
Group.new('ui_sel_fg_1', colors.yellow, nil)
Group.new('ui_sel_fg_2', colors.soft_red, nil)
Group.new('tab_unfocus', colors.noir_6, colors.black)
Group.new('tab_focus', colors.yellow, colors.black)

-- NvimTree
Group.new('NvimTreeOpenedFolderName', groups.hl_2)
Group.new('NvimTreeFolderName', groups.hl_2)
Group.new('NvimTreeEmptyFolderName', groups.hl_2)
Group.new('NvimTreeImageFile', colors.noir_6)
Group.new('NvimTreeCursorLine', colors.border_1)
Group.new('NvimTreeNormal', nil, colors.border_1)
Group.new('NvimTreeNormalFloat', nil, colors.border_1)

Group.new('NvimTreeWinSeparator', groups.border_1)
-- Group.new('NvimTreeStatusLineNC', colors.background, colors.background)
-- Group.new('NvimTreeStatusLine', colors.background, colors.background)

Group.new('NvimTreeGitNew', colors.noir_6)
Group.new('NvimTreeGitDirty', colors.noir_6)
Group.new('NvimTreeGitStaged', colors.noir_6)
Group.new('NvimTreeGitMerge', colors.noir_6)
Group.new('NvimTreeGitRenamed', colors.noir_6)
Group.new('NvimTreeGitNew', colors.noir_6)
Group.new('NvimTreeGitDeleted', colors.noir_6)
Group.new('NvimTreeGitIgnored', colors.noir_6)

-- Neovim Editor
Group.new('CursorLineNr', colors.noir_4, nil)
Group.new('CursorLine', nil, nil)
Group.new('LineNr', colors.noir_6)
Group.new('statusline', colors.yellow, nil)
Group.new('statuslineNC', colors.noir_4, nil, styles.italic)
Group.new('WinSeparator', colors.bg_lighter, nil)
Group.new('endofbuffer', colors.background)
Group.new('FoldColumn', groups.border_2)
Group.new('Folded', groups.border_2)

Group.new('WildMenu', groups.ui_sel_bg_1)
Group.new('Comment', colors.noir_6)
Group.new('Search', colors.noir_9, groups.ui_sel_bg_1)
Group.new('IncSearch', colors.noir_9, groups.ui_sel_bg_1)

Group.new('Visual', colors.background, groups.ui_sel_bg_2)
Group.new('ErrorMsg', colors.diagnostic_error, nil)
Group.new('WarningMsg', colors.yellow, nil)

Group.new('TablineFill', nil, nil)
Group.new('Tabline', groups.tab_unfocus, groups.tab_unfocus)
Group.new('TabLineSel', groups.tab_focus, groups.tab_focus)

-- Treesitter
Group.new('@comment', colors.noir_6, nil, styles.italic)
Group.new('@string', colors.soft_red)
Group.new('@function', colors.soft_red)
Group.new('@keyword.function', colors.soft_red)

-- Telescope
Group.new('TelescopeTitle', colors.noir_0)
Group.new('TelescopeBorder', groups.border_1)
Group.new('TelescopeSearch', nil)
Group.new('telescopematching', groups.ui_sel_fg_1)
Group.new('TelescopeSelection', groups.ui_sel_fg_1)

-- blankline
Group.new('IndentBlanklineChar', colors.noir_6)
Group.new('IndentBlanklineContextChar', groups.hl_1)
