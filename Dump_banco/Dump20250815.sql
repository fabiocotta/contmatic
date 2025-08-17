--
-- Current Database: `contmatic`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `contmatic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `contmatic`;

-- MySQL dump 10.13  Distrib 5.7.30, for Win32 (AMD64)
--
-- Host: localhost    Database: contmaticcontmatic
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `CIDADE` varchar(50) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  UNIQUE KEY `CODIGO` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
INSERT INTO `cliente` VALUES (1,'ROBERTO','RECIFE','PE'),(2,'JOAO','MANAUS','AM'),(3,'CARLOS','RIO DE JANEIRO','RJ'),(4,'MAURO','BRASILIA','DF'),(5,'LILIAN','RECIFE','PE');
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `NUMERO_PEDIDO` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_EMISSAO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CODIGO_CLIENTE` int(11) NOT NULL,
  `VALOR_TOTAL` decimal(11,2) NOT NULL,
  PRIMARY KEY (`NUMERO_PEDIDO`),
  UNIQUE KEY `NUMERO_PEDIDO` (`NUMERO_PEDIDO`),
  KEY `FK_PEDIDO_CLIENTE` (`CODIGO_CLIENTE`),
  CONSTRAINT `FK_PEDIDO_CLIENTE` FOREIGN KEY (`CODIGO_CLIENTE`) REFERENCES `cliente` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `pedido_produto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_produto` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_PEDIDO` int(11) NOT NULL,
  `CODIGO_PRODUTO` int(11) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `VALOR_UNITARIO` decimal(11,2) NOT NULL,
  `VALOR_TOTAL` decimal(11,2) NOT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_PEDIDO_PRODUTO_PEDIDO` (`NUMERO_PEDIDO`),
  KEY `FK_PEDIDO_PRODUTO_PRODUTO` (`CODIGO_PRODUTO`),
  CONSTRAINT `FK_PEDIDO_PRODUTO_PEDIDO` FOREIGN KEY (`NUMERO_PEDIDO`) REFERENCES `pedido` (`NUMERO_PEDIDO`) ON DELETE CASCADE,
  CONSTRAINT `FK_PEDIDO_PRODUTO_PRODUTO` FOREIGN KEY (`CODIGO_PRODUTO`) REFERENCES `produto` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_produto`
--

LOCK TABLES `pedido_produto` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(100) NOT NULL,
  `PRECOVENDA` decimal(11,2) NOT NULL,
  PRIMARY KEY (`CODIGO`),
  UNIQUE KEY `CODIGO` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
INSERT INTO `produto` VALUES (1,'Apple MacBook Air',4958.30),(2,'Notebook Apple MacBook Pro',8642.40),(3,'Apple iPhone 16',3767.20),(4,'Relógio Apple Watch Series 10',1717.40),(5,'Tablet Apple iPad 11ª Geração',1761.72);
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-15  22:15:59:01