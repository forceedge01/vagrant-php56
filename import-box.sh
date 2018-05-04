#!/bin/bash

# Download the box files.
echo 'Downloading box'
mkdir box
wget https://1drv.ms/f/s!AloDq6KHhON5qFPVCId1jQ3k2Ohq box/

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

echo 'You are now ready to run vagrant up'
