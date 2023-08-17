# system packages
{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager.users.parthiv = {
    home.packages = with pkgs; [
      htop
      git
      neofetch
      neovim
      powertop
      tmux
      trash-cli
      tree
      wget
    ];

    home.stateVersion = "23.05";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.parthiv = {
    isNormalUser = true;
    description = "Parthiv Krishna";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

