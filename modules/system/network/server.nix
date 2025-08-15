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
    tailscale.useRoutingFeatures = "server";
  };
  networking.firewall.allowedTCPPorts = [ 22 8080 11434 3000 8000 ];
}
