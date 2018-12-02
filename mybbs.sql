-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: mybbs
-- ------------------------------------------------------
-- Server version	5.7.21-1

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
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `login_time` datetime(6) NOT NULL,
  `ip` varchar(50) CHARACTER SET latin1 NOT NULL,
  `device` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
INSERT INTO `login_log` VALUES (1,1,'2018-12-01 09:50:02.610000','0:0:0:0:0:0:0:1','CHROME'),(2,1,'2018-12-01 09:52:21.687000','0:0:0:0:0:0:0:1','CHROME'),(3,1,'2018-12-01 09:57:00.377000','0:0:0:0:0:0:0:1','CHROME'),(4,1,'2018-12-01 11:53:00.626000','0:0:0:0:0:0:0:1','CHROME'),(5,1,'2018-12-01 11:58:48.781000','0:0:0:0:0:0:0:1','CHROME'),(6,1,'2018-12-01 12:03:06.085000','0:0:0:0:0:0:0:1','CHROME'),(7,1,'2018-12-01 12:12:17.934000','0:0:0:0:0:0:0:1','CHROME'),(8,1,'2018-12-01 14:26:03.031000','0:0:0:0:0:0:0:1','CHROME'),(9,1,'2018-12-01 15:00:24.615000','0:0:0:0:0:0:0:1','CHROME'),(10,1,'2018-12-01 15:11:40.166000','0:0:0:0:0:0:0:1','CHROME'),(11,1,'2018-12-01 15:21:17.959000','0:0:0:0:0:0:0:1','CHROME');
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) NOT NULL,
  `reply_user_id` int(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `device` varchar(100) CHARACTER SET latin1 NOT NULL,
  `content` varchar(500) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `reply_user_id` (`reply_user_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`reply_user_id`) REFERENCES `reply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab`
--

DROP TABLE IF EXISTS `tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `tab_name_en` varchar(100) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab`
--

LOCK TABLES `tab` WRITE;
/*!40000 ALTER TABLE `tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `click` int(10) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8_bin NOT NULL,
  `tab_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,'2018-12-01 15:24:32.774000','2018-12-01 15:24:32.774000','linux',NULL,'????????xxxx',0),(2,1,'2018-12-01 15:27:29.157000','2018-12-01 15:27:29.157000','newKey',NULL,'??????????????????????vvdsdvasvdavdaddfrgggfggdfcxvdv',0),(3,1,'2018-12-01 15:47:34.972000','2018-12-01 15:47:34.972000','macKey',NULL,'xxx????????????',0),(4,1,'2018-12-01 16:13:02.908000','2018-12-01 16:13:02.908000','水水水水',NULL,'少时诵诗书多撒大`',0);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `phone_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `credit` int(10) NOT NULL,
  `avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `type` tinyint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'15875024344','E10ADC3949BA59ABBE56E057F20F883E','17322087096@163.com','8617322087096','2018-12-01 09:47:01.411000','2018-12-01 09:47:01.411000',15,'/img/avatar/avatar-default-7.png',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-03  6:57:17
