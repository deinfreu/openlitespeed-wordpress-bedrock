# openlitespeed-wordpress-bedrock

Installs bedrock on a openlitespeed wordperss installation

## Description

:information_source: I used a clean install of the google cloud openlitespeed-wordpress image to test this script.

This script automaticly downloads roots/bedrock and puts the current wordpress install folder in the wp folder in bedrock. After installation and moving the script enables usage of WP-CLI inside of the wordpress bedrock installation 

Todo:
- Take current wp database password and copy it to the .env

## Getting Started

* Wordpress installation
* SSH Connection with custom username

### Dependencies

* Wordpress installation
* SSH Connection with custom username

### Automaticaly installs & update Dependencies

* Composer
* roots/bedrock
* Wp-CLi

### Installing

:warning: ONLY USE THIS ON A DEVELOPMENT SERVER AND CHANGE THE SCRIPT TO FIT YOUR INSTALLATION.

* Fork this repo
* change to your variables in the bedrock-install.sh file and the .env file
* You still need to change PASSWORD to the database password of the current wordpress installation in the .env file

### Executing program

* How to run the program
* Step-by-step bullets

```
run the code as USER in ssh with: bash <(curl -Ls https://github.com/GITHUB_USERNAME/FORKED_REPO_NAME/raw/main/bedrock-install.sh)
```

## Authors

Contributors names and contact info

ex. Daniel Freudenberg
ex. [@deinfreu](https://www.instagram.com/deinfreundnl)

## Version History

* 0.2
    * Coming soon
* 0.1
    * Initial Release - Proof of concept

## Other plugins

Also take a look at these uself plugins
* [jonbp/wp-cli-sync](https://github.com/jonbp/wp-cli-sync)

## Acknowledgments

Inspiration
* [bvsisible/openlitespeed-mariadb-php72-bedrock-sage](https://github.com/bvisible/openlitespeed-mariadb-php72-bedrock-sage)