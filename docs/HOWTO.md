# HOW TO INSTALL AND MANAGE DOCKSAL BUILD

This is a composer package that gets added to the repositories section of your project's composer.json file. You can specify the version by tag:

 "repositories": [
    {
      "type": "composer",
      "url": "https://packages.drupal.org/8"
    },
    {
      "type": "package",
      "package": {
        "name": "electriccitizen/docksal",
        "version": "1.1.3",
        "type": "drupal-custom-module",
        "source": {
          "url": "https://github.com/electriccitizen/docksal.git",
          "type": "git",
          "reference": "1.1.3"
        }
      }
    }
  ],

add to composer require 

"electriccitizen/docksal": "~1"

Don't forget to add to installer path

".docksal": ["type:drupal-custom-module"]

To update to a new or different version number, update the version and reference tags, and then run:

```composer install```

to set up the new version. 

After installing or updating you will also want to regenerate the documentation:

./docgen.sh


and then commit those changes. 

Also make sure that you add and commit the settings.docksal.php file to your repository.

Copy, update and commit local docksal files

Don't forget to add to installer path

".docksal": ["type:drupal-custom-module"]
