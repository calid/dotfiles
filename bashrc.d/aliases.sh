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

whatismyip () {
    curl checkip.amazonaws.com
}

find_invalid_nb () {
    local dir="$1"

    if test -z "$1"
    then
        echo 'find_invalid_nb <directory>'
        return 1
    fi

    for f in $(find "$dir" -type f -name '*.ipynb')
    do
        echo $f && cat $f | jq -e . &>/dev/null || echo "$f is invalid"
    done | grep invalid
}
