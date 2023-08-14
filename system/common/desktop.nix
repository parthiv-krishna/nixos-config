# desktop environment configuration

{ config, pkgs, ...}:

{
  services.xserver = {
    enable = true;

    # KDE Plasma 5
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    # Configure keymap
    layout = "us";
    xkbVariant = "";
  };
}
