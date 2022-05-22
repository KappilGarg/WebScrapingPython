-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 11:15 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webscraping`
--

-- --------------------------------------------------------

--
-- Table structure for table `drt_cases_list`
--

CREATE TABLE `drt_cases_list` (
  `drt_case_list_id` int(11) NOT NULL,
  `diary_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `case_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `case_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dof` date NOT NULL,
  `applicant_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `respondent_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `application_advocate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `respondent_advocate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drt_cases_list`
--

INSERT INTO `drt_cases_list` (`drt_case_list_id`, `diary_no`, `case_type`, `case_no`, `dof`, `applicant_name`, `respondent_name`, `application_advocate`, `respondent_advocate`, `created_datetime`) VALUES
(1, ' 9784/2015', '', ' SA/287/2015', '2015-09-04', '\r					KAPIL DEO DUBE', '\r\r				ICICI BANK LIM', '', '', '2022-05-22 14:44:29'),
(2, ' 9325/2017', '', ' OA/981/2017', '2017-12-08', '\r					ICICI BANK LIM', '\r\r				KAPIL BAJWA 		', '\r			ABHISHEK TRIPATH', '\r			PRASHANT KUMAR P', '2022-05-22 14:44:29'),
(3, ' 639/2020', '', ' OA/419/2020', '2020-07-08', '\r					UNION BANK OF ', '\r\r				KAPIL SHARMA  ', '\r			RAKESH MISHRA			', '', '2022-05-22 14:44:29'),
(4, ' 588/2019', '', ' SA/148/2019', '2019-03-11', '\r					KAPIL RICE MIL', '\r\r				ALLAHABAD BANK', '', '', '2022-05-22 14:44:29'),
(5, ' 9076/1999', '', ' EX/202/2000', '1999-01-01', '\r					UNITED BANK OF', '\r\r				KAPILMUNI  KAR', '', '', '2022-05-22 14:44:29'),
(6, ' 9783/2015', '', ' SA/65/2015', '2015-03-02', '\r					KAPIL DEV DUBE', '\r\r				ICICI BANK LIM', '', '', '2022-05-22 14:44:29'),
(7, ' 11917/2018', '', ' SA/81/2018', '2018-02-28', '\r					KAPIL KUMAR SA', '\r\r				ORIENTAL BANK ', '\r			D N AWASTHI			\r	', '\r			SHAILENDRA KUMAR', '2022-05-22 14:44:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drt_cases_list`
--
ALTER TABLE `drt_cases_list`
  ADD PRIMARY KEY (`drt_case_list_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drt_cases_list`
--
ALTER TABLE `drt_cases_list`
  MODIFY `drt_case_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
