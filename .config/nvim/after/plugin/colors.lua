-- basically a complete theft of https://github.com/jesseleite/nvim-noirbuddy
-- with some of my own additions. I just wanted stability to only use colorbuddy
-- and found that there was flashing of colors as noirbuddy loaded ontop of colorbuddy.

-- tip: run ":so $VIMRUNTIME/syntax/hitest.vim" to see highlight naming and their set colors. Handy!

local Color, colors, Group, groups, styles = require('colorbuddy').setup()
Color.new('yellow', '#a6864d')
Color.new('burnt_yellow', '#a6794d')
Color.new('soft_red', '#936666')
Color.new('purple', '#c3a0ba')
Color.new('bground', '#171A27')
Color.new('bg_lighter', '#202436')
Color.new('bg_light', '#1d2030')
Color.new('bg_text', '#525d8a')
Color.new('diagnostic_error', '#662a25')
Color.new('diagnostic_info', '#949494')
Color.new('diagnostic_warning', '#665025')
Color.new('diagnostic_hint', '#25662a')
Color.new('blue_1', '#496c7a')
Color.new('blue_2', '#566981')
Color.new('black', '#000000')
Color.new('gray_0', '#a0a0a0')
Color.new('gray_1', '#a7a7a7')
Color.new('gray_2', '#949494')
Color.new('gray_3', '#737373')
Color.new('gray_4', '#535353')
Color.new('gray_5', '#323232')
Color.new('gray_6', '#212121')

-- Group Sets
Group.new('primary', colors.blue_2)
Group.new('secondary', colors.blue_1)
Group.new('hl_yellow', colors.burnt_yellow)
Group.new('hl_red', colors.soft_red)
Group.new('hl_blue', colors.blue_1)
Group.new('border_yellow', colors.burnt_yellow)
Group.new('border_red', colors.soft_red)
Group.new('border_blue', colors.blue_1)
Group.new('ui_sel_bg_1', nil, colors.yellow)
Group.new('ui_sel_bg_2', nil, colors.soft_red)
Group.new('ui_sel_fg_1', colors.yellow, nil)
Group.new('ui_sel_fg_2', colors.soft_red, nil)
Group.new('tab_unfocus', colors.gray_4, colors.black)
Group.new('tab_focus', colors.yellow, colors.black)

-- typography
Group.new('Constant', colors.primary)
Group.new('Comment', colors.gray_4)
Group.new('Character', colors.gray_3)
Group.new('Error', colors.primary)
Group.new('Identifier', colors.gray_0)
Group.new('Normal', colors.gray_2, colors.bground)
Group.new('Statement', colors.gray_0)
Group.new('PreProc', colors.primary)
Group.new('Type', colors.secondary)
Group.new('Special', colors.gray_3)
Group.new('Todo', colors.primary, colors.gray_6)
Group.new('Function', colors.gray_0)

-- editor signage
Group.new('ColorColumn', nil, colors.gray_6)
Group.new('Conceal', colors.gray_5)
Group.new('Cursor', nil)
Group.new('CursorColumn', nil, colors.gray_6)
Group.new('CursorLineNr', colors.gray_2, nil)
Group.new('CursorLine', nil, colors.bg_light)
Group.new('Directory', colors.gray_1)
Group.new('DiffAdd', colors.primary, colors.gray_6)
Group.new('DiffChange', colors.gray_0, colors.gray_6)
Group.new('DiffDelete', colors.secondary, colors.gray_6)
Group.new('DiffText', colors.gray_0, colors.gray_5)
Group.new('ErrorMsg', colors.diagnostic_error, nil)
Group.new('SignColumn', nil, colors.bground)
Group.new('endofbuffer', colors.bground)
Group.new('LineNr', colors.gray_4)
Group.new('statusline', colors.bg_text, colors.bg_lighter)
Group.new('statuslineNC', colors.gray_4, nil, styles.italic)
Group.new('WarningMsg', colors.yellow, nil)
Group.new('WinSeparator', colors.bg_lighter, nil)
Group.new('VertSplit', colors.gray_6, colors.gray_6)

-- UI Elements?
Group.new('FoldColumn', groups.border_red)
Group.new('Folded', groups.border_red)
Group.new('MatchParen', nil, colors.gray_5)
Group.new('MoreMsg', nil, colors.gray_4)
Group.new('NonText', colors.gray_6, nil)
Group.new('Pmenu', colors.gray_0, colors.gray_6)
Group.new('PmenuSel', colors.gray_4, colors.gray_6)
Group.new('PmenuSbar', colors.primary, colors.gray_6)
Group.new('PmenuThumb', colors.primary, colors.gray_5)
Group.new('Question', colors.gray_0, colors.gray_6)
Group.new('Search', colors.gray_6, groups.ui_sel_bg_1)
Group.new('IncSearch', colors.gray_6, groups.ui_sel_bg_1)
Group.new('SpecialKey', colors.gray_4, nil)
Group.new('SpellBad', colors.primary)
Group.new('SpellCap', colors.gray_0)
Group.new('SpellLocal', colors.gray_3)
Group.new('SpellRare', colors.primary)
Group.new('TablineFill', nil, nil)
Group.new('Tabline', groups.tab_unfocus, groups.tab_unfocus)
Group.new('TabLineSel', groups.tab_focus, groups.tab_focus)
Group.new('Title', colors.gray_1)
Group.new('WildMenu', colors.yellow, colors.bg_lighter)
Group.new('VisualNOS', colors.primary, colors.gray_6)
Group.new('Visual', colors.black, groups.ui_sel_bg_2)

-- Treesitter Syntax Highlighting
-- See :help treesitter-highlight-groups
Group.new('@boolean', colors.primary)
Group.new('@character', colors.secondary)
Group.new('@character.special', colors.gray_0)
Group.new('@comment', colors.gray_5)
Group.new('@conditional', colors.gray_0)
Group.new('@constant', colors.gray_0)
Group.new('@constant.builtin', colors.gray_0)
Group.new('@constant.macro', colors.primary)
Group.new('@constructor', colors.gray_0)
Group.new('@debug', colors.gray_0)
Group.new('@define', colors.gray_0)
Group.new('@exception', colors.gray_0)
Group.new('@field', colors.gray_0)
Group.new('@float', colors.gray_0)
Group.new('@function', colors.gray_0)
Group.new('@function.builtin', colors.gray_0)
Group.new('@function.call', colors.gray_0)
Group.new('@function.macro', colors.primary)
Group.new('@include', colors.gray_4)
Group.new('@keyword', colors.gray_3)
Group.new('@keyword.function', colors.gray_3)
Group.new('@keyword.operator', colors.gray_4)
Group.new('@keyword.return', colors.gray_0)
Group.new('@label', colors.gray_0)
Group.new('@macro', colors.primary)
Group.new('@method', colors.gray_0)
Group.new('@method.call', colors.gray_0)
Group.new('@namespace', colors.gray_0)
Group.new('@none', colors.gray_1)
Group.new('@number', colors.primary)
Group.new('@operator', colors.gray_4)
Group.new('@parameter', colors.gray_0)
Group.new('@preproc', colors.gray_0)
Group.new('@property', colors.gray_0)
Group.new('@punctuation', colors.gray_0)
Group.new('@punctuation.bracket', colors.gray_4)
Group.new('@punctuation.delimiter', colors.gray_4)
Group.new('@punctuation.special', colors.primary)
Group.new('@repeat', colors.gray_0)
Group.new('@storageclass', colors.gray_0)
Group.new('@string', colors.primary)
Group.new('@string.escape', colors.gray_0)
Group.new('@string.special', colors.gray_0)
Group.new('@structure', colors.gray_0)
Group.new('@tag', colors.gray_4)
Group.new('@tag.attribute', colors.gray_2)
Group.new('@tag.delimiter', colors.gray_1)
Group.new('@text.literal', colors.secondary)
Group.new('@text.reference', colors.secondary)
Group.new('@text.title', colors.gray_0)
Group.new('@text.todo', colors.gray_0)
Group.new('@text.underline', colors.gray_0)
Group.new('@text.uri', colors.gray_0)
Group.new('@type', colors.gray_0)
Group.new("@identifier", colors.gray_0)
Group.new('@type.builtin', colors.gray_4)
Group.new('@type.definition', colors.gray_0)
Group.new('@variable', colors.secondary)
Group.new('@variable.builtin', colors.gray_0)
Group.new('@lsp.type.function', colors.gray_0)
Group.new('@lsp.type.macro', colors.primary)
Group.new('@lsp.type.method', colors.gray_0)

-- PLUGINS --

-- NvimTree
Group.new('NvimTreeOpenedFolderName', groups.hl_blue)
Group.new('NvimTreeFolderName', groups.hl_blue)
Group.new('NvimTreeEmptyFolderName', groups.hl_blue)
Group.new('NvimTreeImageFile', colors.gray_4)
Group.new('NvimTreeCursorLine', colors.border_yellow)
Group.new('NvimTreeNormal', nil, colors.border_yellow)
Group.new('NvimTreeNormalFloat', nil, colors.border_yellow)
Group.new('NvimTreeWinSeparator', groups.border_yellow)
Group.new('NvimTreeOpenedFile', colors.gray_0, nil)
Group.new('NvimTreeExecFile', colors.gray_0, nil)
Group.new('NvimTreeWindowPicker', groups.tab_focus)
Group.new('NvimTreeRootFolder', colors.soft_red, nil)
Group.new('NvimTreeEndOfBuffer', colors.bground)
Group.new('NvimTreeIndentMarker', colors.gray_3)

Group.new('NvimTreeGitNew', colors.gray_4)
Group.new('NvimTreeGitDirty', colors.gray_4)
Group.new('NvimTreeGitStaged', colors.gray_4)
Group.new('NvimTreeGitMerge', colors.gray_4)
Group.new('NvimTreeGitRenamed', colors.gray_4)
Group.new('NvimTreeGitNew', colors.gray_4)
Group.new('NvimTreeGitDeleted', colors.gray_4)
Group.new('NvimTreeGitIgnored', colors.gray_4)

-- Treesitter
Group.new('@comment', colors.gray_4, nil, styles.italic)
Group.new('@string', colors.soft_red)
Group.new('@function', colors.soft_red)
Group.new('@keyword.function', colors.soft_red)

-- Telescope
Group.new('TelescopeTitle', colors.gray_0)
Group.new('TelescopeBorder', groups.border_yellow)
Group.new('TelescopeSearch', nil)
Group.new('telescopematching', groups.ui_sel_fg_1)
Group.new('TelescopeSelection', groups.ui_sel_fg_1)

-- blankline
Group.new('IndentBlanklineChar', colors.gray_4)
Group.new('IndentBlanklineContextChar', groups.hl_yellow)
