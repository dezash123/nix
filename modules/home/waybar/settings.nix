{
  programs.waybar.settings.mainBar = {
    position = "bottom";
    layer = "top";
    height = 5;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "pulseaudio"
      "battery"
      "network"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#b4befe'><b><u>{}</u></b></span>";
        };
      };
      format = "{:%I:%M:%S}";
      tooltip = true;
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      format-alt = "{:%m/%d/%Y}";
      interval = 1;
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
    };
    memory = {
      format-alt = "RAM {}%";
      format = "{used} GiB";
      interval = 2;
    };
    cpu = {
      format = "CPU {usage}%";
      format-alt = "{avg_frequency} GHz";
      interval = 2;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "  {volume}%";
      format-muted = "  {volume}%";
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    battery = {
      format = "{icon} {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
  };
}
