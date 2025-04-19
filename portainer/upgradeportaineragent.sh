#!/bin/bash

##########
# Filename: upgradeportaineragent.sh
# Location: $HOME/docker/portainer
# Date updated: April 19, 2025
#
# Upgrades the Portainer agent.
##########

# Stop the current container
sudo docker kill portainer_agent

# Delete the current container
sudo docker rm portainer_agent

# Download upgrade and run Portainer Agent
docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes -v /:/host portainer/agent:lts
