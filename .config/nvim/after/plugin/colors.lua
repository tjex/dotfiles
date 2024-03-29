-- basically a complete theft of https://github.com/jesseleite/nvim-noirbuddy
-- with some of my own additions. I just wanted stability to only use colorbuddy
-- and found that there was flashing of colors as noirbuddy loaded ontop of colorbuddy, 
-- made worse with treesitter delay as well.

-- tip: run ":so $VIMRUNTIME/syntax/hitest.vim" to see highlight naming and their set colors. Handy!

-- don't color backgrounds of floating windows (and backgrounds?..)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new("bground", "#1a1c23")
Color.new("bg_lighter", "#202436")
Color.new("bg_light", "#1b1e2d")
Color.new("bg_text", "#525d8a")

Color.new("primary", "#647f9d") -- blue_1
Color.new("secondary", "#7F718E") -- purple
Color.new("tertiary", "#ba8c64") -- burnt_yellow
Color.new("quart", "#bf8585") -- soft_red
Color.new("yellow", "#ccb266")
Color.new("diag_error", "#9c5543")
Color.new("diag_info", "#647f9d")
Color.new("diag_hint", "#339843")
Color.new("diag_warn", "#ba8c64")
Color.new("blue_2", "#6f88a6")
Color.new("black", "#1a1a1a")
Color.new("gray_0", "#b4b4b4")
Color.new("gray_1", "#bcbcbc")
Color.new("gray_2", "#aeaeae") -- regular text
Color.new("gray_3", "#969696")
Color.new("gray_4", "#737373")
Color.new("gray_5", "#484848")
Color.new("gray_6", "#2b2b2b")

-- Group Sets
Group.new("border_1", colors.primary)
Group.new("border_2", colors.secondary)
Group.new("border_3", colors.quart)
Group.new("hl_bg_1", colors.black, colors.primary)
Group.new("hl_bg_2", colors.black, colors.secondary)
Group.new("hl_fg_1", colors.primary, nil)
Group.new("hl_fg_2", colors.quart, nil)
Group.new("tab_unfocus", colors.gray_4, colors.bg_lighter)
Group.new("tab_focus", colors.yellow, colors.bg_lighter)

--
-- COLORING THINGS
--

-- notices
Group.new("DiagnosticError", colors.diag_error)
Group.new("DiagnosticInfo", colors.diag_info)
Group.new("DiagnosticHint", colors.diag_hint)
Group.new("DiagnosticWarn", colors.diag_warn)
Group.new("Error", colors.diag_error)
Group.new("WarningMsg", colors.yellow, nil)
Group.new("ErrorMsg", colors.diag_error, nil)

-- editor signage
Group.new("Conceal", colors.gray_5)
Group.new("Cursor", nil) -- set by term
Group.new("ColorColumn", nil, colors.gray_6)
Group.new("CursorLineNr", colors.gray_2, nil)
Group.new("CursorLine", nil, colors.bg)
Group.new("Directory", colors.gray_1)
Group.new("DiffAdd", colors.primary, colors.gray_6)
Group.new("DiffChange", colors.gray_0, colors.gray_6)
Group.new("DiffDelete", colors.secondary, colors.gray_6)
Group.new("DiffText", colors.gray_0, colors.gray_5)
-- Group.new("SignColumn", nil, colors.bground)
Group.new("SignColumn", nil, nil) -- transparent
Group.new("endofbuffer", colors.bground) -- doesnt like 'nil' for some reason
Group.new("LineNr", colors.gray_4)
-- Group.new("statusline", colors.bg_text, colors.bg_lighter)
Group.new("statusline", colors.bg_text, colors.bg_lighter)
Group.new("statuslineNC", colors.gray_4, nil, styles.italic)
Group.new("WinSeparator", colors.bg_lighter, nil)
Group.new("VertSplit", colors.gray_6, colors.gray_6)

-- UI Elements
Group.new("FloatBorder", groups.border_1)
Group.new("FoldColumn", groups.border_1)
Group.new("Folded", groups.border_3)
Group.new("MatchParen", nil, colors.gray_5)
Group.new("MoreMsg", nil, colors.gray_4)
Group.new("NonText", colors.gray_6, nil)
Group.new("Pmenu", colors.gray_0, colors.bg_light)
Group.new("PmenuSel", colors.black, groups.hl_bg_1)
Group.new("PmenuSbar", colors.primary, colors.gray_6)
Group.new("PmenuThumb", colors.primary, colors.gray_5)
Group.new("Question", colors.gray_0, colors.gray_6)
Group.new("Search", colors.black, groups.hl_bg_1)
Group.new("IncSearch", colors.black, groups.hl_bg_1)
Group.new("SpecialKey", colors.gray_4, nil)
Group.new("SpellBad", colors.tertiary)
Group.new("SpellCap", colors.tertiary)
Group.new("SpellLocal", colors.gray_3)
Group.new("SpellRare", colors.primary)
Group.new("TablineFill", nil, nil)
Group.new("Tabline", groups.tab_unfocus, groups.tab_unfocus)
Group.new("TabLineSel", groups.tab_focus, groups.tab_focus)
Group.new("Title", colors.quart)
Group.new("WildMenu", colors.yellow, colors.bg_lighter)
Group.new("VisualNOS", colors.primary, colors.gray_6)
Group.new("Visual", colors.black, groups.hl_bg_2)

-- Treesitter Syntax Highlighting
-- See :help treesitter-highlight-groups
Group.new("@boolean", colors.tertiary)
Group.new("@character", colors.secondary)
Group.new("@character.special", colors.gray_0)
Group.new("@comment", colors.gray_4, nil, styles.italic)
Group.new("@conditional", colors.gray_0)
Group.new("@constant", colors.gray_0)
Group.new("@constant.builtin", colors.gray_0)
Group.new("@constant.macro", colors.primary)
Group.new("@constructor", colors.gray_0)
Group.new("@debug", colors.gray_0)
Group.new("@define", colors.gray_0)
Group.new("@exception", colors.gray_0)
Group.new("@field", colors.gray_0)
Group.new("@float", colors.gray_0)
Group.new("@function", colors.quart)
Group.new("@function.builtin", colors.gray_0)
Group.new("@function.call", colors.gray_0)
Group.new("@function.macro", colors.primary)
Group.new("@include", colors.gray_4)
Group.new("@keyword", colors.secondary)
Group.new("@keyword.function", colors.quart)
Group.new("@keyword.operator", colors.gray_4)
Group.new("@keyword.return", colors.gray_0)
Group.new("@label", colors.gray_0)
Group.new("@macro", colors.primary)
Group.new("@method", colors.primary)
Group.new("@method.call", colors.primary)
Group.new("@namespace", colors.gray_0)
Group.new("@none", colors.gray_1)
Group.new("@number", colors.primary)
Group.new("@operator", colors.gray_4)
Group.new("@parameter", colors.gray_0)
Group.new("@preproc", colors.primary)
Group.new("@property", colors.gray_0)
Group.new("@punctuation", colors.gray_0)
Group.new("@punctuation.bracket", colors.gray_4)
Group.new("@punctuation.delimiter", colors.gray_4)
Group.new("@punctuation.special", colors.primary)
Group.new("@repeat", colors.gray_0)
Group.new("@statement", colors.gray_0)
Group.new("@storageclass", colors.gray_0)
Group.new("@string", colors.quart)
Group.new("@string.escape", colors.gray_0)
Group.new("@string.special", colors.gray_0)
Group.new("@structure", colors.gray_0)
Group.new("@tag", colors.gray_4)
Group.new("@tag.attribute", colors.gray_2)
Group.new("@tag.delimiter", colors.gray_1)
Group.new("@text.literal", colors.secondary)
Group.new("@text.reference", colors.reference)
Group.new("@text.title", colors.quart, nil, nil)
Group.new("@text.todo", colors.gray_0)
Group.new("@text.underline", colors.gray_0)
Group.new("@text.uri", colors.gray_0)
Group.new("@type", colors.gray_0)
Group.new("@identifier", colors.gray_0)
Group.new("@type.builtin", colors.gray_4)
Group.new("@type.definition", colors.gray_0)
Group.new("@variable", colors.gray_3)
Group.new("@variable.builtin", colors.gray_3)

-- vim standard (non treesitter) highlights
Group.new("boolean", colors.tertiary)
Group.new("character", colors.secondary)
Group.new("character.special", colors.gray_0)
Group.new("comment", colors.gray_4, nil, styles.italic)
Group.new("conditional", colors.gray_0)
Group.new("constant", colors.gray_0)
Group.new("constant.builtin", colors.gray_0)
Group.new("constant.macro", colors.primary)
Group.new("constructor", colors.gray_0)
Group.new("debug", colors.gray_0)
Group.new("define", colors.gray_0)
Group.new("exception", colors.gray_0)
Group.new("field", colors.gray_0)
Group.new("float", colors.gray_0)
Group.new("function", colors.quart)
Group.new("function.builtin", colors.gray_0)
Group.new("function.call", colors.gray_0)
Group.new("function.macro", colors.primary)
Group.new("include", colors.gray_4)
Group.new("keyword", colors.secondary)
Group.new("keyword.function", colors.quart)
Group.new("keyword.operator", colors.gray_4)
Group.new("keyword.return", colors.gray_0)
Group.new("label", colors.gray_0)
Group.new("macro", colors.primary)
Group.new("method", colors.primary)
Group.new("method.call", colors.primary)
-- Group.new("Normal", colors.gray_2, colors.bground)
Group.new("Normal", colors.gray_2, nil) -- transparent
Group.new("namespace", colors.gray_0)
Group.new("none", colors.gray_1)
Group.new("number", colors.primary)
Group.new("operator", colors.gray_4)
Group.new("parameter", colors.gray_0)
Group.new("preproc", colors.primary)
Group.new("property", colors.gray_0)
Group.new("punctuation", colors.gray_0)
Group.new("punctuation.bracket", colors.gray_4)
Group.new("punctuation.delimiter", colors.gray_4)
Group.new("punctuation.special", colors.primary)
Group.new("repeat", colors.gray_0)
Group.new("Special", colors.gray_3)
Group.new("Statement", colors.gray_0)
Group.new("storageclass", colors.gray_0)
Group.new("string", colors.quart)
Group.new("string.escape", colors.gray_0)
Group.new("string.special", colors.gray_0)
Group.new("structure", colors.gray_0)
Group.new("tag", colors.gray_4)
Group.new("tag.attribute", colors.gray_2)
Group.new("tag.delimiter", colors.gray_1)
Group.new("text.literal", colors.secondary)
Group.new("text.reference", colors.primary)
Group.new("text.title", colors.primary)
Group.new("text.todo", colors.gray_0)
Group.new("text.underline", colors.gray_0)
Group.new("text.uri", colors.gray_0)
Group.new("type", colors.gray_0)
Group.new("identifier", colors.gray_0)
Group.new("type.builtin", colors.gray_4)
Group.new("type.definition", colors.gray_0)
Group.new("underlined", colors.primary, nil, nil)
Group.new("variable", colors.gray_3)
Group.new("variable.builtin", colors.gray_3)

-- PLUGINS --

-- NvimTree
Group.new("NvimTreeOpenedFolderName", colors.primary)
Group.new("NvimTreeFolderName", colors.primary)
Group.new("NvimTreeEmptyFolderName", colors.primary)
Group.new("NvimTreeImageFile", colors.gray_4)
Group.new("NvimTreeCursorLine", nil)
Group.new("NvimTreeNormal", nil)
Group.new("NvimTreeNormalFloat", nil)
Group.new("NvimTreeWinSeparator", groups.border_1)
Group.new("NvimTreeOpenedFile", colors.gray_0, nil)
Group.new("NvimTreeExecFile", colors.gray_0, nil)
Group.new("NvimTreeWindowPicker", groups.tab_focus)
Group.new("NvimTreeRootFolder", colors.quart, nil)
Group.new("NvimTreeEndOfBuffer", colors.bground)
Group.new("NvimTreeIndentMarker", colors.gray_5)
Group.new("NvimTreeSpecialFile", colors.gray_0)

Group.new("NvimTreeGitNew", colors.gray_4)
Group.new("NvimTreeGitDirty", colors.gray_4)
Group.new("NvimTreeGitStaged", colors.gray_4)
Group.new("NvimTreeGitMerge", colors.gray_4)
Group.new("NvimTreeGitRenamed", colors.gray_4)
Group.new("NvimTreeGitNew", colors.gray_4)
Group.new("NvimTreeGitDeleted", colors.gray_4)
Group.new("NvimTreeGitIgnored", colors.gray_4)

-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
Group.new("TelescopeTitle", colors.gray_0)
Group.new("TelescopeBorder", groups.border_1)
Group.new("TelescopeSearch", nil)
Group.new("TelescopeMatching", colors.white)
Group.new("TelescopeSelection", colors.white, nil)

-- blankline
-- these hl groups don't seem to work (2023-09-29)
Group.new("IblIndent", colors.blue_1)

-- cmp
Group.new("CmpItemMenu", groups.hl_fg_2, nil)
Group.new("CmpItemAbbrMatch", groups.hl_fg_2, nil)

-- obsidian
Group.new("ObsidianRefText", colors.primary, nil, nil)

-- vimwki
Group.new("VimwikiLink", colors.primary, nil, nil)
Group.new("VimwikiHeader1", colors.primary, nil)
Group.new("VimwikiHeaderChar", colors.primary, nil)
