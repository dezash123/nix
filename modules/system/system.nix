{inputs, ...}: 
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-31.7.7"
        "electron-27.3.11"
        "tightvnc-1.3.10"
        "libsoup-2.74.3"
      ];
      allowBroken = true;
      allowUnfree = true;
    };
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  time.timeZone = "America/New_York";
  
  i18n.defaultLocale = "en_US.UTF-8";
  
  system.stateVersion = "24.11";
}
