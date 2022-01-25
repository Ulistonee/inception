#!/bin/bash
#cp /wordpress/wp-config.php /var/www/html/wordpress/wp-config.php

sed -i "s/DB_USER_/$DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/DB_PASSWORD_/$DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php
sed -i "s/DB_NAME_/$DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/DB_HOST_/$DB_HOST/g" /var/www/html/wordpress/wp-config.php