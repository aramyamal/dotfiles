# Swtich theme
st() {
    color_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)

    if [ "$color_scheme" = "'default'" ]; then
        kitty +kitten themes --reload-in=all 'Gruvbox Material Dark Hard'
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    else
        kitty +kitten themes --reload-in=all 'Gruvbox Material Light Hard'
        gsettings set org.gnome.desktop.interface color-scheme 'default'
    fi
}

st 
