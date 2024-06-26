#!/bin/bash
sudo cd /var/www/
sudo rm -rf html
sudo wget https://wordpress.org/latest.zip
sudo apt install unzip
sudo unzip latest.zip
sudo rm latest.zip
sudo mv wordpress html
sudo mysql -e "CREATE DATABASE IF NOT EXISTS wordpress"
sudo mysql -e "CREATE USER wpuser@localhost identified by 'password'"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* to wpuser@localhost"
sudo mysql -e "FLUSH PRIVILEGES"
sudo cd /var/www/html/wordpress
sudo wget https://dannylandawordpress.s3.amazonaws.com/wp-config.php
sudo chmod 640 wp-config.php
sudo chown www-data:www-data /var/www/html/wordpress/ -R
