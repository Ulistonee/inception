#!/bin/sh

echo "im running..."

openrc default
/etc/init.d/mariadb setup

rc-service mariadb start
mysql -e "CREATE DATABASE ${DB_NAME}" && echo ok || echo 'fail to create DB'
mysql wordpress < /home/wordpress.sql
mysql -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" && echo ok  || echo 'fail to create user'
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost';" && echo ok || echo 'fail to grant'
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" && echo ok  || echo 'fail to create user'
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';" && echo ok || echo 'fail to grant'
mysql -e "FLUSH PRIVILEGES;" && echo ok || echo 'fail to flush'
/usr/bin/mysqladmin -u root password ${MYSQL_ROOT_PASSWORD} && echo ok || echo 'failed to root'
rc-service mariadb stop