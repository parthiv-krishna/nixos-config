# setup specific to Framework Laptop 13 (Intel 13th Gen)
# based on https://github.com/FrameworkComputer/linux-docs/blob/main/Ubuntu23.04-Manual-Setup-13thGen.md

{ config, lib, pkgs, ... }: {
  imports = [
    ./common.nix
  ];

  # bluetooth
  hardware.bluetooth.enable = true;

  # enable headset mic input
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=dell-headset-multi
  '';

  # disable ambient light sensor so the brightness keys work
  boot.blacklistedKernelModules = [ "hid-sensor-hub" ];
  hardware.acpilight.enable = lib.mkDefault true;

  # set up brightness and airplane mode keys
  systemd.services.bind-keys-driver = {
    description = "Set up brightness and airplane mode keys";
    wantedBy = [ "default.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    script = ''
      if [ -e /sys/bus/i2c/devices/i2c-FRMW0001:00 -a ! -e /sys/bus/i2c/drivers/i2c_hid_acpi/i2c-FRMW0001:00 ]; then
        echo i2c-FRMW0001:00 > /sys/bus/i2c/drivers/i2c_hid_acpi/bind
        ls -lad /sys/bus/i2c/devices/i2c-*:* /sys/bus/i2c/drivers/i2c_hid_acpi/i2c-*:*
      fi
    '';
  };

  boot.kernelParams = [
    # power saving: RAM deep sleep
    "mem_sleep_default=deep"
    # power saving: disable NVMe ACPI
    "nvme.noacpi=1"
  ];

  # enable TRIM for SSD
  services.fstrim.enable = lib.mkDefault true;

  # use TLP instead of power-profiles-daemon
  services.power-profiles-daemon.enable = lib.mkForce false;
  services.tlp.enable = lib.mkForce true;

  # nixos power management
  powerManagement.enable = lib.mkForce true;

  # intel microcode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # fingerprint
  services.fprintd.enable = lib.mkDefault true;
}

