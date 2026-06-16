{ host, lib, ... }:
{
  services = {
    dbus.enable = true;
    fstrim.enable = true;
    logind.settings.Login.HandlePowerKey = "ignore";
    timesyncd.enable = true;
  }
  // lib.optionalAttrs (host == "nix-top") {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    onedrive.enable = true;
  };
}
