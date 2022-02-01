FROM	alpine:3.14.2

ARG     DB_NAME
ARG     DB_HOST
ARG		DB_USER
ARG		DB_PASSWORD

RUN		apk update \
		&& apk add bash vim php7 php7-fpm php7-mysqli php7-json wget

RUN mkdir -p /var/www/html/
WORKDIR	/var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz


COPY conf/wp-config.php ./wordpress/wp-config.php
RUN chmod 755 /var/www/html/wordpress/wp-config.php
RUN chmod 644 /var/www/html/wordpress
RUN chmod 777 /var/www/html/wordpress/
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

COPY    tools/setup.sh /tmp/setup.sh
RUN     chmod +x /tmp/setup.sh
RUN     /tmp/setup.sh


#EXPOSE 9000
CMD     [ "/usr/sbin/php-fpm7", "-F" ]