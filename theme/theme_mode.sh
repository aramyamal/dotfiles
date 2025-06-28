#!/usr/bin/env bash

theme_mode_path="$HOME/.config/theme/.theme_mode"

get_theme_mode() {
    cat $theme_mode_path
}

toggle_theme_mode() {
    current_theme=$(get_theme_mode)
    if [ "$current_theme" = "dark" ]; then
        light
        echo "light" > $theme_mode_path
    else
        dark
        echo "dark" > $theme_mode_path
    fi
}
