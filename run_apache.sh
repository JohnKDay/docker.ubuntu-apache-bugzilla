#!/bin/bash


set |grep '_PORT_' |tr  '=' ' ' |sed 's/^/SetEnv /' > /etc/apache2/conf-enabled/docker-vars.conf
set |grep '_ENV_' |tr  '=' ' ' |sed 's/^/SetEnv /' >> /etc/apache2/conf-enabled/docker-vars.conf
set |grep 'SERVER_NAME' |tr  '=' ' ' |sed 's/^/SetEnv /' >> /etc/apache2/conf-enabled/docker-vars.conf

set |grep '_PORT_'  |sed 's/^/export /'>> /etc/apache2/envvars

echo "export SERVER_NAME=$SERVERNAME" >> /etc/apache2/envvars

echo "ServerName $SERVER_NAME" >> /etc/apache2/conf-enabled/servername.conf

echo "\$db_host = \"$MYSQL_PORT_3306_TCP_ADDR\";" >> /var/www/html/bugzilla/localconfig
echo "\$db_port = \"$MYSQL_PORT_3306_TCP_PORT\";" >> /var/www/html/bugzilla/localconfig
echo "\$db_user = \"$MYSQL_USER\"; " >> /var/www/html/bugzilla/localconfig
echo "\$db_name = \"$MYSQL_DB\"; " >> /var/www/html/bugzilla/localconfig
echo "\$db_pass = \"$MYSQL_PASS\"; "  >> /var/www/html/bugzilla/localconfig


/etc/init.d/apache2 start && \
tail -F /var/log/apache2/*log

#service rsyslog start && \
#service postfix start && \
#tail -F /var/log/mail.log
