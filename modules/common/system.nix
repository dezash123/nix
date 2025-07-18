{ pkgs, inputs, ...}: 
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
      ];
      allowBroken = true;
      allowUnfree = true;
    };
    overlays = [ inputs.nur.overlays.default ];
  };

  time.timeZone = "America/New_York";
  
  # Bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
  
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk 
        fcitx5-chinese-addons
	      fcitx5-nord
        fcitx5-rime
	      rime-data
      ];           
    };
  };
  
  system.stateVersion = "24.05";
}
