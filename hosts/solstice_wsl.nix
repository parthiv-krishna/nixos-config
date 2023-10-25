# WSL on primary desktop

{ ... }: {
  networking.hostName = "solstice_wsl";

  imports = [
    ../platforms/wsl.nix
    ../environments/common.nix
  ];
}

