#!/bin/bash
echo
echo '### Setting up ssh key on box'
key=$(cat ~/.ssh/id_rsa.pub)
vagrant ssh -c "mkdir -p ~/.ssh/authorized_keys && cat $key >> ~/.ssh/authorized_keys"

filename=vssh
echo
echo "### Creating $filename file: ssh into the box from root using this file."
rm ../$filename && \
touch ../$filename && \
chmod a+x ../$filename && \
echo '#!/bin/bash' >> ../$filename && \
echo 'cd vagrant-php56 && vagrant ssh' >> ../$filename

filename=vc
echo
echo "### Creating $filename file: run commands on the vagrant box using this file."
rm ../$filename && \
touch ../$filename && \
chmod a+x ../$filename && \
echo '#!/bin/bash' >> ../$filename && \
echo 'cd vagrant-php56 && vagrant ssh -c "$@"' >> ../$filename

filename=vtests
echo
echo "### Creating $filename file: run tests by executing this file."
rm ../$filename && \
touch ../$filename && \
chmod a+x ../$filename && \
echo '#!/bin/bash' >> ../$filename && \
echo 'cd vagrant-php56 && vagrant ssh -c "vendor/bin/phpunit -c tests"' >> ../$filename
echo