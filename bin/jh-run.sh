#!/bin/bash
#
# Run JupyterHub
#

docker \
	run --rm -it -p 9876:9876 \
	--env-file=/epyc/projects/sssc/env \
	-v /epyc/opt/anaconda:/epyc/opt/anaconda \
	-v /usr/local/share/jupyter/kernels:/usr/local/share/jupyter/kernels \
	-v /epyc/projects/sssc/home:/home \
	-v /epyc/projects/sssc/lsst:/epyc/projects/sssc/lsst \
	jupyterhub-sssc
