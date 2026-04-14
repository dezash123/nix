{
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      layer = "overlay";
      sort = "-time";
      max-history = 100;
      max-visible = 5;
      default-timeout = 10000;
      ignore-timeout = true;
      width = 480;
      height = 160;
      outer-margin = "3,3,3,3";
      margin = "0";
      padding = "12";
      border-size = 2;
      border-radius = 10;
      icons = true;
      max-icon-size = 48;
      markup = true;
      actions = true;
      history = true;
      font = "Noto Sans 11";
      background-color = "#11111be6";
      text-color = "#cdd6f4ff";
      border-color = "#fb1830ff";
      progress-color = "over #89b4faff";
      format = "<b>%s</b>\\n%b";

      "urgency=low" = {
        default-timeout = 5000;
      };

      "urgency=critical" = {
        default-timeout = 0;
        border-color = "#4020d4ff";
      };

      "mode=do-not-disturb" = {
        invisible = true;
      };
    };
  };
}
