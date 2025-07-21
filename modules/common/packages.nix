{ pkgs, lib, ... }: 
{
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      # pinentryFlavor = "";
    };
    nix-ld = {
      enable = true;
      # libraries = with pkgs; [];
    };
    git = {
      enable = true;
      lfs.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    neovim
    fastfetch
    btop
    lsd
    yazi
    go
    uv
    
    # Bluetooth utilities
    bluetuith
    
    # Media
    spotify
  ];
}
