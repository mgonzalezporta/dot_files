# Aliases
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

# Functions
mcd() { mkdir -p "$1"; cd "$1";}

# Prompt
if [ -f /etc/bash_completion.d/git ]
then
    PS1='\n[`pwd`]\n\u@\h$(__git_ps1 " (%s)")$ '
    source /etc/bash_completion.d/git
else
    PS1='\n[`pwd`]\n\u@\h$ '
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/tljh/user/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/tljh/user/etc/profile.d/conda.sh" ]; then
        . "/opt/tljh/user/etc/profile.d/conda.sh"
    else
        export PATH="/opt/tljh/user/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<