# # Preview script for fzf for showing file trees and hex content
# if [ -d "$1" ]; then
#     eza --color=always -T -F -a -L 3 -I 'node_modules|.git|.venv|.vscode|__pycache__' "$1"
# else
# 	BAT_TEST=$(file --mime "$1")
# 	if [[ $BAT_TEST == *binary ]] ; then
# 		hexyl -n 4kB "$1"
# 	else
# 		# batcat --color=always --theme=gruvbox-material-light --style=numbers --line-range=:500 "$1"
#         dbat.sh --style=numbers --line-range=:500 "$1"
# 	fi
# fi

# Preview script for fzf for showing file trees, image previews and hex content
if [ -d "$1" ]; then
    eza --color=always -T -F -a -L 3 -I 'node_modules|.git|.venv|.vscode|__pycache__' "$1"
else
    file_type=$(file --mime "$1")
    
    if [[ $file_type == *image/* ]]; then
        dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
        if [[ $dim = x ]]; then
            dim=$(stty size < /dev/tty | awk '{print $2 "x" $1}')
        fi
        
        kitty icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no --place="$dim@0x0" "$1" | sed '$d' | sed $'$s/$/\e[m/'
    elif [[ $file_type == *binary ]]; then
        hexyl -n 4kB "$1"
    else
        dbat.sh --style=numbers --line-range=:500 "$1"
    fi
fi
