#!/bin/sh
kak_buffile="/home/chris/Dropbox/Budget/budget.txt"
kak_cursor_line=21
kak_cursor_column=28
kak_timestamp=100
tempfile=$(mktemp)
prefix=$(head -${kak_cursor_line} $kak_buffile |tail -1 | cut -c -$kak_cursor_column | sed -E 's/^\s+//')
completions=$(grep -E '^\s+' ${kak_buffile}| grep -v ';' | sed -E 's/^\s+//' | sed -e 's/  .*//' | sort | uniq | tee $tempfile)
filtered_completions=$(grep "$prefix" $tempfile | sed -e 's/^\(.*\)$/"\1"||"\1"/' | sed "s/^\"${prefix}/\"/" | tr '\n' ' ')
rm $tempfile
#echo "echo -debug ${filtered_completions}"
echo "set-option window ledger_completions $kak_cursor_line.$kak_cursor_column@${kak_timestamp} ${filtered_completions}"
