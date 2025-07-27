{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../drivers/server_network.nix
    ../../app/ollama.nix
    ../../drivers/nvidia.nix
    ../../home.nix
  ];  
  powerManagement.cpuFreqGovernor = "performance";
}
