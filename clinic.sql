-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 03:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `ConsultationID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `TimeIn` datetime NOT NULL,
  `TimeOut` datetime DEFAULT NULL,
  `SOAP` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LastEditedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`ConsultationID`, `PatientID`, `TimeIn`, `TimeOut`, `SOAP`, `CreatedAt`, `UpdatedAt`, `LastEditedBy`) VALUES
(1, 1, '2024-12-04 10:00:00', '2024-12-04 10:30:00', 'Subjective: Fever\nObjective: High Temp\nAssessment: Possible Flu\nPlan: Rest & meds', '2024-12-04 15:14:17', '2024-12-04 15:14:17', 1),
(2, 2, '2024-12-04 11:00:00', '2024-12-04 11:20:00', 'Subjective: Fatigue\nObjective: Normal vitals\nAssessment: Stress\nPlan: Rest', '2024-12-04 15:14:17', '2024-12-04 15:14:17', 2);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatientID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `MiddleInitial` varchar(10) NOT NULL,
  `Sex` char(1) DEFAULT NULL CHECK (`Sex` in ('M','F')),
  `DOB` date NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `age` int(11) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `emergency_number` varchar(15) NOT NULL,
  `guardian` varchar(50) NOT NULL,
  `height` varchar(10) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `specialcases` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientID`, `FirstName`, `LastName`, `MiddleInitial`, `Sex`, `DOB`, `Address`, `ContactNumber`, `CreatedAt`, `UpdatedAt`, `age`, `civil_status`, `emergency_number`, `guardian`, `height`, `weight`, `specialcases`) VALUES
(1, 'John', 'Doe', '', 'M', '1990-05-15', '123 Main St', '1234567890', '2024-12-04 15:04:54', '2024-12-04 15:04:54', 0, '', '', '', '', '', NULL),
(2, 'Jane', 'Smith', '', 'F', '1985-03-22', '456 Elm St', '0987654321', '2024-12-04 15:04:54', '2024-12-04 15:04:54', 0, '', '', '', '', '', NULL),
(4, 'Khen', 'Abesamis', 'Imperial', 'M', '0000-00-00', '1585 Lawin St', '9454595720', '2024-12-07 18:39:30', '2024-12-07 18:39:30', 21, 'Single', '9454595720', 'Marilou Abesamis', '185', '55', NULL),
(5, 'Christian', 'Rogero', 'None', 'M', '0000-00-00', '1585 Lawin St', '9454595720', '2024-12-07 18:40:05', '2024-12-07 18:40:05', 21, 'Maried', '9454595720', 'Eduard John Bicaldo', '145', '36', NULL),
(7, 'hey', 'hey', 'hehe', 'F', '0000-00-00', '123', '0987654321', '2024-12-09 07:55:20', '2024-12-09 07:55:20', 20, 'Single', '1234567891', '123', '180', '20', NULL),
(14, 'b', 'hey', 'c', 'M', '0000-00-00', 'housee', '1310390546', '2024-12-09 09:18:41', '2024-12-09 09:18:41', 20, 'Single', '1234567891', 'dadd', '179', '68', 'PWD'),
(25, 'aa', 'xx', 'y', 'M', '0000-00-00', 'housee', '0912345678', '2024-12-09 09:57:57', '2024-12-09 09:57:57', 20, 'Single', '9871234097', 'dad', '187', '89', 'Hepa B'),
(26, 'ok', 'ahh', 'g', 'M', '0000-00-00', 'houssee', '7631743290', '2024-12-09 09:59:05', '2024-12-09 09:59:05', 20, 'Single', '9871234097', 'dadd', '187', '65', 'PWD'),
(27, 'girl', 'surname', 'L', 'F', '0000-00-00', 'here', '3414577123', '2024-12-09 10:00:11', '2024-12-09 10:00:11', 22, 'Married', '1234567891', 'idk', '160', '78', 'Pregnant'),
(28, 'test', 'testing', 't', 'M', '0000-00-00', 'Tondo', '0912345678', '2024-12-09 10:16:24', '2024-12-09 10:16:24', 22, 'Single', '9871234560', 'mom', '165', '60', 'Hepa B');

-- --------------------------------------------------------

--
-- Table structure for table `patientspecialcases`
--

CREATE TABLE `patientspecialcases` (
  `PatientSpecialCaseID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `AssignedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patientspecialcases`
--

INSERT INTO `patientspecialcases` (`PatientSpecialCaseID`, `PatientID`, `CaseID`, `AssignedAt`) VALUES
(5, 1, 1, '2024-12-04 15:13:13'),
(6, 2, 3, '2024-12-04 15:13:13'),
(7, 25, 1, '2024-12-09 09:57:57'),
(8, 26, 2, '2024-12-09 09:59:05'),
(9, 27, 3, '2024-12-09 10:00:11'),
(10, 28, 1, '2024-12-09 10:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `specialcases`
--

CREATE TABLE `specialcases` (
  `CaseID` int(11) NOT NULL,
  `CaseName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialcases`
--

INSERT INTO `specialcases` (`CaseID`, `CaseName`) VALUES
(1, 'Hepa B'),
(2, 'PWD'),
(3, 'Pregnant');

-- --------------------------------------------------------

--
-- Table structure for table `special_cases_tally`
--

CREATE TABLE `special_cases_tally` (
  `id` int(11) NOT NULL,
  `case_name` varchar(255) NOT NULL,
  `tally` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_cases_tally`
--

INSERT INTO `special_cases_tally` (`id`, `case_name`, `tally`) VALUES
(1, 'Hepa B', 2),
(2, 'PWD', 2),
(3, 'Pregnant', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` varchar(30) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `FirstName`, `LastName`, `Role`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Rei', 'Monik', 'Doctor', '2024-12-04 15:06:15', '2024-12-04 15:06:15'),
(2, 'Larry', 'Kristie', 'Nurse', '2024-12-04 15:06:15', '2024-12-04 15:06:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`ConsultationID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `LastEditedBy` (`LastEditedBy`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `patientspecialcases`
--
ALTER TABLE `patientspecialcases`
  ADD PRIMARY KEY (`PatientSpecialCaseID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Indexes for table `specialcases`
--
ALTER TABLE `specialcases`
  ADD PRIMARY KEY (`CaseID`);

--
-- Indexes for table `special_cases_tally`
--
ALTER TABLE `special_cases_tally`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `ConsultationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `patientspecialcases`
--
ALTER TABLE `patientspecialcases`
  MODIFY `PatientSpecialCaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `specialcases`
--
ALTER TABLE `specialcases`
  MODIFY `CaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `special_cases_tally`
--
ALTER TABLE `special_cases_tally`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `consultations_ibfk_2` FOREIGN KEY (`LastEditedBy`) REFERENCES `staff` (`StaffID`);

--
-- Constraints for table `patientspecialcases`
--
ALTER TABLE `patientspecialcases`
  ADD CONSTRAINT `patientspecialcases_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `patientspecialcases_ibfk_2` FOREIGN KEY (`CaseID`) REFERENCES `specialcases` (`CaseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
