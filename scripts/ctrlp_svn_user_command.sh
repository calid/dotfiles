#!/bin/bash -e

svndir="$1"

cd "$svndir"
svn status | awk '{print $NF}' > /tmp/ctrlp.svn.files
svn ls -R >> /tmp/ctrlp.svn.files
cat /tmp/ctrlp.svn.files
