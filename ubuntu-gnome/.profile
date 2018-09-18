if [ -e /home/marco/.nix-profile/etc/profile.d/nix.sh ]; then . /home/marco/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Needed for gnome to pick up nix ./share outputs.
export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
