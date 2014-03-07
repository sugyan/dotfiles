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
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# plenv
path=($HOME/.plenv/bin(N) $path)
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
# flex SDK
path=(/Developer/SDKs/flex_sdk_4.5.1.21328/bin(N) $path)

# z.sh (https://github.com/rupa/z)
if which brew > /dev/null; then
    _Z_CMD=j
    source $(brew --prefix)/etc/profile.d/z.sh
elif [ -f $HOME/.z.sh/z.sh ]; then
    _Z_CMD=j
    source $HOME/.z.sh/z.sh
fi

if which brew > /dev/null; then
    fpath=($fpath $(brew --prefix)/share/zsh/site-functions(N))
fi

fpath=($fpath $HOME/local/functions(N))

if [ "$TMUX" != "" ]; then
    tmux set-option status-bg colour$(($(echo -n $(whoami)@$(hostname) | sum | cut -f1 -d' ') % 7 + 1)) | cat > /dev/null
fi
