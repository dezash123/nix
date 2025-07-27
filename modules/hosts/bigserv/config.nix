{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../home.nix
  ];  
  powerManagement.cpuFreqGovernor = "performance";
}
