{
  services = {
    tailscale.useRoutingFeatures = "client";

    openssh = {
      enable = true;
      openFirewall = false;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
        X11Forwarding = false;
        PrintMotd = false;
        TCPKeepAlive = true;
        ClientAliveInterval = 60;
        ClientAliveCountMax = 3;
      };
    };
  };

  networking.firewall.interfaces.tailscale0.allowedTCPPorts = [ 22 ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
