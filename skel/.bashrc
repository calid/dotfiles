#
# .bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d $HOME/.bashrc.d ]
then
    for f in $HOME/.bashrc.d/*.sh
    do
        . $f
    done
    unset f
fi

# vim: ft=sh
