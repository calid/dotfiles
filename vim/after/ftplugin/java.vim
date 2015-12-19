
au BufEnter * if &ft ==# "java" | call SetJavaOptions() | endif
function! SetJavaOptions()
    set fo-=o
    call SetColorColumn(100)
endfunction

call SetJavaOptions()
