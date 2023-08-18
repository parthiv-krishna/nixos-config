# basic config to bootstrap a complete one

{ ... }: {
  networking.hostName = "icicle";

  imports = [
    ../platforms/common.nix
    ../environments/common.nix
  ];
}

