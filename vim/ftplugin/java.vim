
au BufEnter *      let &colorcolumn=join(range(g:maxwidth+1,999),",")
au BufEnter *.java let &colorcolumn=join(range(100+1,999),",")

let b:syntastic_mode='passive'
