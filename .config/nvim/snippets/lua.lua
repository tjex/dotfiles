-- go snippets
local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local rep = extras.rep

return {
	s(
		"plugcheck",
		fmt(
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
		fmt(
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
