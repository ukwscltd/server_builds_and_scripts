# Centos8 Webserver With Multiple PHP Versions

This is a basic webserver that is based on Centos8 which includes Apache, MariaDb and of course PHP. 
There is no DNS or email server included in this build it focuses only on serving webpages.

The build is based around virtual hosts, so the server can accommodate multiple domains using multiple versions of PHP 
simultaneously making it very useful as a development server. The configuration is done using a command line tool which 
takes care of all the configuration meaning that you do not have to venture into the various config files. 

This build is based on the Digital Ocean image of centos 8.3 and some providers may have slightly different builds so 
you may have to tweak the constants at the top of the script to get things working.  