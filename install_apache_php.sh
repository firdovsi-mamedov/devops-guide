#!/bin/bash

# Prompt the user for the PHP version
echo "Available PHP versions: 7.1, 7.2, 7.3, 7.4, 8.0, 8.1"
read -p "Enter the desired PHP version: " php_version

# Check if the provided PHP version is valid
if [ "$php_version" != "7.1" ] && [ "$php_version" != "7.2" ] && [ "$php_version" != "7.3" ] && [ "$php_version" != "7.4" ] && [ "$php_version" != "8.0" ] && [ "$php_version" != "8.1" ]; then
    echo "Invalid PHP version. Available PHP versions: 7.1, 7.2, 7.3, 7.4, 8.0, 8.1"
    exit 1
fi

if dpkg -l | grep -q "apache2"; then
    sudo apt install apache2 libapache2-mod-php$php_version -y
else
    sudo add-apt-repository ppa:ondrej/apache2 -y
    sudo apt update
    sudo apt upgrade -y
    sudo apt install apache2 libapache2-mod-php$php_version -y
fi

