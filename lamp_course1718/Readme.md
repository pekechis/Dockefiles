
### DockerFile IES Triana Ubuntu 14.04 Lamp

## Author

Juan Diego Pérez Jiménez


## Instructions of using the container

#### First pull the container from DockerHub

docker pull iestriana/Lamp

### Run the container

docker run -it -d --name *container_name* -v *local_folder_for_web_development*:/var/www/html -p *local_port_for_apache*:80 -p *local_port_for_mysql:3306* iestriana/Lamp

For example:

docker run -it -d --name lamp -v /home/usuario/php:/var/www/html/ -p 8080:80 -p 3316:3306 iestriana/Lamp

### Give mysql root privileges to access from any ip

##### Enter the container

docker exec -it *container_name* /bin/bash

##### Log into container's mysql
mysql -u root -pAdmin2015

##### Change root's permissions (inside mysql)

grant all privileges on *.* to 'root'@'%' identified by "Admin2015";

flush privileges;

Now I can login into mysql from any host

mysql -u root -pAdmin2015 -h *my_docker_host_ip* -P 3316 (according to the example)
