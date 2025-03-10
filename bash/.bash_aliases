# # Set up fzf key bindings and fuzzy completion
# eval "$(fzf --bash)"
#
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# switch theme command
alias st='st.sh'

# make bat colors dynamic depending on system theme
alias bat='dbat.sh'

# # replace cat with batcat
# alias cat='batcat'

# change ls to eza
alias ls='eza'

# keep ls as lsraw

# change tree to eza -T
alias tree='eza -T -F --color=always'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -AF'
alias l='ls -F'

# keep original ls as lsraw
alias ls_="$(which ls)"

# fzf aliases
alias fz="fzf \
    --preview 'opener.sh {}' \
    --bind 'ctrl-v:become(nvim {})' \
    --bind tab:up \
    --bind btab:down \
    --bind up:preview-up \
    --bind down:preview-down \
    --bind ctrl-d:preview-half-page-down \
    --bind ctrl-u:preview-half-page-up \
    --bind 'ctrl-y:execute(readlink -f {} | xclip -f -selection clipboard 1> \
        /dev/null 2> /dev/null)+abort+execute(echo -n Following\ path\ copied\
        to\ clipboard:\ )+execute(readlink -f {})'"

alias fls="(printf '.\n..\n'; find . -maxdepth 1 \
    \( -name '.git' -o -name 'node_modules' -o -name '.vscode' \
    -o -name '.venv' -o -name '__pycache__' \) -prune \
    -o -not -name '.' -print \
    | sed 's/^\.\///g' \
    | sort -r) \
    | fz \
        --bind 'ctrl-y:execute(readlink -f {} | xclip -f -selection clipboard \
        1> /dev/null 2> /dev/null)+abort' \
        --bind 'ctrl-v:abort'"

# file explorer using fzf
fcd() {
    while true; do
        if [ "$PWD" = "$HOME" ]; then
            selected=$(fls -q '!^. ')
        else
            selected=$(fls)
        fi

        if [ -z "$selected" ]; then
            break
        fi
        cd "$selected" || return
    done
}

# gpu monitor
alias gpu="nvidia-smi -q -g 0 -d UTILIZATION -l 1"
