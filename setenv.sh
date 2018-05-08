#!/usr/bin/env bash

file=".docksal/docksal-local.env"
DOCROOT=web
GITBRANCH=master
PANTHEON_SITE_ENV=$1
REMOTE_ALIAS=$2

# Set up remote aliases/site for docksal-local.env
sed -i '' 's/DOCROOT=.*/DOCROOT='$DOCROOT'/' $file
sed -i '' 's/GIT_BRANCH=.*/GIT_BRANCH='$GITBRANCH'/' $file
sed -i '' 's/PANTHEON_SITE_ENV=.*/PANTHEON_SITE_ENV='$PANTHEON_SITE_ENV'/' $file
sed -i '' 's/REMOTE_ALIAS=.*/REMOTE_ALIAS='$REMOTE_ALIAS'/' $file
