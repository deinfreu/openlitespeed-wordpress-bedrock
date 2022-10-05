#!/bin/bash

#---CONFIG---

#Your ssh username
USER="freudend"

#--- PREPARE WORDPRESS ---

#---START SCRIPT---

#DONT ALTER it's for the script
GITHUB_ENV="https://raw.githubusercontent.com/deinfreu/openlitespeed-wordpress-bedrock/main/.env"

#Removes previous bedrock install
sudo rm -r -f /var/www/bedrock

#Sets permissions
sudo chown -R $USER /var/www
sudo chown -R $USER /usr/local/lsws/conf

#updates packages
sudo apt update

#Install composer
cd ~ && curl -s https://getcomposer.org/installer -o /tmp/composer-setup.php

#Install composer globally
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Install bedrock in /var/www/html
cd /var/www && sudo git clone https://github.com/roots/bedrock.git

#Sets permissions
sudo chown -R $USER /var/www/bedrock

#updates bedrock composer
cd /var/www/bedrock && composer install

#Move current index html folder to web folder in bedrock
sudo cp -a /var/www/html /var/www/bedrock/web

#Changes index in openlitespeed
sudo sed -i -e 's+/var/www/html/+/var/www/bedrock/web/html/+g' /usr/local/lsws/conf/vhosts/wordpress/vhconf.conf

#Download .env file to bedrock directory
cd ~ && cd /var/www/bedrock && sudo wget $GITHUB_ENV -P /var/www/bedrock

#Install wp CLI
composer require wp-cli/wp-cli

#--- END SCRIPT ---

#Set owner back to www-data
sudo chown -R www-data /var/www
sudo chown -R www-data /var/www/bedrock
sudo chown -R www-data /usr/local/lsws/conf

#--- END ---