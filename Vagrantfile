# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "forceedge01/php56-behat"
  config.vm.box_version = "0.2.1"
  config.vm.synced_folder "../", "/home/vagrant/"
  config.vm.network "private_network", type: "dhcp"
end
