-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: asm
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ctphieuxuat`
--

DROP TABLE IF EXISTS `ctphieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctphieuxuat` (
  `MaLH` int NOT NULL,
  `SoPhieu` varchar(10) NOT NULL,
  `MaHH` int NOT NULL,
  `SoLuong` int NOT NULL,
  `GhiChu` varchar(30) DEFAULT NULL,
  KEY `MaHH` (`MaHH`),
  KEY `SoPhieu` (`SoPhieu`),
  CONSTRAINT `ctphieuxuat_ibfk_1` FOREIGN KEY (`MaHH`) REFERENCES `hanghoa` (`MaHH`),
  CONSTRAINT `ctphieuxuat_ibfk_2` FOREIGN KEY (`SoPhieu`) REFERENCES `phieuxuat` (`SoPhieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctphieuxuat`
--

LOCK TABLES `ctphieuxuat` WRITE;
/*!40000 ALTER TABLE `ctphieuxuat` DISABLE KEYS */;
INSERT INTO `ctphieuxuat` VALUES (1,'SP001',15,30,'Tot'),(2,'SP002',16,20,'Nhieu'),(3,'SP003',17,40,'Du'),(4,'SP004',18,15,'Tot'),(5,'SP005',19,60,'Tot');
/*!40000 ALTER TABLE `ctphieuxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuahang` (
  `MaCH` int NOT NULL,
  `TenCH` varchar(50) DEFAULT NULL,
  `DiaChi` varchar(250) DEFAULT NULL,
  `SĐT` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaCH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuahang`
--

LOCK TABLES `cuahang` WRITE;
/*!40000 ALTER TABLE `cuahang` DISABLE KEYS */;
INSERT INTO `cuahang` VALUES (1,'An','125/d TP Đà Nẵng',268115786,'nguyenvanA@gmail.com'),(2,'Tien','158/d TP Mỹ Tho',231545684,'nguyenvanB@gmail.com'),(3,'Teo','224/hd TP Hồ Chí Minh',123568518,'nguyenvanB@gmail.com'),(4,'Khoa','126/a TP Thủ Đức',956301571,'nguyenvanD@gmail.com'),(5,'Dung','156/e TP Hồ Chí Minh',263146971,'nguyenvanE@gmail.com');
/*!40000 ALTER TABLE `cuahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hanghoa`
--

DROP TABLE IF EXISTS `hanghoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hanghoa` (
  `MaLH` int NOT NULL,
  `MaHH` int NOT NULL,
  `TenHH` varchar(50) DEFAULT NULL,
  `ĐVT` varchar(45) DEFAULT NULL,
  `GiaBan` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`MaHH`),
  KEY `MaLH` (`MaLH`),
  CONSTRAINT `hanghoa_ibfk_1` FOREIGN KEY (`MaLH`) REFERENCES `loaihang` (`MaLH`),
  CONSTRAINT `hanghoa_chk_1` CHECK ((`GiaBan` > 1000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hanghoa`
--

LOCK TABLES `hanghoa` WRITE;
/*!40000 ALTER TABLE `hanghoa` DISABLE KEYS */;
INSERT INTO `hanghoa` VALUES (1,15,'A','Cái',1500),(2,16,'B','Cái',2000),(3,17,'C','Cái',1641),(4,18,'D','Cái',1600),(5,19,'E','Cái',1180);
/*!40000 ALTER TABLE `hanghoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaihang`
--

DROP TABLE IF EXISTS `loaihang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaihang` (
  `MaLH` int NOT NULL,
  `TenLH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaLH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaihang`
--

LOCK TABLES `loaihang` WRITE;
/*!40000 ALTER TABLE `loaihang` DISABLE KEYS */;
INSERT INTO `loaihang` VALUES (1,'Thời Trang Nam'),(2,'Thời Trang Nữ'),(3,'Thời Trang Trẻ Em'),(4,'Đồng Phục Học Sinh'),(5,'Đông Phục Sinh Vien'),(6,'Thời Trang Tổng Hợp');
/*!40000 ALTER TABLE `loaihang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuat`
--

DROP TABLE IF EXISTS `phieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuat` (
  `SoPhieu` varchar(10) NOT NULL,
  `MaCH` int NOT NULL,
  `NgayLap` date NOT NULL,
  `NgayXuat` date NOT NULL,
  PRIMARY KEY (`SoPhieu`),
  KEY `MaCH` (`MaCH`),
  CONSTRAINT `phieuxuat_ibfk_1` FOREIGN KEY (`MaCH`) REFERENCES `cuahang` (`MaCH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuat`
--

LOCK TABLES `phieuxuat` WRITE;
/*!40000 ALTER TABLE `phieuxuat` DISABLE KEYS */;
INSERT INTO `phieuxuat` VALUES ('SP001',1,'2016-01-01','2023-04-07'),('SP002',2,'2017-01-01','2017-01-04'),('SP003',3,'2018-01-01','2018-02-04'),('SP004',4,'2019-01-01','2019-02-04'),('SP005',5,'2020-01-01','2016-05-04');
/*!40000 ALTER TABLE `phieuxuat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12 21:27:57
