# fonts configuration, should be imported to home-manager

{ pkgs, ... }: {
  # fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Lilex" ]; })
  ];
}

