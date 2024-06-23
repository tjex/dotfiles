-- markdown snippets
local I = require("tjex.luasnip_vars")
local i = I.i
local s = I.s
local t = I.t
local fmt = I.fmt

return {
	s(
		"pandoc",
		t({
			"---",
			"documentclass: scrartcl",
			"title: Title",
			"subtitle: Subtitle",
			"author: Author",
			"date: date",
			"geometry: margin=2.5cm",
			"linestretch: 1.2",
			"fontfamily: inter",
			"fontfamilyoptions: sfdefault",
			"---",
		})
	),
    -- default template for obsidian note frontmatter
    -- inserts todays date and file name as H1 title
	s(
		"blog post",
		fmt(
			[[
        ---
        title: {}
        description: {}
        pubDate: {}
        author: tjex
        tags: ["{}"]
        license: {}
        draft: true
        ---
        ]],
			{ i(1), i(2), i(3, vim.fn.strftime("%Y-%m-%dT%XZ")), i(4), i(5) }
		)
	),
}

