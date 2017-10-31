## Origin image that has almost everything we need
## Based originally on Ubuntu 14:04
FROM linode/lamp


## Setting ENV variable for non interactive installations
ENV DEBIAN_FRONTEND=noninteractive

#Update Repos for
RUN apt-get update
##Installing missing php library
RUN apt-get -y install php5-mysql

##Apache Setup
RUN a2dissite example.com
RUN a2ensite 000-default


## Deleting DocumentRoot for example.com
RUN rm -rf /var/www/example.com

## Adding info.php for testing purposes
ADD ./info.php /var/www/html/


### Adding the script for stating the services
ADD ./startservices.sh /usr/bin/
RUN chmod 755 /usr/bin/startservices.sh

### Starting Apache and MySQL services when starting the container
CMD /usr/bin/startservices.sh
