local ok, _ = pcall(require, "nvim-autopairs" )
if not ok then
    print('nvim-autopairs not ok!')
    return
end

-- autopairs windwp/nvim-autopairs
-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')


require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" },
})


