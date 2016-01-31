export VIMRUNTIME="$(\
    vim --version \
    | grep VIMRUNTIME \
    | awk '{print $NF}' \
    | sed 's/"//g'\
)"
