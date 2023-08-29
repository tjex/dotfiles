-- go snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s("e",
        t({ "if err != nil {",
            "   fmt.Println(err)",
            "}"
        })
    )
}
