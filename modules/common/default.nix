{ inputs, nixpkgs, self, username, host, ...}:
{
  imports = [
    ./boot.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./tmux.nix
    ./user.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
