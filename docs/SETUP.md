# INITIAL SETUP
[back to README](../README.md)

**Install Terminus and authenticate via machine token**

Follow the [Terminus install instructions](https://pantheon.io/docs/terminus/install/) to install and generate a machine token for authentication. (Save your token somewhere safe in case you need it later.) If you are running already Terminus you can check your version:

```terminus --version``` and [update Terminus](https://pantheon.io/docs/terminus/updates/) if you are running an older version.

```terminus auth:login``` to verify you can authenticate via machine token

**Install VirtualBox (5.1.28 or higher)**

VirtualBox is available for Mac, PC and Linux and can be [installed manually](https://www.virtualbox.org/wiki/Downloads) on your platform. If necessary, you can update to a new version or manage your virtual machines using VirtualBox Manager GUI. 

**Install Docksal (One-time setup)**

Follow the [one-time setup instructions](https://docs.docksal.io/en/master/getting-started/env-setup/) for your platform. Once you complete step 3 you are finished with the onboarding process and can [get started](../README.md). You should be all set for this and future Docksal projects. 

*IMPORTANT: By default, Docksal uses the /Users/[username]/Projects folder to store projects. You can change this to /Users/[username]/Sites (or another location) during setup, but be sure to clone all of your projects into whichever project folder you defined during Docksal setup. Docksal is opinionated, and will not work if you attempt to run from outside your defined project folder.*


[back to README](../README.md)
