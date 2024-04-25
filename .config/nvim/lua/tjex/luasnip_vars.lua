-- have one base file here and import the variables 
-- into other files. That way if some syntax changes 
-- for imports etc, I can just change here instead 
-- of running sed on the other files.

local M = {}

M.ls = require("luasnip")
M.s = M.ls.snippet
M.sn = M.ls.snippet_node
M.isn = M.ls.indent_snippet_node
M.t = M.ls.text_node
M.i = M.ls.insert_node
M.f = M.ls.function_node
M.c = M.ls.choice_node
M.d = M.ls.dynamic_node
M.r = M.ls.restore_node
M.events = require("luasnip.util.events")
M.ai = require("luasnip.nodes.absolute_indexer")
M.extras = require("luasnip.extras")
M.l = M.extras.lambda
M.rep = M.extras.rep
M.p = M.extras.partial
M.m = M.extras.match
M.n = M.extras.nonempty
M.dl = M.extras.dynamic_lambda
M.fmt = require("luasnip.extras.fmt").fmt
M.fmta = require("luasnip.extras.fmt").fmta
M.conds = require("luasnip.extras.expand_conditions")
M.postfix = require("luasnip.extras.postfix").postfix
M.types = require("luasnip.util.types")
M.parse = require("luasnip.util.parser").parse_snippet
M.ms = M.ls.multi_snippet
M.k = require("luasnip.nodes.key_indexer").new_key

return M

