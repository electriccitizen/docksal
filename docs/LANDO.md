# Newupstream [LANDO]

[back to README](../README.md)

[![CircleCI](https://circleci.com/gh/electriccitizen/newupstream.svg?style=shield)](https://circleci.com/gh/electriccitizen/newupstream)
[![Dashboard](https://img.shields.io/badge/dashboard-newupstream-yellow.svg)](https://dashboard.pantheon.io/sites/cbc91b53-e053-4c27-8ad4-7502151a02ed#dev/code)
[![Dev Site](https://img.shields.io/badge/site-newupstream-blue.svg)](http://dev-newupstream.pantheonsite.io/)

Wilder Foundation is a Composer-based Drupal 8 application hosted on [Pantheon](http://dashboard.getpantheon.com). The application integrates with [Circle CI](https://circleci.com/dashboard) for continuous integration testing. All development and theming is done on a local virtual machine running [Lando](https://docs.devwithlando.io/).

## Onboarding

See the [onboarding instructions](#onboarding-instructions) below for cloning the repository, installing Lando, and getting your local development environment set up for the first time.

## Basic Workflow

```terminus auth:login``` Make sure you are logged into Terminus via machine token

```lando start``` Make sure Lando is running

```lando sync``` Pull down a new copy of the code and database

```git checkout -b <my-feature-branch>``` Checkout a new branch and do your thing

```lando drush cex``` Export your changes to code

```git add .``` Add any new config, theme, or modules to github

```git commit -am "Commit message"``` commit your changes to Github

```git push origin <my-feature-branch>```

When you push changes to your working branch it will trigger a Circle CI build that attempts to merge and import your changes against the latest production database.

You can monitor the status of your builds here [![CircleCI](https://circleci.com/gh/electriccitizen/newupstream.svg?style=shield)](https://circleci.com/gh/electriccitizen/newupstream) and they are also posted to the #Chompbots channel in Slack. A [Pantheon multidev site](https://dashboard.pantheon.io/sites/cbc91b53-e053-4c27-8ad4-7502151a02ed#dev/code) is also created during the CI build that can be used to check your work or troubleshoot.

## Deploying

Once your tests are passing, create a new Github Pull Request against your branch so that it can be reviewed and merged into master.

## Best practices

1. Always start each new task with a fresh ```lando sync``` to make sure you have all of the latest changes

2. Always create a new ```feature branch``` for your task (do not work directly on ```master```)

3. Do your best to get your work merged into the ```master``` branch at the end of each day

4. If your ```feature branch``` is open for a long time, it is your responsibility to make sure it will still work against ```master```

Note: If you want to merge and test changes from ```master``` into your open feature branch, you will want to checkout and pull ```master``` branch. Then checkout your ```feature branch``` again and merge in the ```master``` branch.  If you are able to merge with no conflicts, then attempt a ```lando drush cim``` to ensure that the new configuration will import with no errors.   

## Helpful info

* Primary development branch: ```master``` (Github)
* Local drush alias: ```@newupstream.local```
* Remote drush alias: ```@newupstream.dev```
* Local URL: https://newupstream.lndo.site (Lando provides multiple URLs)
* Local login: admin/admin
* Remote feature branch: ```<your-feature-branch>``` (Pantheon multidev)
* Remote URL: http://dev-newupstream.pantheonsite.io

## Additional resources
* [Onboarding](#onboarding-instructions)
* [Theming basics](#theming-basics)
* [Learn Lando](#learn-lando)
* [Suggested additions](#suggested-additions) (Performance, theming, Behat)
* [Troubleshooting](#troubleshooting)
* [Support/Feedback](#support-and-feedback)

## Onboarding instructions

**Requirements**

* Install Lando (see https://docs.devwithlando.io/installation/installing.html)
* Install Terminus (see https://pantheon.io/docs/terminus/install/ )
* Add public key to Pantheon account and to team
* Add public key to Github account and add to team

Make sure your user account has been added to both the Github team and to the Pantheon team (with the proper roles/permissions) and that you have uploaded your public SSH key to your profile on both sites prior to beginning.

**Refresh your Pantheon alias file**

```
terminus auth:login
terminus aliases
```

**On your local machine, clone the working repository:**

```
git clone git@github.com:electriccitizen/newupstream.git
```

**Install project dependencies:**

```
cd newupstream

composer install
```

**Start Lando:**

```
lando start
```

**Install the Drupal site:**

```
lando sync
```

NOTE: Sometimes Lando has issues with Terminus authentication. It may tell you that it cannot authenticate, in which case you will need to run this command:

```lando terminus auth:login --machine-token=<YOUR-TOKEN>```

If you do not already have a saved machine token to use, you will need to [generate a new Terminus token](https://dashboard.pantheon.io/login?destination=%2Fuser#account/tokens/create/terminus/) to use (save this token for later use on future Lando build.)

[Back to top](#newupstream)


## Theming basics

* We use npm and Pattern Lab to theme the site

* Make sure your version of node is at least 6.11.2 and your npm version is at least 5.5.1 (command can be run from anywhere):

```
node -v

npm -v
```

* To update node:

```
npm install -g n
```

* To update npm:

```
npm install npm@latest -g
```

**Install the node modules**
This command only needs to be run when you first install a local instance of the site.

```
cd /web/themes/oc_patterns
npm install
```

**Start Pattern Lab and Sass compilation**
This command is run from theme folder, and runs all theming Gulp tasks (Pattern Lab syncing, Sass Linting, Sass Compilation, SGV Sprite building and sprite mixins creation, and scss to YAML configuration for colors):
```
cd <your_project_root>/web/themes/oc_patterns

npm start
```

Once a change is saved in any Pattern Lab file, the change will be reflected in the local Pattern Lab instance (which will refresh automatically).  

If new files are added to the Pattern Lab components, or files are deleted, you must quit the start command in terminal and run it again for the new files structure to be detected.

```
<ctrl> + c

npm start
```

**Pattern Lab File locations**
All Pattern Lab files (twig, scss, and js) are located in oc_patterns/components. Most files used in both Pattern Lab and Drupal are located in the components/\_patterns file. Drupal specific js and some theme libraries can be found in components/js.

All Drupal templates are found in oc_patterns/templates. All custom templates are found in templates/zzz-custom.

We use an atomic approach to Pattern Lab file structure with Global elements for Pattern Lab and Drupal found in \_patterns/00-base. Small elements are found in \_patterns/00-atoms. Larger elements are found in \_patterns/02-molecules, \_patterns/03-organisms and \_patterns/04-pages. Drupal specifc high-level things and Pattern Lab specific styles are found in \_patterns/05-sitewide.

**Hiding files from Pattern Lab**
By default, any file in components/\_patterns is going to be shown in Pattern Lab. You can prevent files from being shown in Pattern Lab by preceding the file name with an underscore. The file will sitll be active, but it will not by displayed in the local Pattern Lab instance. This is handy for things like files that are extended straight into Drupal like \_html.twig.

[Back to top](#newupstream)

## Learn Lando

**Lando commands**

You can list all of your installed sites:

```lando list```

You may need to restart your app if it is causing you trouble:

```lando restart```

You may need to rebuild your app if it has changed:

```lando rebuild```

You may need config details about your app such as your available URLs:

```lando info```

You may want to destroy your app completely:

```lando destroy```

You may have to fix a random or persistent Docker error. From the Docker icon (a little whale) in your top Menu Bar:

```Preferences > Reset```

Note that you can run any standard drush command against your local environment for debugging and troubleshooting:

```
lando drush cr all

lando drush cex

lando drush cim

etc.
```
[Back to top](#newupstream)

## Suggested additions

**Prestissimo**

Install prestissimo globally in order to dramatically speed up Composer with parallel installs:

```
composer global require "hirak/prestissimo:^0.3"
```

**Local BEHAT testing**

If you want to run Behat tests on your local machine:

```
brew cask install java
brew install chromedriver
```

**Theme/Frontend**

To interact with the theme you will need NPM:

```
brew install npm nvm
```

[Back to top](#newupstream)

## General tips

* Keep your composer version up to date by running:

```
composer self-update
```
* If you run into random composer issues such as missing vendor files after running ```composer install``` try clearing your composer cache:

```
composer clear-cache
```
[Back to top](#newupstream)

## Troubleshooting

**Pantheon and Github accounts**

> You will need a Pantheon account and a Github account. Make sure both accounts have been added to the respective teams and that your public SSH key has been added to your profiles.

> * [Adding public key to Pantheon](https://pantheon.io/docs/ssh-keys/)
> * [Adding pubic key to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

> If you already have Pantheon and Github accounts with public keys in place (and they have been added to the appropriate teams for this project) you can skip this step.

## Support and feedback

If you need support or find any errors or suggested improvements in this README contact <tim@electriccitizen.com>.

[Back to top](#newupstream)
