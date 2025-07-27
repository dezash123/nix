# bigserv Host Configuration

This document details the configuration of the `bigserv` host, which is configured as a high-performance server with NVIDIA GPU acceleration and AI/ML capabilities.

## Overview

`bigserv` is a server configuration optimized for compute-intensive workloads, particularly AI/ML tasks. It features NVIDIA GPU support, server networking, and minimal but powerful tooling for headless operation.

## Configuration Structure and Module Organization

### Root Configuration Structure
```
modules/
├── common/           # Shared system configurations
├── drivers/          # Hardware-specific drivers  
├── app/             # Application configurations
├── home/            # Home Manager user configurations
└── hosts/           # Host-specific configurations
    └── bigserv/     # This host's specific config
```

### Core System Modules (`modules/common/`)

#### **boot.nix** - Boot Configuration
- **systemd-boot**: EFI boot loader with UEFI support
- **Kernel**: Latest Linux kernel packages for maximum hardware compatibility
- **Boot entries**: Limited to 20 configurations for clean boot menu
- **EFI variables**: Modification enabled for advanced boot management

#### **network.nix** - Network Configuration  
- **Hostname**: Set to "bigserv" for this host
- **NetworkManager**: Network management (though server typically uses static config)
- **DNS**: Cloudflare DNS (1.1.1.1) for reliable resolution
- **Firewall**: Foundation for server-specific security rules
- **NTP**: Time synchronization critical for server operations

#### **packages.nix** - System Packages
- **Essential Programs**: dconf, zsh, gnupg with SSH support, nix-ld, git with LFS
- **Core Utilities**: wget, neovim, fastfetch, btop, lsd, yazi file manager
- **Development**: go, uv (Python package manager) for AI/ML workflows
- **Connectivity**: bluetuith (though limited use on headless server)
- **Media**: spotify (available but typically unused on server)

#### **security.nix** - Security Framework
- **RTKit**: Real-time scheduling for system services and GPU tasks
- **Sudo**: Privilege escalation for administrative tasks
- **PAM**: Authentication modules (hyprlock not used but configured)
- **Authentication**: Secure session management for server access

#### **services.nix** - System Services
- **File Systems**: gvfs for network filesystems, fstrim for NVMe/SSD maintenance
- **Desktop Integration**: gnome-keyring, dbus (minimal on server)
- **Cloud Sync**: OneDrive and Syncthing for data synchronization
- **Bluetooth**: blueman service (typically disabled on headless server)
- **Power**: Configured for always-on server operation

#### **system.nix** - Core System Settings
- **Nix Configuration**: Flakes enabled, auto-optimization, aggressive garbage collection
- **Caching**: Gaming cache substituter for AI/ML package dependencies
- **Locale**: America/New_York timezone, minimal internationalization
- **Input Methods**: fcitx5 configured but unused on headless server
- **Bluetooth**: Hardware support available but typically unused
- **Compatibility**: Insecure packages permitted for AI/ML dependencies

#### **tmux.nix** - Terminal Multiplexer
- **Configuration**: 24-hour clock for server operations
- **Plugins**: catppuccin theme, weather, CPU/battery monitoring (CPU focus), which-key
- **Server Use**: Critical for managing long-running processes and sessions

#### **user.nix** - User Account Management
- **User Creation**: Normal user account for "dezash" with server privileges
- **Groups**: networkmanager, wheel, dialout, docker (critical for containerization)
- **Shell**: zsh as default shell for productivity
- **Permissions**: Nix allowed users for system management

#### **wayland.nix** - Wayland Display Server
- **Compositor**: Hyprland configured but rarely used on server
- **Portals**: XDG desktop portals for occasional GUI access
- **Environment**: Wayland variables for remote desktop scenarios
- **Compatibility**: Available for rare desktop use cases

#### **xserver.nix** - X11 Display Server
- **Layout**: US keyboard configuration
- **Login**: Auto-login configured for emergency access
- **Input**: Standard input configuration
- **Performance**: Optimized timeouts for server use

### Hardware Drivers (`modules/drivers/`)

#### **server_network.nix** - Server Networking
- **OpenSSH**: Secure remote access with hardened configuration
  - Password authentication enabled (consider key-only for production)
  - Root login disabled for security
  - X11 forwarding disabled to reduce attack surface
  - Keep-alive settings for stable remote sessions
- **Fail2ban**: Intrusion prevention against brute force attacks
- **Tailscale**: VPN mesh networking as server node with routing
- **Firewall**: Restrictive rules with specific service ports:
  - Port 22: SSH access
  - Port 8080: Open WebUI for AI model interaction
  - Port 11434: Ollama API server
- **Security**: Production-ready server network hardening

#### **nvidia.nix** - NVIDIA GPU Configuration
- **License**: NVIDIA proprietary license accepted for CUDA acceleration
- **Driver Configuration**:
  - Modesetting enabled for proper display management
  - Open-source kernel module (Turing+ architecture support)
  - Beta drivers for latest features and AI/ML optimizations
  - NVIDIA settings accessible for configuration
- **Power Management**: Disabled for server stability (no sleep/suspend)
- **Graphics**: Hardware acceleration enabled for compute workloads
- **Compatibility**: Full X11/Wayland support for occasional GUI use

### Application Modules (`modules/app/`)

#### **ollama.nix** - AI/ML Platform
- **Ollama Server**: Large language model serving platform
- **CUDA Acceleration**: GPU-accelerated inference and training
- **Open WebUI**: Web interface for model interaction and management
- **API Server**: RESTful API on port 11434 for programmatic access
- **Model Management**: Local model storage and version management

### Home Manager Configuration (`modules/home/`)

#### **bigserv.nix** - Server User Environment
- **Minimal Desktop**: Essential tools without heavy GUI components
- **Development Focus**: Optimized for AI/ML and server development
- **Performance Tools**: GPU-aware monitoring and system analysis
- **Package Selection**: Server-optimized tool selection

#### **Server-Specific Home Manager Modules**:

##### **Core Productivity Tools**:
- **bat.nix**: Enhanced file viewing with syntax highlighting
- **btop.nix**: System monitor configured with **btop-cuda** for GPU monitoring
- **direnv.nix**: Environment management for development projects
- **fastfetch.nix**: Quick system information display
- **git.nix**: Version control optimized for server development
- **starship.nix**: Fast, informative shell prompt

##### **Development Environment**:
- **nixvim/**: Complete Neovim setup for server development
  - **Language Servers**: Configured for major languages
  - **AI Integration**: Coding assistance and completion
  - **Performance**: Optimized for remote development
- **zsh-bs.nix**: Zsh configuration specific to bigserv (bs = bigserv)

##### **System Tools and Packages** (`packages.nix`):
- **System Monitoring**:
  - `bottom` - Cross-platform system monitor
  - `zenith-nvidia` - NVIDIA-specific GPU monitoring
- **Development Tools**:
  - `cargo-generate` - Rust project templating
  - `conda` - Python environment management for AI/ML
  - `lazygit` - Git management interface
  - `gh` - GitHub CLI for repository management
- **Network and Security**:
  - `openconnect` - VPN client for secure connections
  - `openssl` - Cryptographic tools
- **File Management**:
  - `lsd` - Enhanced directory listings
  - `fd` - Fast file search utility
  - `yazi` - Terminal file manager
  - `fzf` - Fuzzy finder for command line
- **Data Processing**:
  - `ripgrep` - Fast text search
  - `todo` - CLI task management
  - `imagemagick` - Image processing utilities
- **Programming Languages**:
  - `gcc`, `gnumake` - C/C++ development
  - `rustup` - Rust toolchain management
  - `jdk17` - Java development
- **Utilities**:
  - `bitwise` - Bit/hex manipulation
  - `hexdump` - Binary file analysis
  - `valgrind` - Memory analysis and debugging
  - `pkg-config` - Build system helper
  - `pipes` - Terminal screensaver
  - `gtt` - Google Translate CLI
  - `nitch` - System information utility
  - `vim` - Text editor
  - `unzip`, `wget` - Basic utilities

### Server-Specific Optimizations

#### **Performance Configuration**:
- **CPU Governor**: Fixed to performance mode for consistent compute power
- **GPU**: NVIDIA CUDA acceleration for AI/ML workloads
- **Memory**: Optimized for large model loading and processing
- **Storage**: NVMe optimization with regular TRIM operations

#### **Service Management**:
- **Always-On**: Configured for 24/7 operation
- **Monitoring**: Comprehensive system and GPU monitoring
- **Automation**: Automated maintenance and optimization
- **Backup**: Syncthing integration for data safety

## Host-Specific Configuration

Location: `modules/hosts/bigserv/config.nix`

### Performance Configuration
- **CPU Governor**: Fixed to `performance` mode for maximum computational throughput
- **No Power Management**: Optimized for always-on server operation
- **Hardware Configuration**: Includes hardware-specific settings

### Imported Modules
- `../../common` - Base system configuration  
- `../../drivers/server_network.nix` - Server networking with SSH and security
- `../../app/ollama.nix` - AI/ML server with CUDA acceleration
- `../../drivers/nvidia.nix` - NVIDIA GPU drivers and configuration
- `../../home.nix` - Minimal Home Manager setup

## Networking Configuration

### Server Network (`modules/drivers/server_network.nix`)

#### SSH Server
- **OpenSSH**: Enabled with security-focused configuration
- **Authentication**: Password authentication enabled, root login disabled
- **Security Settings**:
  - X11 forwarding disabled
  - MOTD disabled for clean connections
  - Keep-alive settings for stable connections
  - Client timeout: 60 seconds, max 3 retries

#### Security
- **Fail2ban**: Intrusion prevention system enabled
- **Firewall**: Restrictive configuration with specific port allowances
  - **Port 22**: SSH access
  - **Port 8080**: Web services
  - **Port 11434**: Ollama API server

#### VPN Integration
- **Tailscale**: Configured as server node with routing features
- Enables secure remote access to server resources

## GPU Configuration

### NVIDIA Drivers (`modules/drivers/nvidia.nix`)

#### Driver Configuration
- **License**: NVIDIA proprietary license accepted
- **Modesetting**: Enabled for proper display handling
- **Open Source Kernel Module**: Using NVIDIA's open-source kernel module (Turing+ GPUs)
- **Driver Version**: Beta drivers for latest features and performance
- **Settings**: NVIDIA control panel accessible via `nvidia-settings`

#### Power Management
- **Standard Power Management**: Disabled (can cause sleep/suspend issues)
- **Fine-grained Power Management**: Disabled (experimental feature)
- Optimized for always-on server operation

#### Graphics Support
- **Hardware Graphics**: Enabled with full acceleration
- **Redistributable Firmware**: Enabled for maximum hardware compatibility
- **X11/Wayland**: Both supported through unified driver

## AI/ML Infrastructure

### Ollama Configuration (`modules/app/ollama.nix`)

#### Core Services
- **Ollama Server**: AI/ML model serving platform
- **CUDA Acceleration**: GPU-accelerated inference and training
- **Open WebUI**: Web interface for model interaction (accessible on port 8080)

#### Model Management
- Supports running large language models locally
- CUDA acceleration for improved performance
- API server accessible at port 11434
- Web interface for easy model interaction

## Home Manager Configuration

### Server Profile (`modules/home/bigserv.nix`)

#### Essential Tools
- **System Monitoring**: 
  - `btop-cuda` - NVIDIA GPU-aware system monitor
  - `bottom` - Cross-platform system monitor
  - `zenith-nvidia` - NVIDIA-specific monitoring
- **Development**: 
  - Git with configuration
  - Rustup for Rust development
  - C/C++ development tools (gcc, gnumake)
  - Java development (JDK 17)
- **File Management**:
  - `lsd` - Enhanced directory listings
  - `fd` - Fast file search
  - `yazi` - Terminal file manager
- **Network Tools**:
  - `gh` - GitHub CLI
  - `openconnect` - VPN client
- **Data Processing**:
  - `conda` - Python environment management
  - Various CLI utilities for data manipulation

#### Terminal Environment
- **Zsh**: Advanced shell with custom configuration
- **Starship**: Modern, fast prompt
- **Direnv**: Environment variable management
- **Git**: Version control with optimized settings
- **Nixvim**: Neovim with LSP and development plugins

## Security Configuration

### Network Security
- **Restrictive Firewall**: Only essential ports open
- **Fail2ban**: Automated intrusion prevention
- **SSH Hardening**: Secure SSH configuration
- **Tailscale**: Secure mesh networking for remote access

### System Security
- Following NixOS security best practices
- No unnecessary services exposed
- Minimal attack surface for server operation

## Monitoring and Management

### GPU Monitoring
```bash
# Monitor GPU status with CUDA support
btop
zenith-nvidia

# NVIDIA-specific monitoring
nvidia-smi
nvidia-settings
```

### Service Management
```bash
# Check Ollama service status
systemctl status ollama

# Check Open WebUI status  
systemctl status open-webui

# Monitor system resources
btop
```

### Network Status
```bash
# Check SSH connections
systemctl status sshd

# Tailscale status
sudo tailscale status

# Firewall status
sudo ufw status
```

## AI/ML Workflow

### Ollama Usage
```bash
# List available models
ollama list

# Pull a new model
ollama pull llama2

# Run a model
ollama run llama2

# API access
curl http://localhost:11434/api/generate -d '{
  "model": "llama2",
  "prompt": "Why is the sky blue?"
}'
```

### Web Interface
- Access Open WebUI at `http://bigserv:8080` or `http://localhost:8080`
- Provides GUI for model interaction and management
- Supports chat interfaces and model configuration

## Build and Management Commands

```bash
# Build and switch to bigserv configuration
sudo nixos-rebuild switch --flake .#bigserv

# Test build without switching
sudo nixos-rebuild build --flake .#bigserv

# Update NVIDIA drivers (requires rebuild)
nix flake update
sudo nixos-rebuild switch --flake .#bigserv

# Check GPU status
nvidia-smi

# Monitor system performance
btop
```

## Performance Optimization

### CPU Configuration
- Performance governor ensures maximum CPU frequency
- No power scaling for consistent performance
- Optimized for compute workloads

### GPU Utilization
- CUDA acceleration for AI/ML workloads
- Beta drivers for latest features and optimizations
- Open-source kernel module for better integration

### Memory and Storage
- Optimized for large model loading
- Efficient memory management for AI workloads

## Notable Features

1. **High-Performance Computing**: Optimized for compute-intensive workloads
2. **NVIDIA GPU Support**: Full CUDA acceleration with latest drivers
3. **AI/ML Ready**: Ollama server with web interface for model serving
4. **Secure Server Configuration**: Hardened SSH, firewall, and intrusion prevention
5. **Remote Access**: Tailscale mesh networking for secure connections
6. **Monitoring**: GPU-aware system monitoring tools
7. **Development Environment**: Complete toolchain for AI/ML development
8. **Minimal Desktop**: Server-focused with essential GUI tools when needed

This configuration provides a powerful, secure server platform specifically designed for AI/ML workloads with NVIDIA GPU acceleration, while maintaining security best practices and remote accessibility.