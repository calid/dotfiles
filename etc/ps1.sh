export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

# git completion and __git_ps1
. /usr/share/bash-completion/completions/git

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="_set_ps1; history -a; history -c; history -r"

function _set_ps1 {
    state=$?

    e="\[\e["
    en="m\]"
    x="${e}0${en}"
    gray="${e}30;1${en}"
    red="${e}31;1${en}"
    green="${e}32;1${en}"
    yellow="${e}33;1${en}"
    blue="${e}34;1${en}"

    if [ $UID == 0 ]
    then
        prompt_color=${red}
    else
        prompt_color=${green}
    fi

    if [ $state -eq 0 ]
    then
        state="${green}✔${x}"
    else
        state="${red}✘${x}"
    fi

    user=$(whoami)
    host=$(hostname)
    cwd=$(pwd)

    start="\n${prompt_color}${user}@${host}${x}"

    git=$(__git_ps1)
    if [ "$git" = '' ]
    then
        git=' '
    fi

    path="${gray}${cwd}${x}"

    PS1="${start}${git}${path}\n${state} "
}
