{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
