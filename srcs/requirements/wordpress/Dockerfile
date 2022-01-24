FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add vim wget php7 php7-fpm curl
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-json
RUN apk add php7-curl php7-intl php7-mbstring php7-soap php7-xml php7-xmlrpc php7-zip

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz

COPY tools/wp-config.php /wordpress/wp-config.php
COPY tools/fpm.conf /etc/php7/php-fpm.d/www.conf

RUN mkdir /var/www
RUN cp -a /wordpress/. /var/www/wordpress

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 775 /var/www/wordpress
RUN chgrp -R www-data /var/www/wordpress

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress;

#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN php wp-cli.phar --info
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#RUN wp core install --allow-root --url=localhost --title=21 --admin_user=boss --admin_email=boss@boss.com
#RUN wp user create rchalmer rchalmer@rchalmer.com --role=author --allow-root


#RUN mkdir /var/www/html
#RUN mv wordpress /var/www/html/
WORKDIR /var/www/wordpress/

#COPY tools/my_config /etc/nginx/conf.d/default.conf
#COPY tools/supervisor.conf /etc/supervisord.conf

#COPY tools/init.sh /home/init.sh
#RUN mkdir -p /run/nginx
EXPOSE 9000
CMD     [ "/usr/sbin/php-fpm7", "-F" ]
