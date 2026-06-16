{ host, lib, ... }:
{
  imports = [
    ./bat.nix
    ./btop.nix
    ./fastfetch.nix
    ./packages
    ./scripts/scripts.nix
    ./starship.nix
    ./git.nix
    ./nixvim
    ./zsh
  ]
  ++ lib.optionals (host == "nix-top") [
    ./nix-top.nix
  ];
}
