{ ... }: 
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    onedrive.enable = true;
    
    # Bluetooth configuration
    blueman.enable = true;
    
    syncthing = {
        enable = true;
        user = "dezash";
        dataDir = "/home/dezash/Sync";    # Default folder for new synced folders
        configDir = "/home/dezash/.config/syncthing";   # Folder for Syncthing's settings and keys
    };

  };
  services.logind.extraConfig = ''
    # don't shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
