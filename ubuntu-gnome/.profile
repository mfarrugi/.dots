if [ -e /home/marco/.nix-profile/etc/profile.d/nix.sh ]; then . /home/marco/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Tells gnome where to find icons for nix installed programs.
export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
