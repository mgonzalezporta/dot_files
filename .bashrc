# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Exports
export LM_LICENSE_FILE=28518@mtr03:28518@mtr02:28518@mtr01
export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}
export TERM=screen-256color

# Aliases
alias tmux="${HOME}/local/bin/tmux -2"
alias mux="tmux source-file ${HOME}/.tmux_conf; tmux attach || tmux new" 
alias ml="tmux list-sessions"
alias df="df -h"
alias du="du -h"
alias gh="history | grep "
alias grep="grep --color"
alias ls="ls -hF --color"
alias ll="ls -l"
alias la="ls -la"
alias llt="ls -lrt"
alias lat="ls -lart"

# Prompt
if [ -f /etc/bash_completion.d/git ]
then
    PS1='\n[$(pwd)]\n\u@\h$(__git_ps1 " (%s)")$ '
    source /etc/bash_completion.d/git
else
    PS1='\n[$(pwd)]\n\u@\h$ '
fi

# Bash history
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $(pwd) \
    "$(history 1)" >> ~/.bash_eternal_history'

# Functions
mcd() { mkdir -p "$1"; cd "$1";}
