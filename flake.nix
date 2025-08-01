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

    zen-browser = {
      url = "0xc000022070/zen-browser-flake";
    };
  };

  outputs = { nixpkgs, self, probe-rs-rules, ...} @ inputs:
  let
    username = "dezash";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      config.allowBroken = true;
    };
    inherit (nixpkgs) lib;
  in
  {
    nixosConfigurations = {
      nix-top = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./modules/hosts/nix-top/config.nix)
          probe-rs-rules.nixosModules.${pkgs.system}.default
        ];
        specialArgs = { host="nix-top"; inherit self inputs username ; };
      };
      bigserv = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./modules/hosts/bigserv/config.nix) ];
        specialArgs = { host="bigserv"; inherit self inputs username ; };
      };
      lilserv = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./modules/hosts/lilserv/config.nix) ];
        specialArgs = { host="lilserv"; inherit self inputs username ; };
      };
    };
  };
}
