#!/usr/bin/env bash

set -xeuo pipefail

download() {
    which nix || ( curl https://nixos.org/nix/install | sh )

    # This requires `git` to work from under a source directory, so move it elsewhere first.
    ln -sfn $(pwd)/nix/.config/nix ~/.config/nix
    nix profile install ~/.config/nix/profile
}

install() {
    # Ignore non-dot files when creating symlinks.
    stow \
        --verbose \
        --ignore='^(?![.]).*' \
        \
        fonts \
        git \
        htop \
        nix \
        nvim \
        python \
        termite \
        tmux \
        ubuntu-gnome \
        zsh

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
