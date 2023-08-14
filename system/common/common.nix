# base for common configuration

{ config, pkgs, ... }:

{
  imports =
    [
      ./desktop.nix
      ./packages.nix
      ./system.nix
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.parthiv = {
    isNormalUser = true;
    description = "Parthiv Krishna";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
