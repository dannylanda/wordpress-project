#!/bin/bash
sudo apt -y update
sudo apt -y upgrade
sudo touch /root/testing.txt # this file will contain the output of our LEMP stack unit tests
sudo apt -y install nginx
sudo systemctl start nginx && systemctl enable nginx
sudo systemctl status nginx > testing.txt
sudo apt -y install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb
sudo systemctl status mariadb >> /root/testing.txt
sudo apt install -y php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
php -v >> /root/testing.txt
