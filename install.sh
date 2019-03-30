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
symlink "$HOME/.tmate.conf" "$BASEDIR/tmate.conf"
symlink "$HOME/.gitconfig" "$BASEDIR/gitconfig"
symlink "$HOME/.dwm" "$BASEDIR/dwm"
symlink "$HOME/.st" "$BASEDIR/st"
symlink "$HOME/.config/kak" "$BASEDIR/kak"
symlink "$HOME/.config/sxhkd" "$BASEDIR/sxhkd"
symlink "$HOME/.local/bin/penv" "$BASEDIR/bin/penv"
symlink "$HOME/.local/bin/dwm.sh" "$BASEDIR/bin/dwm.sh"
symlink "$HOME/.local/bin/get-layout" "$BASEDIR/bin/get-layout"
symlink "$HOME/.local/bin/reconfigure-monitors" "$BASEDIR/bin/reconfigure-monitors"
symlink "$HOME/.local/bin/sas-vpn" "$BASEDIR/bin/sas-vpn"

# ensure plug.kak exists
PLUG_KAK_PATH="$BASEDIR/kak/plugins/plug.kak"
PLUG_KAK_URL="https://github.com/andreyorst/plug.kak"
PLUG_KAK_BRANCH="dev"
if ! [ -e "$PLUG_KAK_PATH" ] ; then
    git clone "$PLUG_KAK_URL" --branch "$PLUG_KAK_BRANCH" "$PLUG_KAK_PATH"
fi
