{ host, lib, ... }:
{
  imports = [
    (if host == "nix-top" then ./flipper_zero.nix else ./nvidia.nix)
  ]
  ++ lib.optionals (host == "nix-top") [
    ./audio.nix
  ];
}
