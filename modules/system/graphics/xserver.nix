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
}
