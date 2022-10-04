#!/bin/bash

#updates packages
sudo apt update

#Install composer
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

#Checks if hash of the installed composer is the same as the version on the verified server
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH

#Verify installation 
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

#Install composer globally
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Test composer
composer