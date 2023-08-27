local ok, _ = pcall(require, "luasnip")
if not ok then
    print("luasnip not ok!")
    return
end

local ls = require("luasnip")
local key = vim.keymap.set
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    -- enable_autosnippets = true,
}

key({ "i", "s" }, "<C-s>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

key({ "i", "s" }, "<c-u>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

key({ "i", "s" }, "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })



ls.add_snippets(nil, {
    -- basic, don't need to know anything else
    --    arg 1: string
    --    arg 2: a node
    ls.s("simple", t "wow, you were right!"),
})
