#!/bin/bash

VAR1="VAR1"

#updates packages
sudo apt update

#Install composer
cd ~
curl -s https://getcomposer.org/installer -o /tmp/composer-setup.php

#Install composer globally
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Install bedrock in /var/www/html
cd /var/www
sudo git clone https://github.com/roots/bedrock.git

sudo mv /var/www/html /var/www/bedrock/web