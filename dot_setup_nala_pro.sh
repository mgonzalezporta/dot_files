# aliases
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -hl"
alias la="ls -hla"
alias lt="ls -hlart"
alias c="clear"
alias mux="tmux -2u attach || tmux new"
alias ms="tmux -2u source-file ~/.tmux.conf"
alias ml="tmux -2u list-sessions"
alias mk="tmux -2u list-sessions | awk 'BEGIN{FS=\":\"}{print $1}' | xargs -n 1 tmux kill-session -t"

# functions
mcd() { mkdir -p "$1"; cd "$1";}

# git autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# prompt
PS1='\n[`pwd`]\n\u@\h$(__git_ps1 " (%s)")$ '
# replace by the line below to ommit info on the current git branch
# PS1='\n[`pwd`]\n\u@\h$ '

# bash history
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $(pwd) \
    "$(history 1)" >> ~/.bash_eternal_history'
