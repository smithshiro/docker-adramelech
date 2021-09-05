# docker-adramelech
## Project Enviromnet
### Overview
![environment image](https://user-images.githubusercontent.com/27280734/110324057-d1301a00-8058-11eb-81aa-97d3b0f775c2.png)
### Nginx
A reverse proxy server
If you access into 80 port, the nginx connects to a node server that serves a next.js application.
And, if you access into 3000 port, the nginx connects to a php-fpm server that serves a laravel application.
### node
A node.js server
It works to serve a next.js application and manage npm package modules.
If you want to deploy a next.js application or install required npm modules, you should enter this container to do those.
### php-fpm
A php fastcgi server
It works to serve a laravel application and composer modules.
If you want to do anything for laravel or install composer modules, you should enter this container to do those.
### mysql
A mysql server
It is connected from php-fpm container to manage application data.
It is mounted on mysql-data volumes not to be destory application data along with this container.
Of course, you can view application data from mysql client throw the port opended for local access.
## How to Install
### Create .env file
Before you create this docker environment, you should .env file.
The .env file defines deploying settings such as local ports, database setting,,etc.
#### Run this command
```bash
$ sh generate_env.sh
```
#### Confirm .env
```bash
$ cat .env
ENV=local
TZ=Asia/Tokyo
NGINX_FRONT_PORT=10088
NGINX_SERVER_PORT=13000
MYSQL_PORT=13306
MYSQL_DATABASE=db
MYSQL_USER=db
MYSQL_PASSWORD=password
MYSQL_ROOT_PASSWORD=root
```
### Install the docker environment
#### Run this command
You just run under this command.
```bash
$ docker-compose build
# Initialize Laravel
$ sh initialize_laravel.sh
# Initialize Next.js
$ sh initialize_next.sh
$ docker-compose up
```
#### Confirm the docker environment
```bash
$ docker-compose ps
          Name                         Command               State                                         Ports
------------------------------------------------------------------------------------------------------------------------------------
docker-adramelech_mysql_1   docker-entrypoint.sh mysqld      Up      0.0.0.0:13306->3306/tcp,:::13306->3306/tcp, 33060/tcp
docker-adramelech_nginx_1   /docker-entrypoint.sh ngin ...   Up      0.0.0.0:13000->3000/tcp,:::13000->3000/tcp, 0.0.0.0:10088->80/tcp,:::10088->80/tcp
docker-adramelech_node_1    docker-entrypoint.sh /bin/ ...   Up      0.0.0.0:33000->3000/tcp,:::33000->3000/tcp
docker-adramelech_php_1     docker-php-entrypoint php-fpm    Up      9000/tcp
```
### Clean install Laravel and Next.js application
If your src/server or src/front directory is empty except for .gitkeep file, you can install laravel or next.js application.
Notice that you have already set up those application which is managed by another repository, you should not do this opparation because this destroys existing project settings.

#### For clean install Laravel application
```bash
$ sh initialize_laravel.sh
```
#### For clean install next.js application
```bash
$ sh initialize_next.sh
```
