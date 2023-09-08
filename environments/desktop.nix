# desktop environment configuration

{ pkgs, ... }: {
  imports = [
   ./common.nix
  ];

  services.xserver = {
    enable = true;

    excludePackages = with pkgs; [
      xterm
    ];

    # KDE Plasma 5
    # displayManager = {
    #   sddm.enable = true;
    #   defaultSession = "plasmawayland"; # use Wayland
    # };
    # desktopManager.plasma5.enable = true;

    # GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keymap
    layout = "us";
    xkbVariant = "";
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-text-editor
    gnome-tour
    kgx
    orca
  ]) ++ (with pkgs.gnome; [
    cheese
    epiphany
    file-roller
    geary
    gnome-contacts
    gnome-music
    gnome-system-monitor
    totem
    yelp
  ]);

  home-manager.users.parthiv = {
    imports = [
      ./packages/alacritty.nix
      ./packages/dconf.nix
    ];

    home.packages = with pkgs; [
      dconf2nix
      discord
      element-desktop
      firefox
      gnome.gnome-tweaks
      signal-desktop
      slack
      spotify
      thunderbird
      vlc
      zoom-us
    ];
  };
}

