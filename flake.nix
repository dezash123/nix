{
  description = "Dezash's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    nix-gaming.url = "github:fufexan/nix-gaming";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };

    probe-rs-rules.url = "github:jneem/probe-rs-rules";
    pcb.url = "github:diodeinc/pcb/v0.3.53";
  };

  outputs =
    {
      nixpkgs,
      self,
      probe-rs-rules,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      username = "dezash";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ self.overlays.default ];
      };

      mkHost =
        host: extraModules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (import ./modules/hosts/${host}/config.nix)
          ]
          ++ extraModules;
          specialArgs = {
            inherit
              host
              self
              inputs
              username
              ;
          };
        };
    in
    {
      overlays.default = import ./pkgs;

      packages.${system} = {
        inherit (pkgs) irsim actflow;
      };

      nixosConfigurations = {
        nix-top = mkHost "nix-top" [
          probe-rs-rules.nixosModules.${pkgs.stdenv.hostPlatform.system}.default
        ];
        bigserv = mkHost "bigserv" [ ];
        lilserv = mkHost "lilserv" [ ];
      };
    };
}
