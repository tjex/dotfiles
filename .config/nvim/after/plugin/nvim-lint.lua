local ok, _ = pcall(require, "lint")
if not ok then
   print("nvim-lint conf has a problem")
   return
end

require('lint').linters_by_ft = {
    javascript = {'eslint_d'},
}
