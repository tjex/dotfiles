local ls = require "luasnip"

ls.add_snippets = {
    all = {
        -- available in any file type
        ls.parser.parse_snippet("expand", "-- this is what was expanded"),

    },
    lua = {
        -- specific to lua
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n  $0\nend")

    },
}
