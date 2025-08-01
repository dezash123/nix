{ host, pkgs, ...}: {
  imports = if (host == "nix-top") then [./nix-top.nix] else [./server.nix];
  home.packages = with pkgs; [
    bitwise                           # cli tool for bit / hex manipulation
    cargo-generate
    claude-code
    fd                                # find replacement
    file                              # Show file information 
    fzf                               # fuzzy finder
    gtt                               # google translate TUI
    gh
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    jupyter
    lazygit
    nitch                             # systhem fetch util
    niv
    nix-prefetch-github
    openconnect
    openssl
    perl
    pkg-config
    ripgrep                           # grep replacement
    toipe                             # typing test in the terminal
    valgrind                          # c memory analyzer
    vim

    # C / C++
    gcc
    gnumake

    rustup

    openssl
    unzip
    docling
  ];
}
