#!/bin/bash

##########
# Filename: upgradeportaineragent.sh
# Location: $HOME/docker/portainer
# Date updated: May 11, 2025
#
# Upgrades the Portainer agent. If you are running from an account not part of the Docker usegroup, you will need to add sudo before the commands.
##########

# Pull the latest Portainer Agent container.
{ echo -e "Pulling the latest Portainer Agent container...";}
docker pull portainer/agent:lts

# Stops the current Portainer Agent container
{ echo -e "\nStopping the Portainer Agent container...";}
docker kill portainer_agent

# Removes the current Portainer Agent container
{ echo -e "\nRemoving the Portainer Agent container...";}
docker rm portainer_agent

# Run Portainer Agent
{ echo -e "\nStarting Portainer Agent...";}
docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes -v /:/host portainer/agent:lts

{ echo -e "\nPortainer Agent updated and running"; }
