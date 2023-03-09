function skim_select_history() {
    BUFFER=$(fc -l -n 1 | sk --tac --no-sort --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N skim_select_history
bindkey '^R' skim_select_history

# z.sh directory search
function skim_select_directory() {
    local dest=$(_z -r 2>&1 | sk --tac --no-sort --query "$LBUFFER" | awk '{ print substr($0, index($0, $2)) }')
    if [ -n "${dest}" ]; then
        cd ${dest}
        precmd_vcs
    fi
    zle reset-prompt
}
zle -N skim_select_directory
bindkey "^Z" skim_select_directory

unset zle_bracketed_paste
