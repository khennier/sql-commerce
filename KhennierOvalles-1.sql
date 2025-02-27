-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Carritos`
--

DROP TABLE IF EXISTS `Carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carritos` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `id_usr` int DEFAULT NULL,
  `fecha_creacion` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id_carrito`),
  KEY `id_usr` (`id_usr`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`id_usr`) REFERENCES `Usuarios` (`id_usr`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carritos`
--

LOCK TABLES `Carritos` WRITE;
/*!40000 ALTER TABLE `Carritos` DISABLE KEYS */;
INSERT INTO `Carritos` VALUES (1,1,'2025-02-25');
/*!40000 ALTER TABLE `Carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `id_cat` int NOT NULL AUTO_INCREMENT,
  `nombre_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Electrónica');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Carrito`
--

DROP TABLE IF EXISTS `Detalle_Carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_Carrito` (
  `id_detalle_carrito` int NOT NULL AUTO_INCREMENT,
  `id_carrito` int DEFAULT NULL,
  `id_prod` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_detalle_carrito`),
  KEY `id_carrito` (`id_carrito`),
  KEY `id_prod` (`id_prod`),
  CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `Carritos` (`id_carrito`) ON DELETE CASCADE,
  CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `Productos` (`id_prod`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Carrito`
--

LOCK TABLES `Detalle_Carrito` WRITE;
/*!40000 ALTER TABLE `Detalle_Carrito` DISABLE KEYS */;
INSERT INTO `Detalle_Carrito` VALUES (1,1,1,2);
/*!40000 ALTER TABLE `Detalle_Carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Ordenes`
--

DROP TABLE IF EXISTS `Detalle_Ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_Ordenes` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_ord` int DEFAULT NULL,
  `id_prod` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_ord` (`id_ord`),
  KEY `id_prod` (`id_prod`),
  CONSTRAINT `detalle_ordenes_ibfk_1` FOREIGN KEY (`id_ord`) REFERENCES `Ordenes` (`id_ord`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ordenes_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `Productos` (`id_prod`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Ordenes`
--

LOCK TABLES `Detalle_Ordenes` WRITE;
/*!40000 ALTER TABLE `Detalle_Ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Detalle_Ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordenes`
--

DROP TABLE IF EXISTS `Ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordenes` (
  `id_ord` int NOT NULL AUTO_INCREMENT,
  `id_usr` int DEFAULT NULL,
  `fecha_orden` date NOT NULL DEFAULT (curdate()),
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_ord`),
  KEY `id_usr` (`id_usr`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_usr`) REFERENCES `Usuarios` (`id_usr`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordenes`
--

LOCK TABLES `Ordenes` WRITE;
/*!40000 ALTER TABLE `Ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagos`
--

DROP TABLE IF EXISTS `Pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_ord` int DEFAULT NULL,
  `fecha_pago` date NOT NULL DEFAULT (curdate()),
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_ord` (`id_ord`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_ord`) REFERENCES `Ordenes` (`id_ord`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagos`
--

LOCK TABLES `Pagos` WRITE;
/*!40000 ALTER TABLE `Pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `id_prod` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `id_cat` int DEFAULT NULL,
  PRIMARY KEY (`id_prod`),
  KEY `id_cat` (`id_cat`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `Categorias` (`id_cat`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Auriculares','Auriculares inalámbricos',100.00,20,1);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `id_usr` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT 'USER',
  `fecha_registro` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id_usr`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Juan Pérez','juanperez@example.com','password123','USER','2025-02-25');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 15:00:47
