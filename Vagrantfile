# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "forceedge01/php56-behat"
  config.vm.box_version = "0.2.3"
  config.vm.synced_folder "../", "/vagrant"
  config.vm.network "private_network", type: "dhcp"
  config.ssh.username = "vagrant"
  config.ssh.password = false
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
  config.vm.provision "shell", inline: "yum install -y gcc kernel-devel; yum update -y kernel"
end
