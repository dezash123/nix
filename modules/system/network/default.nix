{ options, host, ...}: {
  imports = if host == "nix-top" then [./nix-top.nix] else [./server.nix];
  networking = {
    hostName = host;
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    timeServers = options.networking.timeServers.default;
    firewall.enable = true;
  };
  services.tailscale.enable = true;
}
