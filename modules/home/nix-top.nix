{inputs, username, host, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./fastfetch.nix
    ./fuzzel.nix
    ./git.nix
    ./gtk.nix
    ./hyprland
    ./kitty.nix
    ./swaync/swaync.nix
    ./neovide.nix
    ./nixvim/default.nix
    ./packages.nix
    ./scripts/scripts.nix
    ./starship.nix
    ./swaylock.nix
    ./waybar
    ./zsh.nix
  ];

  # Set default applications for file types
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web browsers - Firefox
      "text/html" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      
      # Documents - Firefox for viewing, LibreOffice for editing
      "application/pdf" = "firefox.desktop";
      "application/json" = "firefox.desktop";
      "application/xml" = "firefox.desktop";
      "text/xml" = "firefox.desktop";
      "text/plain" = "firefox.desktop";
      "application/rtf" = "firefox.desktop";
      
      # LibreOffice Writer - Word documents
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop"; # .docx
      "application/msword" = "libreoffice-writer.desktop"; # .doc
      "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop"; # .odt
      
      # LibreOffice Calc - Spreadsheets
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop"; # .xlsx
      "application/vnd.ms-excel" = "libreoffice-calc.desktop"; # .xls
      "text/csv" = "libreoffice-calc.desktop"; # .csv
      "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop"; # .ods
      
      # LibreOffice Impress - Presentations
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop"; # .pptx
      "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop"; # .ppt
      "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop"; # .odp
      
      # E-books - Calibre
      "application/epub+zip" = "calibre-ebook-viewer.desktop"; # .epub
      "application/x-mobipocket-ebook" = "calibre-ebook-viewer.desktop"; # .mobi
      "application/x-amazon-ebook" = "calibre-ebook-viewer.desktop"; # .azw
      "application/vnd.amazon.ebook" = "calibre-ebook-viewer.desktop"; # .azw3
      
      # Images - Image viewer
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/bmp" = "imv.desktop";
      "image/tiff" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "firefox.desktop"; # SVG can be viewed in Firefox
      
      # Videos - MPV
      "video/mp4" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop"; # .avi
      "video/quicktime" = "mpv.desktop"; # .mov
      "video/x-matroska" = "mpv.desktop"; # .mkv
      "video/webm" = "mpv.desktop";
      
      # Audio - MPV
      "audio/mpeg" = "mpv.desktop"; # .mp3
      "audio/ogg" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      
      # Archives - File manager
      "application/zip" = "org.gnome.Nautilus.desktop";
      "application/x-tar" = "org.gnome.Nautilus.desktop";
      "application/x-7z-compressed" = "org.gnome.Nautilus.desktop";
      "application/x-rar-compressed" = "org.gnome.Nautilus.desktop";
    };
  };
}
