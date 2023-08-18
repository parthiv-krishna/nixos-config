# VirtualBox VM

{ lib, ... }: {
  imports = [
    ./common.nix
  ];

  # VirtualBox uses BIOS while systemd-boot omly supports UEFI
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
}

