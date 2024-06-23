local I = require("tjex.luasnip_vars")
local s = I.s
local fmt = I.fmt
local i = I.i

I.ls.setup_snip_env()

return {
	print = s(
		"print",

		fmt(
			[[
            fmt.Println({})
            ]],
			{ i(1) }
		)
	),
	error = s(
		"error",

		fmt(
			[[
            if err != nil {{
                fmt.Println({}err)
            }}
            ]],
			{ i(1) }
		)
	),
}



