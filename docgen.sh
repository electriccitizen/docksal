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

#Set the project
echo-green "Enter the project name:${NC} (e.g. Graywolf Press)"
read project

#Set the site name
echo-green "Enter the site code:${NC} (e.g. graywolf)"
read site

REPLACE1="\[PROJECT\]"
PROJECT=$project

REPLACE2="\[SITE\]"
SITE=$site

# Copy default README from docs
cp -fp docs/README.md .

# Replace with new project details and move to project root
sed "-i" "" "-e" "s/$REPLACE1/$PROJECT/g" "README.md"
sed "-i" "" "-e" "s/$REPLACE2/$SITE/g" "README.md"
mv README.md ../

# Generate the default docs
if [ ! -d "../docs" ]; then
  mkdir ../docs
fi

# Generate the custom docs folder
if [ ! -d "../docs/custom" ]; then
  mkdir ../docs/custom
fi

# Generate custom notes doc if needed
if [ ! -f "../docs/NOTES.md" ]; then
  cp -fp docs/docs/custom/NOTES.md ../docs/custom
fi

# Generate the workflow folder
if [ ! -d "../docs/workflow" ]; then
  mkdir ../docs/workflow
fi

cp -fp docs/docs/workflow/WORKFLOW.md ../docs/workflow

# Generate the frontend folder
if [ ! -d "../docs/frontend" ]; then
  mkdir ../docs/frontend
fi

cp -fp docs/docs/frontend/THEME.md ../docs/frontend

# Generate the local env folder
if [ ! -d "../docs/local" ]; then
  mkdir ../docs/local
fi

cp -fp docs/docs/local/DOCKSAL.md ../docs/local
cp -fp docs/docs/local/TROUBLESHOOT.md ../docs/local

# Generate the commands folder
if [ ! -d "../docs/commands" ]; then
  mkdir ../docs/commands
fi

cp -fp docs/docs/commands/COMMANDS.md ../docs/commands
cp -fp docs/docs/commands/INIT.md ../docs/commands
cp -fp docs/docs/commands/SYNC.md ../docs/commands
cp -fp docs/docs/commands/VALIDATE.md ../docs/commands

# Copy the setup doc
cp -fp docs/docs/SETUP.md ../docs




