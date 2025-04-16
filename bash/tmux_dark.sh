#!/usr/bin/env bash

tmux set -g @dracula-colors "
# Dracula Color Pallette
white='#ddc7a1'
gray='#282828'
dark_gray='#32302f'
light_purple='#A89984'
dark_purple='#504945'
cyan='#a9b665'
green='#928374'
orange='#e78a4e'
red='#ea6962'
pink='#7daea3'
yellow='#d8a657'
true_purple='#d3869b'
"
tmux run '~/.tmux/plugins/tpm/tpm'

