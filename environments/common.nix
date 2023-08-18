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

  home-manager.users.parthiv = {
    imports = [
      ./fonts.nix
      ./nixvim.nix
    ];

    home.stateVersion = "23.05";

    # core packages useful on any system
    home.packages = with pkgs; [
      htop
      git
      neofetch
      # neovim # installed in ./nixvim.nix
      powertop
      tmux
      trash-cli
      tree
      wget
    ];
  };
}

