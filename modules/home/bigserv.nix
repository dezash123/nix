{inputs, username, host, pkgs, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./fastfetch.nix
    ./starship.nix
    ./git.nix
    ./nixvim
    ./zsh-bs.nix
  ];

  programs.btop.package = pkgs.btop-cuda;

  home.packages = with pkgs; [
    bitwise                           # cli tool for bit / hex manipulation
    bottom
    cargo-generate
    conda
    lsd                               # ls replacement
    fastfetch                 # better neofetch
    fd                                # find replacement
    file                              # Show file information 
    fzf                               # fuzzy finder
    gtt                               # google translate TUI
    gh
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imagemagick
    jdk17                             # java
    lazygit
    nitch                             # systhem fetch util
    niv
    nix-prefetch-github
    openconnect
    openssl
    pipes                             # terminal screensaver
    pkg-config
    ripgrep                           # grep replacement
    todo                              # cli todo list
    valgrind                          # c memory analyzer
    vim
    yazi                              # terminal file manager

    # C / C++
    gcc
    gnumake

    rustup

    openssl
    unzip
    wget
  ];
}
