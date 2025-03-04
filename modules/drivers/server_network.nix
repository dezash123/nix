{
  services = {
    openssh.enable = true;
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
