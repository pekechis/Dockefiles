FROM ubuntu:18.04

MAINTAINER @pekechis

# Para evitar que me soliciten parámetros de configuración de manera interactiva
ENV DEBIAN_FRONTEND=noninteractive

# Actualizo los repositorios e instalo los paquetes necesarios Prestashop
RUN apt-get update

RUN apt-get -y install varnish
RUN apt-get -y install varnish-doc
RUN apt-get -y install varnish-modules


ADD default.vcl /etc/default/varnish

EXPOSE 6081 6085

CMD varnish
