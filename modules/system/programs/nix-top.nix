{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bluetuith
    spotify
    networkmanagerapplet
  ];

  # china
  # i18n.inputMethod = {
  #   type = "fcitx5";
  #   enable = true;
  #   fcitx5.addons = with pkgs; [
  #     fcitx5-mozc
  #     fcitx5-gtk 
  #     fcitx5-chinese-addons
  #     fcitx5-nord
  #     fcitx5-rime
  #     rime-data
  #   ];           
  # };
}
