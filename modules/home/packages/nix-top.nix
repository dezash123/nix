{ pkgs, system, inputs, ... }: 
{
  home.packages = with pkgs; [
    discord
    firefox
    inputs.zen-browser.packages.x86_64-linux.twilight
    gifsicle                          # gif utility
    gimp
    gtkwave
    kicad
    # python312Packages.kicad
    libreoffice
    nautilus     # file manager
    obsidian
    ocrmypdf
    p7zip
    pdfmm
    pdftk

    qalculate-gtk
    qFlipper
    slack
    soundwireserver                   # pass audio to android phone
    tdf                               # cli pdf viewer

    yt-dlp-light
    x2goclient
    zenity
    winetricks
    wineWowPackages.wayland

    bleachbit                         # cache cleaner
    ffmpeg
    imv                               # image viewer
    killall
    libnotify
	  man-pages					            	  # extra man pages
    mpv                               # video player
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist                          # clipboard manager
    poweralertd
    xdg-utils
    xxd

    # VLSI
    magic-vlsi
    # xyce
    yosys

    vscode
    zed-editor

    tigervnc
  ];
}
