FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y git
RUN apt-get install -y apache2
RUN apt-get install -y curl
RUN apt-get install -y php
RUN apt-get install -y php-mysql
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y php-curl
RUN apt-get install -y php-xml
RUN apt-get install -y php-intl
RUN apt-get install -y php-gd
RUN apt-get install -y php-zip
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN a2enmod rewrite

# Downloading Prestashop 
WORKDIR /var/www/html
RUN wget https://download.prestashop.com/download/releases/prestashop_1.7.5.0.zip
RUN unzip prestashop_1.7.5.0.zip
RUN chown -R www-data:www-data /var/www/html


EXPOSE 80

#The issue is here: CMD service apache2 start When you execute this command process apache2 
# will be detached from the shell. But Docker works only while main process is alive.
CMD  apachectl -D FOREGROUND