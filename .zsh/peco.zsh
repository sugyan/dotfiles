# https://github.com/mooz/percol#zsh-history-search
function peco_select_history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N peco_select_history
bindkey '^R' peco_select_history

# z.sh directory search
function peco_select_directory() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    local dest=$(_z -r 2>&1 | eval $tac | peco --query "$LBUFFER" | awk '{ print $2 }')
    if [ -n "${dest}" ]; then
        cd ${dest}
        precmd_vcs
    fi
    zle reset-prompt
}
zle -N peco_select_directory
bindkey "^X^J" peco_select_directory
