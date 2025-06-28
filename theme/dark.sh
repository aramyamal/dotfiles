#!/usr/bin/env bash
THEME="base16-black-metal"

for SOCKET in /run/user/1000/nvim.*; do
  nvim --server "$SOCKET" --remote-send ":colorscheme $THEME<CR>"
done

kitty +kitten themes --reload-in=all 'Black Metal'
hyprctl hyprpaper reload "eDP-1, ~/pictures/black_metal.jpg"
