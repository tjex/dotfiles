-- go snippets
local I = require("tjex.luasnip_vars")
local s = I.s
local i = I.i
local rep = I.rep

return {
	s(
		"plugcheck",
		I.fmt(
			[[
        local ok, _ = pcall(require, "{}")
        if not ok then
           print("{} conf has a problem")
           return
        end
        ]],
			{ i(1), rep(1) }
		)
	),
	s(
		"wez-keybind",
		I.fmt(
			[[
            {{
                key = "{}",
                mod = "{}",
                action = act.{},
            }},
            ]],
			{ i(1), i(2), i(3) }
		)
	),
}
