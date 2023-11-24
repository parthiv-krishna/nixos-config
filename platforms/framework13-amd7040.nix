# setup specific to Framework Laptop 13 (AMD Ryzen 7040)

{ config, lib, pkgs, ... }: {
  imports = [
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/framework/13-inch/7040-amd"
    ./common.nix
  ];

  # bluetooth
  hardware.bluetooth.enable = true;

  # enable TRIM for SSD
  services.fstrim.enable = lib.mkDefault true;

  # firmware update
  services.fwupd.enable = true;

  # nixos power management
  powerManagement.enable = lib.mkForce true;

  # disable fingerprint
  services.fprintd.enable = lib.mkForce false;
}

