
au BufEnter * if &ft ==# "java" | call SetJavaOptions() | endif
function! SetJavaOptions()
    set fo-=o
    set fo+=r
    let b:syntastic_mode = "passive"
    call SetColorColumn(100)
endfunction

call SetJavaOptions()
