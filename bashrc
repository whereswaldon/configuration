# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# From BLFS: http://www.linuxfromscratch.org/blfs/view/stable/postlfs/profile.html
# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

export -f pathremove pathprepend pathappend

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export GOPATH="$HOME/Code/go"
pathprepend "$HOME/.local/bin"
pathappend "$HOME/.nix_profile/bin"
pathappend "$GOPATH/bin"

export EDITOR="$(which kak)"
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

export XDG_CONFIG_HOME="$HOME/.config"

# Make gpg XDG compliant
#export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# Make pass XDG compilant
#export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/pass"

# Pick up tweaks specific to this host, if any
if [ -f "$HOME/.config/tweak-env" ]; then
    . "$HOME/.config/tweak-env"
fi

export PATH="$HOME/.cargo/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[[ $- != *i* ]] && return

default_tmux="base"
if [ -z "$TMUX" ] ; then
    # launch tmux if it isn't running
    if tmux ls |& grep $default_tmux 2>&1 >/dev/null ; then
        # attach to default session if it exists
        tmux attach -t $default_tmux
    else
        tmux new-session -t $default_tmux
    fi
fi

