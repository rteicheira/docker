#!/bin/bash

##########
# Filename: upgradeportainer.sh
# Location: $HOME/docker/portainer
# Date updated: December 13, 2025
#
# Upgrades the Portainer or Portainer Agent container. The script determines which container is running and updates it accordingly.
# The script does not currently handle creation of a container if none is found.
##########

# Color codes
GREENBG='\033[30m\033[102m'
GREEN='\033[92m'
GREEND='\033[32m'
YELLOW='\033[93m'
NC='\033[0m'

echo -e "${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} Pulling the latest Portainer container..."

# Detect running container
if docker ps --format '{{.Names}}' | grep -q '^portainer_agent$'; then
    CONT='portainer/agent:lts'
    CONT2='portainer_agent'
    COMMAND='docker run -d \
        -p 9001:9001 \
        --name portainer_agent \
        --restart=always \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /var/lib/docker/volumes:/var/lib/docker/volumes \
        -v /:/host \
        portainer/agent:lts'

elif docker ps --format '{{.Names}}' | grep -q '^portainer$'; then
    CONT='portainer/portainer-ce:lts'
    CONT2='portainer'
    COMMAND='docker run -d \
        -p 8000:8000 \
        -p 9443:9443 \
        --name portainer \
        --restart=always \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v portainer_data:/data \
        portainer/portainer-ce:lts'

else
    echo -e "${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} ${GREEND}Portainer not found, exiting...${NC}"
    return
fi

# Pull image
output="$(docker pull "$CONT")"
echo "$output"

# Check pull result
if echo "$output" | grep -q "Image is up to date"; then
    echo -e "\n${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} ${GREEN}Portainer already up to date. Exiting...${NC}"
    return
fi

# If update available, stop the container and pull the updated version
echo -e "\n${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} Update available..."

# Stop container
echo -e "\n${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} Killing ${CONT2}..."
docker kill "$CONT2"

# Remove container
echo -e "\n${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} Removing ${CONT2}..."
docker rm "$CONT2"

# Start new container
echo -e "\n${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} Starting ${CONT2}..."
bash -c "$COMMAND"

echo -e "\n${YELLOW}$(date +'%Y-%m-%d %H:%M:%S')${NC} ${GREENBG}Portainer updated and running${NC}"
