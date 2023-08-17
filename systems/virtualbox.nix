{ config, pkgs, lib, ... }:

{
  imports = [
    ./common.nix
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
}

