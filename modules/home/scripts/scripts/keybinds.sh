#!/usr/bin/env bash

config_file="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/hyprland.conf"

if [[ ! -r "$config_file" ]]; then
  echo "Hyprland config not found: $config_file" >&2
  exit 1
fi

keybinds=$(grep -oP '^\s*bind\s*=\s*\K.*' "$config_file" || true)

if [[ -z "$keybinds" ]]; then
  echo "No Hyprland keybinds found in $config_file" >&2
  exit 1
fi

sed \
  -e 's/,\([^,]*\)$/ = \1/' \
  -e 's/, exec//g' \
  -e 's/^,//g' \
  <<< "$keybinds" \
  | fuzzel --width 75 --dmenu
