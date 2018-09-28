# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export GOPATH="$HOME/Code/go"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.nix_profile/bin"
export PATH="$PATH:$GOPATH/bin"
export EDITOR="$(which kak)"
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

default_tmux="base"
if [ -z "$TMUX" ] ; then
    # launch tmux if it isn't running
    if tmux ls | grep $default_tmux ; then
        # attach to default session if it exists
        tmux attach -t $default_tmux
    else
        tmux new-session -t $default_tmux
    fi
fi
