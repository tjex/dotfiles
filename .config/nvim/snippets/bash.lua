-- bash snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s("yesno",
        t({
            "read -p 'continue? (Y/N): ' confirm",

            "if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then",
            "   echo 'confirmed'",
            "else",
            "   echo 'denied'",
            "fi"
        }))
}
