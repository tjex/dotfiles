local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- ls.add_snippets = {
--     all = {
--         -- available in any file type
--         ls.parser.parse_snippet("expand", "-- this is what was expanded"),
--
--     },
--     lua = {
--         -- specific to lua
--         ls.parser.parse_snippet("lf", "local $1 = function($2)\n  $0\nend")
--
--     },
-- }

ls.add_snippets("all", {
    s("trig", {
        i(1), t "text", i(2), t "text again", i(3)
    })
})
