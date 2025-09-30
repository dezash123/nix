{ inputs, ... }: 
{
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./config.nix
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
