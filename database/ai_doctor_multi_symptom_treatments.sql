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
-- Table structure for table `multi_symptom_treatments`
--

DROP TABLE IF EXISTS `multi_symptom_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multi_symptom_treatments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `symptom_list` varchar(255) NOT NULL,
  `likely_disease` varchar(255) NOT NULL,
  `medications` text NOT NULL,
  `description` text,
  `dosage` text,
  `side_effects` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_symptom_treatments`
--

LOCK TABLES `multi_symptom_treatments` WRITE;
/*!40000 ALTER TABLE `multi_symptom_treatments` DISABLE KEYS */;
INSERT INTO `multi_symptom_treatments` VALUES (1,'fever, headache','Flu','Paracetamol, Ibuprofen','Treatment for flu symptoms','500mg every 6h, 200mg every 8h','Nausea, dizziness'),(2,'cold, cough','Common Cold','Antihistamines, Cough Syrup','Relief for cold and cough','10ml twice daily, 5ml thrice daily','Drowsiness, dry mouth'),(3,'fever, cough, sore throat','Strep Throat','Amoxicillin, Acetaminophen','Bacterial throat infection treatment','500mg twice daily, 500mg every 6h','Rash, upset stomach'),(4,'headache, nausea, sensitivity to light','Migraine','Sumatriptan, Naproxen','Migraine attack relief','50mg at onset, 250mg every 8h','Tingling, dizziness'),(5,'runny nose, sneezing, itchy eyes','Allergic Rhinitis','Cetirizine, Loratadine','Allergy relief','10mg once daily','Dry mouth, drowsiness'),(6,'chills, body ache, fever','Influenza','Oseltamivir, Acetaminophen','Antiviral treatment for flu','75mg twice daily, 500mg every 6h','Nausea, vomiting'),(7,'stomach ache, diarrhea, vomiting','Gastroenteritis','ORS, Loperamide','Gastrointestinal infection support','As needed, 2mg after each loose stool','Constipation, bloating'),(8,'shortness of breath, chest pain, cough','Bronchitis','Albuterol, Dextromethorphan','Bronchial infection management','2 puffs every 4h, 10ml every 6h','Tremor, nervousness'),(9,'itching, skin rash, swelling','Allergic Reaction','Hydrocortisone, Diphenhydramine','Relief from allergic skin reactions','Apply twice daily, 25mg every 6h','Drowsiness, dry mouth'),(10,'high fever, stiff neck, confusion','Meningitis','Ceftriaxone, Vancomycin','Bacterial meningitis treatment','2g IV every 12h, 1g IV every 12h','Allergic reactions, diarrhea'),(11,'fever, night sweats, weight loss','Tuberculosis','Isoniazid, Rifampin','TB treatment regimen','300mg daily, 600mg daily','Hepatitis, orange urine'),(12,'joint pain, swelling, stiffness','Rheumatoid Arthritis','Methotrexate, NSAIDs','Autoimmune joint treatment','7.5mg weekly, 200mg every 8h','Nausea, liver issues'),(13,'frequent urination, burning sensation, lower abdominal pain','Urinary Tract Infection','Nitrofurantoin, Trimethoprim','UTI treatment','100mg twice daily, 200mg twice daily','Nausea, headache'),(14,'persistent cough, wheezing, shortness of breath','Asthma Exacerbation','Salbutamol, Prednisone','Asthma attack management','2 puffs every 4h, 40mg daily','Tremor, insomnia'),(15,'fatigue, pale skin, shortness of breath','Anemia','Iron Supplements, Folic Acid','Anemia correction','325mg daily, 1mg daily','Constipation, dark stools'),(16,'nausea, yellow skin, dark urine','Hepatitis','Interferon, Ribavirin','Liver infection treatment','3 million units thrice weekly, 1000mg daily','Flu-like symptoms, anemia'),(17,'weight gain, cold intolerance, dry skin','Hypothyroidism','Levothyroxine','Thyroid hormone replacement','50mcg daily','Palpitations, nervousness'),(18,'weight loss, heat intolerance, anxiety','Hyperthyroidism','Methimazole, Beta-blockers','Thyroid hormone suppression','10mg daily, 20mg daily','Rash, slowed heart rate');
/*!40000 ALTER TABLE `multi_symptom_treatments` ENABLE KEYS */;
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
