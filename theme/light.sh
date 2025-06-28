#!/usr/bin/env bash
THEME="everforest"

for SOCKET in /run/user/1000/nvim.*; do
  nvim --server "$SOCKET" --remote-send ":colorscheme $THEME<CR>"
done

kitty +kitten themes --reload-in=all 'Everforest Light Medium'
hyprctl hyprpaper reload "eDP-1, ~/pictures/franz_richard_unterberger-amalfi.jpg"
