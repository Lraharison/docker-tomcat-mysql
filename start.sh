##!/bin/bash
set -e

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user mysql > /dev/null


#Demarrage mysql
/etc/init.d/mysql start

#Load sql
mysql -u root < script.sql

#Copie war file  dans le webapps de tomcat
cp /webapp.war /var/lib/tomcat7/webapps/webapp.war

#Demarrage tomcat
service tomcat7 start && tail -f /var/lib/tomcat7/logs/catalina.out

#Ouverture shell
/bin/bash
