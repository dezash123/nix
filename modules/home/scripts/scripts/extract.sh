#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  echo "Usage: $(basename "$0") <archive.tar.gz>..." >&2
  exit 1
fi

for archive in "$@"; do
  tar -xvzf "$archive"
done
