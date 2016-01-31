function man() {
    CUR_MANFILE="$(/usr/bin/man -w $@)" \
        /usr/bin/man -P vimpager "$@"
}
