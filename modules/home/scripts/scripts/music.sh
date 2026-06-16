#!/usr/bin/env bash

if pgrep -x audacious >/dev/null; then
    pkill -x audacious
else
    hyprctl dispatch exec "[workspace 5 silent] audacious -t"
    sleep 0.5
    audtool playlist-repeat-status | grep -q "on" || audtool playlist-repeat-toggle
    audtool playlist-shuffle-status | grep -q "on" || audtool playlist-shuffle-toggle
fi
