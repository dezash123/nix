{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  environment.systemPackages =
    (with pkgs; [
      acpi
      brightnessctl
      cpupower-gui
      powertop
    ])
    ++ [
      config.boot.kernelPackages.cpupower
    ];

  services = {
    tlp.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 2;
      criticalPowerAction = "PowerOff";
    };

  };

  hardware.probe-rs.enable = true;

  powerManagement.enable = true;

  services.tlp.settings = {
    SATA_LINKPWR_ON_AC = "max_performance";
    SATA_LINKPWR_ON_BAT = "min_power";
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
    ];
  };
}
