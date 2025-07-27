{ host, ... }: {
  imports = if host == "nix-top" then [
    ./audio.nix
    ./flipper_zero.nix
  ] else [
    ./nvidia.nix
  ];
}
