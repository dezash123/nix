{
  services = {
    openssh.enable = true;
    fail2ban.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
  };
}
