
"
" Toggle textwidth
"
    nnoremap <silent> <Leader>tw :TwToggle<cr>
    command TwToggle call ToggleTextWidth()

    function ToggleTextWidth()
    if !exists("b:toggleTw") || !b:toggleTw
        let b:toggleTw=1
        let &tw=g:maxwidth
    else
        let b:toggleTw=0
        set tw=0
    endif

    echo "tw="&tw
    endfunction

"
" Toggle linewrap
"
    nnoremap <silent> <Leader>wr :WrToggle<cr>
    command WrToggle call ToggleWrap()

    function ToggleWrap()
    if !exists("b:toggleWr") || !b:toggleWr
        let b:toggleWr=1
        set nowrap
    else
        let b:toggleWr=0
        set wrap
    endif

    endfunction

