# EC Pantheon Docksal Container

A complete Docksal configuration for working with Pantheon-powered sites.

## Includes

*  Solr 3.x container  
*  Dev version of PHP 7.1 CLI container.  
*  "web" docroot directory (works with https://github.com/pantheon-systems/example-drops-8-composer).  
*  Empty php.ini file (ready for customization).  
*  "fin init" command that reset the local environment, creates and downloads (using Terminus) a new database backup from Pantheon, and (optionally) enables development-related modules in the local environment.  
*  Xdebug support in the docksal-local.yml file.  

Based originally on ideas from Mike A/Drupal Easy.