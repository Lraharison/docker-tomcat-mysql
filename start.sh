##!/bin/bash
set -e

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user mysql > /dev/null


/etc/init.d/mysql start
mysql -u root < script.sql


cp /webapp.war /var/lib/tomcat7/webapps/webapp.war

service tomcat7 start && tail -f /var/lib/tomcat7/logs/catalina.out

/bin/bash
