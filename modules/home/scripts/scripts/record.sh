#!/usr/bin/env bash

tmp_unoptimized="/tmp/recording_unoptimized.gif"
tmp_palette="/tmp/palette.png"
tmp_mp4="/tmp/recording.mp4"
tmp_gif="/tmp/gif_result.gif"
gif_marker="/tmp/recording_gif"
app_name="Recorder"

out_dir="$HOME/Videos"
filename="$(date +"%Y-%m-%d_%H-%M-%S")"

mkdir -p "$out_dir"

cleanup_temp() {
  rm -f "$tmp_unoptimized" "$tmp_palette" "$tmp_mp4" "$tmp_gif" "$gif_marker"
}

is_recorder_running() {
  pgrep -x wf-recorder >/dev/null
}

notify() {
  notify-send -a "$app_name" "$1" "$2" -t 5000
}

choose_save_path() {
  local extension="$1"
  local selected

  selected="$(zenity \
    --file-selection \
    --save \
    --file-filter="*.${extension}" \
    --filename="${out_dir}/${filename}.${extension}" || true)"

  if [[ -z "$selected" ]]; then
    selected="${out_dir}/${filename}.${extension}"
  fi

  if [[ "$selected" != *.${extension} ]]; then
    selected="${selected}.${extension}"
  fi

  printf '%s\n' "$selected"
}

convert_to_gif() {
  ffmpeg -i "$tmp_mp4" -filter_complex "[0:v] palettegen" "$tmp_palette"
  ffmpeg \
    -i "$tmp_mp4" \
    -i "$tmp_palette" \
    -filter_complex "[0:v] fps=10,scale=1400:-1,setpts=0.5*PTS [new];[new][1:v] paletteuse" \
    "$tmp_unoptimized"
  gifsicle -O3 --lossy=100 -i "$tmp_unoptimized" -o "$tmp_gif"
}

record_screen() {
  notify "Starting Recording" "Your screen is being recorded"
  timeout 600 wf-recorder -F format=rgb24 -x rgb24 -p qp=0 -p crf=0 -p preset=slow -c libx264rgb -f "$tmp_mp4"
}

record_area() {
  local geometry
  geometry="$(slurp || true)"

  if [[ -n "$geometry" ]]; then
    notify "Starting Recording" "Your screen is being recorded"
    timeout 600 wf-recorder -F format=rgb24 -x rgb24 -p qp=0 -p crf=0 -p preset=slow -c libx264rgb -g "$geometry" -f "$tmp_mp4"
  else
    return 1
  fi
}

record_gif() {
  touch "$gif_marker"
  if ! record_area; then
    rm -f "$gif_marker"
  fi
}

stop_recording() {
  local save_path

  if ! is_recorder_running; then
    return 0
  fi

  pkill -x wf-recorder

  if [[ -f "$gif_marker" ]]; then
    notify "Stopped Recording" "Starting GIF conversion phase..."
    convert_to_gif
    save_path="$(choose_save_path "gif")"
    mv -- "$tmp_gif" "$save_path"
    wl-copy -t image/gif < "$save_path"
    notify "GIF conversion completed" "GIF saved to $save_path"
  else
    save_path="$(choose_save_path "mp4")"
    mv -- "$tmp_mp4" "$save_path"
    wl-copy -t video/mp4 < "$save_path"
    notify "Stopped Recording" "Video saved to $save_path"
  fi

  cleanup_temp
}

if is_recorder_running; then
  stop_recording
  exit 0
fi

case "${1:-}" in
  screen)
    cleanup_temp
    record_screen
    ;;
  area)
    cleanup_temp
    record_area || true
    ;;
  gif)
    cleanup_temp
    record_gif
    ;;
  stop)
    stop_recording
    ;;
  *)
    echo "Usage: $0 {screen|area|gif|stop}" >&2
    exit 1
    ;;
esac
