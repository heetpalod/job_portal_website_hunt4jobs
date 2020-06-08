-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2020 at 06:45 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate_education`
--

CREATE TABLE `candidate_education` (
  `User_ID` int(255) NOT NULL,
  `Degree` varchar(100) NOT NULL,
  `Major` varchar(70) NOT NULL,
  `University` varchar(70) DEFAULT NULL,
  `Graduation_Date` date NOT NULL,
  `CGPA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate_education`
--

INSERT INTO `candidate_education` (`User_ID`, `Degree`, `Major`, `University`, `Graduation_Date`, `CGPA`) VALUES
(1, 'Master', 'Information Management', 'University of Washington', '2021-06-04', 3.88),
(2, 'Master', 'Information Science', 'University of Washington', '2021-06-05', 4),
(3, 'Master', 'Information Management', 'University of Washington', '2021-06-04', 3.99),
(4, 'Master', 'Information Management', 'University of Washington', '2021-06-04', 3.9),
(5, 'Master', 'Information Science', 'University of Washington', '2021-06-04', 3.95);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_experience`
--

CREATE TABLE `candidate_experience` (
  `User_ID` int(255) NOT NULL,
  `Employer` varchar(100) NOT NULL,
  `Location` varchar(70) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `Job_Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate_experience`
--

INSERT INTO `candidate_experience` (`User_ID`, `Employer`, `Location`, `Start_Date`, `End_Date`, `Description`, `Job_Title`) VALUES
(1, 'Xoriant Solutions Pvt.  Ltd.', 'Mumbai', '2017-07-03', '2019-08-08', '', 'Full-Stack Developer'),
(2, 'University of Washington', 'Seattle', '2017-07-03', '0000-00-00', 'Research cool stuff', 'Research Data Analyst'),
(3, 'Deloitte', 'Mumbai', '2016-07-01', '2019-07-01', 'Managing ETL pipelines and operations', 'Business Technology Analyst'),
(4, 'University of Washington', 'Seattle', '2020-06-01', '0000-00-00', 'Cool stuff. Classified.', 'Graduate Research Analyst'),
(5, 'Credit Suisse', 'Mumbai', '2015-07-03', '2019-07-04', 'Database administrator, data governance, data analysis', 'Software Developer'),
(6, 'Microsoft', 'Seattle', '2016-04-01', '2020-05-31', 'Data. CLoud. Cool stuff.', 'SDE');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_skillset`
--

CREATE TABLE `candidate_skillset` (
  `User_ID` int(255) NOT NULL,
  `Skillset_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate_skillset`
--

INSERT INTO `candidate_skillset` (`User_ID`, `Skillset_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 11),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 6),
(5, 9),
(5, 10),
(5, 11),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 8),
(6, 10),
(6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `employer_details`
--

CREATE TABLE `employer_details` (
  `Employer_ID` int(255) NOT NULL,
  `Employer_Name` varchar(255) NOT NULL,
  `Website_URL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_post`
--

CREATE TABLE `job_post` (
  `Job_ID` int(255) NOT NULL,
  `Employer_ID` int(255) NOT NULL,
  `Location` varchar(70) DEFAULT NULL,
  `Job_Title` varchar(255) NOT NULL,
  `Job_Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_post_skillset`
--

CREATE TABLE `job_post_skillset` (
  `Job_ID` int(255) NOT NULL,
  `Skillset_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE `skillset` (
  `Skillset_ID` int(255) NOT NULL,
  `Skill` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skillset`
--

INSERT INTO `skillset` (`Skillset_ID`, `Skill`) VALUES
(1, 'Python'),
(2, 'SQL'),
(3, 'Java'),
(4, 'JavaScript'),
(5, 'Django'),
(6, 'Angular'),
(7, 'PHP'),
(8, 'NoSQL'),
(9, 'TensorFlow'),
(10, 'Power BI'),
(11, 'Tableau');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `email`) VALUES
(1, 'Heet', 'Palod', '1995-04-13', 'Male', 'hpalod@uw.edu'),
(3, 'Ankita', 'Naikdalal', '1994-11-25', 'Female', 'ankitan@uw.edu'),
(4, 'Kulraj', 'Singh Kohli', '1997-01-13', 'Male', 'kulrajs@uw.edu'),
(5, 'Vaidehi', 'Patil', '2015-01-01', 'Female', 'vaidehip@uw.edu'),
(6, 'David', 'Ewald', '1989-01-01', 'Male', 'ewadav@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `username`, `password`, `date_of_creation`) VALUES
(1, 'hpalod', '9cdfb439c7876e703e307864c9167a15', '2020-06-04 00:19:32'),
(2, 'varunk', '149e200961ea52955bd55cb49a127935', '2020-06-04 11:59:40'),
(3, 'ankita007', 'de5b5bf65ba66517f9b70b1443d2102d', '2020-06-04 12:54:41'),
(4, 'coolraj', '1525640fa90656c3fb4d44e9f020d64b', '2020-06-04 13:05:28'),
(5, 'vaidehip', '5772f5dd7afb90241fe9265becd65703', '2020-06-04 13:24:59'),
(6, 'david', '5f532a3fc4f1ea403f37070f59a7a53a', '2020-06-04 15:57:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD PRIMARY KEY (`User_ID`,`Degree`,`Major`);

--
-- Indexes for table `candidate_experience`
--
ALTER TABLE `candidate_experience`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `candidate_skillset`
--
ALTER TABLE `candidate_skillset`
  ADD PRIMARY KEY (`User_ID`,`Skillset_ID`);

--
-- Indexes for table `employer_details`
--
ALTER TABLE `employer_details`
  ADD PRIMARY KEY (`Employer_ID`);

--
-- Indexes for table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`Job_ID`);

--
-- Indexes for table `job_post_skillset`
--
ALTER TABLE `job_post_skillset`
  ADD PRIMARY KEY (`Job_ID`,`Skillset_ID`);

--
-- Indexes for table `skillset`
--
ALTER TABLE `skillset`
  ADD PRIMARY KEY (`Skillset_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate_education`
--
ALTER TABLE `candidate_education`
  MODIFY `User_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `candidate_experience`
--
ALTER TABLE `candidate_experience`
  MODIFY `User_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employer_details`
--
ALTER TABLE `employer_details`
  MODIFY `Employer_ID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `Job_ID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skillset`
--
ALTER TABLE `skillset`
  MODIFY `Skillset_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;