# Prevents global env from calling compinit an extra time (on certain distros?).
skip_global_compinit=1

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    source "$HOME/.nix-profile/etc/profile.d/nix.sh";
fi

