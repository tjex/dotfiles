local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets('all', {
    -- basic, don't need to know anything else
    --    arg 1: string
    --    arg 2: a node
    s("simple", t "wow, you were right!"),
})
