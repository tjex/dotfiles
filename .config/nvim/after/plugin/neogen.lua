local ok, _ = pcall(require, "neogen" )
if not ok then
    print('neogen not ok!')
    return
end

require('neogen').setup {}
