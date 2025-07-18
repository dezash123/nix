# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Development Commands

### Building and Managing NixOS Configuration
- `nix flake check` - Validate the flake configuration and check for errors
- `sudo nixos-rebuild switch --flake .#nix-top` - Build and switch to the nix-top configuration
- `sudo nixos-rebuild switch --flake .#bigserv` - Build and switch to the bigserv configuration  
- `sudo nixos-rebuild switch --flake .#lilserv` - Build and switch to the lilserv configuration
- `sudo nixos-rebuild test --flake .#<host>` - Test configuration without making it the default
- `nix flake update` - Update all flake inputs to latest versions
- `nix flake lock --update-input <input>` - Update specific input (e.g., nixpkgs, home-manager)

### Home Manager
- `home-manager switch --flake .#<username>@<host>` - Apply home-manager configuration
- `home-manager generations` - List previous generations

### Development and Testing
- `nix develop` - Enter development shell if available
- `nix-shell` - Enter nix-shell for development
- `nix run nixpkgs#<package>` - Run a package temporarily without installing

## Architecture Overview

This is a NixOS configuration flake managing multiple hosts with a modular structure:

### Core Structure
- **flake.nix** - Main flake configuration defining inputs, outputs, and host configurations
- **modules/common/** - Shared system configuration modules (boot, network, packages, security, services, system, user, wayland, xserver)
- **modules/home/** - Home-manager configuration modules for user-specific settings
- **modules/hosts/** - Host-specific configurations (nix-top, bigserv, lilserv)
- **modules/drivers/** - Hardware driver configurations (audio, network, nvidia, flipper_zero)
- **modules/app/** - Application-specific configurations (docker, ollama, custom apps)

### Key Components

#### Host Configuration
- **nix-top** - Laptop/desktop configuration with power management, audio, and development tools
- **bigserv** - Server configuration (currently has missing hardware-configuration.nix)
- **lilserv** - Secondary server configuration

#### Home Manager Integration
- Home-manager is imported as a NixOS module in `modules/home.nix`
- Host-specific home configurations are loaded based on hostname
- User-specific settings include nixvim, hyprland, shell configuration, and application preferences

#### Nixvim Configuration
- Modular neovim configuration using nixvim
- Separated into logical modules: ai.nix, cmp.nix, keymaps.nix, lsp.nix, options.nix, ui.nix, utils.nix
- Utilities organized in `modules/home/nixvim/utils/`

#### Hyprland Setup
- Wayland compositor configuration in `modules/home/hyprland/`
- Includes config, hyprland settings, hyprlock, and environment variables
- Integrated with waybar, fuzzel, and other Wayland-native applications

### Important Notes
- The configuration uses unstable nixpkgs channel
- Unfree and broken packages are allowed in the configuration
- The flake includes various inputs for gaming, hyprland, catppuccin themes, and development tools
- Current issue: bigserv configuration missing hardware-configuration.nix file
- Nixvim has a configuration warning about duplicate lspconfig plugins that should be resolved

### File Organization
- System-wide configurations are in `modules/common/`
- User-specific configurations are in `modules/home/`
- Host-specific overrides are in `modules/hosts/<hostname>/`
- Driver configurations are modular and imported as needed
- Shell scripts for various utilities are in `modules/home/scripts/`

This is a personal NixOS configuration with focus on development tools, Wayland desktop environment, and modular organization for easy maintenance across multiple hosts.