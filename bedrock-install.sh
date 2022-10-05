#!/bin/bash

#---CONFIG---

#Your ssh username
USER="freudend"
HOME_URL="http://34.65.179.44"

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

#Move current wordpress install folder to web folder in bedrock
sudo cp -a /var/www/html /var/www/bedrock/web

#Changes index directory in openlitespeed wordpress virtualhost
sudo sed -i -e 's+/var/www/html/+/var/www/bedrock/web/html/+g' /usr/local/lsws/conf/vhosts/wordpress/vhconf.conf

#Download .env file to bedrock directory
cd /var/www/bedrock && sudo wget $GITHUB_ENV -P /var/www/bedrock

#Install wp CLI in bedrock directory and 
cd /var/www/bedrock && composer require wp-cli/wp-cli
cd /var/www/bedrock && composer install

cd /var/www/bedrock && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

cd /var/www/bedrock && ./vendor/wp-cli plugin list --path=wp --url=$HOME_URL/bedrock/wp

sudo chown -R freudend /usr/local/bin

#shows wordpress info
wp -info

#--- END SCRIPT ---

#Set owner back to www-data for security reasons
sudo chown -R www-data /var/www
sudo chown -R www-data /var/www/bedrock
sudo chown -R www-data /usr/local/lsws/conf