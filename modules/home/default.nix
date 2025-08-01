{ host, ... }: {
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
  ] ++ (if ( host == "nix-top" ) then [
      ./nix-top.nix
  ] else [
      ./server.nix
  ]);
}
