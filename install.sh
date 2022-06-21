#!/usr/bin/env bash

set -xeuo pipefail

download() {
    which nix-env || ( curl https://nixos.org/nix/install | sh )

    mkdir -p ~/.config/nixpkgs
    ln -sf $(pwd)/nix/.config/nixpkgs/config.nix ~/.config/nixpkgs/config.nix
    nix-env --install all
}

install() {
    stow \
        --verbose \
        --ignore='^_.*' \
        --ignore='README.md' \
        --no-folding \
        \
        fonts \
        git \
        htop \
        intellij \
        nix \
        nvim \
        python \
        termite \
        tmux \
        zsh

    # Additional bespoke setup per program.
    sh termite/_install.sh

    # Ensure zsh is default the default shell.
    if [ "$(basename $SHELL)" != "zsh" ]; then
        grep zsh /etc/shells || (command -v zsh | sudo tee -a /etc/shells)
        chsh -s $(command -v zsh)
    fi

    # Create ssh credentials, for at least github.
    [[ -e ~/.ssh/id_rsa.pub ]] || ( ssh-keygen -t rsa -C "$USER@$(hostname | cut -d'.' -f1)" -b 4096 )
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --download)
            DOWNLOAD=true
            shift
            ;;
        --install)
            INSTALL=true
            shift
            ;;
    esac
done

if [[ -n "${DOWNLOAD:-}" ]]; then
    download
fi

if [[ -n "${INSTALL:-}" ]]; then
    install
fi
