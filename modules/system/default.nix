{ host, lib, ... }:
{
  imports = [
    ./boot.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./drivers
    ./programs
    ./network
    ./home.nix
  ]
  ++ lib.optionals (host == "nix-top") [
    ./graphics
  ];
}
