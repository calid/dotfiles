
highlight SignColumn term=standout ctermfg=14 ctermbg=234 guifg=Cyan guibg=Grey

highlight GitGutterAdd          ctermfg=2   ctermbg=0 guifg=#009900 guibg=Black
highlight GitGutterChange       ctermfg=3   ctermbg=0 guifg=#bbbb00 guibg=Black
highlight GitGutterDelete       ctermfg=1   ctermbg=0 guifg=#ff2222 guibg=Black
highlight GitGutterChangeDelete ctermfg=171 ctermbg=0 guifg=#ff2222 guibg=Black

let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '__'
let g:gitgutter_sign_modified_removed = '≂≂'

nnoremap <silent> <Leader>gn :GitGutterNextHunk<cr>
nnoremap <silent> <Leader>gp :GitGutterPrevHunk<cr>
nnoremap <silent> <Leader>gr :GitGutterRevertHunk<cr>

