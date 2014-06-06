##################################################
# shell variables

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt sharehistory
setopt histignorealldups

# report time
REPORTTIME=3

# prompt
PROMPT=$'%{\e[31m%}%n@%M %{\e[33m%}%* %# %{\e[m%}'

# pre exec
function preexec_fluent() {
    (curl -X POST -d 'json={"command":"'${1%% *}'"}' localhost:9880/zsh 2> /dev/null &)
}
preexec_functions=(preexec_fluent)
# pre cmd
function precmd_vcs() {
    vcs_info
    RPROMPT=$'%{\e[32m%}%~ %{\e[35m%}'${vcs_info_msg_0_}$'%{\e[m%}'
}
precmd_functions+=(precmd_vcs)

# special functions
function redrev() {
    perl -pe 's/^/\e[41m/ && s/$/\e[m/';
}

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
alias gcp="git cherry-pick"
alias gsd="git svn dcommit"
alias gsr="git svn rebase"
alias gst="git stash"
alias gsp="git stash pop"

alias pad='plackup -MPlack::App::Directory -e '\''$app = Plack::App::Directory->new({ root => "." })->to_app'\'''

alias -g RED='2> >(redrev)'

##################################################
# others

# options
setopt autocd
setopt autopushd
setopt pushdignoredups

# completion
autoload -Uz compinit
compinit

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
