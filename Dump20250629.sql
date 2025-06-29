CREATE DATABASE  IF NOT EXISTS `clima_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clima_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: clima_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `id_zona` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `id_nivel_riesgo` int DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `id_zona` (`id_zona`),
  KEY `id_nivel_riesgo` (`id_nivel_riesgo`),
  CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`),
  CONSTRAINT `alerta_ibfk_2` FOREIGN KEY (`id_nivel_riesgo`) REFERENCES `nivel_riesgo` (`id_nivel_riesgo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
INSERT INTO `alerta` VALUES (1,3,'2025-06-29 01:50:23',2,'Generada por reporte de usuario'),(2,4,'2025-06-29 01:50:23',3,'Generada por reporte de usuario'),(3,5,'2025-06-29 01:50:23',3,'Generada por reporte de usuario');
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_climatica`
--

DROP TABLE IF EXISTS `condicion_climatica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_climatica` (
  `id_condicion_climatica` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `icono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_condicion_climatica`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_climatica`
--

LOCK TABLES `condicion_climatica` WRITE;
/*!40000 ALTER TABLE `condicion_climatica` DISABLE KEYS */;
INSERT INTO `condicion_climatica` VALUES (1,'Soleado','01d'),(2,'Parcialmente Nublado','02d'),(3,'Nublado','04d'),(4,'Lluvia Ligera','09d'),(5,'Lluvia Fuerte','10d'),(6,'Tormenta Eléctrica','11d'),(7,'Niebla','50d');
/*!40000 ALTER TABLE `condicion_climatica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuente_informacion`
--

DROP TABLE IF EXISTS `fuente_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuente_informacion` (
  `id_fuente` int NOT NULL AUTO_INCREMENT,
  `nombre_fuente` varchar(255) NOT NULL,
  `tipo_fuente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fuente`),
  UNIQUE KEY `nombre_fuente` (`nombre_fuente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuente_informacion`
--

LOCK TABLES `fuente_informacion` WRITE;
/*!40000 ALTER TABLE `fuente_informacion` DISABLE KEYS */;
INSERT INTO `fuente_informacion` VALUES (1,'Protección Civil Chimalhuacán','Gubernamental'),(2,'Servicio Meteorológico Nacional','Gubernamental'),(3,'CENAPRED','Gubernamental'),(4,'Nota Periodística Local','Prensa'),(5,'Archivo Histórico Municipal','Histórico'),(6,'Reporte Ciudadano Verificado','Comunitaria');
/*!40000 ALTER TABLE `fuente_informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_inundaciones`
--

DROP TABLE IF EXISTS `historico_inundaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_inundaciones` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_zona` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `id_nivel_inundacion` int DEFAULT NULL,
  `id_fuente` int DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_zona` (`id_zona`),
  KEY `id_nivel_inundacion` (`id_nivel_inundacion`),
  KEY `id_fuente` (`id_fuente`),
  CONSTRAINT `historico_inundaciones_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`),
  CONSTRAINT `historico_inundaciones_ibfk_2` FOREIGN KEY (`id_nivel_inundacion`) REFERENCES `nivel_inundacion` (`id_nivel_inundacion`),
  CONSTRAINT `historico_inundaciones_ibfk_3` FOREIGN KEY (`id_fuente`) REFERENCES `fuente_informacion` (`id_fuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_inundaciones`
--

LOCK TABLES `historico_inundaciones` WRITE;
/*!40000 ALTER TABLE `historico_inundaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_inundaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id_imagen` int NOT NULL AUTO_INCREMENT,
  `id_reporte` int DEFAULT NULL,
  `image_url` varchar(2048) NOT NULL,
  PRIMARY KEY (`id_imagen`),
  KEY `id_reporte` (`id_reporte`),
  CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`id_reporte`) REFERENCES `reporte_usuario` (`id_reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_inundacion`
--

DROP TABLE IF EXISTS `nivel_inundacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_inundacion` (
  `id_nivel_inundacion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nivel_inundacion`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_inundacion`
--

LOCK TABLES `nivel_inundacion` WRITE;
/*!40000 ALTER TABLE `nivel_inundacion` DISABLE KEYS */;
INSERT INTO `nivel_inundacion` VALUES (4,'Alto'),(2,'Bajo'),(3,'Medio'),(5,'Muy Alto'),(1,'Muy Bajo');
/*!40000 ALTER TABLE `nivel_inundacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_riesgo`
--

DROP TABLE IF EXISTS `nivel_riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_riesgo` (
  `id_nivel_riesgo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nivel_riesgo`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_riesgo`
--

LOCK TABLES `nivel_riesgo` WRITE;
/*!40000 ALTER TABLE `nivel_riesgo` DISABLE KEYS */;
INSERT INTO `nivel_riesgo` VALUES (3,'Alto'),(1,'Bajo'),(2,'Medio');
/*!40000 ALTER TABLE `nivel_riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pronostico_clima`
--

DROP TABLE IF EXISTS `pronostico_clima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pronostico_clima` (
  `id_pronostico` int NOT NULL AUTO_INCREMENT,
  `id_zona` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `temperatura` decimal(5,2) DEFAULT NULL,
  `humedad` decimal(5,2) DEFAULT NULL,
  `precipitacion_mm` decimal(6,2) DEFAULT NULL,
  `viento_kmh` decimal(5,2) DEFAULT NULL,
  `id_condicion_climatica` int DEFAULT NULL,
  PRIMARY KEY (`id_pronostico`),
  KEY `id_zona` (`id_zona`),
  KEY `id_condicion_climatica` (`id_condicion_climatica`),
  CONSTRAINT `pronostico_clima_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`),
  CONSTRAINT `pronostico_clima_ibfk_2` FOREIGN KEY (`id_condicion_climatica`) REFERENCES `condicion_climatica` (`id_condicion_climatica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pronostico_clima`
--

LOCK TABLES `pronostico_clima` WRITE;
/*!40000 ALTER TABLE `pronostico_clima` DISABLE KEYS */;
/*!40000 ALTER TABLE `pronostico_clima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_usuario`
--

DROP TABLE IF EXISTS `reporte_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte_usuario` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_zona` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `id_nivel_inundacion` int NOT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_zona` (`id_zona`),
  KEY `id_nivel_inundacion` (`id_nivel_inundacion`),
  CONSTRAINT `reporte_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `reporte_usuario_ibfk_2` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`),
  CONSTRAINT `reporte_usuario_ibfk_3` FOREIGN KEY (`id_nivel_inundacion`) REFERENCES `nivel_inundacion` (`id_nivel_inundacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_usuario`
--

LOCK TABLES `reporte_usuario` WRITE;
/*!40000 ALTER TABLE `reporte_usuario` DISABLE KEYS */;
INSERT INTO `reporte_usuario` VALUES (1,1,1,'2025-06-29 01:50:23',1),(2,2,2,'2025-06-29 01:50:23',2),(3,3,3,'2025-06-29 01:50:23',3),(4,4,4,'2025-06-29 01:50:23',4),(5,5,5,'2025-06-29 01:50:23',5);
/*!40000 ALTER TABLE `reporte_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_zona`
--

DROP TABLE IF EXISTS `tipo_zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_zona` (
  `id_tipo_zona` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `factor_riesgo_base` decimal(4,2) DEFAULT '1.00',
  PRIMARY KEY (`id_tipo_zona`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_zona`
--

LOCK TABLES `tipo_zona` WRITE;
/*!40000 ALTER TABLE `tipo_zona` DISABLE KEYS */;
INSERT INTO `tipo_zona` VALUES (1,'Residencial',1.00),(2,'Comercial',1.20),(3,'Industrial',1.50),(4,'Ribereña',3.00),(5,'Vialidad Principal',1.80);
/*!40000 ALTER TABLE `tipo_zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_telegram` bigint NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_telegram` (`id_telegram`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,100001),(2,100002),(3,100003),(4,100004),(5,100005);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `latitud` decimal(10,8) NOT NULL,
  `longitud` decimal(11,8) NOT NULL,
  `id_tipo_zona` int DEFAULT NULL,
  PRIMARY KEY (`id_zona`),
  KEY `id_tipo_zona` (`id_tipo_zona`),
  CONSTRAINT `zona_ibfk_1` FOREIGN KEY (`id_tipo_zona`) REFERENCES `tipo_zona` (`id_tipo_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'Barrio Xochiaca',19.41650700,-98.94022300,NULL),(2,'San Agustín Atlapulco',19.41981200,-98.93517200,NULL),(3,'Barrio Herreros',19.42114400,-98.94532200,NULL),(4,'Tlatel Xochitenco',19.40912600,-98.94954300,NULL),(5,'Barrio Saraperos',19.41488000,-98.95421100,NULL);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'clima_db'
--

--
-- Dumping routines for database 'clima_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-29  1:57:11
