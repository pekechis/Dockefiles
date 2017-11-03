
### DockerFile IES Triana Ubuntu 14.04 Lamp

## Author

Juan Diego Pérez Jiménez


MySQL Root Password: Admin2015

## Instructions of using the container

#### First pull the container from DockerHub

docker pull iestriana/Lamp

### Run the container

```shell
docker run -it -d --name container_name -v local_folder_for_web_development:/var/www/html -p local_port_for_apache:80 -p local_port_for_mysql:3306 iestriana/Lamp
```

For example:
```shell
docker run -it -d --name lamp -v /home/usuario/php:/var/www/html/ -p 8080:80 -p 3316:3306 iestriana/Lamp
```

### Give mysql root privileges to access from any ip
### Must be done if you want MySQL to be used from outside the container

##### Enter the container

```
docker exec -it *container_name* /bin/bash
```

##### Log into container's mysql
```shell
mysql -u root -pAdmin2015
```

##### Change root's permissions (inside mysql)

```sql
grant all privileges on *.* to 'root'@'%' identified by "Admin2015";


flush privileges;
```

Now I can login into mysql from any host

```sql
mysql -u root -pAdmin2015 -h *my_docker_host_ip* -P 3316 (according to the example)
```
