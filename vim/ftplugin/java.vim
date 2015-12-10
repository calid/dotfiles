
au BufEnter *.java call SetJavaOptions()
function SetJavaOptions()
    let  b:syntastic_mode='passive'
    call SetColorColumn(100)
endfunction
