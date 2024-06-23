-- bash snippets
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt

return {
	s(
		"yesno",
		t({
			"read -p 'continue? (Y/N): ' confirm",

			"if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then",
			"   echo 'confirmed'",
			"else",
			"   echo 'denied'",
			"fi",
		})
	),
	s(
		"for loop list",
		fmt(
			[[
            for item in "${{{}[@]}}"; do
                echo ${{item}}
            done

            ]],
			{ i(1) }
		)
	),
	s(
		"for loop file",
		fmt(
			[[
            for read item; do
                echo "$item"
            done <$file{}
            ]],
			{ i(1) }
		)
	),
}
