#!/bin/bash
USER="freudend"
HOME_URL="http://35.204.12.50"
GITHUB_ENV="https://raw.githubusercontent.com/deinfreu/openlitespeed-wordpress-bedrock/main/.env"
FILENAME_ENV=".env"

#Removes previous bedrock install
sudo rm -r -f /var/www/bedrock

#Sets permissions
sudo chown -R $USER /var/www/html
sudo chown -R $USER /usr/local/lsws/conf
sudo chown -R $USER /usr/local/lsws/conf

#updates packages
sudo apt update

#Install composer
cd ~
curl -s https://getcomposer.org/installer -o /tmp/composer-setup.php

#Install composer globally
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Makes $USER privelaged user 
sudo chown -R $USER /var/www/html

#Install bedrock in /var/www/html
cd /var/www
sudo git clone https://github.com/roots/bedrock.git

#Move html folder to web folder in bedrock
sudo cp -a /var/www/html /var/www/bedrock/web

#Changes index in openlitespeed
sudo sed -i -e 's+/var/www/html/+/var/www/bedrock/web/html/-+g' /usr/local/lsws/conf/vhosts/wordpress/vhconf.conf

cd ~
cd /var/www/bedrock
sudo wget $GITHUB_ENV >> $FILENAME_ENV

#--- END ---

#Set owner back to www-data
sudo chown -R www-data /var/www/html
sudo chown -R www-data /usr/local/lsws/conf