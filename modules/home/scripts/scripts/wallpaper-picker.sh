#!/usr/bin/env bash

wallpaper_path="$HOME/Pictures/wallpapers"
wallpapers_folder="$HOME/Pictures/wallpapers/others"

if [[ ! -d "$wallpapers_folder" ]]; then
  echo "Wallpaper folder not found: $wallpapers_folder" >&2
  exit 1
fi

mkdir -p "$wallpaper_path"

wallpaper_name="$(
  {
    find "$wallpapers_folder" -maxdepth 1 -type f -printf '%f\n' \
    | sort \
    | fuzzel --dmenu
  } || true
)"

if [[ -n "$wallpaper_name" && -f "$wallpapers_folder/$wallpaper_name" ]]; then
    find "$wallpaper_path" -maxdepth 1 -type f -delete
    cp -- "$wallpapers_folder/$wallpaper_name" "$wallpaper_path/$wallpaper_name"
    wall-change "$wallpaper_path/$wallpaper_name"
else
    exit 1
fi
