{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bluetuith
    spotify
    networkmanagerapplet
  ];
}
