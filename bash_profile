# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
if [ -e /home/waldon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/waldon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/.cargo/bin:$PATH"
