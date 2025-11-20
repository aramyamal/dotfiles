#!/usr/bin/env bash

# Build a list of full paths and their relative paths (following symlinks)
mapfile -t full_paths < <(find -L ~/Documents -type f -iname '*.pdf' -print)
mapfile -t rel_paths < <(printf '%s\n' "${full_paths[@]}" | sed "s|^$HOME/Documents/||")

# Show only the relative paths in wofi
selected_rel=$(printf '%s\n' "${rel_paths[@]}" | wofi --dmenu --width 800 --height 400 --prompt "Select PDF:")

# Find the index of the selected relative path
for i in "${!rel_paths[@]}"; do
  if [[ "${rel_paths[$i]}" == "$selected_rel" ]]; then
    selected_full="${full_paths[$i]}"
    break
  fi
done

# Open the file if one was selected
if [[ -n "$selected_full" ]]; then
  exec uwsm app -- zathura "$selected_full"
fi
