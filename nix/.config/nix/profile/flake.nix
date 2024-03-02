{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    # nixpkgs-unstable.url = "nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      packages."x86_64-linux".default = pkgs.buildEnv {
        name = "u-marco-packages";

        paths = with pkgs; [
          google-chrome
          # alacritty didnt work

          # Font
          (nerdfonts.override { fonts = [ "Inconsolata" ]; })

          # Terminal Emulator
          termite

          # Terminal Multiplexer
          tmux
          tmuxPlugins.cpu
          tmuxPlugins.fpp
          tmuxPlugins.pain-control
          tmuxPlugins.sensible

          # Shell
          zsh
          oh-my-zsh
          zsh-autosuggestions
          zsh-bd
          zsh-completions
          zsh-syntax-highlighting
          zsh-powerlevel10k

          # Editor
          (neovim.override {
            vimAlias = true;
            configure.customRC = "source $HOME/.config/nvim/init.vim";
            configure.vam.pluginDictionaries = [{
              names = [
                "airline"
                "fzf-vim"
                "gitgutter"
                "rainbow"
                "vim-indent-guides"
                "vim-nix"
              ];
            }];
          })
          helix

          # Version Control
          git
          git-filter-repo
          gitAndTools.delta
          gitAndTools.diff-so-fancy

          # Utils - Files & Search
          bat
          broot
          # exa
          eza
          fd
          fpp
          fzf
          ripgrep
          zoxide

          # Utils - Storage
          duf
          du-dust
          ncdu

          # Utils - Compute
          htop
          procs
          perf-tools

          # Utils - Data Munging
          jq
          sd
          xsv

          # Utils - Miscellaneous
          direnv
          graphviz
          htop
          hwloc
          nox
          stow
          tldr
          tokei
          xclip

          # Utils - bin
          bloaty
          hexyl

          # Bazel
          # bazel
          # bazel-buildtools # for buildifier

          # Python
          (python3.withPackages (ps: with ps; [
            pyaml
            rich
            typer
          ]))
          mypy
          ruff
          # python3Packages.black

          # jetbrains.idea-ultimate
          # jetbrains.pycharm-professional

          # Bash
          shellcheck

          # Rust
          cargo
          rustc
          rustfmt

          # Nix
          nixpkgs-fmt
        ];
      };
    };
}

#       cpp = with pkgs; buildEnv {
#         name = "cpp";
#         paths = [
#           jetbrains.clion
#           llvmPackages.clang-unwrapped.python # for git-clang-format
#         ];
#       };
#
#       java = with pkgs; buildEnv {
#         name = "java";
#         paths = [
#           jdk
#           jetbrains.idea-community
#         ];
#       };
#
#       # Tools and libraries for native code development.
#       # Build systems commonly assume these things are present.
#       native = with pkgs; buildEnv {
#         name = "native";
#         paths = [
#           clion
#           cmake
#           gcc
#           gnumake
#           openssl
#           patchelf
#           pkgconfig
#         ];
#       };
#
#       # This was a nightmare, but here it is if I ever revisit...
#       embedded = with pkgs; buildEnv {
#         name = "embedded";
#         paths = [
#           # bossa # needs to come from apt, would be nice if openocd just worked.
#           arduino
#           gcc-arm-embedded
#           openocd
#           platformio
#           python36Packages.pyserial
#           urjtag
#         ];
#       };
#
#       # Stuff I can't or shouldn't install on a computer I don't own.
#       personal = with pkgs; buildEnv {
#         name = "personal";
#         paths = [
#           google-chrome
#           gparted
#           vlc
#         ];
#       };
#
#     };
#}   
