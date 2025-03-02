{
  description = "Dezash's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
  
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
  
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "github:mikaelfangel/nixvim-config";
      # flake = false;
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
    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    probe-rs-rules = {
      url = "github:jneem/probe-rs-rules";
      flake = false;
    };
  };

  outputs = { nixpkgs, self, ...} @ inputs:
  let
    username = "dezash";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      nix-top = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./modules/hosts/nix-top.nix) ];
        specialArgs = { host="nix-top"; inherit self inputs username ; };
      };
      bigserv = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./modules/hosts/bigserv.nix) ];
        specialArgs = { host="bigserv"; inherit self inputs username ; };
      };
      lilserv = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (import ./modules/hosts/lilserv.nix) ];
        specialArgs = { host="lilserv"; inherit self inputs username ; };
      };
    };
  };
}
