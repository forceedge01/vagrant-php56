#!/bin/bash

# Download the box files.
echo 'Downloading box'
mkdir -p box
wget -o box/php56-behat.box https://vagrantcloud.com/forceedge01/boxes/php56-behat/versions/0.2.3/providers/virtualbox.box --show-progress

if [[ $? != 0 ]]; then
	echo 'Download unsuccessful';
	exit;
fi

echo 'Adding box to vagrant'
# vagrant box add the box.
vagrant box add box/php56-behat.box

if [[ $? == 0 ]]; then
	echo 'Removing box';
	rm -rf box;
fi

echo 'You are now ready to run vagrant up - you can delete virtualbox.box file in this folder if you wish to.'
