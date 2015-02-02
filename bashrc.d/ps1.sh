export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

export PS1_SHOWUSER=1

export HISTSIZE=100000      # big big history
export HISTFILESIZE=100000  # big big history

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
shopt -s histappend # append to history, don't overwrite it
shopt -s histreedit # allow re-editing failed hist expansion

# complicated gymnastics to get cross term deduped history working
PROMPT_COMMAND="_set_ps1;"    # run the prompt command
PROMPT_COMMAND+="history -n;" # load the full history file
PROMPT_COMMAND+="history -w;" # write back out the now complete hist buffer
PROMPT_COMMAND+="history -c;" # clear the buffer
PROMPT_COMMAND+="history -r;" # reload the now complete hist file

export PROMPT_COMMAND

. "$(dirname $(readlink -f ${BASH_SOURCE[0]}))/../completion.d/git"

# get the last signal number listed by kill -l
MAX_SIGNUM="$(kill -l | awk 'END {f=$(NF-1);gsub(")","",f);print f}')"

# if exit status represents signal then return signal name
# else return original exit status
function _status_or_signal {
    local s=$1

    if [[ $s -le 128 || $s -eq 255 ]]; then
        echo $s
        return
    fi

    # convert to potential signal number
    local signum=$(expr $s - 128)

    if [[ $signum -gt $MAX_SIGNUM ]]; then
        # not a valid signal number
        echo $s
        return
    fi

    # signum to signame
    echo "SIG$(kill -l $signum)"
}

function _set_ps1 {
    local status=$?

    local e="\[\e["
    local en="m\]"
    local x="${e}0${en}"
    local gray="${e}1;38;5;246${en}"
    local red="${e}31;1${en}"
    local green="${e}32;1${en}"
    local altgreen="${e}1;38;5;113${en}"
    local yellow="${e}33;1${en}"
    local blue="${e}1;38;5;111${en}"

    local state
    local prompt_color
    local start
    local git_ps1
    local path

    bind 'set vi-mode-str1 [38;5;246m▶[0m'
    bind 'set vi-mode-str2 [33;1m▶[0m'

    if [ $UID == 0 ]
    then
        prompt_color=${red}
    else
        prompt_color=${altgreen}
    fi

    if [ $status -eq 0 ]; then
        state="${gray}[${green}✔${gray}]${x}"
    elif [ $status -eq 1 ]; then
        state="${gray}[${red}✘${gray}]${x}"
    else
        status="$(_status_or_signal $status)"
        state="${gray}[${red}${status}${gray}]${x}"
    fi

    if [[ $PS1_SHOWUSER -eq 1 ]]; then
        start="\n${prompt_color}\u@\h${x}"
    else
        start="\n${prompt_color}\h${x}"
    fi

    git_ps1=$(__git_ps1)
    if [ "$git_ps1" = '' ]
    then
        git_ps1=' '
    fi

    path="${gray}\w${x}"

    PS1="${start}${git_ps1}${path}\n${state}\\m "
}
