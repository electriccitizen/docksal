# Newupstream
xxx

[![CircleCI](https://circleci.com/gh/electriccitizen/newupstream.svg?style=shield)](https://circleci.com/gh/electriccitizen/newupstream)
[![Dashboard newupstream](https://img.shields.io/badge/dashboard-newupstream-yellow.svg)](https://dashboard.pantheon.io/sites/9ec12d94-c804-44b7-968e-166a0b49fdc0#dev/code)
[![Dev Site newupstream](https://img.shields.io/badge/site-newupstream-blue.svg)](http://dev-newupstream.pantheonsite.io/)

Newupstream is a Composer-based Drupal 8 application hosted on [Pantheon](http://dashboard.getpantheon.com). The application integrates with [Circle CI](https://circleci.com/dashboard) for continuous integration testing and automated deployments. Follow this README to set up a local environment for site building, development, and theming. 

## Onboarding

See the [one-time setup documentation](docs/SETUP.md) if you are installing VirtualBox, Docksal, and/or Terminus for the first time. Please also:

* Add your public key to your Pantheon account, and be on the team [(?)](https://pantheon.io/docs/ssh-keys/)
* Add your public key to your Github account, and be on the team [(?)](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
* Update your Pantheon aliases (```terminus aliases```)

Once you meet the above requirements, clone the Github repository into your Docksal projects directory and initialize the site:

```cd ~/Projects/newupstream```

```git clone git@github.com:electriccitizen/newupstream.git```

Move to your project's root folder and initialize the site:

```cd newupstream```

```fin init```

You can run the ```fin init``` command any time you want to start a new install, or to ensure that your local environment is in a safe one-to-one state with the development environment. During active development, you will typically run ```fin sync``` instead (see below).

## Getting started

* Local URL: http://newupstream.docksal
* Dev URL: http://dev-newupstream.pantheonsite.io
* Local drush: ```fin drush <your-command>```
* Remote drush: ```drush @newupstream.dev <your-command>```
* User 1: admin/admin

## Be a good citizen

You are working in a team environment and must follow a few rules. If you are careless, it can lead to:

* Losing all of your uncommitted work (bad)
* Overriding or losing the work of others (worse)
* Uninstallable configuration or deploy errors

See this guide to [following a safe workflow](docs/WORKFLOW.md) when using configuration management in Drupal 8. The recommended workflow below follows these best practices, and includes two helper commands (```fin sync``` and ```fin validate```) that automate important components of a safe work flow.

## Recommended workflow

Here is a safe workflow that will help prevent lost work and other problems.

```fin sync``` to ensure your local site is synced with development environment before starting a new task [1]

```git checkout -b <your-feature-branch>``` to checkout a new feature branch; start a new task and do your thing

```fin drush cex``` to export your changes

```git add``` to add any new configuration, theme, or custom module files 

```git commit``` to commit your changes and get your feature branch into a safe, recoverable state

```fin validate``` to check your work against the master branch and pull in changes from other team members [2]

```git push origin <your-feature-branch>``` to push your feature branch to Github if everything looks good

When you push your feature branch, it triggers a Circle CI build to run tests and imports against the development server. You can continue to push to your branch until your work is complete and your site is passing its automated tests.

**NOTES**

[1] ```fin sync``` is an wrapper command to ensure your local environment is in a safe, one-to-one state with the development environment (with an optional database sync). See [following a safe workflow](docs/WORKFLOW.md) for more details.

[2] ```fin validate``` is a wrapper command to pull in changes from team members, and to make sure your branch can safely merge into master. See [following a safe workflow](docs/WORKFLOW.md) for more details. If your feature branch is open for a long time, you should export and ```fin validate``` often.

If you see errors or merge conflicts when running ```fin validate``` against your feature branch, it means your changes to a file(s) are conflicting with another change that has already been pushed to master branch. You will need to work with the team to understand, fix, and commit the conflicting file(s). 

As long as you have exported and committed your work per the above workflow, you can always rollback to your last known working version if necessary.

## Submit a Github pull request

Once your feature branch looks good and is passing its Circle CI tests, submit a Github pull request against your branch. A project maintainer will review the changes and merge into master.

*Note: Advanced or otherwise approved users can submit and merge their own PRs, and/or merge and push a feature branch directly into master without a formal pull request. Ask if you have questions, and err on the side of caution.*


## Next steps

Instructions for frontend theming and other topics are available in separate documents:

* [Frontend/theming](docs/THEME.md)
* [Working with Docksal](docs/DOCKSAL.md)
* [Troubleshooting](docs/TROUBLESHOOT.md)
* [Following a safe workflow](docs/WORKFLOW.md)

## Old local environments

If you have previously worked on this project or are having trouble with Docksal, the old [Lando](docs/LANDO.md) and [DrupalVM](docs/DRUPALVM.md) builds are both still available if needed.

## Support and feedback

If you need support or find any errors or suggested improvements in this README contact <tim@electriccitizen.com>.

[Back to top](#newupstream)
