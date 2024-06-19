#!/bin/bash
sudo cd /var/www/html
sudo apt -y install unzip
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
rm latest.zip
sudo mysql -u root
# create database wordpress;
# create user wpuser@localhost identified by 'your-password';
# grant all privileges on wordpress.* to wpuser@localhost;
# flush privileges;
# exit;
# wget wp=config.php from S3 Bucket
sudo chmod 640 wp-config.php
sudo cd /etc/nginx/conf.d/
# sudo touch wordpress.conf pull from S3 Bucket
