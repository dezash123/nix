{inputs, username, host, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./fastfetch.nix
    ./fuzzel.nix
    ./git.nix
    ./gtk.nix
    ./hyprland
    ./kitty.nix
    ./swaync/swaync.nix
    ./nixvim.nix
    ./packages.nix
    ./scripts/scripts.nix
    ./starship.nix
    ./swaylock.nix
    ./waybar
    ./zsh.nix
  ];

  # Set Firefox as default browser
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
