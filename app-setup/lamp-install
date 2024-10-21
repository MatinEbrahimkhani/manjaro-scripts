#!/bin/bash
sudo pacman -S apache mariadb php php-apache
sudo systemctl start httpd
sudo systemctl enable httpd
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo "LAMP stack installed and services started."
