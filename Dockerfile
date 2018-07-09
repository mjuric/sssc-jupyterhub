# Designed to be run as:
# 
#  docker run -it -p 8000:8000 
#     --env-file=env 
#     -v /epyc/opt/anaconda:/epyc/opt/anaconda 
#     -v /usr/local/share/jupyter/kernels:/usr/local/share/jupyter/kernels
#     -v /epyc/projects/sssc/home:/home
#     -v /epyc/opt/projects/sssc/lsst:/epyc/opt/projects/sssc/lsst
#     jupyterhub-oauth
#

FROM jupyterhub/jupyterhub

MAINTAINER Project Jupyter <ipython-dev@scipy.org>

# Install Jupyter into this container, but don't provide a default kernel
# That will be mounted from the outside
RUN conda install jupyter -y

# Install missing packages
RUN apt-get update
RUN apt-get install -y libgl1-mesa-glx libgomp1

# Install oauthenticator from git
RUN python3 -m pip install oauthenticator

# Create oauthenticator directory and put necessary files in it
RUN mkdir /srv/oauthenticator
WORKDIR /srv/oauthenticator
ENV OAUTHENTICATOR_DIR /srv/oauthenticator
ADD jupyterhub_config.py jupyterhub_config.py
ADD userlist /srv/oauthenticator/userlist
ADD ssl /srv/oauthenticator/ssl
RUN chmod 700 /srv/oauthenticator

# Jupyter single-user server startup script
# It makes sure we switch to the /epyc/opt/anaconda environment
ADD single-user.sh /srv
RUN chmod +x /srv/single-user.sh

# Set up default kernels
RUN rm -rf /opt/conda/share/jupyter/kernels
RUN ln -s /usr/local/share/jupyter/kernels /opt/conda/share/jupyter/kernels
RUN mkdir -p /usr/local/share/jupyter
RUN ln -s /epyc/projects/sssc/sssc-jupyterhub/kernels /usr/local/share/jupyter/kernels

# Add link to sssc to home directories (so notebooks can escape into the
# common dir)
RUN ln -s /epyc/projects/sssc /etc/skel/sssc
RUN groupadd sssc

# Startup script
ADD start.sh /srv/oauthenticator/start.sh
RUN chmod 700 /srv/oauthenticator/start.sh
CMD ["/srv/oauthenticator/start.sh"]
