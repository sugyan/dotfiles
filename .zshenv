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

# perlbrew
source $HOME/perl5/perlbrew/etc/bashrc
# nodebrew
path=($HOME/.nodebrew/current/bin(N) $path)
# rbenv
path=($HOME/.rbenv/bin(N) $path)
eval "$(SHELL=zsh rbenv init -)"
# flex SDK
path=(/Developer/SDKs/flex_sdk_4.5.1.21328/bin(N) $path)
