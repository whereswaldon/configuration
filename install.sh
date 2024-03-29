#!/bin/bash
set -x
BASEDIR="$(dirname "$0")"

function symlink {
    # symlink ensures that there is a link at $target that points to $source.
    local target="$1"
    local source="$2"

    # back up the file if it isn't already a symlink
    if [ ! -L "$target" ] && [ -e "$target" ] ; then
        mv -v "$target" "$target-waldon-backup";
    fi
    # overwrite symlink
    ln -svnf "$(realpath "$source")" "$target"
}

mkdir -p "$HOME/".{local/{bin,lib},config}
symlink "$HOME/.bash_profile" "$BASEDIR/bash_profile"
symlink "$HOME/.bashrc" "$BASEDIR/bashrc"
symlink "$HOME/.tmux.conf" "$BASEDIR/tmux.conf"
symlink "$HOME/.gitconfig" "$BASEDIR/gitconfig"
symlink "$HOME/.config/kak" "$BASEDIR/kak"
symlink "$HOME/.config/river" "$BASEDIR/river"
symlink "$HOME/.config/waybar" "$BASEDIR/waybar"
symlink "$HOME/.local/bin/penv" "$BASEDIR/bin/penv"
