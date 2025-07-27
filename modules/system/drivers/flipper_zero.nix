{ pkgs, inputs, ... }:
{  
  hardware = {
    flipperzero.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
    enableRedistributableFirmware = true;
  };
}
