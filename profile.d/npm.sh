NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
