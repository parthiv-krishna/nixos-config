{ config, pkgs, ... }:

{
  networking.hostName = "nixos";

  imports = [
    ../systems/virtualbox.nix
    ../environments/desktop.nix
  ];
}

