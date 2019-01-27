# DOCKER-COMPOSE Varnish

Fichero docker-compose para el despliegue de un Proxy-caché Varnish con un backend de tres servidores Apache

Consta de de 4 contenedores.

- Un contenedor que se contruye en base al fichero Dockerfile y donde de instala y configura el Varnish cuya configuración está en el fichero default.vcl
- Tres contenedores con un servidor Apache instalado.

Se monta en el directorio raíz de los servidores una serie de ficheros de imagenes para comprobar que se está cacheando correctamente.

Realizado como práctica en el CFGS de ASIR del IES Triana.
