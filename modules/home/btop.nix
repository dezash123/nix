{ host, pkgs, ... }: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      theme_background = false;
      update_ms = 500;
    };
    package = if (host == "nix-top") then pkgs.btop-rocm else pkgs.btop-cuda;
  };  
}
