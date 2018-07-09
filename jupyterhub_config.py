# Configuration file for Jupyter Hub

c = get_config()

c.JupyterHub.log_level = 10
from oauthenticator.github import LocalGitHubOAuthenticator
c.JupyterHub.authenticator_class = LocalGitHubOAuthenticator

c.LocalGitHubOAuthenticator.create_system_users = True

# -- mjuric:
c.GitHubOAuthenticator.scope = ['read:org']
c.GitHubOAuthenticator.github_organization_whitelist = ['lsst-sssc', 'dirac-institute']

c.Spawner.cmd = '/srv/single-user.sh'
c.LocalAuthenticator.add_user_cmd = ["useradd", "-m", "-G", "sssc"]

c.JupyterHub.port = 9876
c.JupyterHub.base_url = '/sssc'

#c.Authenticator.whitelist = whitelist = set()
#c.JupyterHub.admin_users = admin = set()
c.Authenticator.admin_users = { 'mjuric' }

##import os
##import sys

##join = os.path.join
##
##here = os.path.dirname(__file__)
##root = os.environ.get('OAUTHENTICATOR_DIR', here)
##sys.path.insert(0, root)

#with open(join(root, 'userlist')) as f:
#    for line in f:
#        if not line:
#            continue
#        parts = line.split()
#        name = parts[0]
##        whitelist.add(name)
#        if len(parts) > 1 and parts[1] == 'admin':
#            admin.add(name)

import os
c.GitHubOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']

# ssl config
#from os.path import join
#ssl = join(root, 'ssl')
#keyfile = join(ssl, 'ssl.key')
#certfile = join(ssl, 'ssl.cert')
#if os.path.exists(keyfile):
#    c.JupyterHub.ssl_key = keyfile
#if os.path.exists(certfile):
#    c.JupyterHub.ssl_cert = certfile
