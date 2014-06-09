# make unique 'path'
typeset -U path
# add "$HOME/local/bin" to head
path=($HOME/local/bin(N) $path)
path=($HOME/.bin(N) $path)

# environment variables
export H=$HOME

# fpath
typeset -U fpath
fpath=($fpath $HOME/.zsh/functions(N))

# nodebrew
path=($HOME/.nodebrew/current/bin(N) $path)
# rbenv
path=($HOME/.rbenv/bin(N) $path)
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
# plenv
path=($HOME/.plenv/bin(N) $path)
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi
# golang
export GOPATH=$HOME/dev/go
path=($GOPATH/bin(N) $path)

# z.sh (https://github.com/rupa/z)
if which brew > /dev/null; then
    _Z_CMD=j
    source $(brew --prefix)/etc/profile.d/z.sh
elif [ -f $HOME/.z.sh/z.sh ]; then
    _Z_CMD=j
    source $HOME/.z.sh/z.sh
fi

# percol
if which percol > /dev/null; then
    source $HOME/.zsh/percol.zsh
fi

if which brew > /dev/null; then
    fpath=($fpath $(brew --prefix)/share/zsh/site-functions(N))
fi
fpath=($fpath $HOME/local/functions(N))

# tmux
if [ "$TMUX" != "" ]; then
    tmux set-option status-bg colour$(($(echo -n $(whoami)@$(hostname) | sum | cut -f1 -d' ') % 7 + 1)) | cat > /dev/null
fi
