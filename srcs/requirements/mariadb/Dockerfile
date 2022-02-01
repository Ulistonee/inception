FROM alpine:3.7

ARG     DB_NAME
ARG     DB_HOST
ARG		DB_USER
ARG		DB_PASSWORD
ARG     MYSQL_ROOT_PASSWORD

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-common mariadb-client vim openrc


COPY tools/init.sh ./
COPY conf/my.cnf /etc/mysql/
COPY tools/wordpress.sql /home/wordpress.sql
RUN chmod +x ./init.sh

#EXPOSE 3306

RUN ./init.sh

CMD ["mysqld_safe"]