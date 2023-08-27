-- latex snippets
local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets('markdown', {
    s("pandoc",
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
            "---" })
    ) })
