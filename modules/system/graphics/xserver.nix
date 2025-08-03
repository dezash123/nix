{ pkgs, username, ... }: 
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "grp:caps_toggle,grp_led:scroll";
      };
      displayManager.lightdm.enable = false;
    };

    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
