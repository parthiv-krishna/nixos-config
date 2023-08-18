# virtualbox virtual machine

{ ... }: {
  networking.hostName = "norther";

  imports = [
    ../platforms/virtualbox.nix
    ../environments/desktop.nix
  ];
}

