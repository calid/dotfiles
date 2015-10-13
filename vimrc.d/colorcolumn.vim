
" set the "no man's land" past max line width to black background
let &colorcolumn=join(range(g:maxwidth+1,999),",")
hi ColorColumn ctermbg=232 guibg=#080808
