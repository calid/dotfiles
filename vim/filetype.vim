
augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf,tmux.conf setf tmux
augroup END

augroup filetypedetect
    au BufNewFile,BufRead Xdefaults,Xresources setf xdefaults
augroup END

augroup filetypedetect
    au BufNewFile,BufRead gitconfig setf gitconfig
augroup END
