# Imagen Base
FROM ubuntu:18.04

# Autor
MAINTAINER @pekechis

# Para evitar que me soliciten parámetros de configuración de manera interactiva
ENV DEBIAN_FRONTEND=noninteractive

# Actualizo los repositorios e instalo los paquetes necesarios Prestashop
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

# Habilito este módulo para Apache
RUN a2enmod rewrite

# Descargo Prestashop y lo coloco en el directorio raíz del servidor web
WORKDIR /var/www/html
RUN wget https://download.prestashop.com/download/releases/prestashop_1.7.5.0.zip
RUN unzip prestashop_1.7.5.0.zip
RUN chown -R www-data:www-data /var/www/html


EXPOSE 80

# Arranco apache en Foreground al iniciar el contenedor
CMD  apachectl -D FOREGROUND