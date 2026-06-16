#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $(basename "$0") <wallpaper>" >&2
  exit 1
fi

wallpaper="$1"

if [[ ! -f "$wallpaper" ]]; then
  echo "Wallpaper not found: $wallpaper" >&2
  exit 1
fi

mapfile -t old_pids < <(pgrep -x swaybg || true)

swaybg -m fill -i "$wallpaper" &

if (( ${#old_pids[@]} > 0 )); then
  kill "${old_pids[@]}" 2>/dev/null || true
fi
