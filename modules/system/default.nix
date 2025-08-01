{ host, ... }: {
  imports = if host == "nix-top" then [
    ./boot.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./drivers
    ./programs
    ./network
    ./graphics
    ./home.nix
  ] else [
    ./boot.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./drivers
    ./programs
    ./network
    ./home.nix
  ];
}
