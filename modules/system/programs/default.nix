{ host, pkgs, ... }: 
{
  imports = if host == "nix-top" then [./nix-top.nix] else [./server.nix];

  programs = {
    dconf.enable = true;
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld.enable = true;

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

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

  services = {
    ollama = {
      enable = true;
      host = "0.0.0.0";
    };
  };

  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    bun
    go
    lsd    # better ls
    statix # nix linter
    uv     # better pip
    wget
    typst
    python313Packages.huggingface-hub
  ];
}
