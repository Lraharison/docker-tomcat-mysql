USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("rootpass") WHERE user='root';

CREATE DATABASE IF NOT EXISTS mybdd CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mybdd;

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL,
  `AGE` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
LOCK TABLES `person` WRITE;
INSERT INTO `person`(`name`,`age`) values('Rakoto',25),('Rabe',38),('Jean',19),('Rasoa',18),('Paul',23),('Maurice',65),('KotoNandra',21);
UNLOCK TABLES;
