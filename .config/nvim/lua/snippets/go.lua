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
	s(
		"get user config dir",
		fmt([[
            func {} string {{
                path, ok := os.LookupEnv("XDG_CONFIG_HOME")
                if !ok {{
                    home, ok := os.LookupEnv("HOME")
                    if !ok {{
                        home = "~/"
                    }}
                    path = filepath.Join(home, ".config")
                }}
                return path

            }}
            ]],
            { i(1) }
            )
	),
}
