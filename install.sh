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
    ln -svTnf "$(realpath "$source")" "$target"
}

symlink "$HOME/.bash_profile" "$BASEDIR/bash_profile"
symlink "$HOME/.bashrc" "$BASEDIR/bashrc"
symlink "$HOME/.tmux.conf" "$BASEDIR/tmux.conf"
symlink "$HOME/.gitconfig" "$BASEDIR/gitconfig"
symlink "$HOME/.config/kak" "$BASEDIR/kak"
symlink "$HOME/.local/bin/penv" "$BASEDIR/bin/penv"

# ensure plug.kak exists
PLUG_KAK_PATH="$BASEDIR/kak/plugins/plug.kak"
PLUG_KAK_URL="https://github.com/andreyorst/plug.kak"
PLUG_KAK_BRANCH="dev"
if ! [ -e "$PLUG_KAK_PATH" ] ; then
    git clone "$PLUG_KAK_URL" --branch "$PLUG_KAK_BRANCH" "$PLUG_KAK_PATH"
fi
