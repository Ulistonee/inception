FROM alpine:3.7

ARG   DOMAIN_NAME

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh vim

COPY conf/my_config.conf /etc/nginx/conf.d/default.conf
RUN sed -i "s/DOMAIN_NAME_/$DOMAIN_NAME/g" /etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=School21/OU=21School/CN=myssl" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt
RUN mkdir -p /run/nginx
#EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]