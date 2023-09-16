-- go snippets
local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"err",
		t({
			"if err != nil {",
			"   fmt.Println(err)",
			"}",
		})
	),
	s(
		"main",
		fmt(
			[[
			package main

            import(
                "fmt"
            )

            func main(){{
                {}
            }}

            ]],
			{ i(1)}
		)
	),
}
