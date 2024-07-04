#!/bin/bash
# Create a file that will contain the output of our LEMP stack unit tests
sudo touch /root/testing.txt

# Install Nginx
sudo apt -y install nginx

# Start and enable Nginx to start on server reboot. The second command runs only if the first command is successful.
sudo systemctl start nginx && sudo systemctl enable nginx

# Check the status of Nginx and write it to the testing.txt file
sudo systemctl status nginx > /root/testing.txt

# Install MariaDB server
sudo apt -y install mariadb-server

# Start and enable MariaDB to start on server reboot
sudo systemctl start mariadb && sudo systemctl enable mariadb

# Check the status of MariaDB and append it to the testing.txt file
systemctl status mariadb >> /root/testing.txt

# Install PHP and various PHP modules
sudo apt -y install php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl

# Check the PHP version and append it to the testing.txt file
sudo php -v >> /root/testing.txt

# Rename the default Apache testing page
sudo mv /var/www/html/index.html /var/www/html/index.html.old

# Move the custom Nginx configuration file to the appropriate directory
sudo mv /root/wordpress-project/nginx.conf /etc/nginx/conf.d/nginx.conf

# Retrieve the public IP of the server, format it, and store it in a variable
dns_record=$(curl -s icanhazip.com | sed 's/^/ec2-/; s/\./-/g; s/$/.compute-1.amazonaws.com/')

# Replace the placeholder SERVERNAME in the Nginx configuration file with the formatted DNS record
sed -i "s/SERVERNAME/$dns_record/g" /etc/nginx/conf.d/nginx.conf

# Run the WordPress installation script
sudo bash /root/wordpress-project/wordpress-install.sh
```
