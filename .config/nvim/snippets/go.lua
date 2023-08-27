-- go snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("go", {
    s("e",
        t({ "if err != nil {",
            "   fmt.Println(err)",
            "}"
        })
    )
})
