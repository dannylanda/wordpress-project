#!/bin/bash
sudo cd /var/www/html/
sudo wget https://wordpress.org/latest.zip
sudo apt install unzip
sudo unzip latest.zip
sudo rm latest.zip
sudo mariadb -u root

# /** The name of the database for WordPress */
define('DB_NAME', 'database_name_here');
#/** MySQL database username */
define('DB_USER', 'username_here');
/** MySQL database password */
define('DB_PASSWORD', 'password_here');

cd wordpress/ 
sudo cp wp-config-sample.php wp-config.php
vi wp-config.php
# added the database name / username / password

sudo chmod 640 wp-config.php
sudo chown www-data:www-data /var/www/html/wordpress/ -R

cd /etc/nginx/conf.d/
sudo vi /etc/nginx/conf.d/wordpress.conf
# ec2-54-83-68-228.compute-1.amazonaws.com;
# Root /var/www/html/wordpress/;
nginx -t
systemctl reload nginx
