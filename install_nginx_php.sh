#!/bin/bash

# Prompt the user for the PHP version
echo "Available PHP versions: 7.1, 7.2, 7.3, 7.4, 8.0, 8.1"
read -p "Enter the desired PHP version: " php_version

# Check if the provided PHP version is valid
if [ "$php_version" != "7.1" ] && [ "$php_version" != "7.2" ] && [ "$php_version" != "7.3" ] && [ "$php_version" != "7.4" ] && [ "$php_version" != "8.0" ] && [ "$php_version" != "8.1" ]; then
    echo "Invalid PHP version. Available PHP versions: 7.1, 7.2, 7.3, 7.4, 8.0, 8.1"
    exit 1
fi

sudo add-apt-repository ppa:ondrej/nginx-mainline -y
sudo apt update
sudo apt upgrade -y

# Install Nginx and the specified PHP version
sudo apt update
sudo apt install -y nginx php$php_version-fpm

sudo apt install nginx-extras -y