# Dynamic bat with color scheme depending on system theme
dbat() {
    # Get the color scheme
    color_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
    
    # Check if the color scheme is default
    if [ "$color_scheme" = "'default'" ]; then
        batcat --color=always --theme=gruvbox-material-light "$@"
    else
        batcat --color=always --theme=gruvbox-material-dark "$@"
    fi
}

dbat "$@"
