#Setup

sudo su

apt update

git clone https://github.com/AlteredSecurity/365-Stealer.git

cd 365-Stealer

apt install python3-pip

pip install -r requirements.txt

apt install php

apt install php-mbstring

apt install php8.2-sqlite3

php --version

cd yourVictims

cd /opt/365-Stealer/yourVictims/

#Running the management portal
php -S 0.0.0.0:8000

python3 365-Stealer.py -h

#Running the stealer app
python3 365-Stealer.py --run-app