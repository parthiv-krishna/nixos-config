{ config, pkgs, ... }:

{
  networking.hostName = "nixos";

  imports = [
    ../systems/common.nix
    ../environments/common.nix
  ];
}

