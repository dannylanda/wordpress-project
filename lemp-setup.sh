#!/bin/bash
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install nginx
sudo systemctl start nginx && systemctl enable nginx
sudo apt -y install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb
sudo apt -y php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
apt install -y mariadb-server
