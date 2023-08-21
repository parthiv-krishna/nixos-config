# desktop environment configuration

{ pkgs, ... }: {
  imports = [
   ./common.nix
  ];

  services.xserver = {
    enable = true;

    # KDE Plasma 5
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland"; # use Wayland
    };
    desktopManager.plasma5.enable = true;

    # Configure keymap
    layout = "us";
    xkbVariant = "";
  };

  home-manager.users.parthiv = {
    imports = [
      ./packages/alacritty.nix
    ];

    home.packages = with pkgs; [
      firefox
      signal-desktop
      slack
      spotify
      thunderbird
    ];
  };
}

