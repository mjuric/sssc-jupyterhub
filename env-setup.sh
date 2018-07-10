####
#### Source this file to set up the proper conda + LSST environment
####

#
# Setup our Conda environment
#
. /epyc/opt/anaconda/etc/profile.d/conda.sh
conda activate /epyc/projects/sssc/conda-sssc-env

# Anaconda has a binary named `pager` which messes up man
export MANPAGER=less

#
# Setup our LSST Stack installation
#
. "/epyc/projects/sssc/lsst/loadLSST.bash"
setup -t sims lsst_sims

#
# Overrides from source
#
setup -k -r /epyc/projects/sssc/sources/oorb
setup -k -r /epyc/projects/sssc/sources/sims_movingObjects
