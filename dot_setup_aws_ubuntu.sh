#!/bin/bash

alias mux="tmux -2u attach || tmux new"
alias ms="tmux -2u source-file ~/.tmux.conf"
alias ml="tmux -2u list-sessions"
alias mk="tmux -2u list-sessions | awk 'BEGIN{FS=\":\"}{print $1}' | xargs -n 1 tmux kill-session -t"

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
conda activate dev
