# desktop environment configuration

{ pkgs, ... }: {
  imports = [
   ./common.nix
  ];

  services = {
    xserver = {
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

  # iOS
  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
  ];

  # fix warning in firefox about speech synthesis
  nixpkgs.config.firefox.speechSynthesisSupport = true;

  home-manager.users.parthiv = {
    imports = [
      ./packages/alacritty.nix
      ./packages/dconf.nix
    ];

    home.packages = with pkgs; [
      brave
      dconf2nix
      discord
      element-desktop
      firefox
      gcc-arm-embedded-9
      gnome.gnome-tweaks
      gnomeExtensions.forge
      joplin-desktop
      kicad
      musescore
      onlyoffice-bin
      protonvpn-gui
      signal-desktop
      slack
      spotify
      steam
      thunderbird
      vlc
      zoom-us
    ];
  };
}

