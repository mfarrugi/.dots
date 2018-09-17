#!/usr/bin/env bash

set -xeuo pipefail

which nix-env || ( curl https://nixos.org/nix/install | sh )

which stow || nix-env --install stow

# Setup all of the dot file symlinks.
stow fonts scripts git nix nvim tmux vim zsh htop termite intellij \
    --verbose \
    --ignore='^_.*' \
    --ignore='README.md'

# Additional bespoke setup per package.
sh ~/.dots/termite/_install.sh

# Install all of our packages.
nix-env --uninstall stow
nix-env --install all

# Ensure zsh is default the default shell.
if [ "$(basename $SHELL)" != "zsh" ]; then
    grep zsh /etc/shells || (command -v zsh | sudo tee -a /etc/shells)
    chsh -s $(command -v zsh)
fi

# Create ssh credentials, for at least github.
[[ -e ~/.ssh/id_rsa.pub ]] || ( ssh-keygen -t rsa -C "$USER@$(hostname | cut -d'.' -f1)" -b 4096 )

