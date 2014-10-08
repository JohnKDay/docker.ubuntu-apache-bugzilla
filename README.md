docker.ubuntu-apache-bugzilla
=============================

dockerfile - ubuntu with apache and bugzilla

expects bugzilla to be mounted into /var/www/html/bugzilla
 
 docker run -v `pwd`/data/bugzilla/:/var/www/html/bugzilla .....
 
expects to be linked to mysql container with bugzilla database:

 docker run --link mysql-bugzilla-docker-container-name:mysql .....
 
expects database name, username and password passed over as environment vars:

 docker run -e MYSQL_USER=bugz -e MYSQL_DB=bugz -e MYSQL_PASS=mypass ....
