{
  services = {
    openssh = {
      enable = true;
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
    fail2ban.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 8080 11434 ];
    # allowedUDPPorts = [ 59010 59011 ];
    # allowedUDPPortRanges = [
    #   { from = 4000; to = 4007; }
    #   { from = 8000; to = 8010; }
    # ];
  };
}
