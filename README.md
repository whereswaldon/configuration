# Configuration

This repo houses the configuration files for my most-used tools so that I can synchronize them quickly between computers.

The script `install.sh` uses symlinks to make the files in this repo appear to be in their correct paths on the file system.
It backs up any pre-existing configuration to ensure that it doesn't destroy your stuff.

The configuration here is for Fedora Linux. Many of these files will be relevant on other distros/OSes, but not all.

Feel free to borrow files or make PRs to update the process or suggest improvements.

# Note on Kakoune Plugins

The `kak/plugins/` directory contains `git subtree`s of the plugin repositories. You can use the subtree commands to update
the version of the plugin that is used.
