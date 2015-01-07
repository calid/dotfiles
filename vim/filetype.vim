
augroup filetypedetect
    au BufNewFile,BufRead *.gradle             setf groovy
    au BufNewFile,BufRead .tmux.conf,tmux.conf setf tmux
    au BufNewFile,BufRead Xdefaults,Xresources setf xdefaults
    au BufNewFile,BufRead gitconfig            setf gitconfig
augroup END
