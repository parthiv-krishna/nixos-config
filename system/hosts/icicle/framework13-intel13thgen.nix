# setup specific to Framework Laptop 13 (Intel 13th Gen)
# based on https://github.com/FrameworkComputer/linux-docs/blob/main/Ubuntu23.04-Manual-Setup-13thGen.md

{ config, pkgs, lib, ...}:

{
  # enable headset mic input
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=dell-headset-multi
  '';

  # disable ambient light sensor so the brightness keys work
  boot.blacklistedKernelModules = [ "hid-sensor-hub" ];

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
  services.tlp.enable = lib.mkDefault true;

  # intel microcode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

