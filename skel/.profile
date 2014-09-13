
if [ -d $HOME/.profile.d ]
then
    for f in $HOME/.profile.d/*.sh
    do
        . $f
    done
fi

# vim: ft=sh
