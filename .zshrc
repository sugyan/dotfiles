##################################################
# shell variables

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_all_dups

# report time
REPORTTIME=3

# prompt
PROMPT=$'%{\e[31m%}%n@%M %{\e[33m%}%D{%H:%M:%S} %# %{\e[m%}'

# pre exec

# pre cmd
function precmd_vcs() {
    vcs_info
    RPROMPT=$'%{\e[32m%}%~ %{\e[35m%}'${vcs_info_msg_0_}$'%{\e[m%}'
}
precmd_functions+=(precmd_vcs)

##################################################
# aliases

alias sl=ls
case "$OSTYPE" in
    darwin*)
        alias ls="LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx ls -G"
        alias -s html='open -a Google\ Chrome'
        alias -s {png,jpg,bmp,PNG,JPG,pdf}='open -a Preview'
        ;;
    linux*)
        alias ls="ls --color=auto"
        ;;
esac
alias ll="ls -l"
alias la="ll -a"
alias em="emacs-minimum"

alias gi=git
alias ga="git add"
alias gd="git diff"
alias gl="git log"
alias gs="git status"
alias gsh="git show"
alias gpl="git pull"
alias gps="git push"
alias gci="git commit"
alias gco="git checkout"
alias gcp='git checkout $(git branch | peco)'
alias gst="git stash"
alias gsp="git stash pop"

alias pad='plackup -MPlack::App::Directory -e '\''$app = Plack::App::Directory->new({ root => "." })->to_app'\'''

alias -g L='| less'
alias -g P='| peco'

##################################################
# others

# options
setopt autocd
setopt autopushd
setopt pushdignoredups

# completion
autoload -Uz compinit
compinit -u

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B--- %d ---%b'

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ln=35 di=36

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:kill:*:processes' command 'ps x'
zstyle ':completion:*:-command-:*' \
    fake-parameters PERL5LIB # for perl

## git completion
if [ -e $HOME/.git-completion.sh ]; then
    source $HOME/.git-completion.sh
fi

# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats $'[%s %r %b]'

# word-style
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;:@"
zstyle ':zle:*' word-style unspecified
