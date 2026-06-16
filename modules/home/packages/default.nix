{
  host,
  lib,
  pkgs,
  ...
}:
{
  imports = lib.optionals (host == "nix-top") [ ./nix-top.nix ];

  home.packages = with pkgs; [
    bitwise # cli tool for bit / hex manipulation
    bubblewrap
    cargo-generate
    fd # find replacement
    file # show file information
    fzf # fuzzy finder
    gtt # google translate TUI
    gh
    glab
    gtrash # rm replacement, put deleted files in system trash
    hexdump
    jupyter
    lazygit
    ncdu # disk space
    nitch # systhem fetch util
    niv
    nix-prefetch-github
    openconnect
    openssl
    perl
    pkg-config
    ripgrep # grep replacement
    toipe # typing test in the terminal
    valgrind # c memory analyzer
    vim

    # C / C++
    gcc
    gnumake

    rustup

    unzip
  ];
}
