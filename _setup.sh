#!/bin/bash
SCRIPT_DIR=$( dirname $( readlink -e $0 ) )
git -C "$SCRIPT_DIR" config --local filter.plainzip.clean 'bash -c '"'"'T="$(mktemp)";cat - > "$T";N=$(ziptool "$T" get_num_entries u);N=${N//[^0-9]};C="";for ((i=0; i<N;i++)); do C="$C set_file_compression $i store u"; done; ziptool "$T" $C; cat "$T"; rm "$T"'"'"''
git -C "$SCRIPT_DIR" config --local diff.plainzip.textconv 'bash -c '"'"'cat $0 | tr \\0 ␀'"'"''