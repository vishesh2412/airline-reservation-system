-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ars
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `user_id` varchar(20) NOT NULL,
  `passwd` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `contact` char(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('vg2412','V78647','Vishesh Goyal','8871500881','vishesh78647@gmail.com'),('ld1009','LD1009','Lakshya Dubey','8889525140','lakshya.dubey04@gmail.com'),('','','','',''),('pd98','PD98','Prateek Dubey','8720050791','prateek.dubey98@gmail.com'),('yb55','YB55','Yash Bhargava','9425323034','yash.bhargav@gmail.com'),('kns45','KNS45','Kanishk Shukla','8889525140','kanishk.shukla@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `F_No` varchar(20) NOT NULL,
  `Dprt` varchar(20) DEFAULT NULL,
  `Arvl` varchar(30) DEFAULT NULL,
  `Dprt_time` varchar(20) DEFAULT NULL,
  `Arvl_Time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`F_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('ic94','Indore','Chennai','0530','0800'),('id95','Indore','Dubai','1400','2220'),('ik96','Indore','Kolkata','0845','1315'),('im97','Indore','Mumbai','0300','0430'),('in98','Indore','New Delhi','0445','0630');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ic94`
--

DROP TABLE IF EXISTS `ic94`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ic94` (
  `psg_id` varchar(20) NOT NULL,
  `psg_name` varchar(20) DEFAULT NULL,
  `psg_age` int DEFAULT NULL,
  `psg_gdr` varchar(10) DEFAULT NULL,
  `DOF` date DEFAULT NULL,
  `psg_seat` varchar(10) DEFAULT NULL,
  `seat_class` varchar(15) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `Dprt_time` varchar(20) DEFAULT NULL,
  `Arvl_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`psg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ic94`
--

LOCK TABLES `ic94` WRITE;
/*!40000 ALTER TABLE `ic94` DISABLE KEYS */;
INSERT INTO `ic94` VALUES ('776655331122','Lakshya Dubey',18,'M','2022-12-30','C52','Business','ld1009','0000','0530');
/*!40000 ALTER TABLE `ic94` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id95`
--

DROP TABLE IF EXISTS `id95`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id95` (
  `psg_id` varchar(20) NOT NULL,
  `psg_name` varchar(20) DEFAULT NULL,
  `psg_age` int DEFAULT NULL,
  `psg_gdr` varchar(10) DEFAULT NULL,
  `DOF` date DEFAULT NULL,
  `psg_seat` varchar(10) DEFAULT NULL,
  `seat_class` varchar(15) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `Dprt_time` varchar(20) DEFAULT NULL,
  `Arvl_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`psg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id95`
--

LOCK TABLES `id95` WRITE;
/*!40000 ALTER TABLE `id95` DISABLE KEYS */;
/*!40000 ALTER TABLE `id95` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ik96`
--

DROP TABLE IF EXISTS `ik96`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ik96` (
  `psg_id` varchar(20) NOT NULL,
  `psg_name` varchar(20) DEFAULT NULL,
  `psg_age` int DEFAULT NULL,
  `psg_gdr` varchar(10) DEFAULT NULL,
  `DOF` date DEFAULT NULL,
  `psg_seat` varchar(10) DEFAULT NULL,
  `seat_class` varchar(15) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `Dprt_time` varchar(20) DEFAULT NULL,
  `Arvl_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`psg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ik96`
--

LOCK TABLES `ik96` WRITE;
/*!40000 ALTER TABLE `ik96` DISABLE KEYS */;
INSERT INTO `ik96` VALUES ('112233445588','Keshav Gupta',18,'M','2022-02-12','A82','Business','ld1009','1315','0845'),('779955331144','Lakshya Dubey',18,'M','2022-12-02','C50','Business','pd98','1315','0845'),('7799664422','PRATEEK DUBEY',24,'M','2022-02-12','B89','Business','','1315','0845');
/*!40000 ALTER TABLE `ik96` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im97`
--

DROP TABLE IF EXISTS `im97`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `im97` (
  `psg_id` varchar(20) NOT NULL,
  `psg_name` varchar(20) DEFAULT NULL,
  `psg_age` int DEFAULT NULL,
  `psg_gdr` varchar(10) DEFAULT NULL,
  `DOF` date DEFAULT NULL,
  `psg_seat` varchar(10) DEFAULT NULL,
  `seat_class` varchar(15) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `Dprt_time` varchar(20) DEFAULT NULL,
  `Arvl_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`psg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im97`
--

LOCK TABLES `im97` WRITE;
/*!40000 ALTER TABLE `im97` DISABLE KEYS */;
INSERT INTO `im97` VALUES ('1144889966','Lakshya Dubey',18,'M','2022-02-12','B20','Business','ld1009','0430','0300'),('778899556644','Chetan Sharma',30,'M','2022-12-25','A78','Business','ld1009','0430','0300');
/*!40000 ALTER TABLE `im97` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in98`
--

DROP TABLE IF EXISTS `in98`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in98` (
  `psg_id` varchar(20) NOT NULL,
  `psg_name` varchar(20) DEFAULT NULL,
  `psg_age` int DEFAULT NULL,
  `psg_gdr` varchar(10) DEFAULT NULL,
  `DOF` date DEFAULT NULL,
  `psg_seat` varchar(10) DEFAULT NULL,
  `seat_class` varchar(15) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `Dprt_time` varchar(20) DEFAULT NULL,
  `Arvl_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`psg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in98`
--

LOCK TABLES `in98` WRITE;
/*!40000 ALTER TABLE `in98` DISABLE KEYS */;
INSERT INTO `in98` VALUES ('445566998877','Arnav Dubey',19,'M','2022-12-04','A86','Business','ld1009','0630','0445');
/*!40000 ALTER TABLE `in98` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-02  6:53:17
