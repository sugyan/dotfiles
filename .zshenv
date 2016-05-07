# make unique 'path'
typeset -U path
# add "$HOME/local/bin" to head
path=(/usr/local/bin(N-/) $path)
path=(/usr/local/go/bin(N-/) $path)
path=($HOME/local/bin(N-/) $path)
path=($HOME/.bin(N-/) $path)

# environment variables
export H=$HOME

# fpath
typeset -U fpath
fpath=($fpath $HOME/.zsh/functions(N-/))
if command -v brew > /dev/null; then
    fpath=($fpath $(brew --prefix)/share/zsh/site-functions(N-/))
fi
fpath=($fpath $HOME/local/functions(N-/))

# nodebrew
path=($HOME/.nodebrew/current/bin(N-/) $path)
# rbenv
path=($HOME/.rbenv/bin(N-/) $path)
if command -v rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
# plenv
path=($HOME/.plenv/bin(N-/) $path)
if command -v plenv > /dev/null; then eval "$(plenv init - zsh)"; fi
# pyenv
path=($HOME/.pyenv/bin(N-/) $path)
if command -v pyenv > /dev/null; then eval "$(pyenv init - zsh)"; fi

# golang
if command -v go > /dev/null; then
    path=($(go env GOROOT)/bin(N-/) $path)
fi
export GOPATH=$HOME/dev/go
path=($GOPATH/bin(N-/) $path)

# z.sh (https://github.com/rupa/z)
if command -v brew > /dev/null; then
    _Z_CMD=j
    source $(brew --prefix)/etc/profile.d/z.sh
elif [ -f $HOME/.z.sh/z.sh ]; then
    _Z_CMD=j
    source $HOME/.z.sh/z.sh
fi

# peco
if command -v peco > /dev/null; then
    source $HOME/.zsh/peco.zsh
fi

# tmux
if [ "$TMUX" != "" ]; then
    tmux set-option status-fg black
    tmux set-option status-bg colour$(($(echo -n $(whoami)@$(hostname) | sum | cut -f1 -d' ') % 7 + 1)) | cat > /dev/null
fi

# don't read /etc/zprofile!
setopt no_global_rcs
