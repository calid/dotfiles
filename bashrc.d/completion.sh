completion_d="$(dirname ${BASH_SOURCE[0]})/../completion.d"

for f in ${completion_d}/*
do
    source $f
done
