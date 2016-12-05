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
sudo apt-get -y install php
sudo apt-get -y install php7.0-gd
php -v

# set up mySQL
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server
sudo apt-get -y install php-mysql

# create a database
#mysql -uroot p$PASSWORD -e "create database wp"
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
