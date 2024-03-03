{ config, pkgs, ... }:

{

  home.username = "marco";
  home.homeDirectory = "/home/marco";
  home.stateVersion = "23.11";
  xdg.dataHome = "/home/marco/.local/data";

  nixpkgs.config.allowUnfreePredicate = pkg: true;

  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  fonts.fontconfig.enable = true;

  # programs.alacritty.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.sessionVariables = {
    TERMINFO = "/home/marco/.nix-profile/share/terminfo"; # :-(
    # EDITOR = "nvim";
  };

  programs.zoxide.enable = true;
  programs.direnv.enable = true;

  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
  };

  home.packages = [
    pkgs.bat
    pkgs.eza
    pkgs.fd
    pkgs.git
    pkgs.google-chrome
    pkgs.helix
    pkgs.ripgrep
    pkgs.tmux
    pkgs.xclip
    (pkgs.nerdfonts.override { fonts = [ "Inconsolata" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

}
