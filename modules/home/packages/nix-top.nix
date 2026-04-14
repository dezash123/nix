{ pkgs, inputs, ... }: 
{
  home.packages = with pkgs; [
    discord
    firefox
    gifsicle                          # gif utility
    gimp
    google-chrome
    gtkwave
    kicad
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
    wineWow64Packages.wayland

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

    # xyce
    # inputs.pcb.packages.${pkgs.system}.default
    yosys
    # irsim
    # actflow
    verible

    vlc
    vscode
    zed-editor

    tigervnc
    zotero
  ];
}
