{ inputs, pkgs, ... }: 
let 
  # _RStudio = pkgs.rstudioWrapper.override { packages = with pkgs.rPackages; [ 
  #   tidyverse
  #   quarto
  #   rmarkdown
  #   rsconnect
  #   packrat
  # ]; };
  # _actflow = pkgs.callPackage ../../pkgs/actflow/package.nix {};
  _irsim = pkgs.callPackage ../../pkgs/irsim/package.nix {};
in
{
  home.packages = with pkgs; [
    # _actflow
    # _irsim
    # _RStudio
    # _xyce

    apfs-fuse
    apfsprogs
    arduino-ide
    audacity
    bambu-studio
    bitwise                           # cli tool for bit / hex manipulation
    cargo-generate
    cbonsai                           # terminal screensaver
    code-cursor
    chatgpt-cli
    claude-code
    discord
    lsd                               # ls replacement
    entr                              # perform action when file change
    fastfetch			      # better neofetch
    fd                                # find replacement
    firefox
    file                              # Show file information 
    fzf                               # fuzzy finder
    google-chrome
    gtt                               # google translate TUI
    gh
    # ghidra
    gifsicle                          # gif utility
    gimp
    gtkwave
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imagemagick
    jdk17                             # java
    jupyter
    kicad-unstable
    lazygit
    libreoffice
    magic-vlsi
    nautilus     # file manager
    nodejs
    # nomachine-client
    nitch                             # systhem fetch util
    niv
    nix-prefetch-github
    obsidian
    ocrmypdf
    onedrivegui
    openconnect
    openssl
    # inputs.nixvim.packages.${system}.default    
    p7zip
    pdfmm
    pdftk
    perl
    pipes                             # terminal screensaver
    pkg-config
    prismlauncher                     # minecraft launcher
    qalculate-gtk
    qFlipper
    ripgrep                           # grep replacement
    slack
    soundwireserver                   # pass audio to android phone
    stm32cubemx
    tdf                               # cli pdf viewer
    texliveFull
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    # tightvnc
    valgrind                          # c memory analyzer
    vscode
    vim
    yt-dlp-light
    x2goclient
    zenity
    winetricks
    wineWowPackages.wayland
    wlvncc

    # C / C++
    gcc
    gnumake

    rustup

    bleachbit                         # cache cleaner
    gparted                           # partition manager
    ffmpeg
    imv                               # image viewer
    killall
    libnotify
	  man-pages					            	  # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist                          # clipboard manager
    poweralertd
    qalculate-gtk                     # calculator
    unzip
    xdg-utils
    xxd

    # VLSI
    magic-vlsi
    # xyce
    yosys
  ];
}
