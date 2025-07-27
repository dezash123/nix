{ host, pkgs, ... }: 
{
  imports = if host == "nix-top" then [./nix-top.nix] else [./server.nix];

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
    };

    git = {
      enable = true;
      lfs.enable = true;
    };

    yazi.enable = true;
    neovim.enable = true;

    tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs.tmuxPlugins; [ catppuccin weather cpu battery tmux-which-key ];
    };
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    fastfetch
    btop
    lsd
    go
    uv
  ];
}
