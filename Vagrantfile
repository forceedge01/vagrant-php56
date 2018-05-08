# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "forceedge01/php56-behat"
  config.vm.box_version = "0.2.2"
  config.vm.synced_folder "../", "/home/vagrant/"
  config.vm.network "private_network", type: "dhcp"
  config.ssh.private_key_path = File.expand_path('~/.vagrant.d/insecure_private_key')
  config.ssh.insert_key = false
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
  end
end
