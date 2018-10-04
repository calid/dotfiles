alias python=python3
alias pip=pip3
alias ipython=ipython3
alias grep='grep --color=auto'
alias gits='git status -s'
alias ls='ls --color=auto'
alias cpanm='cpanm -v'
alias tree='tree -aC -I .git'
alias view='vim -R'
alias gview='gvim -R'
alias vi='vim -v -u NONE'

function diff {
    colordiff -u "$@" | less
}
