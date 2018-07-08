#!/bin/bash
#
# Run JupyterHub
#

docker \
	run -it -p 9876:9876 \
	--env-file=env \
	-v /epyc/opt/anaconda:/epyc/opt/anaconda \
	-v /usr/local/share/jupyter/kernels:/usr/local/share/jupyter/kernels \
	-v /epyc/projects/sssc/home:/home \
	-v /epyc/opt/projects/sssc/lsst:/epyc/opt/projects/sssc/lsst \
	jupyterhub-sssc
