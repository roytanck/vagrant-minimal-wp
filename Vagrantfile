# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	# Every Vagrant development environment requires a box
	config.vm.box = "ubuntu/xenial64"

	# Set up the network
	config.vm.network "private_network", ip: "192.168.33.10"

	# Sync a folder that will hold the website
	config.vm.synced_folder "html/", "/var/www/site"

	# Define the bootstrap file: A (shell) script that runs after first setup of your box (= provisioning)
	config.vm.provision :shell, path: "provision/bootstrap.sh"

end
