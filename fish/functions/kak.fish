# Defined in /tmp/fish.DkA7Gx/kak.fish @ line 2
function kak
    if not set root (git rev-parse --show-toplevel 2> /dev/null)
        set root "$PWD"
    end
    set session (string sub -e 6 (echo "$root" | md5sum))
    set live_sessions (command kak -l)
    if contains "$session" $live_sessions
        command kak -c "$session" $argv
    else
        systemctl --user start "kakoune@$session.service"
        echo cd "$root" | command kak -p "$session"
        command kak -c "$session" $argv
    end
end
