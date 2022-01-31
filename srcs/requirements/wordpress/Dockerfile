FROM	alpine:3.14.2
ARG     DB_NAME
ARG     DB_HOST
ARG		DB_USER
ARG		DB_PASSWORD

RUN		apk update \
		&& apk add bash vim busybox-extras php7 php7-fpm php7-mysqli php7-json wget

RUN mkdir -p /var/www/html/
WORKDIR	/var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz


COPY tools/wp-config.php ./wordpress/wp-config.php
RUN chmod 755 /var/www/html/wordpress/wp-config.php
RUN chmod 644 /var/www/html/wordpress
RUN chmod 777 /var/www/html/wordpress/
COPY tools/www.conf /etc/php7/php-fpm.d/www.conf

#RUN cp -r /wordpress /var/www/html/
#COPY tools/wp-config.php /var/www /html/wordpress/wp-config.php


#ENV     DB_NAME $DB_NAME
#ENV     DB_HOST $DB_HOST
#ENV     DB_USER $DB_USER
#ENV     DB_PASSWORD $DB_PASSWORD

COPY    tools/setup.sh /tmp/setup.sh
#COPY    tools/wp-config.php /var/www/html/wordpress/wp-config.php
COPY    tools/test.txt /var/www/html/wordpress/test.txt
#COPY    tools/www.conf /etc/php7/php-fpm.d/www.conf
RUN     chmod +x /tmp/setup.sh
RUN     /tmp/setup.sh
#RUN     cp /var/www/html/wordpress/index.php /var/www/html/


EXPOSE 8000
CMD     [ "/usr/sbin/php-fpm7", "-F" ]