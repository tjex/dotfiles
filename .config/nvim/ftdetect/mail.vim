" let neovim see files being edited via neomutt as mail files
" see: https://incenp.org/notes/2020/format-flowed-neomutt-vim.html

au BufNewFile,BufRead neomutt-* setf mail
setl fo=awq
match ErrorMsg '\s\+$'
