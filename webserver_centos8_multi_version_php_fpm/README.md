# Centos8 Webserver With Multiple PHP Versions

###About

###Instructions

Before we start working on the main installation tasks please take a moment 
to make sure your version of CENTOS 8 is current. The images providers use are 
not always the latest release so even if you have just created it you need 
to update it. Ensuring you are working as root please follow the instructions 
bellow:


```
# Update and reboot linux

dnf update -y

reboot 
```

Now you have a clean and current installation of CENTOS 8 you can move on to 
the next task which is installing all the packages that are needed. In this 
repository you will see a file called server_build.sh, please open that file 
and execute all the commands in order, I recommend you copy and paste the 
blocks one by one, so you can see any errors that may pop up. If you do run 
into any problems please do contact me on github, so I can amend the build 
script.

You may see an error to do with firewalld not being found, it is safe to 
ignore this error because it just means that firewalld was not installed. I 
only put that in case other providers bundle it in their images.

Now the packages are installed you need to install the management software, 
you can do this by cloning the repository using the following command:

```
git clone https://github.com/ukwscltd/server_builds_and_scripts.git /usr/local/redpanel
```

This will install the project files in your local software directory and once 
this is complete you can run the setup function by typing the following:

```
php80 /usr/local/redpanel/webserver_centos8_multi_version_php_fpm/rpcmd.php setup
```