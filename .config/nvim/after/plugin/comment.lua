local ok, _ = pcall(require, "Comment" )
if not ok then
    print('comment not ok!')
    return
end
-- comment numToStr/Comment.nvim
require('Comment').setup()

local ft = require('Comment.ft')

ft.set('astro', '<!--%s-->')
