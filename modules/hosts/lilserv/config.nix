{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../drivers/server_network.nix
    ../../drivers/nvidia.nix
    ../../home.nix
  ];  
  powerManagement.cpuFreqGovernor = "performance";
}
