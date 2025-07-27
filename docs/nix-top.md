# nix-top Host Configuration

This document details the configuration of the `nix-top` host, which is configured as a laptop/workstation with comprehensive desktop environment and power management.

## Overview

`nix-top` is a laptop configuration optimized for mobile use with full desktop capabilities. It includes power management, Wayland desktop environment, development tools, and client networking.

## Configuration Structure and Module Organization

### Root Configuration Structure
```
modules/
├── common/           # Shared system configurations
├── drivers/          # Hardware-specific drivers  
├── app/             # Application configurations
├── home/            # Home Manager user configurations
└── hosts/           # Host-specific configurations
    └── nix-top/     # This host's specific config
```

### Core System Modules (`modules/common/`)

#### **boot.nix** - Boot Configuration
- **systemd-boot**: EFI boot loader with UEFI support
- **Kernel**: Latest Linux kernel packages
- **Boot entries**: Limited to 20 configurations
- **EFI variables**: Modification enabled for boot management

#### **network.nix** - Network Configuration  
- **Hostname**: Set to "nix-top" for this host
- **NetworkManager**: GUI network management
- **DNS**: Cloudflare DNS (1.1.1.1) as primary nameserver
- **Firewall**: Enabled with configurable port rules
- **NTP**: Standard time synchronization

#### **packages.nix** - System Packages
- **Essential Programs**: dconf, zsh, gnupg with SSH support, nix-ld, git with LFS
- **Core Utilities**: wget, neovim, fastfetch, btop, lsd, yazi file manager
- **Development**: go, uv (Python package manager)  
- **Connectivity**: bluetuith for Bluetooth management
- **Media**: spotify for music streaming

#### **security.nix** - Security Framework
- **RTKit**: Real-time scheduling for audio and system services
- **Sudo**: Privilege escalation configuration
- **PAM**: Authentication modules for hyprlock screen locker
- **Authentication**: Secure login and session management

#### **services.nix** - System Services
- **File Systems**: gvfs for virtual filesystems, fstrim for SSD maintenance
- **Desktop Integration**: gnome-keyring, dbus message bus
- **Cloud Sync**: OneDrive and Syncthing for file synchronization
- **Bluetooth**: blueman service for device management
- **Power**: Disabled power button immediate shutdown

#### **system.nix** - Core System Settings
- **Nix Configuration**: Flakes enabled, auto-optimization, garbage collection
- **Caching**: Gaming cache substituter for faster package downloads
- **Locale**: America/New_York timezone, internationalization with fcitx5
- **Input Methods**: Chinese, Japanese, and Rime input support
- **Bluetooth**: Hardware support with experimental features
- **Compatibility**: Insecure packages permitted for legacy software

#### **tmux.nix** - Terminal Multiplexer
- **Configuration**: 24-hour clock display
- **Plugins**: catppuccin theme, weather widget, CPU/battery monitoring, which-key helper

#### **user.nix** - User Account Management
- **User Creation**: Normal user account for "dezash"
- **Groups**: networkmanager, wheel, dialout, docker access
- **Shell**: zsh as default shell
- **Permissions**: Nix allowed users configuration

#### **wayland.nix** - Wayland Display Server
- **Compositor**: Hyprland window manager
- **Portals**: XDG desktop portals for application integration
- **Environment**: Wayland-specific environment variables
- **Compatibility**: Wayland support for Electron applications

#### **xserver.nix** - X11 Display Server (Fallback)
- **Layout**: US keyboard with Caps Lock as group toggle
- **Login**: Auto-login for configured user
- **Input**: libinput with flat mouse acceleration profile
- **Performance**: 10-second shutdown timeout

### Hardware Drivers (`modules/drivers/`)

#### **client_network.nix** - Client Networking
- **Tailscale**: VPN mesh networking as client node
- **Network Tools**: NetworkManager applet for GUI management
- **Routing**: Client-side routing features enabled

#### **audio.nix** - Audio System
- **PipeWire**: Modern audio server replacing PulseAudio
- **ALSA**: Full compatibility with 32-bit application support
- **Real-time**: RTKit integration for low-latency audio
- **Legacy**: PulseAudio compatibility layer for older applications

#### **flipper_zero.nix** - Hardware Hacking Device
- **Device Support**: Direct Flipper Zero hardware integration
- **Graphics**: Hardware acceleration support
- **Firmware**: Redistributable firmware packages enabled

### Application Modules (`modules/app/`)

#### **docker.nix** - Containerization
- **Docker Engine**: Container runtime and management
- **User Access**: Docker group membership for containerization
- **Networking**: Container networking and port management

#### **ollama-small.nix** - Local AI
- **Ollama**: Local large language model serving
- **Acceleration**: ROCm (AMD GPU) acceleration support
- **Optimization**: Configured for laptop hardware constraints

### Home Manager Configuration (`modules/home/`)

#### **nix-top.nix** - Desktop User Environment
- **Desktop Components**: Complete Wayland desktop setup
- **Applications**: Development tools, media players, productivity software
- **Theming**: GTK themes and desktop appearance
- **File Associations**: MIME type mappings for file handling

#### **Key Home Manager Modules**:

##### **hyprland/** - Wayland Compositor
- **hyprland.nix**: Window manager configuration and keybindings
- **config.nix**: Custom window rules and workspace setup  
- **hyprlock.nix**: Screen lock configuration and security
- **variables.nix**: Environment variables for Wayland

##### **waybar/** - Status Bar
- **waybar.nix**: Main status bar configuration
- **settings.nix**: Widget configuration and layout
- **style.nix**: CSS styling and appearance

##### **nixvim/** - Neovim Configuration
- **default.nix**: Main Neovim setup
- **lsp.nix**: Language Server Protocol configuration
- **cmp.nix**: Completion engine setup
- **keymaps.nix**: Custom keybinding mappings
- **options.nix**: Editor options and behavior
- **ui.nix**: User interface and appearance
- **ai.nix**: AI-assisted coding features
- **utils.nix**: Utility plugins and tools
- **utils/**: Specific utility configurations
  - **telescope.nix**: Fuzzy finder and file navigation
  - **mini.nix**: Mini plugin suite
  - **auto-pairs.nix**: Automatic bracket pairing
  - **autosave.nix**: Automatic file saving

##### **scripts/** - Custom Automation
- **scripts.nix**: Script package definitions
- **scripts/**: Individual shell scripts
  - **wall-change.sh**: Wallpaper rotation system
  - **wallpaper-picker.sh**: Interactive wallpaper selection
  - **music.sh / lofi.sh**: Audio streaming utilities
  - **toggle_blur.sh / toggle_oppacity.sh**: Visual effects control
  - **compress.sh / extract.sh**: Archive management
  - **shutdown-script.sh**: System shutdown with options
  - **keybinds.sh**: Keyboard shortcut display
  - **vm-start.sh**: Virtual machine launcher
  - **record.sh**: Screen recording utility

##### **Individual Configuration Modules**:
- **bat.nix**: Better cat with syntax highlighting
- **btop.nix**: System resource monitor  
- **direnv.nix**: Environment variable management
- **fastfetch.nix**: System information display
- **fuzzel.nix**: Application launcher for Wayland
- **git.nix**: Version control configuration
- **gtk.nix**: GTK theme and appearance settings
- **kitty.nix**: Terminal emulator configuration
- **neovide.nix**: Neovim GUI client
- **packages.nix**: User-level package installations
- **starship.nix**: Cross-shell prompt configuration
- **swaylock.nix**: Alternative screen locker
- **swaync/** - Notification Center
  - **swaync.nix**: Notification daemon configuration
  - **config.json**: Notification behavior settings
  - **style.css**: Notification appearance styling
- **vscodium.nix**: Open-source VS Code configuration
- **zen.nix**: Alternative browser setup
- **zsh-nt.nix**: Zsh shell configuration for nix-top

## Host-Specific Configuration

Location: `modules/hosts/nix-top/config.nix`

### Power Management
- **TLP (Linux Advanced Power Management)**: Enabled for laptop battery optimization
- **UPower**: Battery monitoring with customized thresholds:
  - Low battery: 20%
  - Critical battery: 5%
  - Action threshold: 2% (PowerOff)
- **CPU Power Management**: Dynamic governor switching between AC/battery
  - AC power: `performance` governor
  - Battery: `powersave` governor
- **SATA Link Power Management**: Optimized for power saving on battery

### Hardware Support
- **ACPI Support**: ACPI call module for advanced laptop features
- **Probe-rs**: Hardware debugging support for embedded development
- **Power Monitoring Tools**: 
  - `acpi` - ACPI information
  - `brightnessctl` - Display brightness control
  - `cpupower-gui` - CPU frequency management GUI
  - `powertop` - Power consumption analysis

### Imported Modules
- `../../common` - Base system configuration
- `../../drivers/client_network.nix` - Tailscale client networking
- `../../drivers/audio.nix` - PipeWire audio system
- `../../drivers/flipper_zero.nix` - Flipper Zero hardware support
- `../../home.nix` - Home Manager integration
- `../../app/docker.nix` - Docker containerization
- `../../app/ollama-small.nix` - Local AI with ROCm acceleration

## Networking Configuration

### Client Network (`modules/drivers/client_network.nix`)
- **Tailscale**: VPN client with routing features
- **NetworkManager**: GUI applet for network management
- Configured as a client in the mesh network

## Audio System

### PipeWire Setup (`modules/drivers/audio.nix`)
- **PipeWire**: Modern audio server replacing PulseAudio
- **ALSA Support**: Full ALSA compatibility with 32-bit support
- **PulseAudio Compatibility**: Legacy application support
- **Real-time Audio**: RTKit enabled for low-latency audio
- Includes `pulseaudioFull` for comprehensive audio tools

## Hardware Drivers

### Flipper Zero Support (`modules/drivers/flipper_zero.nix`)
- **Hardware Integration**: Direct Flipper Zero device support
- **Graphics**: Hardware-accelerated graphics with extra packages
- **Firmware**: Redistributable firmware enabled

## Desktop Environment

### Wayland with Hyprland
Located in `modules/home/hyprland/`:
- **Hyprland**: Tiling Wayland compositor
- **Configuration**: Custom keybindings and window rules
- **Lock Screen**: Hyprlock for secure screen locking
- **Environment Variables**: Wayland-specific variables

### Desktop Components
- **Waybar**: Status bar with system monitoring
- **SwayNC**: Notification center
- **Fuzzel**: Application launcher
- **Kitty**: Terminal emulator
- **GTK Theming**: Consistent desktop theming

### Custom Scripts
Location: `modules/home/scripts/scripts.nix`

Available custom commands:
- `wall-change` / `wallpaper-picker` - Wallpaper management
- `runbg` - Background process launcher
- `music` / `lofi` - Audio streaming utilities
- `toggle_blur` / `toggle_oppacity` - Visual effects control
- `compress` / `extract` - Archive management
- `shutdown-script` - System shutdown with options
- `show-keybinds` - Display keyboard shortcuts
- `vm-start` - Virtual machine launcher
- `ascii` - ASCII art display
- `record` - Screen recording utility

## Development Environment

### Core Tools
- **Nixvim**: Comprehensive Neovim configuration with LSP support
- **Git**: Version control with LFS support
- **Docker**: Containerization support
- **Direnv**: Environment management
- **Development Languages**: 
  - Rust (via rustup)
  - C/C++ (gcc, gnumake)
  - Java (JDK 17)
  - Go, Python (uv)

### File Management
- **Yazi**: Terminal file manager
- **Comprehensive MIME associations**: 
  - Firefox for web content and documents
  - LibreOffice for office documents
  - MPV for media playback
  - IMV for image viewing
  - Calibre for e-books

## AI and Machine Learning

### Ollama Configuration (`modules/app/ollama-small.nix`)
- **ROCm Acceleration**: AMD GPU acceleration for AI workloads
- Optimized for laptop hardware with smaller models

## Build and Management Commands

```bash
# Build and switch to nix-top configuration
sudo nixos-rebuild switch --flake .#nix-top

# Test build without switching
sudo nixos-rebuild build --flake .#nix-top

# Check power status
acpi -b
powertop

# Monitor CPU frequency
cpupower-gui

# Control display brightness
brightnessctl set 50%

# Check Tailscale status
sudo tailscale status
```

## Power Optimization

### TLP Settings
- SATA link power management optimized for AC/battery states
- CPU scaling governor automatically switches based on power source
- Power management enabled globally

### Battery Monitoring
- UPower configured with appropriate warning thresholds
- Automatic power-off when battery reaches critical level (2%)
- Desktop notifications for battery status changes

## Notable Features

1. **Dual Power Profiles**: Automatic switching between performance and power-saving modes
2. **Complete Desktop Environment**: Full Wayland setup with modern components
3. **Development Ready**: Comprehensive toolchain for multiple programming languages
4. **Hardware Integration**: Support for specialized hardware like Flipper Zero
5. **Mesh Networking**: Tailscale integration for secure remote access
6. **AI Capabilities**: Local LLM support with hardware acceleration
7. **Media Production**: Screen recording, image manipulation, and media playback
8. **Customization**: Extensive custom scripts for workflow optimization

This configuration provides a powerful, efficient laptop setup suitable for development, content creation, and general productivity work while maintaining excellent battery life through intelligent power management.