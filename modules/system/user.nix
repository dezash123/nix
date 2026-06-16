{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "docker"
    ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ username ];
}
