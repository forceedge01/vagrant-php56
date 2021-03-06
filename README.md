# vagrant-php56
Useful when working with older software requiring dependencies not available for your machine. Box used https://app.vagrantup.com/forceedge01/boxes/php56-behat

The intended use is for unit testing some packages, it has the following configuration: 

- Centos 7
- httpd 2.4
- Subversion
- Git
- PHP 5.6
- PHP-PDO
- PHP-DBLIB (mssql)
- PHP-MYSQL
- Redis-cli 3.0.7
- Percona Server for MySQL 5.6
- Composer

## Installation:

This project is meant to be submoduled in to your project and get you going. This is the ideal setup:

```
git submodule add https://github.com/forceedge01/vagrant-php56 && cd vagrant-php56 && vagrant up
```

You will need to install virtualbox to get this running. If running on ubuntu, install it via the package manager 'apt-get' as opposed to the GUI version, it will give you less trouble.

This vagrant box will sync the directories outside of its own folder, this is done so you can conveniently clone this repository inside your project root folder and perform a vagrant up and viola, you've got your environment ready.

To get in the box, perform the usual vagrant ssh. Your project is synced in the /home/vagrant folder (usually home folder when you vagrant ssh in). If not refer to the Vagrantfile.

This project also comes with an init.sh file, this will do a few things for you:

- Setup ssh key on the vagrant box.
- Create a file at the root of the project to ssh into the box.
- Create a file at the root to run commands in the vagrant machine.
- Create a file at the root to run unit tests on the vagrant machine.

## Ubuntu only:
You may run into the trouble of signing some kernel modules. Error you may get is:

Could not load 'vboxdrv' or something similar.

Which will lead you to:

$ sudo modprobe vboxdrv
modprobe: ERROR: could not insert 'vboxdrv': Required key not available

To get the key do the following:

Since kernel version 4.4.0-20, it was enforced that unsigned kernel modules will not be allowed to run with Secure Boot enabled. Because you want to keep Secure Boot, then the next logical step is to sign those modules.

So let's try it.

### Create signing keys (Ubuntu)
```
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=Descriptive name/"
```
Sign the module (vboxdrv for this example)
```
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
```

Perform the above for all modules located in the folder where vboxdrv is located, you can find out where vboxdrv is by executing:

```
modinfo -n vboxdrv
```

Register the keys to Secure Boot
```
sudo mokutil --import MOK.der
```
Supply a password for later use after reboot

Reboot and follow instructions to Enroll MOK (Machine Owner Key). Here's a sample with pictures. The system will reboot one more time. After the reboot, you may also need to sudo modprobe vboxdrv to load the module.

Ref: https://askubuntu.com/questions/760671/could-not-load-vboxdrv-after-upgrade-to-ubuntu-16-04-and-i-want-to-keep-secur
