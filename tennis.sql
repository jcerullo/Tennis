-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 18, 2019 at 07:45 AM
-- Server version: 10.1.23-MariaDB-9+deb9u1
-- PHP Version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tennis`
--
CREATE DATABASE IF NOT EXISTS `tennis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tennis`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminID` varchar(20) NOT NULL,
  `emailAddr` varchar(50) NOT NULL,
  `masterKey` varchar(10) NOT NULL,
  `leagueID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `emailAddr`, `masterKey`, `leagueID`) VALUES
('DickN', '', 'NovalKey', 'canal'),
('DanD', '', 'DanKey', 'open1'),
('JamesL', '', 'JamesKey', 'duval');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment` (
  `rcdNbr` int(11) NOT NULL,
  `mbrID` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `facilityName` varchar(20) NOT NULL,
  `balls` char(1) NOT NULL,
  `setsWon` int(6) NOT NULL,
  `setsPlayed` int(6) NOT NULL,
  `leagueID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`rcdNbr`, `mbrID`, `date`, `facilityName`, `balls`, `setsWon`, `setsPlayed`, `leagueID`) VALUES
(1054, 'JohnC', '2018-08-06', 'Canal', 'N', 2, 3, ''),
(1055, 'DickN', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1056, 'CurtG', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1057, 'HarryL', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1058, 'PeterM', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1059, 'TomH', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1060, 'ChuckC', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1061, 'JohnW', '2018-08-06', 'Canal', 'N', 0, 0, ''),
(1172, 'CurtG', '2018-08-25', 'Coconut', 'Y', 0, 0, ''),
(1173, 'TomH', '2018-08-25', 'Coconut', 'Y', 0, 0, ''),
(1174, 'ChuckC', '2018-08-25', 'Coconut', 'N', 0, 0, ''),
(1175, 'DickN', '2018-08-25', 'Coconut', 'N', 0, 0, ''),
(1176, 'CharlesF', '2018-08-25', 'Coconut', 'N', 0, 0, ''),
(1177, 'HarryL', '2018-08-25', 'Coconut', 'N', 0, 0, ''),
(1178, 'JohnW', '2018-08-25', 'Coconut', 'N', 0, 0, ''),
(1179, 'JohnC', '2018-08-25', 'Coconut', 'N', 0, 0, ''),
(1483, 'HarryL', '2018-09-01', 'Coconut', 'N', 0, 0, ''),
(1484, 'TomH', '2018-09-01', 'Coconut', 'N', 0, 0, ''),
(1485, 'ChuckC', '2018-09-01', 'Coconut', 'Y', 0, 0, ''),
(1486, 'CharlesF', '2018-09-01', 'Coconut', 'Y', 0, 0, ''),
(1487, 'JohnC', '2018-09-01', 'Coconut', 'N', 0, 0, ''),
(1488, 'DickN', '2018-09-01', 'Coconut', 'N', 0, 0, ''),
(1489, 'JohnW', '2018-09-01', 'Coconut', 'N', 0, 0, ''),
(1490, 'CurtG', '2018-09-01', 'Coconut', 'N', 0, 0, ''),
(1492, 'HarryL', '2018-09-08', 'Coconut', 'N', 0, 0, ''),
(1493, 'TomH', '2018-09-08', 'Coconut', 'N', 0, 0, ''),
(1494, 'ChuckC', '2018-09-08', 'Coconut', 'N', 0, 0, ''),
(1495, 'CharlesF', '2018-09-08', 'Coconut', 'N', 0, 0, ''),
(1496, 'JohnC', '2018-09-08', 'Coconut', 'Y', 0, 0, ''),
(1497, 'DickN', '2018-09-08', 'Coconut', 'Y', 0, 0, ''),
(1498, 'JohnW', '2018-09-08', 'Coconut', 'N', 0, 0, ''),
(1499, 'CurtG', '2018-09-08', 'Coconut', 'N', 0, 0, ''),
(1500, 'CurtG', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1501, 'JohnW', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1502, 'ChuckC', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1503, 'DickN', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1504, 'JohnC', '2018-10-27', 'Canal', 'Y', 0, 0, ''),
(1505, 'TomH', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1506, 'HarryL', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1507, 'CharlesF', '2018-10-27', 'Canal', 'N', 0, 0, ''),
(1509, 'TomH', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1510, 'HarryL', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1512, 'ChuckC', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1513, 'CharlesF', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1514, 'PeterM', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1515, 'DickN', '2018-11-03', 'Coconut', 'Y', 0, 0, ''),
(1516, 'JohnW', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1518, 'CurtG', '2018-11-03', 'Coconut', 'N', 0, 0, ''),
(1519, 'ChuckC', '2018-11-17', 'Coconut', 'Y', 0, 0, ''),
(1520, 'HarryL', '2018-11-17', 'Coconut', 'N', 0, 0, ''),
(1521, 'CurtG', '2018-11-17', 'Coconut', 'Y', 0, 0, ''),
(1522, 'DickN', '2018-11-17', 'Coconut', 'N', 0, 0, ''),
(1523, 'PeterM', '2018-11-17', 'Coconut', 'N', 0, 0, ''),
(1524, 'JohnW', '2018-11-17', 'Coconut', 'N', 0, 0, ''),
(1526, 'TomH', '2018-11-17', 'Coconut', 'N', 0, 0, ''),
(1528, 'CharlesF', '2018-11-17', 'Coconut', 'N', 0, 0, ''),
(1529, 'JohnW', '2018-11-24', 'Coconut', 'N', 0, 0, ''),
(1531, 'ChuckC', '2018-11-24', 'Coconut', 'N', 0, 0, ''),
(1532, 'CurtG', '2018-11-24', 'Coconut', 'N', 0, 0, ''),
(1533, 'CharlesF', '2018-11-24', 'Coconut', 'N', 0, 0, ''),
(1534, 'TomH', '2018-11-24', 'Coconut', 'N', 0, 0, ''),
(1535, 'DickN', '2018-11-24', 'Coconut', 'Y', 0, 0, ''),
(1536, 'HarryL', '2018-11-24', 'Coconut', 'N', 0, 0, ''),
(1538, 'PeterM', '2018-11-24', 'Coconut', '', 0, 0, ''),
(1540, 'DickN', '2018-12-08', 'Canal', 'Y', 0, 0, ''),
(1541, 'CurtG', '2018-12-08', 'Canal', 'N', 0, 0, ''),
(1542, 'HarryL', '2018-12-08', 'Canal', 'N', 0, 0, ''),
(1543, 'PeterM', '2018-12-08', 'Canal', 'N', 0, 0, ''),
(1544, 'TomH', '2018-12-08', 'Canal', 'N', 0, 0, ''),
(1545, 'ChuckC', '2018-12-08', 'Canal', 'N', 0, 0, ''),
(1546, 'JohnW', '2018-12-08', 'Canal', 'N', 0, 0, ''),
(1548, 'CharlesF', '2018-12-08', 'Canal', '', 0, 0, ''),
(1549, 'DickN', '2018-12-15', 'Canal', 'Y', 0, 0, ''),
(1550, 'CurtG', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1551, 'HarryL', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1552, 'PeterM', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1553, 'TomH', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1554, 'ChuckC', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1555, 'JohnW', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1556, 'CharlesF', '2018-12-15', 'Canal', 'N', 0, 0, ''),
(1557, 'DickN', '2018-12-22', 'Canal', 'Y', 0, 0, ''),
(1558, 'CurtG', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1559, 'HarryL', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1560, 'PeterM', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1561, 'TomH', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1562, 'ChuckC', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1563, 'JohnW', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1564, 'CharlesF', '2018-12-22', 'Canal', 'N', 0, 0, ''),
(1582, 'JohnC', '2019-01-12', 'Coconut', 'N', 0, 0, ''),
(1583, 'DickN', '2019-01-12', 'Coconut', 'N', 0, 0, ''),
(1584, 'PeterM', '2019-01-12', 'Coconut', 'N', 0, 0, ''),
(1585, 'FreemanM', '2019-01-12', 'Coconut', 'Y', 0, 0, ''),
(1586, 'TomF', '2019-01-12', 'Coconut', 'Y', 0, 0, ''),
(1587, 'TonyC', '2019-01-12', 'Coconut', 'N', 0, 0, ''),
(1588, 'JimC', '2019-01-12', 'Coconut', 'N', 0, 0, ''),
(1589, 'JohnG', '2019-01-12', 'Coconut', 'N', 0, 0, ''),
(1590, 'PeterM', '2019-01-19', 'Canal', 'N', 0, 0, ''),
(1591, 'RonP', '2019-01-19', 'Canal', 'N', 0, 0, ''),
(1594, 'JimC', '2019-01-19', 'Canal', 'N', 0, 0, ''),
(1595, 'FreemanM', '2019-01-19', 'Canal', 'N', 0, 0, ''),
(1596, 'JohnC', '2019-01-19', 'Canal', 'N', 0, 0, ''),
(1597, 'JohnG', '2019-01-19', 'Canal', 'N', 0, 0, ''),
(1598, 'TonyC', '2019-01-19', 'Canal', 'Y', 0, 0, ''),
(1599, 'BobC', '2019-01-19', 'Canal', 'Y', 0, 0, ''),
(1608, 'GeneB', '2019-01-26', 'Canal', 'N', 0, 0, ''),
(1609, 'DickN', '2019-01-26', 'Canal', 'N', 0, 0, ''),
(1610, 'MarkK', '2019-01-26', 'Canal', 'N', 0, 0, ''),
(1611, 'JohnC', '2019-01-26', 'Canal', 'Y', 0, 0, ''),
(1612, 'ChuckC', '2019-01-26', 'Canal', 'N', 0, 0, ''),
(1613, 'BrianL', '2019-01-26', 'Canal', 'N', 0, 0, ''),
(1614, 'ClaudioD', '2019-01-26', 'Canal', 'Y', 0, 0, ''),
(1615, 'TomF', '2019-01-26', 'Canal', 'N', 0, 0, ''),
(1648, 'JohnC', '2019-02-02', 'Coconut', 'N', 0, 0, ''),
(1649, 'DickN', '2019-02-02', 'Coconut', 'N', 0, 0, ''),
(1650, 'ClaudioD', '2019-02-02', 'Coconut', 'N', 0, 0, ''),
(1651, 'AlanI', '2019-02-02', 'Coconut', 'Y', 0, 0, ''),
(1652, 'ChuckC', '2019-02-02', 'Coconut', 'N', 0, 0, ''),
(1653, 'JohnG', '2019-02-02', 'Coconut', 'Y', 0, 0, ''),
(1654, 'CurtG', '2019-02-02', 'Coconut', 'N', 0, 0, ''),
(1655, 'KarlL', '2019-02-02', 'Coconut', 'N', 0, 0, ''),
(1664, 'JohnC', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1665, 'DickN', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1666, 'CurtG', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1667, 'ChuckC', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1668, 'JohnG', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1669, 'ClaudioD', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1670, 'KarlL', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1671, 'AlanI', '2019-02-09', 'Coconut', '', 0, 0, ''),
(1672, 'JohnC', '2019-02-23', 'Coconut', 'Y', 0, 0, ''),
(1673, 'DickN', '2019-02-23', 'Coconut', 'Y', 0, 0, ''),
(1674, 'CurtG', '2019-02-23', 'Coconut', 'N', 0, 0, ''),
(1675, 'ChuckC', '2019-02-23', 'Coconut', 'N', 0, 0, ''),
(1676, 'JohnG', '2019-02-23', 'Coconut', 'N', 0, 0, ''),
(1677, 'ClaudioD', '2019-02-23', 'Coconut', 'N', 0, 0, ''),
(1678, 'KarlL', '2019-02-23', 'Coconut', 'N', 0, 0, ''),
(1679, 'AlanI', '2019-02-23', 'Coconut', 'N', 0, 0, ''),
(1680, 'JohnC', '2019-03-02', 'Canal', 'Y', 0, 0, ''),
(1681, 'CurtG', '2019-03-02', 'Canal', 'N', 0, 0, ''),
(1682, 'FreemanM', '2019-03-02', 'Canal', 'N', 0, 0, ''),
(1683, 'JoeM', '2019-03-02', 'Canal', '', 0, 0, ''),
(1684, 'JohnC', '2019-03-09', 'Santiago', 'N', 0, 0, ''),
(1685, 'CurtG', '2019-03-09', 'Santiago', 'Y', 0, 0, ''),
(1686, 'ChuckC', '2019-03-09', 'Santiago', 'N', 0, 0, ''),
(1687, 'FreemanM', '2019-03-09', 'Santiago', 'N', 0, 0, ''),
(1688, 'JohnG', '2019-03-09', 'Santiago', 'N', 0, 0, ''),
(1689, 'AlanI', '2019-03-09', 'Santiago', 'N', 0, 0, ''),
(1690, 'JoeM', '2019-03-09', 'Santiago', 'Y', 0, 0, ''),
(1691, 'PeteS', '2019-03-09', 'Santiago', '', 0, 0, ''),
(1692, 'JohnC', '2019-03-16', 'ChulaVista', 'N', 0, 0, ''),
(1693, 'DickN', '2019-03-16', 'ChulaVista', 'N', 0, 0, ''),
(1694, 'CurtG', '2019-03-16', 'ChulaVista', 'Y', 0, 0, ''),
(1695, 'TonyC', '2019-03-16', 'ChulaVista', 'Y', 0, 0, ''),
(1696, 'ClaudioD', '2019-03-16', 'ChulaVista', 'N', 0, 0, ''),
(1697, 'JoeM', '2019-03-16', 'ChulaVista', 'N', 0, 0, ''),
(1698, 'PeteS', '2019-03-16', 'ChulaVista', 'N', 0, 0, ''),
(1699, 'GaryO', '2019-03-16', 'ChulaVista', 'N', 0, 0, ''),
(1706, 'JohnC', '2019-03-23', 'ChulaVista', 'N', 0, 0, ''),
(1707, 'DickN', '2019-03-23', 'ChulaVista', 'N', 0, 0, ''),
(1708, 'HarryL', '2019-03-23', 'ChulaVista', 'N', 0, 0, ''),
(1709, 'ChuckC', '2019-03-23', 'ChulaVista', 'N', 0, 0, ''),
(1710, 'AlanI', '2019-03-23', 'ChulaVista', 'N', 0, 0, ''),
(1711, 'PeteS', '2019-03-23', 'ChulaVista', 'Y', 0, 0, ''),
(1712, 'JohnG', '2019-03-23', 'ChulaVista', 'Y', 0, 0, ''),
(1713, 'JohnC', '2019-03-30', 'Santiago', 'N', 0, 0, ''),
(1714, 'CurtG', '2019-03-30', 'Santiago', 'N', 0, 0, ''),
(1715, 'HarryL', '2019-03-30', 'Santiago', 'N', 0, 0, ''),
(1716, 'TomH', '2019-03-30', 'Santiago', 'Y', 0, 0, ''),
(1717, 'TonyC', '2019-03-30', 'Santiago', 'N', 0, 0, ''),
(1718, 'ClaudioD', '2019-03-30', 'Santiago', 'N', 0, 0, ''),
(1719, 'GeneB', '2019-03-30', 'Santiago', 'Y', 0, 0, ''),
(1720, 'JoeM', '2019-03-30', 'Santiago', 'N', 0, 0, ''),
(1721, 'JohnC', '2019-04-06', 'Santiago', 'Y', 0, 0, ''),
(1722, 'CurtG', '2019-04-06', 'Santiago', 'N', 0, 0, ''),
(1723, 'ChuckC', '2019-04-06', 'Santiago', 'N', 0, 0, ''),
(1724, 'MarkK', '2019-04-06', 'Santiago', 'N', 0, 0, ''),
(1725, 'BobC', '2019-04-13', 'ChulaVista', 'N', 0, 0, ''),
(1726, 'ChuckC', '2019-04-13', 'ChulaVista', 'N', 0, 0, ''),
(1727, 'ClaudioD', '2019-04-13', 'ChulaVista', 'Y', 0, 0, ''),
(1728, 'GeneB', '2019-04-13', 'ChulaVista', 'N', 0, 0, ''),
(1729, 'HarryL', '2019-04-13', 'ChulaVista', 'Y', 0, 0, ''),
(1730, 'JohnC', '2019-04-13', 'ChulaVista', 'N', 0, 0, ''),
(1731, 'TomH', '2019-04-13', 'ChulaVista', 'N', 0, 0, ''),
(1732, 'JonC', '2019-04-13', 'ChulaVista', '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `available`
--

DROP TABLE IF EXISTS `available`;
CREATE TABLE `available` (
  `rcdNbr` int(11) NOT NULL,
  `dates` date NOT NULL,
  `mbrID` varchar(20) NOT NULL,
  `leagueID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `available`
--

INSERT INTO `available` (`rcdNbr`, `dates`, `mbrID`, `leagueID`) VALUES
(789, '2018-08-06', 'DickN', ''),
(790, '2018-08-06', 'CurtG', ''),
(791, '2018-08-06', 'HarryL', ''),
(792, '2018-08-06', 'PeterM', ''),
(793, '2018-08-06', 'TomH', ''),
(794, '2018-08-06', 'ChuckC', ''),
(795, '2018-08-06', 'JohnW', ''),
(796, '2018-08-06', 'CharlesF', ''),
(798, '2018-08-27', 'DickN', ''),
(799, '2018-08-27', 'CurtG', ''),
(800, '2018-08-27', 'HarryL', ''),
(801, '2018-08-27', 'PeterM', ''),
(802, '2018-08-27', 'TomH', ''),
(803, '2018-08-27', 'ChuckC', ''),
(804, '2018-08-27', 'JohnW', ''),
(805, '2018-08-27', 'CharlesF', ''),
(807, '2018-08-28', 'DickN', ''),
(808, '2018-08-28', 'CurtG', ''),
(809, '2018-08-28', 'HarryL', ''),
(810, '2018-08-28', 'PeterM', ''),
(811, '2018-08-28', 'TomH', ''),
(812, '2018-08-28', 'ChuckC', ''),
(813, '2018-08-28', 'JohnW', ''),
(814, '2018-08-28', 'CharlesF', ''),
(825, '2018-08-25', 'DickN', ''),
(826, '2018-08-25', 'CurtG', ''),
(827, '2018-08-25', 'HarryL', ''),
(828, '2018-08-25', 'PeterM', ''),
(829, '2018-08-25', 'TomH', ''),
(830, '2018-08-25', 'ChuckC', ''),
(831, '2018-08-25', 'JohnW', ''),
(832, '2018-08-25', 'CharlesF', ''),
(834, '2018-09-01', 'DickN', ''),
(835, '2018-09-01', 'CurtG', ''),
(836, '2018-09-01', 'HarryL', ''),
(837, '2018-09-01', 'PeterM', ''),
(838, '2018-09-01', 'TomH', ''),
(839, '2018-09-01', 'ChuckC', ''),
(840, '2018-09-01', 'JohnW', ''),
(841, '2018-09-01', 'CharlesF', ''),
(852, '2018-09-08', 'DickN', ''),
(853, '2018-09-08', 'CurtG', ''),
(854, '2018-09-08', 'HarryL', ''),
(855, '2018-09-08', 'PeterM', ''),
(856, '2018-09-08', 'TomH', ''),
(857, '2018-09-08', 'ChuckC', ''),
(858, '2018-09-08', 'JohnW', ''),
(859, '2018-09-08', 'CharlesF', ''),
(861, '0000-00-00', 'DickN', ''),
(862, '0000-00-00', 'CurtG', ''),
(863, '0000-00-00', 'HarryL', ''),
(864, '0000-00-00', 'PeterM', ''),
(865, '0000-00-00', 'TomH', ''),
(866, '0000-00-00', 'ChuckC', ''),
(867, '0000-00-00', 'JohnW', ''),
(868, '0000-00-00', 'CharlesF', ''),
(870, '2018-10-27', 'DickN', ''),
(871, '2018-10-27', 'CurtG', ''),
(872, '2018-10-27', 'HarryL', ''),
(873, '2018-10-27', 'PeterM', ''),
(874, '2018-10-27', 'TomH', ''),
(875, '2018-10-27', 'ChuckC', ''),
(876, '2018-10-27', 'JohnW', ''),
(877, '2018-10-27', 'CharlesF', ''),
(879, '2018-11-03', 'DickN', ''),
(880, '2018-11-03', 'CurtG', ''),
(881, '2018-11-03', 'HarryL', ''),
(882, '2018-11-03', 'PeterM', ''),
(883, '2018-11-03', 'TomH', ''),
(884, '2018-11-03', 'ChuckC', ''),
(885, '2018-11-03', 'JohnW', ''),
(886, '2018-11-03', 'CharlesF', ''),
(888, '2018-11-17', 'DickN', ''),
(889, '2018-11-17', 'CurtG', ''),
(890, '2018-11-17', 'HarryL', ''),
(891, '2018-11-17', 'PeterM', ''),
(892, '2018-11-17', 'TomH', ''),
(893, '2018-11-17', 'ChuckC', ''),
(894, '2018-11-17', 'JohnW', ''),
(895, '2018-11-17', 'CharlesF', ''),
(897, '2018-11-24', 'DickN', ''),
(898, '2018-11-24', 'CurtG', ''),
(899, '2018-11-24', 'HarryL', ''),
(900, '2018-11-24', 'PeterM', ''),
(901, '2018-11-24', 'TomH', ''),
(902, '2018-11-24', 'ChuckC', ''),
(903, '2018-11-24', 'JohnW', ''),
(904, '2018-11-24', 'CharlesF', ''),
(906, '2018-12-08', 'DickN', ''),
(907, '2018-12-08', 'CurtG', ''),
(908, '2018-12-08', 'HarryL', ''),
(909, '2018-12-08', 'PeterM', ''),
(910, '2018-12-08', 'TomH', ''),
(911, '2018-12-08', 'ChuckC', ''),
(912, '2018-12-08', 'JohnW', ''),
(913, '2018-12-08', 'CharlesF', ''),
(915, '2018-12-15', 'DickN', ''),
(916, '2018-12-15', 'CurtG', ''),
(917, '2018-12-15', 'HarryL', ''),
(918, '2018-12-15', 'PeterM', ''),
(919, '2018-12-15', 'TomH', ''),
(920, '2018-12-15', 'ChuckC', ''),
(921, '2018-12-15', 'JohnW', ''),
(922, '2018-12-15', 'CharlesF', ''),
(924, '2018-12-22', 'DickN', ''),
(925, '2018-12-22', 'CurtG', ''),
(926, '2018-12-22', 'HarryL', ''),
(927, '2018-12-22', 'PeterM', ''),
(928, '2018-12-22', 'TomH', ''),
(929, '2018-12-22', 'ChuckC', ''),
(930, '2018-12-22', 'JohnW', ''),
(931, '2018-12-22', 'CharlesF', ''),
(942, '2019-01-12', 'DickN', ''),
(945, '2019-01-12', 'PeterM', ''),
(950, '2019-01-12', 'FreemanM', ''),
(951, '2019-01-12', 'TomF', ''),
(952, '2019-01-12', 'TonyC', ''),
(953, '2019-01-12', 'JimC', ''),
(954, '2019-01-12', 'JohnG', ''),
(958, '2019-01-19', 'PeterM', ''),
(959, '2019-01-19', 'FreemanM', ''),
(960, '2019-01-19', 'TonyC', ''),
(961, '2019-01-19', 'JimC', ''),
(962, '2019-01-19', 'JohnG', ''),
(963, '2019-01-19', 'RonP', ''),
(964, '2019-01-19', 'BobC', ''),
(966, '2019-01-26', 'DickN', ''),
(967, '2019-01-26', 'ChuckC', ''),
(968, '2019-01-26', 'TomF', ''),
(969, '2019-01-26', 'ClaudioD', ''),
(970, '2019-01-26', 'BrianL', ''),
(971, '2019-01-26', 'MarkK', ''),
(972, '2019-01-26', 'GeneB', ''),
(974, '2019-02-09', 'JohnC', ''),
(975, '2019-02-16', 'JohnC', ''),
(976, '2019-02-23', 'JohnC', ''),
(999, '2019-02-02', 'JohnC', ''),
(1000, '2019-02-02', 'DickN', ''),
(1001, '2019-02-02', 'CurtG', ''),
(1002, '2019-02-02', 'ChuckC', ''),
(1003, '2019-02-02', 'JohnG', ''),
(1004, '2019-02-02', 'ClaudioD', ''),
(1005, '2019-02-02', 'KarlL', ''),
(1006, '2019-02-02', 'AlanI', ''),
(1007, '2019-03-23', 'JohnC', ''),
(1008, '2019-03-23', 'DickN', ''),
(1009, '2019-03-23', 'CurtG', ''),
(1010, '2019-03-23', 'HarryL', ''),
(1011, '2019-03-23', 'PeterM', ''),
(1012, '2019-03-23', 'TomH', ''),
(1013, '2019-03-23', 'ChuckC', ''),
(1014, '2019-03-23', 'JohnW', ''),
(1015, '2019-03-23', 'CharlesF', ''),
(1016, '2019-03-23', 'FreemanM', ''),
(1017, '2019-03-23', 'TomF', ''),
(1018, '2019-03-23', 'TonyC', ''),
(1019, '2019-03-23', 'JimC', ''),
(1020, '2019-03-23', 'JohnG', ''),
(1021, '2019-03-23', 'RonP', ''),
(1022, '2019-03-23', 'BobC', ''),
(1023, '2019-03-23', 'ClaudioD', ''),
(1024, '2019-03-23', 'BrianL', ''),
(1025, '2019-03-23', 'MarkK', ''),
(1026, '2019-03-23', 'GeneB', ''),
(1027, '2019-03-23', 'KarlL', ''),
(1028, '2019-03-23', 'AlanI', ''),
(1029, '2019-03-23', 'JoeM', ''),
(1030, '2019-03-23', 'PeteS', ''),
(1031, '2019-03-23', 'GaryO', ''),
(1032, '2019-03-30', 'JohnC', ''),
(1033, '2019-03-30', 'DickN', ''),
(1034, '2019-03-30', 'CurtG', ''),
(1035, '2019-03-30', 'HarryL', ''),
(1036, '2019-03-30', 'PeterM', ''),
(1037, '2019-03-30', 'TomH', ''),
(1038, '2019-03-30', 'ChuckC', ''),
(1039, '2019-03-30', 'JohnW', ''),
(1040, '2019-03-30', 'CharlesF', ''),
(1041, '2019-03-30', 'FreemanM', ''),
(1042, '2019-03-30', 'TomF', ''),
(1043, '2019-03-30', 'TonyC', ''),
(1044, '2019-03-30', 'JimC', ''),
(1045, '2019-03-30', 'JohnG', ''),
(1046, '2019-03-30', 'RonP', ''),
(1047, '2019-03-30', 'BobC', ''),
(1048, '2019-03-30', 'ClaudioD', ''),
(1049, '2019-03-30', 'BrianL', ''),
(1050, '2019-03-30', 'MarkK', ''),
(1051, '2019-03-30', 'GeneB', ''),
(1052, '2019-03-30', 'KarlL', ''),
(1053, '2019-03-30', 'AlanI', ''),
(1054, '2019-03-30', 'JoeM', ''),
(1055, '2019-03-30', 'PeteS', ''),
(1056, '2019-03-30', 'GaryO', ''),
(1057, '2019-04-06', 'JohnC', ''),
(1058, '2019-04-06', 'DickN', ''),
(1059, '2019-04-06', 'CurtG', ''),
(1060, '2019-04-06', 'HarryL', ''),
(1061, '2019-04-06', 'PeterM', ''),
(1062, '2019-04-06', 'TomH', ''),
(1063, '2019-04-06', 'ChuckC', ''),
(1064, '2019-04-06', 'JohnW', ''),
(1065, '2019-04-06', 'CharlesF', ''),
(1066, '2019-04-06', 'FreemanM', ''),
(1067, '2019-04-06', 'TomF', ''),
(1068, '2019-04-06', 'TonyC', ''),
(1069, '2019-04-06', 'JimC', ''),
(1070, '2019-04-06', 'JohnG', ''),
(1071, '2019-04-06', 'RonP', ''),
(1072, '2019-04-06', 'BobC', ''),
(1073, '2019-04-06', 'ClaudioD', ''),
(1074, '2019-04-06', 'BrianL', ''),
(1075, '2019-04-06', 'MarkK', ''),
(1076, '2019-04-06', 'GeneB', ''),
(1077, '2019-04-06', 'KarlL', ''),
(1078, '2019-04-06', 'AlanI', ''),
(1079, '2019-04-06', 'JoeM', ''),
(1080, '2019-04-06', 'PeteS', ''),
(1081, '2019-04-06', 'GaryO', ''),
(1107, '2019-04-13', 'JohnC', ''),
(1108, '2019-04-13', 'DickN', ''),
(1109, '2019-04-13', 'CurtG', ''),
(1110, '2019-04-13', 'HarryL', ''),
(1111, '2019-04-13', 'PeterM', ''),
(1112, '2019-04-13', 'TomH', ''),
(1113, '2019-04-13', 'ChuckC', ''),
(1114, '2019-04-13', 'JohnW', ''),
(1115, '2019-04-13', 'CharlesF', ''),
(1116, '2019-04-13', 'FreemanM', ''),
(1117, '2019-04-13', 'TomF', ''),
(1118, '2019-04-13', 'TonyC', ''),
(1119, '2019-04-13', 'JimC', ''),
(1120, '2019-04-13', 'JohnG', ''),
(1121, '2019-04-13', 'RonP', ''),
(1122, '2019-04-13', 'BobC', ''),
(1123, '2019-04-13', 'ClaudioD', ''),
(1124, '2019-04-13', 'BrianL', ''),
(1125, '2019-04-13', 'MarkK', ''),
(1126, '2019-04-13', 'GeneB', ''),
(1127, '2019-04-13', 'KarlL', ''),
(1128, '2019-04-13', 'AlanI', ''),
(1129, '2019-04-13', 'JoeM', ''),
(1130, '2019-04-13', 'PeteS', ''),
(1131, '2019-04-13', 'GaryO', ''),
(1132, '2019-04-13', 'JonC', '');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `rcdNbr` int(11) NOT NULL,
  `facilityNbr` int(11) NOT NULL,
  `facilityName` varchar(30) NOT NULL,
  `nbrOfCourts` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`rcdNbr`, `facilityNbr`, `facilityName`, `nbrOfCourts`, `startDate`, `endDate`, `startTime`, `endTime`) VALUES
(7, 75, 'Coconut', 2, '2019-01-01', '2019-12-31', '09:30:00', '11:00:00'),
(8, 76, 'Canal', 2, '2019-01-01', '2019-12-31', '09:30:00', '11:00:00'),
(9, 77, 'Santiago', 2, '0000-00-00', '0000-00-00', '00:00:00', '00:00:00'),
(10, 78, 'ChulaVista', 2, '2019-03-01', '2019-12-31', '09:00:00', '11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
CREATE TABLE `league` (
  `leagueID` varchar(10) NOT NULL,
  `leagueName` varchar(30) NOT NULL,
  `leagueDB` varchar(10) NOT NULL,
  `moderatedBy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`leagueID`, `leagueName`, `leagueDB`, `moderatedBy`) VALUES
('duval', 'The Duval Group', 'duval', 'James Lush'),
('canal', 'Dick\'s Tennis Group', 'canal', 'Dick Noval'),
('coconut', 'Wayne\'s Tennis Group', 'coconut', 'Wayne Adams'),
('open1', 'Allamanda Open', 'allamanda', 'Dan Duval'),
('open2', 'Allamanda Clinic', 'clinic', 'Ron and Charlie');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mbrID` varchar(20) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phonePrimary` varchar(20) DEFAULT NULL,
  `phoneSecondary` varchar(20) DEFAULT NULL,
  `village` varchar(20) DEFAULT NULL,
  `streetAddr` varchar(30) DEFAULT NULL,
  `cityAddr` varchar(30) DEFAULT NULL,
  `zipAddr` varchar(10) DEFAULT NULL,
  `emailAddr` varchar(50) DEFAULT NULL,
  `tennisRanking` char(3) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `displayPhoto` char(1) DEFAULT NULL,
  `assignedRanking` char(4) DEFAULT NULL,
  `leagueID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mbrID`, `firstName`, `lastName`, `phonePrimary`, `phoneSecondary`, `village`, `streetAddr`, `cityAddr`, `zipAddr`, `emailAddr`, `tennisRanking`, `status`, `password`, `displayPhoto`, `assignedRanking`, `leagueID`) VALUES
('JohnC', 'John', 'Cerullo', '(603) 205-4255', '(603) 205-4355', 'Caroline', '656 Sheppard Way', 'The Villages', '32162', 'jcerullo@yahoo.com', '3.5', 'A', 'password', 'Y', '3.5', 'canal'),
('DickN', ' Dick', 'Noval', '(603) 918-6691', ' ', ' ', ' ', ' ', ' ', 'dicknoval@gmail.com', '', 'A', 'password', 'N', '', 'canal'),
('CurtG', 'Curt', '', '(309) 310-9696', ' ', ' ', ' ', ' ', ' ', 'lc5606@frontier.com', '', 'A', 'password', '', '', 'canal'),
('HarryL', 'Harry', 'Leffingwell', '(262) 501-8537', '', '', '', '', '', 'hsleffingwell@gmail.com', '', 'A', 'password', '', '', 'canal'),
('PeterM', 'Peter', '', '(941) 380-7011', '', '', '', '', '', 'peteremcnamara@gmail.com', '', 'A', 'password', '', '', 'canal'),
('TomH', 'Tom', '', '(352) 445-3123', '', '', '', '', '', 'tomhof@gmail.com', '', 'A', 'password', '', '', 'canal'),
('ChuckC', 'Chuck', 'Castellar', '(707) 227-8982', '', '', '', '', '', 'chuckaren@embarqmail.com', '', 'A', 'password', '', '', 'canal'),
('JohnW', 'John', '', '(507) 202-4004', '', '', '', '', '', 'certuryjv@gmail.com', '', 'A', 'password', '', '', 'canal'),
('CharlesF', 'Charles', '', '(610) 823-1386', '', '', '', '', '', 'cvfisher3@gmail.com', '', 'A', 'password', '', '', 'canal'),
('FreemanM', 'Freeman', 'MacKenzie', '', '', '', '', '', '', 'louisemackensie@hotmail.com', '', 'A', 'password', '', '', 'canal'),
('TomF', 'Tom', 'Fallon', '', '', '', '', '', '', 'kftd@aol.com', '', 'A', 'password', '', '', 'canal'),
('TonyC', 'Tony', 'Contrafatto', '', '', '', '', '', '', 'acontrafatto2@gmail.com', '', 'A', 'password', '', '', 'canal'),
('JimC', 'Jim', 'Christy', '', '', '', '', '', '', 'betc54@aol.com', '', 'A', 'password', '', '', 'canal'),
('JohnG', 'John', 'Grossa', '', '', '', '', '', '', 'jgrossa@hotmail.com', '', 'A', 'password', '', '', 'canal'),
('RonP', 'Ron', 'Polisoto', '', '', '', '', '', '', 'ronrack@aol.com', '', 'A', 'password', '', '', 'canal'),
('BobC', 'Bob', 'Cefalu', '', '', '', '', '', '', 'bobcefalu@yahoo.com', '', 'A', 'password', '', '', 'canal'),
('ClaudioD', 'Claudio', 'Daldini', '', '', '', '', '', '', 'claudio1031@comcast.net', '', 'A', 'password', '', '', 'canal'),
('BrianL', 'Brian', 'Lewis', '', '', '', '', '', '', 'blewis502@comcast.net', '', 'A', 'password', '', '', 'canal'),
('MarkK', 'Mark', 'Kalish', '', '', '', '', '', '', 'markskalish@yahoo.com', '', 'A', 'password', '', '', 'canal'),
('GeneB', 'Gene', 'B', '', '', '', '', '', '', '', '', 'A', 'password', '', '', 'canal'),
('KarlL', 'Karl', 'Lattig', '', '', '', '', '', '', 'lattig@embarqmail.com', '', 'A', 'password', '', '', 'canal'),
('AlanI', 'Alan', 'Iampietro', '', '', '', '', '', '', 'amiampietro@comcast.net', '', 'A', 'password', '', '', 'canal'),
('JoeM', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'A', 'password', '', '', 'canal'),
('PeteS', 'Pete', 'Smith', '', '', '', '', '', '', 'palasmith@aol.com', '', 'A', 'password', '', '', 'canal'),
('GaryO', 'Gary', 'Obst', '', '', '', '', '', '', 'garyobst@me.com', '', 'A', 'password', '', '', 'canal'),
('JonC', 'Jon', 'Church', '', '', '', '', '', '', 'church.jon@gmail.com', '', 'A', 'password', '', '', 'canal'),
('JohnC', 'John', 'Cerullo', '(603) 205-4255', '(603) 205-4355', 'Caroline', '656 Sheppard Way', 'The Villages', '32162', 'jcerullo@yahoo.com', '3.5', 'A', 'password', 'Y', '3.5', 'open1'),
('DanD', 'Dan', 'DuVall', '', '', '  ', '', '', ' ', '', '', 'I', 'password',' ',' ', 'open1'),
('DaveA', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password',' ',' ', 'open1'),
('DickA', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password',' ',' ', 'open1'),
('JimB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password',' ',' ', 'open1'),
('JohnB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password',' ',' ', 'open1'),
('BrianB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password',' ',' ', 'open1'),
('GerryB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password',' ',' ', 'open1'),
('DavidB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('DennisB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('AlB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('DaveB', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('RayC', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('NoelC', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JimC', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('DougC', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JoeD', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('HerbD', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JimE', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('MikeF', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('TerryF', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('AllanF', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('GregF', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('GeorgeG', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('GuntherG', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('BobG', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('BobH', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('AllanH', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('HeinzJ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('TracyJ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('HarveyK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JimK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('TomK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JohnK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JerryK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('ElliotL', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('EarleL', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('BruceM', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('MikeM', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('TomM', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('GlenN', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('TomR', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('DickR', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('MikeS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('HowardS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('DickS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('MichaelS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('TonyS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('AllanS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('EdS', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('CarmineT', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('JohnU', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('HalW', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('RickW', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '', 'I', 'password', ' ', ' ', 'open1'),
('NickK', 'Nick', ' Karatzas', ' (603) 531-7994', ' 603.339.2676', ' ', ' 1535 Oean Blvd', ' Rye', ' ', ' nick.karatzas34@gmail.com', '3.6', 'A', 'password', '', '3.6', 'duval'),
('DickM', ' Dick', 'Madler', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '3.5', 'A', 'password', '', '3.51', 'duval'),
('JohnC', ' John', 'Cerullo', ' (603) 205-4255', ' (603) 205-4355', ' Caroline', ' 656 Sheppard Way', ' The Villages', ' 32162', 'jcerullo@yahoo.com', '3.5', 'A', 'password', 'Y', '3.5', 'duval'),
('Dick/James', ' Dick/James', ' ...alternating', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '3.5', 'I', 'password', '', '3.5', 'duval'),
('JimK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '3.5', 'A', 'password', '', '3.7', 'duval'),
('JamesL', ' James', ' Lush', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '3.5', 'A', 'password', 'Y', '', 'duval');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `rcdNbr` int(11) NOT NULL,
  `lowLeftPhoto` varchar(20) NOT NULL,
  `lowLeftText` varchar(600) NOT NULL,
  `lowRightPhoto` varchar(20) NOT NULL,
  `lowRightText` varchar(600) NOT NULL,
  `clubName` varchar(50) NOT NULL,
  `moderatedBy` varchar(50) NOT NULL,
  `leagueID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`rcdNbr`, `lowLeftPhoto`, `lowLeftText`, `lowRightPhoto`, `lowRightText`, `clubName`, `moderatedBy`, `leagueID`) VALUES
(1, 'court', 'New membership requests can be made via email to dicknoval@gmail.com.  A brief user guide for this website can be found in the help menu at the top of this page.', 'cody', '.No special events are currently scheduled.<br><br>', 'Dick\'s Tennis Group', 'Moderated by Dick Noval', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`rcdNbr`);

--
-- Indexes for table `available`
--
ALTER TABLE `available`
  ADD PRIMARY KEY (`rcdNbr`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`rcdNbr`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`rcdNbr`),
  ADD UNIQUE KEY `rcdNbr` (`rcdNbr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `rcdNbr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1733;
--
-- AUTO_INCREMENT for table `available`
--
ALTER TABLE `available`
  MODIFY `rcdNbr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1133;
--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `rcdNbr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `rcdNbr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
