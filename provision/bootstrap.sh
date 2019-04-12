#!/usr/bin/env bash

PASSWORD='12345678'

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

# nginx
sudo apt-get -y install nginx
sudo service nginx start

# set up nginx server
sudo cp /vagrant/provision/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf

# set up PHP
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get -y install php7.3-fpm php7.3-cli php7.3-gd php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc
php -v

# set up mySQL
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"

sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"

sudo apt-get -y install mysql-server
sudo apt-get -y install php7.3-mysql
sudo apt-get -y install phpmyadmin

# create a database
mysql -uroot -p$PASSWORD <<MYSQL_SCRIPT
CREATE DATABASE wp;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY '$PASSWORD';
GRANT ALL PRIVILEGES ON wp.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user created."
echo "Username:   wpuser"
echo "Password:   $PASSWORD"

# WordPress
cd /var/www/site
wget http://wordpress.org/latest.tar.gz -q --show-progress
tar xfz latest.tar.gz
mv wordpress/* ./
rm -rf ./wordpress/
rm -f latest.tar.gz

# Copy WP's config file to the VM
sudo cp /vagrant/provision/wp-config.php /var/www/site/wp-config.php
sudo chmod 644 /var/www/site/wp-config.php

# restart services to activate changes
sudo service nginx restart
