local ok, _ = pcall(require, "luasnip")
if not ok then
    print("luasnip not ok!")
    return
end

require("luasnip").config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    -- enable_autosnippets = true,
}
