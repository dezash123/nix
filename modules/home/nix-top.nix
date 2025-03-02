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
    ./nixvim
    ./packages.nix
    ./scripts/scripts.nix
    ./starship.nix
    ./swaylock.nix
    ./waybar
    ./zsh.nix
  ];
}
