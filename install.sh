#!/bin/sh
set -x
BASEDIR="$(dirname $0)"

function symlink {
    # symlink ensures that there is a link at $target that points to $source.
    local target="$1"
    local source="$2"

    # back up the file if it isn't already a symlink
    if [ ! -L "$target" -a -e "$target" ] ; then
        mv -v "$target" "$target-waldon-backup";
    fi
    # overwrite symlink
    ln -svTnf "$(realpath $source)" "$target"
}

symlink "$HOME/.bash_profile" "$BASEDIR/bash_profile"
symlink "$HOME/.bashrc" "$BASEDIR/bashrc"
symlink "$HOME/.tmux.conf" "$BASEDIR/tmux.conf"
symlink "$HOME/.tmate.conf" "$BASEDIR/tmate.conf"
symlink "$HOME/.gitconfig" "$BASEDIR/gitconfig"
symlink "$HOME/.dwm" "$BASEDIR/dwm"
symlink "$HOME/.st" "$BASEDIR/st"
symlink "$HOME/.config/kak" "$BASEDIR/kak"
symlink "$HOME/.config/sxhkd" "$BASEDIR/sxhkd"

# special case
if [ -e "$BASEDIR/kak/autoload/system" ] ; then rm -v "$BASEDIR/kak/autoload/system" ; fi
symlink "$BASEDIR/kak/autoload/system" "$(dirname $(which kak))/../share/kak/autoload"
