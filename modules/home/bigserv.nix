{inputs, username, host, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./fastfetch.nix
    ./git.nix
    ./nixvim
    ./bigserv-packages.nix
    ./starship.nix
    ./zsh.nix
  ];
}
