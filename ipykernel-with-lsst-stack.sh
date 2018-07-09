#!/bin/bash

#
# Setup our Conda environment
#
. /epyc/opt/anaconda/etc/profile.d/conda.sh
conda activate /epyc/projects/sssc/conda-sssc-env

#
# Setup our LSST Stack installation
#
. "/epyc/projects/sssc/lsst/loadLSST.bash"
setup -t sims lsst_sims

#
# Launch the IPython kernel
#
#exec /epyc/projects/sssc/conda-sssc-env/bin/python -m ipykernel_launcher "$@"
exec python -m ipykernel_launcher -f "$@"
