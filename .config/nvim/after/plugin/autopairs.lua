local ok, _ = pcall(require, "nvim-autopairs")
if not ok then
    print('nvim-autopairs not ok!')
    return
end

local getRule = require("nvim-autopairs").get_rules

require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" },
})

-- leaving here as an example of what works
-- getRule("`")[1].not_filetypes = { "markdown" }
