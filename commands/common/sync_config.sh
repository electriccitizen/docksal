#!/usr/bin/env bash

## Import a database from a Pantheon environment.
##
## Usage: this function is included in various custom fin commands via:
## source "${PROJECT_ROOT}/.docksal/commands/common/dbsync.sh"

# Console colors
red='\033[0;31m'
green='\033[0;32m'
green_bg='\033[42m'
yellow='\033[1;33m'
NC='\033[0m'
bg='\[\033[0;35m\]'

echo-red () { echo -e "${red}$1${NC}"; }
echo-green () { echo -e "${green}$1${NC}"; }
echo-green-bg () { echo -e "${green_bg}$1${NC}"; }
echo-yellow () { echo -e "${yellow}$1${NC}"; }

sync_config ()
{

# No idea why this is needed but i abide
if is_windows; then
	echo-green "Add ${VIRTUAL_HOST} to your hosts file (/etc/hosts), e.g.:"
	echo-green "192.168.64.100 ${VIRTUAL_HOST}"
	echo
fi

# DB updates
echo -e "${green_bg} Step 5 ${NC}${green} Running database updates...${NC}"
fin drush updb -y

# Entity definition updates
echo -e "${green_bg} Step 6 ${NC}${green} Running entity updates...${NC}"
fin drush entup -y

# Import config
echo -e "${green_bg} Step 7 ${NC}${green} Importing config...${NC}"
if [[ ${SKIPCIM} = "TRUE" ]]; then
    echo "Skipping configuration import"
else
    fin drush cim -y
fi

# Clear cache
echo -e "${green_bg} Step 8 ${NC}${green} Clearing caches...${NC}"
fin drush cr all

echo -en "${green_bg} SYNC COMPLETE! ${NC} "
echo -e "Open ${yellow}http://${VIRTUAL_HOST}${NC} in your browser to verify the setup."

}
