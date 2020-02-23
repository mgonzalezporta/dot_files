#!/bin/bash

# aliases
alias userrig="ssh userrig@gis01"
alias aws="/home/users/astar/gis/gonzalez/local/aws/aws"

# anaconda
module load anaconda/3
source /data/users/astar/gis/rpd/apps/conda/etc/profile.d/conda.sh
conda activate mgonzalezporta-nscc

# singularity
module load singularity/3.4.0
