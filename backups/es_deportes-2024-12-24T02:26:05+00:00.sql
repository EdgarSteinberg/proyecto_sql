-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: es_deportes
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `categoria_empleado`
--

DROP TABLE IF EXISTS `categoria_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_empleado` (
  `id_categoria_empleado` int NOT NULL AUTO_INCREMENT,
  `rol` enum('Vendedor','Encargado') DEFAULT NULL,
  PRIMARY KEY (`id_categoria_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_empleado`
--

LOCK TABLES `categoria_empleado` WRITE;
/*!40000 ALTER TABLE `categoria_empleado` DISABLE KEYS */;
INSERT INTO `categoria_empleado` VALUES (1,'Vendedor'),(2,'Encargado');
/*!40000 ALTER TABLE `categoria_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_productos`
--

DROP TABLE IF EXISTS `categoria_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_productos` (
  `id_categoria_productos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_productos`
--

LOCK TABLES `categoria_productos` WRITE;
/*!40000 ALTER TABLE `categoria_productos` DISABLE KEYS */;
INSERT INTO `categoria_productos` VALUES (1,'ElectrÃ³nica','Productos electrÃ³nicos'),(2,'Deportes','ArtÃ­culos deportivos'),(3,'Hogar','Productos para el hogar'),(4,'Ropa','Ropa y accesorios'),(5,'Juguetes','Juguetes y entretenimiento');
/*!40000 ALTER TABLE `categoria_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','PÃ©rez','juan.perez@example.com'),(2,'Ana','GonzÃ¡lez','ana.gonzalez@example.com'),(3,'Carlos','RamÃ­rez','carlos.ramirez@example.com'),(4,'Laura','LÃ³pez','laura.lopez@example.com'),(5,'Pedro','MartÃ­nez','pedro.martinez@example.com'),(7,'Edgar','Steinberg','steinb@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_cliente_insert` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO cliente_auditoria (id_cliente, nombre, apellido, email, accion)
    VALUES
     (
        NEW.id_cliente,
        NEW.nombre,
        NEW.apellido,
        NEW.email,
        'INSERT'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_cliente_update` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO cliente_auditoria (id_cliente, nombre, apellido, email, accion)
    VALUES 
    (
        OLD.id_cliente,
        OLD.nombre,
        OLD.apellido,
        OLD.email,
        'UPDATE'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_cliente_delete` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO cliente_auditoria (id_cliente, nombre, apellido, email, accion)
    VALUES
     (
        OLD.id_cliente,
        OLD.nombre,
        OLD.apellido,
        OLD.email,
        'DELETE'
     );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_auditoria`
--

DROP TABLE IF EXISTS `cliente_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_auditoria` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_auditoria`
--

LOCK TABLES `cliente_auditoria` WRITE;
/*!40000 ALTER TABLE `cliente_auditoria` DISABLE KEYS */;
INSERT INTO `cliente_auditoria` VALUES (1,6,'Luis','GarcÃ­a','luis.garcia@example.com','INSERT','2024-12-24 02:25:55'),(2,6,'Luis','GarcÃ­a','luis.garcia@example.com','UPDATE','2024-12-24 02:25:55'),(3,6,'Luis Eduardo','GarcÃ­a','luis.garcia@example.com','DELETE','2024-12-24 02:25:55'),(4,7,'Edgar','Steinberg','steinb@gmail.com','INSERT','2024-12-24 02:25:55');
/*!40000 ALTER TABLE `cliente_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `precio` int DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `fecha_de_compra` datetime DEFAULT (now()),
  `estado_de_compra` enum('Pendiente','Completada','Cancelada') DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_local` int DEFAULT NULL,
  `id_productos` int DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_constraint_id_cliente` (`id_cliente`),
  KEY `fk_constraint_id_local` (`id_local`),
  KEY `fk_constraint_id_productos` (`id_productos`),
  CONSTRAINT `fk_constraint_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_constraint_id_local` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`),
  CONSTRAINT `fk_constraint_id_productos` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,100,2.00,'2024-12-24 02:25:54','Pendiente',1,1,1),(2,200,1.00,'2024-12-24 02:25:54','Completada',2,2,2),(3,150,5.00,'2024-12-24 02:25:54','Cancelada',3,3,3),(4,120,3.00,'2024-12-24 02:25:54','Pendiente',4,4,4),(5,180,4.00,'2024-12-24 02:25:54','Completada',5,5,5),(6,500,3.00,'2024-12-24 02:25:54','Pendiente',1,2,5);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_metodo_de_pago`
--

DROP TABLE IF EXISTS `compra_metodo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_metodo_de_pago` (
  `id_compra_metodo_de_pago` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_metodo_de_pago` int DEFAULT NULL,
  PRIMARY KEY (`id_compra_metodo_de_pago`),
  KEY `fk_constraint_id_compra` (`id_compra`),
  KEY `fk_constraint_id_metodo_de_pago` (`id_metodo_de_pago`),
  CONSTRAINT `fk_constraint_id_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `fk_constraint_id_metodo_de_pago` FOREIGN KEY (`id_metodo_de_pago`) REFERENCES `metodo_de_pago` (`id_metodo_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_metodo_de_pago`
--

LOCK TABLES `compra_metodo_de_pago` WRITE;
/*!40000 ALTER TABLE `compra_metodo_de_pago` DISABLE KEYS */;
INSERT INTO `compra_metodo_de_pago` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1),(5,5,2),(6,1,3),(7,2,1),(8,3,2),(9,4,3),(10,5,1);
/*!40000 ALTER TABLE `compra_metodo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_de_compra`
--

DROP TABLE IF EXISTS `detalle_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_compra` (
  `id_detalle_de_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_productos` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_de_compra`),
  KEY `fk_constraint_id_detalle_compra` (`id_compra`),
  KEY `fk_constraint_id_detalle_producto` (`id_productos`),
  CONSTRAINT `fk_constraint_id_detalle_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `fk_constraint_id_detalle_producto` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_de_compra`
--

LOCK TABLES `detalle_de_compra` WRITE;
/*!40000 ALTER TABLE `detalle_de_compra` DISABLE KEYS */;
INSERT INTO `detalle_de_compra` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,1,2),(7,2,3),(8,3,4),(9,4,5),(10,5,1);
/*!40000 ALTER TABLE `detalle_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleados` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_empleados`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'SofÃ­a','Molina','1990-02-20','12345678'),(2,'Luis','MartÃ­n','1985-05-12','23456789'),(3,'Marta','GÃ³mez','1992-08-14','34567890'),(4,'RaÃºl','Torres','1980-11-01','45678901'),(5,'Elena','FernÃ¡ndez','1987-03-10','56789012'),(6,'\'Carlos\'','\'Perez\'','0000-00-00','\'87654321\''),(7,'\'Maria\'','\'Lopez\'','0000-00-00','\'98765432\''),(8,'\'Andres\'','\'Garcia\'','0000-00-00','\'76543210\''),(9,'\'Lucia\'','\'Ramirez\'','0000-00-00','\'65432109\''),(10,'\'Javier\'','\'Hernandez\'','0000-00-00','\'54321098\'');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_categoria`
--

DROP TABLE IF EXISTS `empleados_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_categoria` (
  `id_empleados_categoria` int NOT NULL AUTO_INCREMENT,
  `id_empleados` int DEFAULT NULL,
  `id_categoria_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_empleados_categoria`),
  KEY `fk_constraint_id_empleados_categoria` (`id_empleados`),
  KEY `fk_empleados_categoria` (`id_categoria_empleado`),
  CONSTRAINT `fk_constraint_id_empleados_categoria` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`),
  CONSTRAINT `fk_empleados_categoria` FOREIGN KEY (`id_categoria_empleado`) REFERENCES `categoria_empleado` (`id_categoria_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_categoria`
--

LOCK TABLES `empleados_categoria` WRITE;
/*!40000 ALTER TABLE `empleados_categoria` DISABLE KEYS */;
INSERT INTO `empleados_categoria` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,2),(5,5,1),(6,1,2),(7,2,1),(8,3,2),(9,4,1),(10,5,2);
/*!40000 ALTER TABLE `empleados_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id_local` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `encargado` varchar(255) NOT NULL,
  `horarios` enum('9','21') DEFAULT NULL,
  `id_empleados` int DEFAULT NULL,
  PRIMARY KEY (`id_local`),
  UNIQUE KEY `direccion` (`direccion`),
  KEY `fk_constraint_id_empleados` (`id_empleados`),
  CONSTRAINT `fk_constraint_id_empleados` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'Av. Principal 1','Sofia Molina','9',1),(2,'Av. Secundaria 2','Luis Martin','21',2),(3,'Calle Tercera 3','Marta Gomez','9',3),(4,'Calle Cuarta 4','Raul Torres','21',4),(5,'Av. Quinta 5','Elena Fernandez','9',5);
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_empleados`
--

DROP TABLE IF EXISTS `local_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_empleados` (
  `id_local_empleados` int NOT NULL AUTO_INCREMENT,
  `id_local` int DEFAULT NULL,
  `id_empleados` int DEFAULT NULL,
  PRIMARY KEY (`id_local_empleados`),
  KEY `fk_constraint_id_local_empleados` (`id_local`),
  KEY `fk_constraint_id_empleados_local` (`id_empleados`),
  CONSTRAINT `fk_constraint_id_empleados_local` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`),
  CONSTRAINT `fk_constraint_id_local_empleados` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_empleados`
--

LOCK TABLES `local_empleados` WRITE;
/*!40000 ALTER TABLE `local_empleados` DISABLE KEYS */;
INSERT INTO `local_empleados` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,1,2),(7,2,3),(8,3,4),(9,4,5),(10,5,1);
/*!40000 ALTER TABLE `local_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_de_pago`
--

DROP TABLE IF EXISTS `metodo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_de_pago` (
  `id_metodo_de_pago` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Efectivo','Tarjeta','AplicaciÃ³n') DEFAULT NULL,
  PRIMARY KEY (`id_metodo_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_de_pago`
--

LOCK TABLES `metodo_de_pago` WRITE;
/*!40000 ALTER TABLE `metodo_de_pago` DISABLE KEYS */;
INSERT INTO `metodo_de_pago` VALUES (1,'Efectivo'),(2,'Tarjeta'),(3,'AplicaciÃ³n');
/*!40000 ALTER TABLE `metodo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_productos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(254) DEFAULT NULL,
  `descripcion` varchar(254) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `id_categoria_productos` int DEFAULT NULL,
  `id_proveedores` int DEFAULT NULL,
  PRIMARY KEY (`id_productos`),
  KEY `fk_constraint_id_categoria_productos` (`id_categoria_productos`),
  KEY `fk_constraint_id_proveedor` (`id_proveedores`),
  CONSTRAINT `fk_constraint_id_categoria_productos` FOREIGN KEY (`id_categoria_productos`) REFERENCES `categoria_productos` (`id_categoria_productos`),
  CONSTRAINT `fk_constraint_id_proveedor` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto 1','DescripciÃ³n producto 1',10,1,1),(2,'Producto 2','DescripciÃ³n producto 2',5,2,2),(3,'Producto 3','DescripciÃ³n producto 3',8,3,3),(4,'Producto 4','DescripciÃ³n producto 4',3,4,4),(5,'Producto 5','DescripciÃ³n producto 5',12,5,5),(6,'Producto Prueba','DescripciÃ³n vÃ¡lida',10,1,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_bi_stock` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
    -- Mensaje de error personalizado
    SET @msg = "El stock debe ser mayor a 0";

    -- Verificar si el stock es menor o igual a 0
    IF NEW.stock <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_proveedores`),
  UNIQUE KEY `direccion` (`direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor 1','Calle Ficticia 1'),(2,'Proveedor 2','Calle Ficticia 2'),(3,'Proveedor 3','Calle Ficticia 3'),(4,'Proveedor 4','Calle Ficticia 4'),(5,'Proveedor 5','Calle Ficticia 5');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_compras_completadas`
--

DROP TABLE IF EXISTS `vw_compras_completadas`;
/*!50001 DROP VIEW IF EXISTS `vw_compras_completadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_compras_completadas` AS SELECT 
 1 AS `direccion`,
 1 AS `cantidad_compras`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_historial_compras_clientes`
--

DROP TABLE IF EXISTS `vw_historial_compras_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_historial_compras_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_historial_compras_clientes` AS SELECT 
 1 AS `cliente_nombre`,
 1 AS `cliente_apellido`,
 1 AS `fecha_de_compra`,
 1 AS `estado_de_compra`,
 1 AS `total_gastado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_stock_productos`
--

DROP TABLE IF EXISTS `vw_stock_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_stock_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stock_productos` AS SELECT 
 1 AS `producto_nombre`,
 1 AS `producto_descripcion`,
 1 AS `stock_actual`,
 1 AS `categoria_nombre`,
 1 AS `proveedor_nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_empleado_local`
--

DROP TABLE IF EXISTS `vw_ventas_empleado_local`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_empleado_local`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_empleado_local` AS SELECT 
 1 AS `empleado_nombre`,
 1 AS `empleado_apellido`,
 1 AS `total_ventas_empleado`,
 1 AS `total_ventas_local`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_por_categoria`
--

DROP TABLE IF EXISTS `vw_ventas_por_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_por_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_por_categoria` AS SELECT 
 1 AS `categoria_nombre`,
 1 AS `cantidad_total_vendida`,
 1 AS `ingreso_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_compras_completadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_compras_completadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_compras_completadas` AS select `l`.`direccion` AS `direccion`,count(`c`.`id_compra`) AS `cantidad_compras`,sum((`c`.`precio` * `c`.`cantidad`)) AS `total_ventas` from (`local` `l` left join `compra` `c` on((`l`.`id_local` = `c`.`id_local`))) where (`c`.`estado_de_compra` = 'Completada') group by `l`.`id_local` order by `total_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_historial_compras_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_historial_compras_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_historial_compras_clientes` AS select `c`.`nombre` AS `cliente_nombre`,`c`.`apellido` AS `cliente_apellido`,`co`.`fecha_de_compra` AS `fecha_de_compra`,`co`.`estado_de_compra` AS `estado_de_compra`,(`co`.`precio` * `co`.`cantidad`) AS `total_gastado` from (`cliente` `c` left join `compra` `co` on((`c`.`id_cliente` = `co`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_stock_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_stock_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stock_productos` AS select `p`.`nombre` AS `producto_nombre`,`p`.`descripcion` AS `producto_descripcion`,`p`.`stock` AS `stock_actual`,`cp`.`nombre` AS `categoria_nombre`,`pr`.`nombre` AS `proveedor_nombre` from ((`productos` `p` left join `categoria_productos` `cp` on((`p`.`id_categoria_productos` = `cp`.`id_categoria_productos`))) left join `proveedores` `pr` on((`p`.`id_proveedores` = `pr`.`id_proveedores`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_empleado_local`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_empleado_local`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_empleado_local` AS select `e`.`nombre` AS `empleado_nombre`,`e`.`apellido` AS `empleado_apellido`,sum((`c`.`precio` * `c`.`cantidad`)) AS `total_ventas_empleado`,sum((`c2`.`precio` * `c2`.`cantidad`)) AS `total_ventas_local` from (((`empleados` `e` left join `local_empleados` `le` on((`e`.`id_empleados` = `le`.`id_empleados`))) left join `compra` `c` on((`le`.`id_local` = `c`.`id_local`))) left join `compra` `c2` on((`c2`.`id_local` = `le`.`id_local`))) group by `e`.`id_empleados` order by `total_ventas_empleado` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_por_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_por_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_por_categoria` AS select `cp`.`nombre` AS `categoria_nombre`,sum(`co`.`cantidad`) AS `cantidad_total_vendida`,sum((`co`.`precio` * `co`.`cantidad`)) AS `ingreso_total` from ((`categoria_productos` `cp` left join `productos` `p` on((`cp`.`id_categoria_productos` = `p`.`id_categoria_productos`))) left join `compra` `co` on((`p`.`id_productos` = `co`.`id_productos`))) group by `cp`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-24  2:26:05
