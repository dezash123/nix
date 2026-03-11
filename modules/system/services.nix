{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    onedrive.enable = true;
    blueman.enable = true;
    logind.settings.Login.HandlePowerKey="ignore";
    timesyncd.enable = true;
  };
}
