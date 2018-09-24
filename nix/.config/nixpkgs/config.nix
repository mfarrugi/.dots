{
  allowUnfree = true;

  packageOverrides = pkgs: with pkgs; {
    all = with pkgs; buildEnv {
      name = "all";
      # pathsToLink = [ "/bin" "/share" ]; # @TODO idk not an issue yet
      paths = [
        nox

        (neovim.override {
          vimAlias = true;
          configure.customRC = "source $HOME/.config/nvim/init.vim";
          # Don't need to use vam, but whatever.
          configure.vam.pluginDictionaries = [ { names = [
            # "airline"
            "gitgutter"
            "vim-nix"
          ];}];
        })

        git
        gitAndTools.diff-so-fancy
        jetbrains.idea-community

        ## Terminal Stuff
        termite
        powerline-fonts
        vistafonts # for Consolas

        tmux
        tmuxPlugins.fpp
        tmuxPlugins.cpu
        tmuxPlugins.resurrect
        tmuxPlugins.continuum

        zsh
        zsh-autosuggestions

        exa
        htop
        ripgrep
        fpp
        fzf
        graphviz
        tokei
        xsv
        jq
        hwloc
        stow

        # cargo # Easier to work with rustup for now:
        bazel
        bazel-buildtools

        ## Python
        python3
        mypy
        python36Packages.black
        python36Packages.pyaml

        # Bash
        shellcheck

        ## Haven't used recently..
        # clion
        # patchelf
        # aha
      ];
    };

    # Java and other JVM tools.
    java = with pkgs; buildEnv {
      name = "java";
      paths = [
        jdk
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

    # Tools and libraries for native code development.
    ## bazel, cargo, and others assume these things are present.
    native = with pkgs; buildEnv {
      name = "native";
      paths = [
        gnumake
        pkgconfig
        openssl
        gcc
        cmake
      ];
    };

    # Stuff I can't or shouldn't install on a computer I don't own.
    personal = with pkgs; buildEnv {
      name = "personal";
      paths = [
        google-chrome
        # dropbox-cli
        # steam # still using windows for most of this..
        # xflux-gui # This is now a builtin for ubuntu18 + gnome
    ];
  };
 };
}
