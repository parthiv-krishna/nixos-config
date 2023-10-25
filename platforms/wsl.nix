# Windows Subsystem for Linux

{ lib, ... }: {
  imports = [
    ./common.nix
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "parthiv";

  # disable systemd-boot, boot handled by wsl above
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
  hardware.enableRedistributableFirmware = lib.mkForce false;
}

