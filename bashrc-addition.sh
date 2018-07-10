
# Setup LSST environment
if [ $UID -ne 0 ] && [ -z "$NOLSST" ]; then
	echo "Setting up LSST environment (please wait)..."
	. /epyc/projects/sssc/sssc-jupyterhub/env-setup.sh
fi
