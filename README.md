# EPA Wordpress Project

So far this repo emcompasses Automation, using scripts to stand up web servers to my requirement instead of doing it manually, and also Unit Testing which is a part of our script to output if the scripts exceuted successfully. 

The Scipts Explained: 
# git-setup.sh: 
This script is designed to automate several tasks required for setting up a project. It begins by defining a log file where all actions and their outcomes will be recorded. The script includes a function to check if each command it runs is successful. If a command fails, an error message is logged, and the script stops executing.
The first step of the script is to clear the log file to ensure that only the current execution's details are logged. It then updates the package lists on the system using apt update and upgrades all installed packages with apt upgrade. These steps ensure that the system is up-to-date with the latest software versions and security patches.
Next, the script clones a GitHub repository into a specified directory. This repository contains the project files needed for the setup. After cloning the repository, the script changes the permissions of the cloned files to ensure they are accessible and executable as needed.
Finally, the script runs a setup script from the cloned repository to complete the project setup. Throughout these steps, the script logs whether each operation succeeds or fails, providing a clear audit trail of the actions taken and any issues encountered.

# lemp-setup.sh: 
This script sets up a LEMP stack (Linux, Nginx, MariaDB, PHP) and configures a WordPress site on a server. It begins by creating a file named testing.txt to log the output of various operations. The first major task is to install Nginx, a popular web server. After installing Nginx, the script ensures that it starts immediately and is configured to start automatically on server reboot. It then checks the status of Nginx and records this information in the testing.txt file.
Next, the script installs the MariaDB server, which is used for managing the database. Similar to Nginx, MariaDB is started and enabled to run on startup. The status of MariaDB is also checked and appended to the testing.txt file.
Following the database setup, the script installs PHP along with several commonly used PHP modules necessary for running a WordPress site. It then logs the installed PHP version to the testing.txt file.
The script proceeds to rename the default Apache testing page to avoid conflicts with Nginx. It then moves a custom Nginx configuration file from the cloned WordPress project directory to the appropriate directory for Nginx configurations.
To ensure the Nginx configuration file uses the correct server name, the script retrieves the server's public IP address, formats it, and updates the configuration file with this formatted DNS record.
Finally, the script runs a WordPress installation script to complete the setup of the WordPress site.

# nginx.conf: 
This Nginx configuration file is designed to serve a WordPress site efficiently and securely. It starts by setting up the server to listen on port 80 for both IPv4 and IPv6 connections. The server_name placeholder will be replaced with the actual DNS name of the server. The root directory for the website files is set to /var/www/html, and the server will look for index files such as index.php and index.html.
The configuration includes custom log files for error and access logs to keep track of server activity and errors. For handling requests, the location / block attempts to serve the requested file directly or passes the request to index.php if the file is not found. This is essential for handling WordPress's permalinks structure.
Special handling is configured for the WordPress REST API and sitemaps. Requests to the JSON API are rewritten to a specific route, while sitemap requests try to serve the file directly or pass it to index.php.
Custom error pages are specified for 404 (not found) and 50x (server error) responses. The maximum allowed size for client request bodies is set to 20 megabytes, ensuring that large file uploads are handled appropriately.
The configuration includes settings for PHP-FPM, which processes PHP files. It specifies the socket for PHP-FPM and sets parameters needed for PHP to function correctly with Nginx, including buffer sizes to optimize performance.
To improve performance, gzip compression is enabled. This reduces the size of responses, making the site faster to load. Specific MIME types are set to be compressed, and a compression level of 5 is chosen for a balance between compression efficiency and resource usage.
Static files like images, CSS, and JavaScript are cached by the browser for 360 days, speeding up repeat visits to the site. Finally, access to hidden files (like .htaccess) is disabled for security reasons, preventing unauthorized access to sensitive configuration files.

# wordpress-install.sh
This script automates the process of setting up a WordPress site on a server. It begins by removing any existing content in the /var/www/html directory to ensure a clean environment for the new WordPress installation.
First, it installs the unzip utility, which is necessary for extracting the WordPress files. The script then downloads the latest version of WordPress from the official WordPress website and unzips the downloaded file into the /var/www/ directory. After extracting the files, the downloaded zip file is deleted to save space.
Next, the script moves the WordPress files from the /var/www/wordpress directory to /var/www/html, making them accessible to the web server. It then sets up a MySQL database for WordPress. If the database does not already exist, it is created. Additionally, a new MySQL user named wpuser is created with the password theweatherisnice, and this user is granted all privileges on the WordPress database. The MySQL privileges are then refreshed to ensure the changes take effect.
To configure WordPress, the script downloads a pre-configured wp-config.php file from a specified S3 bucket and places it in the /var/www/html directory. The permissions of this file are set to be readable and writable only by the owner for security reasons. The ownership of the entire /var/www/html directory is changed to the www-data user and group, which are the default user and group for the Nginx web server.
Finally, the script reloads Nginx to apply the changes and ensure the server is using the latest configuration.
The script also includes commented-out commands that indicate potential future steps, such as changing to the Nginx configuration directory and creating a new configuration file for WordPress, which could be fetched from an S3 bucket.
