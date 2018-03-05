{
  allowUnfree = true;

  packageOverrides = pkgs: with pkgs; {
    all = with pkgs; buildEnv {
      name = "all";
      # ignoreCollisions = true;
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
        # gitAndTools.hub
        gitAndTools.diff-so-fancy
        jetbrains.idea-community

        ## Terminal Stuff
        konsole
        zsh
        tmux
        powerline-fonts
        vistafonts # for Consolas

        exa # Can I easily add aliases per package? eg. ls=exa
        htop
        ripgrep
        fpp
        # Maybe don't want to install if already present..
        # curl
        # stow

        # Easier to work with rustup for now:
        # cargo
        bazel
        python3

        ## Haven't used recently..
       # clion
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
      ];
    };

    # Stuff I can't or shouldn't install on a computer I don't own.
    personal = with pkgs; buildEnv {
      name = "personal";
      paths = [
        google-chrome
        dropbox-cli
        # steam # still using windows for most of this..
        # xflux-gui # This is now a builtin for ubuntu18 + gnome
    ];
  };
 };
}
