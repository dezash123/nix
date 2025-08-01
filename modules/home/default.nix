{ inputs, username, host, config, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = 
        if (host == "nix-top") then 
          [ ./nix-top.nix ] 
        else
          [ ./server.nix ]
          ++ [
            ./bat.nix
            ./btop.nix
            ./fastfetch.nix
            ./packages
            ./scripts/scripts.nix
            ./starship.nix
            ./git.nix
            ./nixvim
            ./zsh
          ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
      };
      programs.home-manager.enable = true;
    };
    backupFileExtension = "backup";
  };
}
