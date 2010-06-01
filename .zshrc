# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
PROMPT=$'%{\e[33m%}''%n@%M %* %# '$'%{\e[m%}'
RPROMPT=$'%{\e[32m%}'%~$'%{\e[m%}'

# aliases
alias sl=ls
alias ls="LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx ls -G"
alias ll="ls -l"
alias la="ll -a"

# completion
autoload -Uz compinit
compinit
