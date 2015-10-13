
let g:ctrlp_map = ''
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }

nnoremap <Leader>bf :CtrlP<cr>
nnoremap <Leader>bb :CtrlPBuffer<cr>
nnoremap <Leader>bt :CtrlPTag<cr>

