# Changelog

## Drush 10 branch

### 2020.09.22 - 1.5.1
* quick fix to ULI command to pass all arguments 

### 2020.09.17 - 1.5.0
* NEW branch specific for Drush 10 only
* Only one Drush10 specific command - pwrd command
* branched from 1.4.5 release

## Drush 8/9 branch

### 2020.09.22 - 1.4.6
* quick fix to ULI command to pass all arguments 

### 2020.05.17 - 1.4.5
* Change all composer commands to use 'fin composer' instead of relying on a local native composer install

### 2020.04.29 - version 1.4.4
* set composer install to use docksal version instead of local version - fin composer install
* Removing 'all' argument from cache rebuild command

### 2019.11.07 - version 1.4.0
* Added timer to sync
* Added uli command to replace drush uli 
* Added uli to sync command
* Removed all calls to drush entup, and updated documentation
* Updated CLI container to latest docksal container
* Added SITE_URI variable to be used with ULI command