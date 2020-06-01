create database test;

use test;

CREATE TABLE `test`.`users` ( `id` INT(255) NOT NULL AUTO_INCREMENT ,
 `first_name` VARCHAR(255) NOT NULL , 
 `last_name` VARCHAR(255) NOT NULL , 
 `date_of_birth` DATE NOT NULL , 
 `gender` VARCHAR(10) NOT NULL , 
 `email` VARCHAR(255) NOT NULL , 
 PRIMARY KEY (`id`),
 Foreign Key(`id`) references user_login) ENGINE = InnoDB;

CREATE TABLE `user_login` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;