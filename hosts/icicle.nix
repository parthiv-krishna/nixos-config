# icicle (Framework 13, 13th Gen Intel) configuration

{ config, pkgs, ... }:

{
  networking.hostName = "icicle";

  imports = [
    ../environments/desktop.nix
    ../systems/framework13-intel13thgen.nix
  ];
}
