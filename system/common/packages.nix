# system packages
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    htop
    git
    home-manager
    neofetch
    neovim
    powertop
    tmux
    trash-cli
    tree
    wget
  ];
}

