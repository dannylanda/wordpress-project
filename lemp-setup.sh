#!/bin/bash 

# Update the package list
sudo apt -y update

# Upgrade all installed packages to their latest versions
sudo apt -y upgrade

# Create a file to store the output of LEMP stack unit tests
sudo touch /root/testing.txt

# Install Nginx web server
sudo apt -y install nginx

# Start Nginx and enable it to start on server boot
sudo systemctl start nginx && sudo systemctl enable nginx

# Write the status of Nginx to the testing.txt file
sudo systemctl status nginx > /root/testing.txt

# Install MariaDB server
sudo apt -y install mariadb-server

# Start MariaDB and enable it to start on server boot
sudo systemctl start mariadb && sudo systemctl enable mariadb

# Append the status of MariaDB to the testing.txt file
systemctl status mariadb >> /root/testing.txt

# Install PHP and various PHP extensions
sudo apt -y install php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl

# Append the PHP version information to the testing.txt file
sudo php -v >> /root/testing.txt

# Change directory to /var/www/html/
cd /var/www/html/

# Rename the default Apache test page if it exists
sudo mv index.html index.html.old
