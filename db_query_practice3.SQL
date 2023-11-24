-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: store_practice
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `department_FK` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `department_check` CHECK (`name` = 'Sales' or `name` = 'Marketing' or `name` = 'R&D' or `name` = 'Retail')
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Sales',3),(2,'Marketing',5),(3,'R&D',1),(4,'Sales',4),(5,'Retail',2);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `salary` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_un` (`email`),
  CONSTRAINT `employee_check` CHECK (`salary` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Anna','Njong','njo@gmail.com',120000),(2,'Anu','Colines','ano@gmail.com',80000),(3,'Nunti','Njon','njon@gmail.com',110000),(4,'Numbi','Brend','numbi@gmail.com',150000),(5,'Gladise','Boris','glad@gmail.com',100000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'store_practice'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-24 14:49:51



insert into employee(first_name, last_name, email, salary) values('Anna', 'Njong', 'njo@gmail.com', 120000);
insert into employee(first_name, last_name, email, salary) values('Anu', 'Colines', 'ano@gmail.com', 80000);
insert into employee(first_name, last_name, email, salary) values('Nunti', 'Njon', 'njon@gmail.com', 110000);
insert into employee(first_name, last_name, email, salary) values('Numbi', 'Brend', 'numbi@gmail.com', 150000);
insert into employee(first_name, last_name, email, salary) values('Gladise', 'Boris', 'glad@gmail.com', 100000);

select first_name, last_name, email, salary from employee;
select first_name, last_name from employee;
select  first_name, last_name, salary from employee where salary >=5000;
select max(salary) from employee;
select avg(salary) from employee;
select min(salary) from employee;


insert into department(name, department_id) values('Sales', 3);
insert into department(name, department_id) values('Marketing', 5);
insert into department(name, department_id) values('R&D', 1);
insert into department(name, department_id) values('Sales', 4);
insert into department(name, department_id) values('Retail', 2);

select employee.last_name, department.name from employee inner join department on employee.id = department.department_id;
select employee.first_name, department.name from employee inner join department on employee.id = department.department_id where name ='Sales';
select avg(salary) from employee inner join department on employee.id = department.department_id;
select count(id) from employee;