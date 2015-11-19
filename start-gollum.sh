#!/bin/bash
wiki_root="$1"

gollum \
    --host $(hostname) --port 8080 \
    --adapter rugged \
    --show-all \
    --mathjax \
    --user-icons gravatar \
    "$wiki_root"
