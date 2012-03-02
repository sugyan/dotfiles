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
if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi
# nodebrew
path=($HOME/.nodebrew/current/bin(N) $path)
# rbenv
path=($HOME/.rbenv/bin(N) $path)
eval "$(SHELL=zsh rbenv init -)"
# flex SDK
path=(/Developer/SDKs/flex_sdk_4.5.1.21328/bin(N) $path)

# autojump
# https://github.com/joelthelion/autojump
# $ git clone git://github.com/joelthelion/autojump.git
# $ cd autojump
# $ ./install.sh --zsh --local --prefix $HOME/local
if [ -e $HOME/local/etc/profile.d/autojump.zsh ]; then
    source $HOME/local/etc/profile.d/autojump.zsh
fi
fpath=($fpath $HOME/local/functions(N))

if ! [ "$TMUX" = "" ]; then
    tmux set-option status-bg $(perl -MList::Util=sum -e'print+(red,green,blue,yellow,cyan,magenta,white)[sum(unpack"C*",shift)%7]' $(hostname)) | cat > /dev/null
fi
