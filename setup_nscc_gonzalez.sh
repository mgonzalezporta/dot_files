#!/bin/bash

# paths
export PATH=/home/users/astar/gis/gonzalez/local/bin:${PATH}
export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}
# export LM_LICENSE_FILE=28518@mtr03:28518@mtr02:28518@mtr01
# export THEANO_FLAGS="base_compiledir=/data/13000026/scratch/gonzalez"

# aliases
# alias userrig="ssh userrig@gis01"
alias aws="/home/users/astar/gis/gonzalez/local/aws/aws"
alias qstat="/opt/pbs/bin/qstat"
alias qa="qmgr -c 'list queue production' | grep state_count"
alias qm="qstat | grep '^[0-9]' | awk '{print \$5, \$2}' | sort | uniq -c"

# miniconda
# module load anaconda/3
# source /data/users/astar/gis/rpd/apps/conda/etc/profile.d/conda.sh
# conda activate mgonzalezporta-nscc
export PATH="/data/13000026/pipeline/dev/gonzalez/tools/miniconda3/bin:$PATH"
source /data/13000026/pipeline/dev/gonzalez/tools/miniconda3/etc/profile.d/conda.sh

# singularity
module load singularity/3.6.4
