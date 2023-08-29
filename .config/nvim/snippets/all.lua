local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node


-- TODO: implement snip_env so I don't need to
-- add lots of locals
return {
    s("simple", t "wow, you were right!"),
}
