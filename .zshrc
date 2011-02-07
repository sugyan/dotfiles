##################################################
# shell variables

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
function precmd_vcs() {
    vcs_info
    RPROMPT=$'%{\e[32m%}%~'${vcs_info_msg_0_}$'%{\e[m%}'
}
PROMPT=$'%{\e[31m%}%n@%M %{\e[33m%}%* %# %{\e[m%}'

# special functions
precmd_functions=(precmd_vcs)

function redrev() {
    perl -pe 's/^/\e[41m/ && s/$/\e[m/';
}


##################################################
# aliases

alias sl=ls
alias ls="LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx ls -G"
alias ll="ls -l"
alias la="ll -a"
alias em="emacsclient -n"

alias gi=git
alias ga="git add"
alias gs="git status"
alias gsh="git show"
alias gd="git diff"
alias gci="git commit"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gl="git log"
alias gm="git merge"
alias gr="git reset"
alias gsd="git svn dcommit"
alias gsr="git svn rebase"

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
    fake-parameters CATALYST_DEBUG DBIC_TRACE PERL5LIB MICRO_TEMPLATE_DEBUG # for perl debug

# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats $'%{\e[35m%} [%s %r %b]%{\e[m%}'

# word-style
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;:@"
zstyle ':zle:*' word-style unspecified
