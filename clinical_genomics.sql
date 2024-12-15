CREATE DATABASE  IF NOT EXISTS `clinical_genomics` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinical_genomics`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: clinical_genomics
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `clinicaltrials`
--

DROP TABLE IF EXISTS `clinicaltrials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicaltrials` (
  `trialId` int NOT NULL,
  `trialName` varchar(100) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `coordinator` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicaltrials`
--

LOCK TABLES `clinicaltrials` WRITE;
/*!40000 ALTER TABLE `clinicaltrials` DISABLE KEYS */;
INSERT INTO `clinicaltrials` VALUES (1,'Breast Cancer Study','2023-04-01','2024-03-31','Dr. Smith','New York'),(2,'Diabetes Treatment Trial','2023-05-15','2024-05-14','Dr. Johnson','Chicago'),(3,'Lung Cancer Immunotherapy','2023-06-01','2024-05-31','Dr. Williams','Los Angeles'),(4,'Obesity Prevention Program','2023-07-01','2024-06-30','Dr. Brown','Houston'),(5,'Alzheimer’s Disease Study','2023-08-01','2024-07-31','Dr. Martinez','San Francisco'),(6,'Colon Cancer Screening','2023-09-01','2024-08-31','Dr. Garcia','Boston'),(7,'Osteoporosis Research','2023-10-01','2024-09-30','Dr. Thompson','Philadelphia'),(8,'Asthma Management Study','2023-11-01','2024-10-31','Dr. Clark','Miami'),(9,'Prostate Cancer Detection','2023-12-01','2024-11-30','Dr. Adams','Seattle'),(10,'Cardiovascular Disease Prevention','2024-01-01','2024-12-31','Dr. White','Denver');
/*!40000 ALTER TABLE `clinicaltrials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnoses` (
  `diagnosisId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `diagnosisDate` date DEFAULT NULL,
  `diagnosisType` varchar(100) DEFAULT NULL,
  `physician` varchar(50) DEFAULT NULL,
  `treatmentPlan` text,
  PRIMARY KEY (`diagnosisId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,1,'2022-05-15','Coronary Artery Disease','Dr. Smith','Medication and Diet'),(2,2,'2022-06-20','Breast Cancer','Dr. Johnson','Surgery and Chemotherapy'),(3,3,'2022-07-25','Type 2 Diabetes','Dr. Williams','Insulin Therapy and Diet'),(4,4,'2022-08-30','Hypertension','Dr. Brown','Exercise and Medication'),(5,5,'2022-10-05','Obesity','Dr. Davis','Diet and Exercise Plan'),(6,6,'2022-11-10','Alzheimer’s Disease','Dr. Martinez','Medication and Cognitive Therapy'),(7,7,'2023-01-15','Colon Cancer','Dr. Garcia','Surgery and Chemotherapy'),(8,8,'2023-02-20','Osteoporosis','Dr. Thompson','Calcium Supplements and Exercise'),(9,9,'2023-03-25','Asthma','Dr. Clark','Inhaler and Allergy Management'),(10,10,'2023-04-30','Obesity','Dr. Adams','Exercise and Nutrition Counseling');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familyhistory`
--

DROP TABLE IF EXISTS `familyhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familyhistory` (
  `familyHistoryId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `disease` varchar(50) DEFAULT NULL,
  `ageAtDiagnosis` int DEFAULT NULL,
  `relativeStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`familyHistoryId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `familyhistory_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familyhistory`
--

LOCK TABLES `familyhistory` WRITE;
/*!40000 ALTER TABLE `familyhistory` DISABLE KEYS */;
INSERT INTO `familyhistory` VALUES (1,1,'Father','Heart Disease',55,'Deceased'),(2,2,'Mother','Breast Cancer',50,'Alive'),(3,3,'Brother','Diabetes',40,'Alive'),(4,4,'Sister','High Blood Pressure',45,'Alive'),(5,5,'Grandfather','Prostate Cancer',70,'Deceased'),(6,6,'Grandmother','Alzheimer’s Disease',75,'Deceased'),(7,7,'Uncle','Colon Cancer',60,'Alive'),(8,8,'Aunt','Osteoporosis',65,'Alive'),(9,9,'Cousin','Asthma',30,'Alive'),(10,10,'Nephew','Obesity',20,'Alive');
/*!40000 ALTER TABLE `familyhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geneticcounseling`
--

DROP TABLE IF EXISTS `geneticcounseling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geneticcounseling` (
  `counselingId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `counselor` varchar(50) DEFAULT NULL,
  `counselingDate` date DEFAULT NULL,
  `counselingType` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`counselingId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `geneticcounseling_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geneticcounseling`
--

LOCK TABLES `geneticcounseling` WRITE;
/*!40000 ALTER TABLE `geneticcounseling` DISABLE KEYS */;
INSERT INTO `geneticcounseling` VALUES (1,1,'Dr. Johnson','2022-05-25','BRCA Genetic Testing','Patient tested positive for BRCA1 mutation.'),(2,2,'Dr. Smith','2022-06-30','Hereditary Breast Cancer Risk Assessment','Patient has family history of breast cancer.'),(3,3,'Dr. Williams','2022-08-05','Type 2 Diabetes Genetic Risk Assessment','Patient has genetic predisposition to diabetes.'),(4,4,'Dr. Brown','2022-09-10','Hypertension Genetic Counseling','Patient needs to monitor blood pressure regularly.'),(5,5,'Dr. Martinez','2022-10-15','Alzheimer’s Disease Genetic Counseling','Patient has elevated risk of Alzheimer’s disease.'),(6,6,'Dr. Garcia','2023-01-01','Colon Cancer Genetic Counseling','Patient should undergo colonoscopy screening.'),(7,7,'Dr. Thompson','2023-03-05','Osteoporosis Genetic Risk Assessment','Patient has genetic risk factors for osteoporosis.'),(8,8,'Dr. Clark','2023-04-10','Asthma Genetic Counseling','Patient has allergen-induced asthma.'),(9,9,'Dr. Adams','2023-05-15','Obesity Genetic Risk Assessment','Patient has genetic predisposition to obesity.'),(10,10,'Dr. White','2023-07-20','Cardiovascular Disease Genetic Counseling','Patient needs to follow heart-healthy diet.');
/*!40000 ALTER TABLE `geneticcounseling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genetictesting`
--

DROP TABLE IF EXISTS `genetictesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genetictesting` (
  `testingId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `testDate` date DEFAULT NULL,
  `testName` varchar(100) DEFAULT NULL,
  `lab` varchar(100) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`testingId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `genetictesting_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genetictesting`
--

LOCK TABLES `genetictesting` WRITE;
/*!40000 ALTER TABLE `genetictesting` DISABLE KEYS */;
INSERT INTO `genetictesting` VALUES (1,1,'2022-05-30','BRCA1 Genetic Test','Genomics Lab A','Positive'),(2,2,'2022-07-05','Hereditary Breast Cancer Test','Genetic Diagnostics Lab B','Negative'),(3,3,'2022-08-10','Diabetes Genetic Test','Genomics Lab A','Positive'),(4,4,'2022-09-15','Hypertension Genetic Test','Genomics Lab C','Negative'),(5,5,'2022-10-20','Obesity Genetic Test','Genetic Diagnostics Lab B','Positive'),(6,6,'2023-01-05','Alzheimer’s Disease Genetic Test','Genomics Lab A','Negative'),(7,7,'2023-03-10','Colon Cancer Genetic Test','Genomics Lab C','Positive'),(8,8,'2023-04-15','Osteoporosis Genetic Test','Genomics Lab A','Negative'),(9,9,'2023-05-20','Asthma Genetic Test','Genetic Diagnostics Lab B','Positive'),(10,10,'2023-07-25','Cardiovascular Disease Genetic Test','Genomics Lab C','Negative');
/*!40000 ALTER TABLE `genetictesting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecords` (
  `recordId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `conditions` varchar(100) DEFAULT NULL,
  `treatment` varchar(100) DEFAULT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecords`
--

LOCK TABLES `medicalrecords` WRITE;
/*!40000 ALTER TABLE `medicalrecords` DISABLE KEYS */;
INSERT INTO `medicalrecords` VALUES (1,1,'2022-05-10','Heart Attack','Medication','Dr. Smith'),(2,2,'2022-06-15','Breast Cancer','Surgery','Dr. Johnson'),(3,3,'2022-07-20','Diabetes','Insulin','Dr. Williams'),(4,4,'2022-08-25','High Blood Pressure','Exercise','Dr. Brown'),(5,5,'2022-09-30','Obesity','Diet Plan','Dr. Davis'),(6,6,'2022-10-05','Alzheimer’s Disease','Medication','Dr. Martinez'),(7,7,'2022-11-10','Colon Cancer','Chemotherapy','Dr. Garcia'),(8,8,'2022-12-15','Osteoporosis','Calcium Supplements','Dr. Thompson'),(9,9,'2023-01-20','Asthma','Inhaler','Dr. Clark'),(10,10,'2023-02-25','Obesity','Exercise','Dr. Adams');
/*!40000 ALTER TABLE `medicalrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patientId` int NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'John','Doe','Male','1980-05-15','123 Main St'),(2,'Jane','Smith','Female','1992-10-25','456 Elm St'),(3,'Michael','Johnson','Male','1975-08-12','789 Oak St'),(4,'Emily','Davis','Female','1988-03-02','101 Pine St'),(5,'David','Lee','Male','1995-12-18','202 Maple St'),(6,'Sarah','Wilson','Female','1982-07-29','303 Cedar St'),(7,'Robert','Brown','Male','1973-04-05','404 Walnut St'),(8,'Laura','Martinez','Female','1990-09-14','505 Spruce St'),(9,'Daniel','Garcia','Male','1987-06-21','606 Birch St'),(10,'Jennifer','Thompson','Female','1984-11-08','707 Sycamore St');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phenotypes`
--

DROP TABLE IF EXISTS `phenotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phenotypes` (
  `phenotypeId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `phenotypeType` varchar(50) DEFAULT NULL,
  `measurement` float DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `recordedDate` date DEFAULT NULL,
  PRIMARY KEY (`phenotypeId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `phenotypes_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phenotypes`
--

LOCK TABLES `phenotypes` WRITE;
/*!40000 ALTER TABLE `phenotypes` DISABLE KEYS */;
INSERT INTO `phenotypes` VALUES (1,1,'Blood Pressure',120,'mmHg','2023-01-05'),(2,2,'Heart Rate',70,'bpm','2023-01-07'),(3,3,'Blood Glucose',90,'mg/dL','2023-01-10'),(4,4,'Cholesterol',150,'mg/dL','2023-01-12'),(5,5,'BMI',25,'kg/m²','2023-01-15'),(6,6,'HbA1c',5.5,'%','2023-01-17'),(7,7,'White Blood Cell Count',7000,'/mm³','2023-01-20'),(8,8,'Platelet Count',250000,'/mm³','2023-01-22'),(9,9,'Hemoglobin',14,'g/dL','2023-01-25'),(10,10,'Blood Urea Nitrogen',15,'mg/dL','2023-01-28');
/*!40000 ALTER TABLE `phenotypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `treatmentId` int NOT NULL,
  `patientId` int DEFAULT NULL,
  `treatmentDate` date DEFAULT NULL,
  `treatmentType` varchar(100) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`treatmentId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (1,1,'2022-05-20','Medication','Local Pharmacy',100.00),(2,2,'2022-06-25','Surgery','Memorial Hospital',5000.00),(3,3,'2022-07-30','Insulin Therapy','Endocrinology Clinic',200.00),(4,4,'2022-09-05','Exercise Program','Fitness Center',50.00),(5,5,'2022-10-10','Diet Plan','Nutritionist',150.00),(6,6,'2022-11-15','Medication','Local Pharmacy',75.00),(7,7,'2023-01-20','Chemotherapy','Oncology Center',3000.00),(8,8,'2023-02-25','Calcium Supplements','Local Pharmacy',30.00),(9,9,'2023-03-30','Inhaler Therapy','Pulmonology Clinic',80.00),(10,10,'2023-05-05','Exercise Program','Fitness Center',75.00);
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `variantId` int NOT NULL,
  `geneName` varchar(50) DEFAULT NULL,
  `chromosome` varchar(10) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `refAllele` varchar(50) DEFAULT NULL,
  `altAllele` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`variantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,'BRCA1','17',41197642,'C','T'),(2,'BRCA2','13',32315086,'G','A'),(3,'EGFR','7',55259515,'A','G'),(4,'TP53','17',7578537,'T','G'),(5,'APC','5',112175807,'G','A'),(6,'PTEN','10',87984436,'C','T'),(7,'KRAS','12',25398285,'G','A'),(8,'BRAF','7',140453136,'A','T'),(9,'ABL1','9',1335907,'G','C'),(10,'FLT3','13',28578349,'C','T');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 13:01:36
