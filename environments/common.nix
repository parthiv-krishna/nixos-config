# core system packages

{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.parthiv = {
    isNormalUser = true;
    description = "Parthiv Krishna";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # unfortunately I still use some unfree software. working on it.
  nixpkgs.config.allowUnfree = true;
  
  boot.supportedFilesystems = [ "ntfs" ];

  # environment variables
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home-manager.users.parthiv = {
    imports = [
      ./fonts.nix
      ./packages/bash.nix
      ./packages/git.nix
      ./packages/nixvim.nix
      ./packages/tmux.nix
    ];

    home.stateVersion = "23.05";

    # core packages useful on any system
    home.packages = with pkgs; [
      htop
      killall
      neofetch
      powertop
      trash-cli
      tree
      unzip
      wget
      xclip
      zip
    ];
  };
}

