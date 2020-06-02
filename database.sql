create database test;

use test;

CREATE TABLE `user_login` (
  `id` int(255) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 CREATE TABLE `test`.`users` ( `id` INT(255) NOT NULL AUTO_INCREMENT REFERENCES dbo.user_login(id),
 `first_name` VARCHAR(255) NOT NULL , 
 `last_name` VARCHAR(255) NOT NULL , 
 `date_of_birth` DATE NOT NULL , 
 `gender` VARCHAR(10) NOT NULL , 
 `email` VARCHAR(255) NOT NULL , 
 PRIMARY KEY (`id`)) ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Candidate_Education
(User_ID INT(255) NOT NULL REFERENCES dbo.user_login(id),
 Degree varchar(100), 
 Major varchar(70) , 
 University varchar(70),
 Graduation_Date DATE NOT NULL,
 CGPA int NOT NULL, 
 CONSTRAINT PKCandidateEducation PRIMARY KEY CLUSTERED (User_ID,Degree,Major)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Candidate_Experience 
(User_ID int(255) NOT NULL REFERENCES dbo.user_login(id),
 Employer varchar(100), 
 Location varchar(70) ,
 Start_Date DATE NOT NULL, 
 End_Date DATE NOT NULL, 
 Description varchar(300) NOT NULL, 
 PRIMARY KEY(User_ID)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Skillset 
(Skillset_ID INT(255) NOT NULL AUTO_INCREMENT, 
 Skill varchar(255) NOT NULL,
 PRIMARY KEY (Skillset_ID)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Candidate_Skillset` 
(`User_ID` INT(255) NOT NULL REFERENCES dbo.user_login(id), 
 `Skillset_ID` INT(255) NOT NULL REFERENCES dbo.Skillset(Skillset_ID), 
 PRIMARY KEY (User_ID, Skillset_ID)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Employer_Details 
(Employer_ID INT(255) NOT NULL AUTO_INCREMENT, 
 Employer_Name varchar(255) NOT NULL, 
 Website_URL varchar(255) NOT NULL,
 PRIMARY KEY (Employer_ID)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
             
CREATE TABLE `Job_Post`
 (`Job_ID` int(255) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Employer_ID` int(255) NOT NULL REFERENCES dbo.Employer_Details(Employer_ID) ,
  `Location` varchar(70),
  `Job_Title` varchar(255) NOT NULL,
  `Job_Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
              
CREATE TABLE `Job_Post_Skillset` 
(`Job_ID` INT(255) NOT NULL REFERENCES dbo.Job_Post(Job_ID), 
 `Skillset_ID` INT(255) NOT NULL REFERENCES dbo.Skillset(Skillset_ID), 
 PRIMARY KEY (Job_ID, Skillset_ID)) ENGINE=InnoDB DEFAULT CHARSET=latin1;