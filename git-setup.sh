#!/bin/bash

# Install git package without prompting for confirmation
sudo apt -y install git

# Clone the specified GitHub repository into /root/
sudo git clone https://github.com/dannylanda/wordpress-project.git wordpress-project

# Change permissions of the cloned directory to read and execute for all users, and write for the owner
sudo chmod -R 755 wordpress-project

# Execute the lemp-setup.sh script from the cloned repository
sudo bash wordpress-project/lemp-setup.sh
