# Troubleshooting
[back to README](../README.md)

**```fin up``` or ```fin reset``` fails to start your services**

Make sure that your project was cloned into your defined Docksal project folder. By default this is ~/Projects unless you set up a different folder during initial setup. 

** Cannot mount NFS error**

This can be caused by conflicting entries in your ```/etc/exports``` file and often happens if you have had another Virtualbox instance running of the project running in DrupalVM. 

One method for fixing this problem:

1. Make a backup of your existing ```/etc/exports``` file

2. Delete the original ```/etc/exports``` file

3. Run ```fin system reset```

If you are still working with other DrupalVMs or Virtualbox instances, you may need to restore your backup file. You can also selectively comment your ```/etc/exports``` file as needed.

[back to README](../README.md)