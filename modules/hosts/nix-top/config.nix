{ pkgs, config, inputs, host, self, username, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../drivers/client_network.nix
    ../../drivers/audio.nix
    ../../drivers/flipper_zero.nix
    ../../home.nix
    ../../app/docker.nix
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];
  
  services = {    
    # thermald.enable = true;
    # cpupower-gui.enable = true;
    power-profiles-daemon.enable = true;
    tlp.enable = true;
 
    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 2;
      criticalPowerAction = "PowerOff";
    };

    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #     charger = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #   };
    # };
  };

  hardware.probe-rs.enable = true;

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
    scsiLinkPolicy = "min_power";
  };

  

  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [pkgs.cpupower-gui];
  };
}
