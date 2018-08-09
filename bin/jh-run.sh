#!/bin/bash
#
# Run JupyterHub
#

docker \
	run --rm -it -p 9876:9876 \
	--cpus=16 \
	--memory=128g \
	--name=sssc-jupyterhub \
	--hostname=sssc-jupyterhub \
	--env-file=/epyc/projects/sssc/env \
	-v /epyc/opt/anaconda:/epyc/opt/anaconda \
	-v /opt/rh:/opt/rh \
	-v /epyc/projects/sssc/home:/home \
	-v /epyc/projects/sssc:/epyc/projects/sssc \
	jupyterhub-sssc

#	-v /usr/local/share/jupyter/kernels:/usr/local/share/jupyter/kernels \
#	-v /epyc/projects/sssc/lsst:/epyc/projects/sssc/lsst \
#	-v /epyc/projects/sssc/conda-sssc-env:/epyc/projects/sssc/conda-sssc-env \
#	-v /epyc/projects/sssc/common:/epyc/projects/sssc/common \
#	-v /epyc/projects/sssc/sssc-jupyterhub:/epyc/projects/sssc/sssc-jupyterhub \
#
