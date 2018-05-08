#!/usr/bin/env bash

file=".docksal/docksal-local.env"
DOCROOT=web
GITBRANCH=master
PANTHEON_SITE_ENV=$1
REMOTE_ALIAS=$2

# Set up remote aliases/site for docksal-local.env
sed -i -e 's/DOCROOT=.*/DOCROOT='$DOCROOT'/' $file
sed -i -e 's/GIT_BRANCH=.*/GIT_BRANCH='$GITBRANCH'/' $file
sed -i -e 's/PANTHEON_SITE_ENV=.*/PANTHEON_SITE_ENV='$PANTHEON_SITE_ENV'/' $file
sed -i -e 's/REMOTE_ALIAS=.*/REMOTE_ALIAS='$REMOTE_ALIAS'/' $file
