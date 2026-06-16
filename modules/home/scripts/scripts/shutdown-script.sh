#!/usr/bin/env bash

respond="$(printf "Shutdown\nRestart\nCancel\n" | fuzzel --dmenu --lines=3 --width=10 --prompt='' || true)"

case "$respond" in
  Shutdown)
    systemctl poweroff
    ;;
  Restart)
    systemctl reboot
    ;;
  *)
    notify-send "Shutdown cancelled"
    ;;
esac
