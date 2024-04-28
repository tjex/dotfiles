-- mail luasnips
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt

return {
	s(
		"sig-tjex",
		fmt(
			[[
            {}
            --
            Tillman Jex
            www.tjex.net
            ]],
			{ i(1) }
		)
	),
}
