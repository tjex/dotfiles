local ok, _ = pcall(require, "dap-go")
if not ok then
    print('nvim-dap-go not ok!')
    return
end

require('dap-go').setup()
