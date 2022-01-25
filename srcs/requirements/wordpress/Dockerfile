FROM	alpine:3.14.2

RUN		apk update \
		&& apk add bash vim busybox-extras php7 php7-fpm php7-mysqli php7-json wget

RUN mkdir -p /var/www/html/
WORKDIR	/var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz

COPY tools/wp-config.php ./wordpress/wp-config.php
COPY tools/www.conf /etc/php7/php-fpm.d/www.conf

#RUN cp -r /wordpress /var/www/html/
#COPY tools/wp-config.php /var/www /html/wordpress/wp-config.php

ARG     DB_NAME
ARG     DB_HOST
ARG		DB_USER
ARG		DB_PASSWORD



COPY    tools/setup.sh /tmp/setup.sh
#COPY    tools/wp-config.php /var/www/html/wordpress/wp-config.php
COPY    tools/test.txt /var/www/html/wordpress/test.txt
#COPY    tools/www.conf /etc/php7/php-fpm.d/www.conf
RUN     ls /var/www/html/wordpress
RUN     cat /var/www/html/wordpress/wp-config.php
RUN     chmod +x /tmp/setup.sh
RUN     /tmp/setup.sh

EXPOSE 8000
CMD     [ "/usr/sbin/php-fpm7", "-F" ]