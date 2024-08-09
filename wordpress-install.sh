#!/bin/bash

# Remove the existing html directory
sudo rm -rf /var/www/html

# Install unzip utility
sudo apt -y install unzip

# Download the latest WordPress zip file
sudo wget -O /var/www/latest.zip https://wordpress.org/latest.zip

# Unzip the downloaded WordPress file into /var/www/
sudo unzip /var/www/latest.zip -d /var/www/

# Remove the downloaded zip file
sudo rm /var/www/latest.zip

# Move the WordPress files to the html directory
sudo mv /var/www/wordpress /var/www/html 

# Create a new MySQL database for WordPress if it doesn't already exist
sudo mysql -e "CREATE DATABASE IF NOT EXISTS wordpress"

# Create a new MySQL user for WordPress with a specified password
sudo mysql -e "CREATE USER IF NOT EXISTS wpuser@localhost identified by 'theweatherisnice'"

# Grant all privileges on the WordPress database to the newly created user
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* to wpuser@localhost"

# Refresh MySQL privileges to ensure that all changes take effect
sudo mysql -e "FLUSH PRIVILEGES"

# Download the WordPress configuration file from the specified S3 bucket
sudo wget -O /var/www/html/wp-config.php https://dannylandawordpress.s3.amazonaws.com/wp-config.php
#back up of old - sudo wget -O /var/www/html/wp-config.php https://dannylandawordpress.s3.amazonaws.com/wp-config.php

# Set the permissions of the wp-config.php file to be readable and writable by the owner only
sudo chmod 640 /var/www/html/wp-config.php 

# Change the ownership of the html directory to the www-data user and group
sudo chown -R www-data:www-data /var/www/html/

# Reload NGINX for changes to take effect
sudo systemctl reload nginx

# Comments for the following commands (not currently executed)
# Change to the nginx configuration directory
# sudo cd /etc/nginx/conf.d/
# Create a new configuration file for WordPress (fetch from S3 bucket)
# sudo touch wordpress.conf pull from s3bucket
