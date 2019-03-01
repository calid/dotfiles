d="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
. "$d/../completion.d/bazel"
unset d
