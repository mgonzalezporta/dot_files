#!/bin/bash

# paths
export PATH=/home/users/astar/gis/gonzalez/local/bin:${PATH}
export LD_LIBRARY_PATH=/home/users/astar/gis/gonzalez/local/lib/:${LD_LIBRARY_PATH}
# export LM_LICENSE_FILE=28518@mtr03:28518@mtr02:28518@mtr01
# export THEANO_FLAGS="base_compiledir=/data/13000026/scratch/gonzalez"

# aliases
# alias userrig="ssh userrig@gis01"
alias aws="/home/users/astar/gis/gonzalez/local/aws/aws"
alias qstat="/opt/pbs/bin/qstat"
alias qa="qmgr -c 'list queue production' | grep state_count"
alias qm="qstat | grep '^[0-9]' | awk '{print \$5, \$2}' | sort | uniq -c"

# tmux
alias tmux="/home/users/astar/gis/gonzalez/local/bin/tmux -2u"
alias mux="tmux -2u attach || tmux new"
alias ms="tmux -2u source-file ~/.tmux.conf"
alias ml="tmux -2u list-sessions"
alias mk="tmux -2u list-sessions | awk 'BEGIN{FS=\":\"}{print $1}' | xargs -n 1 tmux kill-session -t"

# singularity
module load singularity/3.6.4
