# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
PROMPT=$'%{\e[33m%}''%n@%M %* %# '$'%{\e[m%}'
RPROMPT=$'%{\e[32m%}'%~$'%{\e[m%}'

# completion
autoload -Uz compinit
compinit
