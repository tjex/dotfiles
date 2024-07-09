-- reflex color scheme by me (tjex)

-- don't color backgrounds of floating windows (and backgrounds?..)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

local colorbuddy = require("colorbuddy")
colorbuddy.colorscheme("reflex")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("bground", "#1a1c23")
Color.new("bg_lighter", "#202436")
Color.new("bg_light", "#1b1e2d")
Color.new("bg_text", "#525d8a")

Color.new("primary", "#647f9d") -- blue_1
Color.new("secondary", "#7F718E") -- purple
Color.new("tertiary", "#bc9f76") -- burnt_yellow
Color.new("quart", "#bf8585") -- soft_red
Color.new("yellow", "#cca166")
Color.new("green", "#4e9a6f") -- green
Color.new("diag_error", "#9c5543")
Color.new("diag_info", "#647f9d")
Color.new("diag_hint", "#339843")
Color.new("diag_warn", "#ba8c64")
Color.new("blue_2", "#6f88a6")
Color.new("black", "#1a1a1a")
Color.new("gray_0", "#b4b4b4") -- brightest
Color.new("gray_1", "#bcbcbc")
Color.new("gray_2", "#aeaeae") -- regular text
Color.new("gray_3", "#969696")
Color.new("gray_4", "#737373")
Color.new("gray_5", "#585858")
Color.new("gray_6", "#2b2b2b") -- dullest

-- Group Sets
Group.new("border_1", c.primary)
Group.new("border_2", c.secondary)
Group.new("border_3", c.quart)
Group.new("hl_bg_1", c.black, c.primary)
Group.new("hl_bg_2", c.black, c.secondary)
Group.new("hl_fg_1", c.primary, nil)
Group.new("hl_fg_2", c.quart, nil)
Group.new("tab_unfocus", c.gray_4, c.bg_lighter)
Group.new("tab_focus", c.yellow, c.bg_lighter)

------------------
-- COLORING THINGS
------------------

-- notices
Group.new("DiagnosticError", c.diag_error)
Group.new("DiagnosticWarn", c.diag_warn)
Group.new("DiagnosticInfo", c.diag_info)
Group.new("DiagnosticHint", c.diag_hint)
Group.new("DiagnosticUnderlineError", nil, nil, s.underline)
Group.new("DiagnosticUnderlineWarn", nil, nil, s.underline)
Group.new("DiagnosticUnderlineInfo", nil, nil, s.underline)
Group.new("DiagnosticUnderlineHint", nil, nil, s.underline)
Group.new("Error", c.diag_error)
Group.new("WarningMsg", c.yellow, nil)
Group.new("ErrorMsg", c.diag_error, nil)

-- editor signage
Group.new("Conceal", c.gray_5)
Group.new("Cursor", nil) -- set by term
Group.new("ColorColumn", nil, nil)
Group.new("CursorLineNr", c.gray_2, nil)
Group.new("CursorLine", nil, nil)
Group.new("Directory", c.gray_1)
Group.new("DiffAdded", c.green)
Group.new("DiffRemoved", c.quart)
Group.new("DiffFile", c.white, nil, s.underline)
Group.new("DiffOldFile", c.gray_2)
Group.new("DiffNewFile", c.gray_2)
Group.new("DiffAdd", c.primary)
Group.new("DiffChange", c.gray_0)
Group.new("DiffDelete", c.secondary)
Group.new("DiffText", c.gray_0)
Group.new("SignColumn", nil, nil)
Group.new("endofbuffer", c.bground)
Group.new("LineNr", c.gray_4)
Group.new("statusline", c.bg_text, c.bg_lighter)
Group.new("statuslineNC", c.gray_4, nil, s.italic)
Group.new("WinSeparator", c.primary, nil)
Group.new("VertSplit", c.gray_6, c.gray_6)

-- UI Elements
Group.new("FloatBorder", g.border_1)
Group.new("FoldColumn", g.border_1)
Group.new("Folded", g.border_3)
Group.new("MatchParen", nil, c.gray_5)
Group.new("MoreMsg", nil, c.gray_4)
Group.new("NonText", c.gray_6, nil)
Group.new("Pmenu", c.gray_0, c.bg_light)
Group.new("PmenuSel", c.black, g.hl_bg_1)
Group.new("PmenuSbar", c.primary, c.gray_6)
Group.new("PmenuThumb", c.primary, c.gray_5)
Group.new("Question", c.gray_0, c.gray_6)
Group.new("Search", c.black, g.hl_bg_1)
Group.new("IncSearch", c.black, g.hl_bg_1)
Group.new("SpecialKey", c.gray_4, nil)
Group.new("SpellBad", c.tertiary)
Group.new("SpellCap", c.tertiary)
Group.new("SpellLocal", c.gray_3)
Group.new("SpellRare", c.primary)
Group.new("TablineFill", nil, nil)
Group.new("Tabline", g.tab_unfocus, g.tab_unfocus)
Group.new("TabLineSel", g.tab_focus, g.tab_focus)
Group.new("Title", c.quart)
Group.new("WildMenu", c.yellow, c.bg_lighter)
Group.new("VisualNOS", c.primary, c.gray_6)
Group.new("Visual", c.black, g.hl_bg_2)

-- Syntax Highlighting
-- See :help treesitter-highlight-g
Group.new("@boolean", c.primary)
Group.new("boolean", c.primary)

Group.new("@character", c.secondary)
Group.new("character", c.secondary)

Group.new("@character.special", c.gray_0)
Group.new("character.special", c.gray_0)

Group.new("@comment", c.gray_5, nil, s.italic)
Group.new("comment", c.gray_5, nil, s.italic)

Group.new("@conditional", c.gray_0)
Group.new("conditional", c.gray_0)

Group.new("@constant", c.gray_0)
Group.new("constant", c.gray_0)

Group.new("@constant.builtin", c.gray_0)
Group.new("constant.builtin", c.gray_0)

Group.new("@constant.macro", c.quart)
Group.new("constant.macro", c.quart)

Group.new("@constructor", c.gray_0)
Group.new("constructor", c.gray_0)

Group.new("@debug", c.gray_0)
Group.new("debug", c.gray_0)

Group.new("@define", c.gray_0)
Group.new("define", c.gray_0)

Group.new("@exception", c.gray_0)
Group.new("exception", c.gray_0)

Group.new("@field", c.gray_0)
Group.new("field", c.gray_0)

Group.new("@float", c.gray_0)
Group.new("float", c.gray_0)

Group.new("@function", c.quart)
Group.new("function", c.quart)

Group.new("@function.builtin", c.gray_0)
Group.new("function.builtin", c.gray_0)

Group.new("@function.call", c.gray_0)
Group.new("function.call", c.gray_0)

Group.new("@function.macro", c.quart)
Group.new("function.macro", c.quart)

Group.new("@include", c.gray_4)
Group.new("include", c.gray_4)

Group.new("@keyword", c.gray_4)
Group.new("keyword", c.gray_4)

Group.new("@keyword.function", c.quart)
Group.new("keyword.function", c.quart)

Group.new("@keyword.operator", c.gray_4)
Group.new("keyword.operator", c.gray_4)

Group.new("@keyword.return", c.gray_0)
Group.new("keyword.return", c.gray_0)

Group.new("@label", c.gray_0)
Group.new("label", c.gray_0)

Group.new("@macro", c.quart)
Group.new("macro", c.quart)

Group.new("@method", c.quart)
Group.new("method", c.quart)

Group.new("@method.call", c.quart)
Group.new("method.call", c.quart)

Group.new("@namespace", c.gray_0)
Group.new("namespace", c.gray_0)

Group.new("@Normal", c.gray_2, nil)
Group.new("Normal", c.gray_2, nil)

Group.new("@none", c.gray_1)
Group.new("none", c.gray_1)

Group.new("@number", c.quart)
Group.new("number", c.quart)

Group.new("@operator", c.gray_4)
Group.new("operator", c.gray_4)

Group.new("@parameter", c.gray_0)
Group.new("parameter", c.gray_0)

Group.new("@preproc", c.quart)
Group.new("preproc", c.quart)

Group.new("@property", c.gray_0)
Group.new("property", c.gray_0)

Group.new("@punctuation", c.gray_0)
Group.new("punctuation", c.gray_0)

Group.new("@punctuation.bracket", c.gray_4)
Group.new("punctuation.bracket", c.gray_4)

Group.new("@punctuation.delimiter", c.gray_4)
Group.new("punctuation.delimiter", c.gray_4)

Group.new("@punctuation.special", c.quart)
Group.new("punctuation.special", c.quart)

Group.new("@repeat", c.gray_0)
Group.new("repeat", c.gray_0)

Group.new("@statement", c.gray_0)
Group.new("Statement", c.gray_0)

Group.new("@special", c.gray_3)
Group.new("Special", c.gray_3)

Group.new("@storageclass", c.gray_0)
Group.new("storageclass", c.gray_0)

Group.new("@string", c.primary)
Group.new("string", c.primary)

Group.new("@string.escape", c.gray_0)
Group.new("string.escape", c.gray_0)

Group.new("@string.special", c.gray_0)
Group.new("string.special", c.gray_0)

Group.new("@structure", c.gray_0)
Group.new("structure", c.gray_0)

Group.new("@tag", c.gray_4)
Group.new("tag", c.gray_4)

Group.new("@tag.attribute", c.gray_2)
Group.new("tag.attribute", c.gray_2)

Group.new("@tag.delimiter", c.gray_1)
Group.new("tag.delimiter", c.gray_1)

Group.new("@tag.delimiter.html", c.gray_1)

Group.new("@text.literal", c.secondary)
Group.new("text.literal", c.secondary)

Group.new("@text.reference", c.reference)
Group.new("text.reference", c.quart)

Group.new("@text.title", c.quart, nil, nil)
Group.new("text.title", c.quart)

Group.new("@text.todo", c.gray_0)
Group.new("text.todo", c.gray_0)

Group.new("@text.underline", c.gray_0)
Group.new("text.underline", c.gray_0)

Group.new("@text.uri", c.gray_0)
Group.new("text.uri", c.gray_0)

Group.new("@type", c.gray_0)
Group.new("type", c.gray_0)

Group.new("@identifier", c.gray_0)
Group.new("identifier", c.gray_0)

Group.new("@type.builtin", c.gray_4)
Group.new("type.builtin", c.gray_4)

Group.new("@type.definition", c.gray_0)
Group.new("type.definition", c.gray_0)

Group.new("@variable", c.gray_3)
Group.new("variable", c.gray_3)

Group.new("@variable.builtin", c.gray_3)
Group.new("variable.builtin", c.gray_3)

Group.new("@underlined", c.primary, nil, nil) -- markdown links also
Group.new("underlined", c.primary, nil, nil)

-------------
-- PLUGINS --
-------------

-- Oil

Group.new("OilDir", c.primary, nil)
Group.new("OilDirIcon", c.gray_2, nil)

-- NvimTree
Group.new("NvimTreeOpenedFolderName", c.primary)
Group.new("NvimTreeFolderName", c.primary)
Group.new("NvimTreeEmptyFolderName", c.primary)
Group.new("NvimTreeImageFile", c.gray_4)
Group.new("NvimTreeCursorLine", c.white, nil, s.italic)
Group.new("NvimTreeNormal", nil)
Group.new("NvimTreeNormalFloat", nil)
Group.new("NvimTreeWinSeparator", g.border_1)
Group.new("NvimTreeOpenedFile", c.gray_0, nil)
Group.new("NvimTreeExecFile", c.gray_0, nil)
Group.new("NvimTreeWindowPicker", g.tab_focus)
Group.new("NvimTreeRootFolder", c.quart, nil)
Group.new("NvimTreeEndOfBuffer", c.bground)
Group.new("NvimTreeIndentMarker", c.gray_5)
Group.new("NvimTreeSpecialFile", c.gray_0)

Group.new("NvimTreeGitNew", c.gray_4)
Group.new("NvimTreeGitDirty", c.gray_4)
Group.new("NvimTreeGitStaged", c.gray_4)
Group.new("NvimTreeGitMerge", c.gray_4)
Group.new("NvimTreeGitRenamed", c.gray_4)
Group.new("NvimTreeGitNew", c.gray_4)
Group.new("NvimTreeGitDeleted", c.gray_4)
Group.new("NvimTreeGitIgnored", c.gray_4)

-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
Group.new("TelescopeTitle", c.gray_0)
Group.new("TelescopeBorder", g.border_1)
Group.new("TelescopeSearch", nil)
Group.new("TelescopeMatching", c.white)
Group.new("TelescopeSelection", c.white, nil, s.italic)

-- blankline
-- these hl g don't seem to work (2023-09-29)
Group.new("IblIndent", c.blue_1)

-- cmp
Group.new("CmpItemMenu", g.hl_fg_2, nil)
Group.new("CmpItemAbbrMatch", g.hl_fg_2, nil)
