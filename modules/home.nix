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
          [ ./home/nix-top.nix ] 
        else if (host == "bigserv") then
          [ ./home/bigserv.nix ]
        else if (host == "bigserv") then
          [ ./home/lilserv.nix ]
        else
          throw "bad hostname!";
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
