{ options, host, ...}:
{
  networking = {
    hostName = host;
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    timeServers = options.networking.timeServers.default;
    firewall = {
      enable = true;
      # allowedTCPPorts = [ 22 80 443 59010 59011 ];
      # allowedUDPPorts = [ 59010 59011 ];
      # allowedUDPPortRanges = [
      #   { from = 4000; to = 4007; }
      #   { from = 8000; to = 8010; }
      # ];
    };
  };
}
