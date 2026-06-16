#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  echo "$(basename "$0"): missing command" >&2
  exit 1
fi

if ! prog=$(command -v -- "$1"); then
  echo "$(basename "$0"): unknown command: $1" >&2
  exit 1
fi

shift

if tty -s; then
  exec </dev/null
fi

if tty -s <&1; then
  exec >/dev/null
fi

if tty -s <&2; then
  exec 2>&1
fi

"$prog" "$@" &
