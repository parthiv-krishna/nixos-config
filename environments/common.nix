# core system packages

{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.parthiv = {
    isNormalUser = true;
    description = "Parthiv Krishna";
    extraGroups = [
      "dialout"
      "networkmanager"
      "wheel"
    ];
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
      bear
      ccls
      gnumake
      htop
      killall
      neofetch
      nixd
      powertop
      protonvpn-cli
      unstable.rclone
      sshfs
      trash-cli
      tree
      unzip
      wget
      xclip
      zip
    ];
  };
}

