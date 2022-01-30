FROM alpine:3.7

RUN apk update && apk upgrade
#RUN apk add mysql mysql-client openrc supervisor vim

RUN apk add mariadb mariadb-common mariadb-client vim openrc

#COPY srcs/supervisor.conf /etc/supervisord.conf
COPY tools/init.sh ./
COPY tools/my.cnf /etc/mysql/
COPY tools/wordpress.sql /home/wordpress.sql
RUN chmod +x ./init.sh

EXPOSE 3306

RUN ./init.sh
#CMD sh init.sh
CMD [ "mysqld_safe"]