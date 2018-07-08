#!/bin/bash

set -e

# Switch to the central Anaconda installation
. /epyc/opt/anaconda/etc/profile.d/conda.sh
conda activate base

# Show conda environment info in the log to aid debugging
echo "==== ENVIRONMENT INFO ===="
id
echo ----------------------
env
echo ----------------------
conda info
echo "==== ================ ===="

# Delegate the notebook server launch to the jupyterhub-singleuser script.
# this is how most sudospawner-singleuser scripts should end.
#exec "$(dirname "$0")/jupyterhub-singleuser" $@
exec /opt/conda/bin/jupyterhub-singleuser "$@"
