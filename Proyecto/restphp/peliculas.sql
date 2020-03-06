-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: peliculas
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `act`
--

DROP TABLE IF EXISTS `act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act` (
  `actor_id` smallint(5) unsigned NOT NULL,
  `MOVIE_ID` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`MOVIE_ID`),
  KEY `FK_ACT2` (`MOVIE_ID`),
  CONSTRAINT `FK_ACT2` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`MOVIE_ID`),
  CONSTRAINT `fk_act` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act`
--

LOCK TABLES `act` WRITE;
/*!40000 ALTER TABLE `act` DISABLE KEYS */;
/*!40000 ALTER TABLE `act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `actor_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ACTOR_NAME` varchar(15) NOT NULL,
  `ACTOR_LASTNAME` varchar(15) NOT NULL,
  `ACTOR_TYPE` varchar(15) DEFAULT NULL,
  `ACTOR_BIRTH_DATE` date DEFAULT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (2,'Alexander','Llerena','Auxiliar','1997-07-09');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `DIRECTOR_ID` int(11) NOT NULL,
  `DIRECTOR_NAME` varchar(15) NOT NULL,
  `DIRECTOR_LASTNAME` varchar(15) NOT NULL,
  PRIMARY KEY (`DIRECTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `FILM_STUDIO_ID` char(10) NOT NULL,
  `DIRECTOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`FILM_STUDIO_ID`,`DIRECTOR_ID`),
  KEY `FK_FILM2` (`DIRECTOR_ID`),
  CONSTRAINT `FK_FILM` FOREIGN KEY (`FILM_STUDIO_ID`) REFERENCES `film_studio` (`FILM_STUDIO_ID`),
  CONSTRAINT `FK_FILM2` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `director` (`DIRECTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_studio`
--

DROP TABLE IF EXISTS `film_studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_studio` (
  `FILM_STUDIO_ID` char(10) NOT NULL,
  `FILM_STUDIO_NAME` char(10) NOT NULL,
  PRIMARY KEY (`FILM_STUDIO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_studio`
--

LOCK TABLES `film_studio` WRITE;
/*!40000 ALTER TABLE `film_studio` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `MOVIE_ID` int(11) NOT NULL,
  `MOVIE_NAME` varchar(25) NOT NULL,
  `MOVIE_CATEGORY` varchar(25) DEFAULT NULL,
  `MOVIE_GENERE` varchar(25) DEFAULT NULL,
  `MOVIE_RELEASE_DATE` date NOT NULL,
  PRIMARY KEY (`MOVIE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produce`
--

DROP TABLE IF EXISTS `produce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produce` (
  `DIRECTOR_ID` int(11) NOT NULL,
  `MOVIE_ID` int(11) NOT NULL,
  PRIMARY KEY (`DIRECTOR_ID`,`MOVIE_ID`),
  KEY `FK_PRODUCE2` (`MOVIE_ID`),
  CONSTRAINT `FK_PRODUCE` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `director` (`DIRECTOR_ID`),
  CONSTRAINT `FK_PRODUCE2` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`MOVIE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produce`
--

LOCK TABLES `produce` WRITE;
/*!40000 ALTER TABLE `produce` DISABLE KEYS */;
/*!40000 ALTER TABLE `produce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 16:37:11
