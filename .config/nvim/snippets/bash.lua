-- bash snippets
local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

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
}
