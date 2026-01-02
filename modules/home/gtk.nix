{ pkgs, lib, config, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # nerdfonts
    # nerdfonts.
    # nerdfonts.Noto
    noto-fonts
    twemoji-color-font
    noto-fonts-color-emoji
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  gtk = {
    enable = true;
    font = {
      name = "Noto Sans";
      size = 11;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
  };
  
  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 22;
  };
}
