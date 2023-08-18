# core system configuration

{ lib, ... }: {
  ################
  #### NixOS  ####
  ################
  # enable nix-command and flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.05";

  ################
  ## Bootloader ##
  ################
  # allow overloading (BIOS systems)
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  ################
  # Localization #
  ################
  time.timeZone = "America/Los_Angeles";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  ################
  ## Networking ##
  ################
  networking = {
    networkmanager = {
      enable = true;
    };
  };

  ################
  ### Printing ###
  ################
  services.printing = {
    enable = true; # CUPS
  };

  ################
  #### Audio  ####
  ################
  sound.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

