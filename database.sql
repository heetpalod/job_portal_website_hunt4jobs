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
 CGPA float NOT NULL, 
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

INSERT INTO `Employer_Details` (`Employer_ID`,`Employer_Name`,`Website_URL`)
VALUES
(700, 
 'Amazon', 
 'www.amazon.com'), 
 (710, 
 'Amazon Web Services', 
 'www.aws.com')
 ;
 INSERT INTO `Employer_Details` (`Employer_ID`,`Employer_Name`,`Website_URL`)
VALUES
(400, 
 'SalesForce', 
 'www.salesforce.com');

 INSERT INTO  `Job_Post` (`Job_ID`,`Employer_ID`,`Location`,`Job_Title`,`Job_Description`)
 VALUES
 (711,
  700 ,
  "Seattle",
  "Security Engineer",
  "Conduct periodic and ad hoc IT user access reviews, compliance reviews, and analysis of security alerts, remediate control deficiencies till resolution."),
  (712,
  710 ,
  "Seattle",
  "Cloud Security Engineer",
  "Prepare reports on relevant metrics such as IT risk assessment and remediation, compliance reviews for management and stakeholders."),
  (713,
   700 ,
  "Virginia",
  "Security Engineer",
  "Work with IT operations and system engineering team members to monitor user access and logged security events, investigate security alerts, control violations and incidents based on established policies and protocols."),
  (714,
   710 ,
  "Los Angeles",
  "Cloud Security Engineer",
  "Ensure that digital assets are protected from unauthorized access including both cloud and on-premises infrastructures and public-facing or internal systems."),
  (715,
   700 ,
  "Seattle",
  "Security Consultant",
  "Collect , analyze and manage security compliance evidence docs, records and artifacts to meet information security related compliance requirements for all laws, regulations, contractual provisions and industry standards (SOC2, HIPAA, PCI ) that are applicable to Vera systems and information, and SaaS vendor systems."),
  (716,
   710 ,
  "Seattle",
  "Cloud Security Consultant",
  "Participate in Information Security awareness training activities, train Vera staff on their responsibilities concerning information security procedures and compliance activities."),
  (717,
   700 ,
  "Austin",
  "Security Analyst",
  "Activate, maintain, validate and deactivate secure and compliant enterprise end user accounts"),
  (718,
   710 ,
  "Austin",
  "Cloud Security Analyst",
  "Analyze, troubleshoot, and support end users and departments regarding centralized repository data, access levels, and account and data lifecycle;"),
  (719,
   700 ,
  "New York",
  "Security Lead",
  "Work as part of account management team to lead security services for end customer. Coordinate with security practice and global delivery center staff to provide contracted services to meet client expectations.
Coordinate steady state, change management and project implementation with the client and CGI security team leads."),
  (720,
   710 ,
  "New York",
  "Cloud Security Lead",
  "Maintain an inventory of hardware and software for all information systems.
Coordinate and maintain the plan of action with milestones for support ongoing remediation activities.
Support the incident response and contingency activities.
Coordinate security SME support coverage, tool cross training and individual career development plans for the account.
Monitor the lifecycle of Level 3 incident and support tickets.
Manage the security-related account SLAs.
Make monthly recommendations to the ISSO based on observations.
Support the ISSO.");

  INSERT INTO  `Job_Post` (`Job_ID`,`Employer_ID`,`Location`,`Job_Title`,`Job_Description`)
 VALUES
 (421,
  400 ,
  "Seattle",
  "Software Developer",
  "Salesforce has immediate opportunities for extremely talented software developers who want their lines of code to have significant and measurable positive impact for users, the company's bottom line and the industry. You will be working with a group of world-class engineers to build the breakthrough features our customers will love, adopt and use while keeping our trusted platform stable and scalable. The software engineer role at Salesforce encompasses architecture, design, implementation, and testing to ensure we build products right and release them with high quality.."),
  (422,
  400 ,
  "Seattle",
  " Software Engineer",
  " As a member of the Engineering Services and Data Infrastructure team, you will be using your software development skills to architect systems and services to modernize our engineering infrastructure to make the product development experience at Tableau the best in the industry. If you love decoding complex systems, designing intuitive service interfaces, and exploring innovative ways to improve developer experience and optimize engineering operations, you will feel right at home.."),
  (423,
   400 ,
  "Virginia",
  " User Researcher",
  " 
The Tableau Research team is looking for a User Researcher to join our Data Preparation team. As a member of the Tableau User Research team, you’ll use your knowledge and technical prowess to enable more people use data to solve the world's problems. You will leverage qualitative and quantitative user research methods while working with design and product partners to develop research plans, conduct studies, and present results and recommendations. Ideal candidates will be an advocate for the user and have a motivation to develop expertise in uncovering barriers to data preparation and self-service analytics within organizations. You will communicate insights to both management and feature teams to create experiences that Tableau’s customers need and love."),
  (424,
   400 ,
  "Los Angeles",
  " Software Engineer",
  " As a member of the Engineering Services and Data Infrastructure team, you will be using your software development skills to architect systems and services to modernize our engineering infrastructure to make the product development experience at Tableau the best in the industry. If you love decoding complex systems, designing intuitive service interfaces, and exploring innovative ways to improve developer experience and optimize engineering operations, you will feel right at home.."),
  (425,
   400 ,
  "Seattle",
  " Software developer",
  " At Tableau, our mission is to help people see and understand their data. The Interactive Analytics team works on tools that “wow” new users when they first see how easy Tableau makes it to visually explore their data. But not only do our features impress our new users, they continue to excite our most experienced power users. Does working on providing great analytics tools that impress everyone from novice users to experts sound exciting? Then the Tableau Interactive Analytics team has a great opportunity for you.."),
  (426,
   400 ,
  "Seattle",
  "Technology Consultant",
  " At Tableau, our mission is to help people see and understand their data. The Interactive Analytics team works on tools that “wow” new users when they first see how easy Tableau makes it to visually explore their data. But not only do our features impress our new users, they continue to excite our most experienced power users. Does working on providing great analytics tools that impress everyone from novice users to experts sound exciting? Then the Tableau Interactive Analytics team has a great opportunity for you. "),
  (427,
   400 ,
  "Austin",
  "Technology Analyst",
  " At Tableau, our mission is to help people see and understand their data. The Interactive Analytics team works on tools that “wow” new users when they first see how easy Tableau makes it to visually explore their data. But not only do our features impress our new users, they continue to excite our most experienced power users. Does working on providing great analytics tools that impress everyone from novice users to experts sound exciting? Then the Tableau Interactive Analytics team has a great opportunity for you. "),
  (428,
   400 ,
  "Austin",
  "Software Developer",
  "Build optimized solutions to the core products of Salesforce. Analyze, troubleshoot, and support end users and departments regarding centralized repository data, access levels, and account and data lifecycle;"),
  (429,
   400 ,
  "New York",
  "Software Engineering Lead",
  "Work as part of account management team to lead security services for end customer. Coordinate with security practice and global delivery center staff to provide contracted services to meet client expectations.
Coordinate steady state, change management and project implementation with the client and CGI security team leads."),
  (430,
   400 ,
  "New York",
  "Cloud Developer",
  " From Sales Cloud to Marketing Cloud from IoT to Analytics, …. We have many opportunities available across various applications and platforms. Submit your resume here and we will reach out to you with opportunities that fit your background and interests.");

  
INSERT INTO  `Job_Post_Skillset` (`Job_ID`,`Skillset_ID`)
VALUES
(711,1),
(711,2),
(711,3),
(712,1),
(712,2),
(712,3),
(713,4),
(713,5),
(713,6),
(714,4),
(714,5),
(714,6),
(715,7),
(715,8),
(715,9),
(716,7),
(716,8),
(716,9),
(717,1),
(717,4),
(717,7),
(718,1),
(718,4),
(718,7),
(719,2),
(719,5),
(719,8),
(720,2),
(720,5),
(720,8);

INSERT INTO  `Job_Post_Skillset` (`Job_ID`,`Skillset_ID`)
VALUES
(422,1),
(421,2),
(421,3),
(421,1),
(422,2),
(422,3),
(423,8),
(423,4),
(423,10),
(424,1),
(424,5),
(424,2),
(425,10),
(425,11),
(425,2),
(426,11),
(426,2),
(427,11),
(427,2),
(427,9),
(428,6),
(428,8),
(428,7),
(429,2),
(429,5),
(429,11),
(430,2),
(430,1),
(430,3);
