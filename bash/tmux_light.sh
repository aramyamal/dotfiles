#!/usr/bin/env bash

tmux set -g @dracula-colors "
# Dracula Color Pallette
white='#4f3829'
gray='#eddeb5'
dark_gray='#ebdbb2'
light_purple='#7c6f64'
dark_purple='#dac9a5'
cyan='#6c782e'
green='#928374'
orange='#c35e0a'
red='#c14a4a'
pink='#45707a'
yellow='#a96b2c'
true_purple='#945e80'
"
tmux run '~/.tmux/plugins/tpm/tpm'
