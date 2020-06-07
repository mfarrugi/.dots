{
  allowUnfree = true;

  packageOverrides = pkgs: with pkgs; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        powerline-fonts
        vistafonts # for Consolas

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
          configure.vam.pluginDictionaries = [ {
            names = [
              # "airline"
              "gitgutter"
              "vim-nix"
              "rainbow"
            ];
          }];
        })

        # Version Control
        git
        gitAndTools.diff-so-fancy

        # Utils - Files & Search
        exa
        bat
        fd
        ripgrep
        fpp
        fzf

        # Utils - Data Munging
        jq
        xsv

        # Utils - Miscellaneous
        htop
        graphviz
        tokei
        hwloc
        stow
        hexyl
        xclip
        nox

        bazel
        bazel-buildtools

        # Python
        python3
        mypy
        python36Packages.black
        python36Packages.pyaml

        # Bash
        shellcheck
      ];
    };

    java = with pkgs; buildEnv {
      name = "java";
      paths = [
        jdk
        jetbrains.idea-community
      ];
    };

    # Tools and libraries for native code development.
    # Build systems commonly assume these things are present.
    native = with pkgs; buildEnv {
      name = "native";
      paths = [
        gnumake
        pkgconfig
        openssl
        gcc
        cmake
        patchelf
        clion
      ];
    };

    # This was a nightmare, but here it is if I ever revisit...
    embedded = with pkgs; buildEnv {
      name = "embedded";
      paths = [
        gcc-arm-embedded
        python36Packages.pyserial
        arduino
        openocd
        # bossa # needs to come from apt, would be nice of openocd just worked.
        platformio
        urjtag
      ];
    };

    # Stuff I can't or shouldn't install on a computer I don't own.
    personal = with pkgs; buildEnv {
      name = "personal";
      paths = [
        google-chrome
        vlc
        gparted
      ];
    };

  };
}
