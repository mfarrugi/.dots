#!/usr/bin/env bash

set -xeuo pipefail

which nix-env || ( curl https://nixos.org/nix/install | sh )

which stow || nix-env -i stow

stow fonts scripts git nix nvim tmux vim zsh htop termite \
    -v \
    --ignore='^_.*' \
    --ignore='README.md'

sh ~/.dots/termite/_install.sh

# Have stow link files instead of directories to avoid picking up files we don't care about.
stow intellij \
    -v \
    --ignore='^_.*' \
    --ignore='README.md' \
    --no-folding

nix-env -i all
# personal

# Ensure zsh is default the default shell.
if [ "$(basename $SHELL)" != "zsh" ]; then
    grep zsh /etc/shells || (command -v zsh | sudo tee -a /etc/shells)
    chsh -s $(command -v zsh)
fi

# Create ssh credentials, for at least github.
[[ -e ~/.ssh/id_rsa.pub ]] || ( ssh-keygen -t rsa -C "afmarco@gmail.com" -b 4096 )

