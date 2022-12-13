-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: modulo06tp09
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `idmateria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `objetivo` text,
  `plan_estudio` text,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idmateria`),
  UNIQUE KEY `idmateria` (`idmateria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Matematica discreta','estudio de elementos finitos o infinitos, siempre que estos sean numerables.','Teoria de la informacion,Logica,Teoria de conjuntos','1'),(2,'Bases de datos','Estudiar las características de la evolución experimentada por la tecnología de gestión de datos. Estudiar los principales modelos semánticos de datos. Estudiar los fundamentos de las bases de datos orientadas a objeto.','SQL WorkBench','1'),(3,'Ingles Tecnico','Los objetivos de esta asignatura son capacitar al alumno para la comprensión de textos técnicos y semitécnicos propios de su especialidad, la expresión escrita, la traducción y la comprensión y expresión orales, habilidades, estas últimas, a las que se dará un énfasis especial en este nivel II.','Compresion de texto, traducciones...','0'),(4,'Ingenieria de software','Crear programas informáticos que satisfagan las necesidades de la sociedad y empresas.Guiar y coordinar el desarrollo de una programación difícil.Intervenir en el ciclo de vida de un producto.Estimar los costos y el plazo de ejecución de un proyecto.Actuar como líder del equipo de desarrollo de software.Diseño, desarrollo y administración de bases de datos.Durante la creación de la aplicación, liderar y dirigir a los programadores.Incluir procesos de calidad en las aplicaciones, como la medición de métricas y medidas y la evaluación de la calidad del software.','...','1'),(5,'Inteligencia Artificial','Preparar al alumno para la innovación en el área de la Inteligencia Artificial, en dos sentidos: la creación de técnicas y métodos innovadores en el propio área de investigación de la Inteligencia Artificial ...','...','1');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 13:51:33
