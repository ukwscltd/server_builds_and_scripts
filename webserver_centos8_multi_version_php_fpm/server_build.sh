# This script is intended to be ran on a fresh image of centos8, please make
# sure you run this on the server you intend to as it will really screw up a
# live server. I have used the centos8 image from digial ocean and other
# providers may have things set up slightly different so you might need to
# tweak the settings a bit. Please comment on github if you encounter any
# problems
#
# Kind Regards
#
# Nicholas Ashley

###############################################################################
# Disable SELinux and prevent SELinux from starting on boot, SELinux really
# causes problems in these builds. Maybe in the future I will create a build
# that can do SELinux.
###############################################################################

setenforce 0

cat > /etc/selinux/config <<EOL
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of these three values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected.
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
EOL

###############################################################################
# Disable Any firewall that may come from the base image, you can add this back
# in later if you wish but most providers have network firewalls.
###############################################################################

systemctl stop firewalld

systemctl disable firewalld

###############################################################################
# Install Base tools that all servers should have, this installs the epel and
# remi repository as I have found its the most efficient way to manage multiple
# php installations.
###############################################################################

dnf install -y epel-release

dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

dnf install -y nano telnet mc net-tools vim wget curl lsof bash-completion bind-utils

###############################################################################
# Install development tools such as git, this step is optional but if you do
# want development tools do it at this step rather than later.
###############################################################################

dnf install -y git composer

###############################################################################
# Install PHP 8.0 and start running the FPM service. We leave the defaults in
# as the management scripts will initialize everything. You can skip this if
# you are not intending on using this version.
###############################################################################

dnf install -y php80-php php80-php-common php80-php-cli php80-php-ast php80-php-bcmath php80-php-brotli php80-php-componere php80-php-ffi php80-php-fpm php80-php-gd

dnf install -y php80-php-imap php80-php-intl php80-php-json php80-php-ldap php80-php-libvirt php80-php-mbstring php80-php-mysqlnd php80-php-opcache php80-php-pdo php80-php-pear

dnf install -y php80-libzip php80-php-pecl-bitset php80-php-pecl-csv php80-php-pecl-igbinary php80-php-pecl-mailparse php80-php-pecl-oauth php80-php-pecl-parle php80-php-pecl-redis5

dnf install -y php80-php-pecl-xdiff php80-php-pecl-xmldiff php80-php-pecl-yaml php80-php-pecl-zip php80-php-phpiredis php80-php-process php80-php-soap php80-php-sodium php80-php-xml

systemctl start php80-php-fpm

systemctl enable php80-php-fpm

###############################################################################
# Install PHP 7.4 and start running the FPM service. We leave the defaults in
# as the management scripts will initialize everything. You can skip this if
# you are not intending on using this version.
###############################################################################

dnf install -y php74 php74-php-common php74-php-cli php74-php-fpm php74-php-intl php74-php-libvirt php74-php-mbstring php74-php-opcache php74-php-pear php74-php-sodium php74-php-pecl-env php74-php-bcmath

dnf install -y php74-php-mysqlnd php74-php-pdo php74-php-pecl-mongodb php74-php-pgsql php74-php-pecl-memcached php74-php-pecl-redis5 php74-php-ldap php74-php-imap php74-php-pecl-oauth php74-php-pecl-ssh2

dnf install -y php74-php-json php74-php-pecl-csv php74-php-soap php74-php-xml php74-php-pecl-mailparse php74-php-pecl-yaml php74-php-pecl-rrd

dnf install -y php74-libzip php74-php-lz4 php74-php-pecl-mcrypt

dnf install -y php74-php-ast php74-php-componere php74-php-pecl-uploadprogress php74-php-phalcon4 php74-php-process

dnf install -y php74-php-gd php74-php-pecl-gmagick

###############################################################################
# Install PHP 7.3 and start running the FPM service. We leave the defaults in
# as the management scripts will initialize everything. You can skip this if
# you are not intending on using this version.
###############################################################################

dnf install -y php73 php73-php-common php73-php-cli php73-php-fpm php73-php-intl php73-php-libvirt php73-php-mbstring php73-php-opcache php73-php-pear php73-php-sodium php73-php-pecl-env php73-php-bcmath

dnf install -y php73-php-mysqlnd php73-php-pdo php73-php-pecl-mongodb php73-php-pgsql php73-php-pecl-memcached php73-php-pecl-redis5 php73-php-ldap php73-php-imap php73-php-pecl-oauth php73-php-pecl-ssh2

dnf install -y php73-php-json php73-php-pecl-csv php73-php-soap php73-php-xml php73-php-pecl-mailparse php73-php-pecl-yaml php73-php-pecl-rrd

dnf install -y php73-libzip php73-php-lz4 php73-php-pecl-mcrypt

dnf install -y php73-php-ast php73-php-componere php73-php-pecl-uploadprogress php73-php-phalcon4 php73-php-process

dnf install -y php73-php-gd php73-php-pecl-gmagick

systemctl start php73-php-fpm

systemctl enable php73-php-fpm

###############################################################################
# Install PHP 5.6 and start running the FPM service. We leave the defaults in
# as the management scripts will initialize everything. You can skip this if
# you are not intending on using this version.
###############################################################################

dnf install -y php56 php56-libzip php56-php-bcmath php56-php-cli php56-php-common php56-php-fpm php56-php-gd php56-php-imap php56-php-intl php56-php-ldap php56-php-libvirt php56-php-mbstring php56-php-mcrypt php56-php-mysqlnd php56-php-opcache php56-php-pdo php56-php-pear

dnf install -y php56-php-pecl-env php56-php-pecl-igbinary php56-php-pecl-imagick php56-php-pecl-jsond php56-php-pecl-libsodium php56-php-pecl-lzf php56-php-pecl-mailparse php56-php-pecl-uploadprogress php56-php-pecl-xdiff php56-php-pecl-xmldiff php56-php-pecl-yaml php56-php-pecl-zip php56-php-phpiredis php56-php-process php56-php-soap php56-php-xml

systemctl start php56-php-fpm

systemctl enable php56-php-fpm

###############################################################################
# Install Apache along with SSL, Fast CGI and http2 support. We leave all the
# settings at default and let the management script configure it.
###############################################################################

dnf install -y httpd mod_fcgid mod_ssl mod_http2

systemctl start httpd

systemctl enable httpd

###############################################################################
# Install Mariadb 10.5 then start and enable, currently the management scripts
# do not do much with the databases so for now you have to sort this yourself
# but that will change in future builds.
###############################################################################

cat > /etc/yum.repos.d/mariadb.repo <<EOL
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/centos8-amd64
module_hotfixes=1
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOL

dnf makecache

dnf install -y MariaDB-server MariaDB-client

systemctl start mariadb

systemctl enable mariadb

###############################################################################
# Sets the default command line version of PHP, by default we have set it to
# 8.0 but you can safely change this. You can access all other versions of PHP
# from the command line by calling them directly by php56, php73, php74 and
# php80.
###############################################################################

rm -f /usr/bin/php

ln -s /usr/bin/php80 /usr/bin/php

