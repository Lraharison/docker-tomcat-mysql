FROM ubuntu:14.04
MAINTAINER L.Raharison, raharisonlaurent@gmail.com

#Mise à jour du système
RUN apt-get update && apt-get -y upgrade

#Ajouter le repo oracle pour java 7
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update

#Accepter la license oracle
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

#installation java 7
RUN apt-get -y install oracle-java7-installer

#Installation tomcat7 
RUN apt-get -y install tomcat7
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7

#Installation Mysql server et client
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server mysql-client

#Copie du script d'initialisation dans la racine du VM
ADD ./start.sh  /start.sh
#Rendre executable
RUN chmod 755 /start.sh


#Copie dump BDD
ADD ./script.sql /script.sql
RUN chmod 777 /script.sql

#Copie du war file
ADD ./webapp.war /webapp.war
RUN chmod 777 /webapp.war

#expose port mysql 
EXPOSE 3306
#expose port tomcat
EXPOSE 8080

#Lancer un shell et  le script d'initialisation
CMD ["/bin/bash","/start.sh"]

