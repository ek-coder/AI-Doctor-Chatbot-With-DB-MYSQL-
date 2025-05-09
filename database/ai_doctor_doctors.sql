-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ai_doctor
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `availability` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dr. Kavitha Ramesh','General Physician','Tambaram','9876543211','Mon-Sat, 9am-1pm'),(2,'Dr. Arjun Iyer','Dermatologist','Tambaram','9876543212','Mon-Fri, 10am-2pm'),(3,'Dr. Manoj Das','General Physician','Potheri','9876543213','Mon-Sun, 9am-12pm'),(4,'Dr. Sneha Krishnan','Pediatrician','Potheri','9876543214','Mon-Sat, 11am-3pm'),(5,'Dr. Raghav Menon','General Physician','Anna Nagar','9876543215','Tue-Sat, 10am-1pm'),(6,'Dr. Deepa Suresh','ENT Specialist','Anna Nagar','9876543216','Mon-Fri, 2pm-6pm'),(7,'Dr. Priya Narayanan','General Physician','Kattankulathur','9876543217','Mon-Sat, 9am-12pm'),(8,'Dr. Surya Raj','Orthopedic','Kattankulathur','9876543218','Mon-Fri, 3pm-6pm'),(9,'Dr. Anitha Kumar','General Physician','T Nagar','9876543219','Mon-Sat, 10am-1pm'),(10,'Dr. Vishnu Balan','Neurologist','T Nagar','9876543220','Mon-Fri, 11am-2pm'),(11,'Dr. Latha Chandran','General Physician','Adyar','9876543221','Tue-Sat, 9am-1pm'),(12,'Dr. Karthik Ram','Psychiatrist','Adyar','9876543222','Mon-Fri, 10am-12pm'),(13,'Dr. Meena Joseph','General Physician','Velachery','9876543223','Mon-Sat, 9am-1pm'),(14,'Dr. Naren S.','ENT Specialist','Velachery','9876543224','Mon-Fri, 3pm-6pm'),(15,'Dr. Bhuvana Sekar','General Physician','Mylapore','9876543225','Mon-Sat, 10am-2pm'),(16,'Dr. Keerthi Balaji','Dentist','Mylapore','9876543226','Mon-Fri, 2pm-5pm');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-09 10:35:48
