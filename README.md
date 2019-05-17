# Vagrant minimal WP
Vagrant scripts to set up WordPress (on Ubuntu Xenial, PHP7, NGINX) and nothing else.

Use this to set up a minimal WordPress (latest version) install, without any additional (development) tools. Assumes you have Vagrant set up and configured.

* Ubuntu 18.04 LTS
* NGINX
* PHP 7.3
* PHPMyAdmin

Usage

1. Clone this repo into your project folder
1. vagrant up
1. Edit your hosts file so 'vagrant.dev' connects to 192.168.33.10
1. Point your browser to vagrant.dev, and set the site name, user etc
1. Happy WordPressing
