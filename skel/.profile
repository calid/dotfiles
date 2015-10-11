#
# .profile
#

if [ -d $HOME/.profile.d ]
then
    for f in $HOME/.profile.d/*.sh
    do
        . $f
    done
    unset f
fi

PATH=$HOME/bin:$PATH

# vim: ft=sh
