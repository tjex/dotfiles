-- go snippets
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt

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
			{ i(1) }
		)
	),
	s(
		"for loop",
		fmt(
			[[
            for {}, {} := range {} {{
                {}
            }}

            ]],
			{ i(1), i(2), i(3), i(4) }
		)
	),
}
