#!/bin/bash

if [ $# -ne 3 ]
then
    echo "Usage: $(basename $0) <wiki-root> <host> <port>"
    exit 1
fi

wiki_root="$1"
host="$2"
port="$3"

gollum \
    --host $host --port $port \
    --adapter rugged \
    --show-all \
    --mathjax \
    --user-icons gravatar \
    "$wiki_root"
