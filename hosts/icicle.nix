# icicle (Framework 13, AMD Ryzen 7040) configuration

{ ... }: {
  networking.hostName = "icicle";

  imports = [
    ../platforms/framework13-amd7040.nix
    ../environments/desktop.nix
  ];
}

