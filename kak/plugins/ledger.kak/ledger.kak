hook global BufCreate .*\.ledger %{
    set-option buffer filetype ledger
}

declare-option completions ledger_completions
declare-option str ledger_temp_file

define-command ledger-complete -docstring "Generate completions for the current ledger file" %{
    evaluate-commands %sh{
    if [ ! -f "$kak_opt_ledger_temp_file" ]; then
    	printf %s\\n "set-option buffer=${kak_bufname} ledger_temp_file $(mktemp)"
    fi
    }
    write %opt{ledger_temp_file}
    evaluate-commands %sh{
        prefix=$(head -${kak_cursor_line} $kak_opt_ledger_temp_file | tail -1 | cut -c -$kak_cursor_column | sed -E 's/^\s+//')
        completions=$(grep -E '^\s+' ${kak_opt_ledger_temp_file}| grep -v ';' | sed -E 's/^\s+//' | sed -e 's/  .*//' | sort | uniq | tee $kak_opt_ledger_temp_file)
        filtered_completions=$(grep "$prefix" $kak_opt_ledger_temp_file| sed -e 's/^\(.*\)$/"\1||\1"/' | sed "s/^\"${prefix}/\"/" | tr '\n' ' ')
        printf %s\\n "set-option buffer=${kak_bufname} ledger_completions ${kak_cursor_line}.${kak_cursor_column}@${kak_timestamp} ${filtered_completions}"
    }
}

hook global WinSetOption filetype=ledger %{
    set-option window completers "option=ledger_completions" %opt{completers}
    hook window -group ledger-autocomplete InsertIdle .* %{ try %{
        	echo -debug "completing"
        	ledger-complete
        }
    }
}
