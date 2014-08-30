export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

export PS1_SHOWUSER=1

export HISTCONTROL=ignoredups  # no duplicate entries
export HISTSIZE=100000         # big big history
export HISTFILESIZE=100000     # big big history
shopt -s histappend            # append to history, don't overwrite it
shopt -s histreedit            # allow re-editing failed hist expansion

# Save and reload the history after each command finishes
export PROMPT_COMMAND="_set_ps1; history -a; history -c; history -r"

. "$(dirname $(readlink -f ${BASH_SOURCE[0]}))/../completion.d/git"

function _set_ps1 {
    state=$?

    e="\[\e["
    en="m\]"
    x="${e}0${en}"
    gray="${e}1;38;5;246${en}"
    red="${e}31;1${en}"
    green="${e}32;1${en}"
    altgreen="${e}1;38;5;113${en}"
    yellow="${e}33;1${en}"
    blue="${e}1;38;5;111${en}"

    bind 'set vi-mode-str1 [38;5;246m▶[0m'
    bind 'set vi-mode-str2 [33;1m▶[0m'

    if [ $UID == 0 ]
    then
        prompt_color=${red}
    else
        prompt_color=${altgreen}
    fi

    if [ $state -eq 0 ]
    then
        state="${gray}[${green}✔${gray}]${x}"
    else
        state="${gray}[${red}✘${gray}]${x}"
    fi

    if [[ $PS1_SHOWUSER -eq 1 ]]; then
        start="\n${prompt_color}\u@\h${x}"
    else
        start="\n${prompt_color}\h${x}"
    fi

    git=$(__git_ps1)
    if [ "$git" = '' ]
    then
        git=' '
    fi

    path="${gray}\w${x}"

    PS1="${start}${git}${path}\n${state}\\m "
}
