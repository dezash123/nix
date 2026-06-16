# Thermo-Nuclear Code Quality Audit

Scope: every repository-local file under `/home/dezash/nix`, excluding `.git` internals. Tracked files, ignored local config, generated hardware config, binary assets, lock data, and files removed during the audit are all accounted for.

## Fix Log

- Removed hard-coded Tavily API key from `.mcp.json` and fixed the enabled MCP server name in `.claude/settings.local.json`.
- Added a canonical flake overlay, exposed both custom packages, and removed global `allowBroken`.
- Deleted stale unused modules for inactive Zen, Obsidian, Swaylock, Hypridle, server placeholders, and duplicate custom package definitions.
- Reworked Home and system host conditionals to avoid duplicated import lists and desktop services leaking into servers.
- Repaired shell scripts, added explicit runtime dependencies, fixed syntax errors, quoted paths, and passed ShellCheck.
- Cleaned Nixvim config: removed disabled-plugin keymaps, aligned cmp sources, fixed TODO items, and removed duplicate auto-save config.
- Simplified Hyprland bindings, made `configType = "hyprlang"` explicit, and removed stale lock/idle comments.
- Deduplicated CUDA package config and moved non-kernel tools out of `boot.extraModulePackages`.
- Ran `nixfmt`, `statix`, `deadnix`, `shellcheck`, per-host NixOS evals, and `nix flake check`.

## Validation

- [x] `bash -n modules/home/scripts/scripts/*.sh`
- [x] `nix run nixpkgs#shellcheck -- modules/home/scripts/scripts/*.sh`
- [x] `nix run nixpkgs#statix -- check .`
- [x] `nix run nixpkgs#deadnix -- .`
- [x] `nix eval .#nixosConfigurations.nix-top.config.system.build.toplevel.drvPath --raw`
- [x] `nix eval .#nixosConfigurations.bigserv.config.system.build.toplevel.drvPath --raw`
- [x] `nix eval .#nixosConfigurations.lilserv.config.system.build.toplevel.drvPath --raw`
- [x] `nix flake check --allow-import-from-derivation`

## Audited Current Files

- [x] `.agents/skills/thermo-nuclear-code-quality-review/SKILL.md`
- [x] `.claude/settings.local.json`
- [x] `.gitignore`
- [x] `.mcp.json`
- [x] `CLAUDE.md`
- [x] `CODE_QUALITY_AUDIT.md`
- [x] `assets/nixos-logo.png`
- [x] `flake.lock`
- [x] `flake.nix`
- [x] `modules/home/bat.nix`
- [x] `modules/home/btop.nix`
- [x] `modules/home/default-apps.nix`
- [x] `modules/home/default.nix`
- [x] `modules/home/fastfetch.nix`
- [x] `modules/home/fuzzel.nix`
- [x] `modules/home/git.nix`
- [x] `modules/home/gtk.nix`
- [x] `modules/home/hyprland/config.nix`
- [x] `modules/home/hyprland/default.nix`
- [x] `modules/home/hyprland/hyprland.nix`
- [x] `modules/home/hyprland/variables.nix`
- [x] `modules/home/kitty.nix`
- [x] `modules/home/mako.nix`
- [x] `modules/home/neovide.nix`
- [x] `modules/home/nix-top.nix`
- [x] `modules/home/nixvim/TODO.md`
- [x] `modules/home/nixvim/ai.nix`
- [x] `modules/home/nixvim/cmp.nix`
- [x] `modules/home/nixvim/default.nix`
- [x] `modules/home/nixvim/keymaps.nix`
- [x] `modules/home/nixvim/lsp.nix`
- [x] `modules/home/nixvim/options.nix`
- [x] `modules/home/nixvim/ui.nix`
- [x] `modules/home/nixvim/utils.nix`
- [x] `modules/home/nixvim/utils/auto-pairs.nix`
- [x] `modules/home/nixvim/utils/autosave.nix`
- [x] `modules/home/nixvim/utils/default.nix`
- [x] `modules/home/nixvim/utils/mini.nix`
- [x] `modules/home/nixvim/utils/telescope.nix`
- [x] `modules/home/packages/default.nix`
- [x] `modules/home/packages/nix-top.nix`
- [x] `modules/home/scripts/scripts.nix`
- [x] `modules/home/scripts/scripts/extract.sh`
- [x] `modules/home/scripts/scripts/keybinds.sh`
- [x] `modules/home/scripts/scripts/music.sh`
- [x] `modules/home/scripts/scripts/record.sh`
- [x] `modules/home/scripts/scripts/runbg.sh`
- [x] `modules/home/scripts/scripts/shutdown-script.sh`
- [x] `modules/home/scripts/scripts/toggle_blur.sh`
- [x] `modules/home/scripts/scripts/toggle_oppacity.sh`
- [x] `modules/home/scripts/scripts/vm-start.sh`
- [x] `modules/home/scripts/scripts/wall-change.sh`
- [x] `modules/home/scripts/scripts/wallpaper-picker.sh`
- [x] `modules/home/starship.nix`
- [x] `modules/home/waybar/default.nix`
- [x] `modules/home/waybar/settings.nix`
- [x] `modules/home/waybar/style.nix`
- [x] `modules/home/waybar/waybar.nix`
- [x] `modules/home/zsh/default.nix`
- [x] `modules/home/zsh/nix-top.nix`
- [x] `modules/hosts/bigserv/config.nix`
- [x] `modules/hosts/bigserv/hardware-configuration.nix`
- [x] `modules/hosts/lilserv/config.nix`
- [x] `modules/hosts/lilserv/hardware-configuration.nix`
- [x] `modules/hosts/nix-top/config.nix`
- [x] `modules/hosts/nix-top/hardware-configuration.nix`
- [x] `modules/system/boot.nix`
- [x] `modules/system/default.nix`
- [x] `modules/system/drivers/audio.nix`
- [x] `modules/system/drivers/default.nix`
- [x] `modules/system/drivers/flipper_zero.nix`
- [x] `modules/system/drivers/nvidia.nix`
- [x] `modules/system/graphics/default.nix`
- [x] `modules/system/graphics/wayland.nix`
- [x] `modules/system/graphics/xserver.nix`
- [x] `modules/system/home.nix`
- [x] `modules/system/network/default.nix`
- [x] `modules/system/network/nix-top.nix`
- [x] `modules/system/network/server.nix`
- [x] `modules/system/programs/default.nix`
- [x] `modules/system/programs/nix-top.nix`
- [x] `modules/system/programs/server.nix`
- [x] `modules/system/security.nix`
- [x] `modules/system/services.nix`
- [x] `modules/system/system.nix`
- [x] `modules/system/user.nix`
- [x] `pkgs/actflow.nix`
- [x] `pkgs/default.nix`
- [x] `pkgs/irsim.nix`
- [x] `skills-lock.json`

## Removed During Audit

- [x] `modules/home/hyprland/hypridle.nix`
- [x] `modules/home/nixvim/obsidian.nix`
- [x] `modules/home/nixvim/zen.nix`
- [x] `modules/home/packages/server.nix`
- [x] `modules/home/server.nix`
- [x] `modules/home/swaylock.nix`
- [x] `modules/home/zen.nix`
- [x] `modules/home/zsh/server.nix`
- [x] `modules/system/custom/actflow.nix`
- [x] `modules/system/custom/irsim.nix`
