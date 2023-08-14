# system packages
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    htop
    git
    neofetch
    powertop
    tmux
    trash-cli
    tree
    vim
    wget
  ];
}
