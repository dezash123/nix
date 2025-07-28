{ inputs, pkgs, ... }: 
{
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    pam.services.swaylock = {};
    pam.services.hyprlock = {};
  };
}
