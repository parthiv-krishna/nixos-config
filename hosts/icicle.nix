# icicle (Framework 13, 13th Gen Intel) configuration

{ ... }: {
  networking.hostName = "icicle";

  imports = [
    ../platforms/framework13-intel13thgen.nix
    ../environments/desktop.nix
  ];
}

