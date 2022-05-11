-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: OnlineTest
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','f392642056c736434f6aa4b282fc8a42');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `teacherId` int NOT NULL,
  `image` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `members` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'计算机一班',1,'https://himg.bdimg.com/sys/portrait/hotitem/wildkid/23',4),(2,'计算机二班',2,'https://himg.bdimg.com/sys/portrait/hotitem/wildkid/11',0),(3,'自动化一班',3,'https://himg.bdimg.com/sys/portrait/hotitem/wildkid/55',1),(4,'计算机五班',1,'https://himg.bdimg.com/sys/portrait/hotitem/wildkid/27',0),(5,'计算机四班',1,'https://himg.bdimg.com/sys/portrait/hotitem/wildkid/46',0);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msg` (
  `id` int NOT NULL,
  `test_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_id` (`test_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `test_id` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `describe` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `answer` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `subjectId` int DEFAULT NULL,
  `analysis` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `options` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `correct` int DEFAULT NULL,
  `wrong` int DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'马克思在《资本论》中指出∶\"一个商品占有者出售他现有的商品，而另一个商品占有者却只是作为货币的代表或作为未来货币的代表来购买这种商品。卖者成为债权人，买者成为债务人。由于商品的形态变化或育晶的价值形式的发展在这里起了变化，货币也就取得了另一种职能。\"这里所论述的货币\"另一种职能\"指的是（ ）','A',10,'价值尺度','价值尺度,流通手段,贮藏手段,支付手段',0,0,'单选'),(2,'与第二次世界大战前的资本主父相比，当代资本主义在许多方面已经并正在发生着深刻的变化，当代资本主义社会，大公司经营活动的实际控制者是（ ）','B,C,D',13,'股东大会、监事会、董事长','高级职业经理,股东大会,监事会,董事长',0,0,'多选'),(3,'发展格局是经济现代化的路径选择，是关系我国发展全局的重大战略任务。立足新发展阶段，贯彻新发展理念，要致力构建以国内大循环为主体、国内国际双循环相促进的新发展格局。构建渐发展格局的关键在于（ ）','A',10,'正确','null,null,null,null',0,0,'判断'),(4,'虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。','A',11,'无','null,null,null,null',0,0,'判断'),(5,'测试题目','A',10,'暂无解析','选项A,选项B,选项C,选项D',0,0,'单选');
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` int DEFAULT NULL,
  `record` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `testId` int DEFAULT NULL,
  `problemId` int DEFAULT NULL,
  `correct` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id2` (`studentId`),
  KEY `test_id3` (`testId`),
  KEY `problem_id` (`problemId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (5,7,'A,C',3,2,0),(20,7,'A',3,1,1),(22,7,'A',3,4,1),(23,306,'A',3,1,1),(24,306,'B,C,D',3,2,1),(25,306,'A',3,3,1),(26,306,'A',3,4,1),(27,7,'A,B,C',3,3,0),(30,7,'B,C,D',0,2,1);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `score` int DEFAULT NULL,
  `test_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id1` (`student_id`),
  KEY `test_id1` (`test_id`),
  CONSTRAINT `student_id1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `test_id1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `classId` int DEFAULT NULL,
  `nikename` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (7,'zixiangfei','e97f16e6f5caeaa5c340e66636b50be7','zxf@163.com',1,'郑鲁州'),(8,'student1','e97f16e6f5caeaa5c340e66636b50be7','student1@qq.com',1,'学生1'),(209,'student2','e97f16e6f5caeaa5c340e66636b50be7','student2@qq.com',1,'学生2'),(210,'student3','e97f16e6f5caeaa5c340e66636b50be7','student3@qq.com',3,'张三'),(211,'student4','e97f16e6f5caeaa5c340e66636b50be7','student4@qq.com',NULL,'student4'),(212,'student5','e97f16e6f5caeaa5c340e66636b50be7','student5@qq.com',NULL,'student5'),(213,'student6','e97f16e6f5caeaa5c340e66636b50be7','student6@qq.com',NULL,'student6'),(214,'student9','e97f16e6f5caeaa5c340e66636b50be7','student9@qq.com',NULL,'student9'),(215,'student10','e97f16e6f5caeaa5c340e66636b50be7','student10@qq.com',NULL,'student10'),(216,'student11','e97f16e6f5caeaa5c340e66636b50be7','student11@qq.com',NULL,'student11'),(217,'student12','e97f16e6f5caeaa5c340e66636b50be7','student12@qq.com',NULL,'student12'),(218,'student13','e97f16e6f5caeaa5c340e66636b50be7','student13@qq.com',NULL,'student13'),(219,'student14','e97f16e6f5caeaa5c340e66636b50be7','student14@qq.com',NULL,'student14'),(220,'student15','e97f16e6f5caeaa5c340e66636b50be7','student15@qq.com',NULL,'student15'),(221,'student16','e97f16e6f5caeaa5c340e66636b50be7','student16@qq.com',NULL,'student16'),(222,'student17','e97f16e6f5caeaa5c340e66636b50be7','student17@qq.com',NULL,'student17'),(223,'student18','e97f16e6f5caeaa5c340e66636b50be7','student18@qq.com',NULL,'student18'),(224,'student19','e97f16e6f5caeaa5c340e66636b50be7','student19@qq.com',NULL,'student19'),(225,'student20','e97f16e6f5caeaa5c340e66636b50be7','student20@qq.com',NULL,'student20'),(226,'student21','e97f16e6f5caeaa5c340e66636b50be7','student21@qq.com',NULL,'student21'),(227,'student22','e97f16e6f5caeaa5c340e66636b50be7','student22@qq.com',NULL,'student22'),(228,'student23','e97f16e6f5caeaa5c340e66636b50be7','student23@qq.com',NULL,'student23'),(229,'student24','e97f16e6f5caeaa5c340e66636b50be7','student24@qq.com',NULL,'student24'),(230,'student25','e97f16e6f5caeaa5c340e66636b50be7','student25@qq.com',NULL,'student25'),(231,'student26','e97f16e6f5caeaa5c340e66636b50be7','student26@qq.com',NULL,'student26'),(232,'student27','e97f16e6f5caeaa5c340e66636b50be7','student27@qq.com',NULL,'student27'),(233,'student28','e97f16e6f5caeaa5c340e66636b50be7','student28@qq.com',NULL,'student28'),(234,'student29','e97f16e6f5caeaa5c340e66636b50be7','student29@qq.com',NULL,'student29'),(235,'student30','e97f16e6f5caeaa5c340e66636b50be7','student30@qq.com',NULL,'student30'),(236,'student31','e97f16e6f5caeaa5c340e66636b50be7','student31@qq.com',NULL,'student31'),(237,'student32','e97f16e6f5caeaa5c340e66636b50be7','student32@qq.com',NULL,'student32'),(238,'student33','e97f16e6f5caeaa5c340e66636b50be7','student33@qq.com',NULL,'student33'),(239,'student34','e97f16e6f5caeaa5c340e66636b50be7','student34@qq.com',NULL,'student34'),(240,'student35','e97f16e6f5caeaa5c340e66636b50be7','student35@qq.com',NULL,'student35'),(241,'student36','e97f16e6f5caeaa5c340e66636b50be7','student36@qq.com',NULL,'student36'),(242,'student37','e97f16e6f5caeaa5c340e66636b50be7','student37@qq.com',NULL,'student37'),(243,'student38','e97f16e6f5caeaa5c340e66636b50be7','student38@qq.com',NULL,'student38'),(244,'student39','e97f16e6f5caeaa5c340e66636b50be7','student39@qq.com',NULL,'student39'),(245,'student40','e97f16e6f5caeaa5c340e66636b50be7','student40@qq.com',NULL,'student40'),(246,'student41','e97f16e6f5caeaa5c340e66636b50be7','student41@qq.com',NULL,'student41'),(247,'student42','e97f16e6f5caeaa5c340e66636b50be7','student42@qq.com',NULL,'student42'),(248,'student43','e97f16e6f5caeaa5c340e66636b50be7','student43@qq.com',NULL,'student43'),(249,'student44','e97f16e6f5caeaa5c340e66636b50be7','student44@qq.com',NULL,'student44'),(250,'student45','e97f16e6f5caeaa5c340e66636b50be7','student45@qq.com',NULL,'student45'),(251,'student46','e97f16e6f5caeaa5c340e66636b50be7','student46@qq.com',NULL,'student46'),(252,'student47','e97f16e6f5caeaa5c340e66636b50be7','student47@qq.com',NULL,'student47'),(253,'student48','e97f16e6f5caeaa5c340e66636b50be7','student48@qq.com',NULL,'student48'),(254,'student49','e97f16e6f5caeaa5c340e66636b50be7','student49@qq.com',NULL,'student49'),(255,'student50','e97f16e6f5caeaa5c340e66636b50be7','student50@qq.com',NULL,'student50'),(256,'student51','e97f16e6f5caeaa5c340e66636b50be7','student51@qq.com',NULL,'student51'),(257,'student52','e97f16e6f5caeaa5c340e66636b50be7','student52@qq.com',NULL,'student52'),(258,'student53','e97f16e6f5caeaa5c340e66636b50be7','student53@qq.com',NULL,'student53'),(259,'student54','e97f16e6f5caeaa5c340e66636b50be7','student54@qq.com',NULL,'student54'),(260,'student55','e97f16e6f5caeaa5c340e66636b50be7','student55@qq.com',NULL,'student55'),(261,'student56','e97f16e6f5caeaa5c340e66636b50be7','student56@qq.com',NULL,'student56'),(262,'student57','e97f16e6f5caeaa5c340e66636b50be7','student57@qq.com',NULL,'student57'),(263,'student58','e97f16e6f5caeaa5c340e66636b50be7','student58@qq.com',NULL,'student58'),(264,'student59','e97f16e6f5caeaa5c340e66636b50be7','student59@qq.com',NULL,'student59'),(265,'student60','e97f16e6f5caeaa5c340e66636b50be7','student60@qq.com',NULL,'student60'),(266,'student61','e97f16e6f5caeaa5c340e66636b50be7','student61@qq.com',NULL,'student61'),(267,'student62','e97f16e6f5caeaa5c340e66636b50be7','student62@qq.com',NULL,'student62'),(268,'student63','e97f16e6f5caeaa5c340e66636b50be7','student63@qq.com',NULL,'student63'),(269,'student64','e97f16e6f5caeaa5c340e66636b50be7','student64@qq.com',NULL,'student64'),(270,'student65','e97f16e6f5caeaa5c340e66636b50be7','student65@qq.com',NULL,'student65'),(271,'student66','e97f16e6f5caeaa5c340e66636b50be7','student66@qq.com',NULL,'student66'),(272,'student67','e97f16e6f5caeaa5c340e66636b50be7','student67@qq.com',NULL,'student67'),(273,'student68','e97f16e6f5caeaa5c340e66636b50be7','student68@qq.com',NULL,'student68'),(274,'student69','e97f16e6f5caeaa5c340e66636b50be7','student69@qq.com',NULL,'student69'),(275,'student70','e97f16e6f5caeaa5c340e66636b50be7','student70@qq.com',NULL,'student70'),(276,'student71','e97f16e6f5caeaa5c340e66636b50be7','student71@qq.com',NULL,'student71'),(277,'student72','e97f16e6f5caeaa5c340e66636b50be7','student72@qq.com',NULL,'student72'),(278,'student73','e97f16e6f5caeaa5c340e66636b50be7','student73@qq.com',NULL,'student73'),(279,'student74','e97f16e6f5caeaa5c340e66636b50be7','student74@qq.com',NULL,'student74'),(280,'student75','e97f16e6f5caeaa5c340e66636b50be7','student75@qq.com',NULL,'student75'),(281,'student76','e97f16e6f5caeaa5c340e66636b50be7','student76@qq.com',NULL,'student76'),(282,'student77','e97f16e6f5caeaa5c340e66636b50be7','student77@qq.com',NULL,'student77'),(283,'student78','e97f16e6f5caeaa5c340e66636b50be7','student78@qq.com',NULL,'student78'),(284,'student79','e97f16e6f5caeaa5c340e66636b50be7','student79@qq.com',NULL,'student79'),(285,'student80','e97f16e6f5caeaa5c340e66636b50be7','student80@qq.com',NULL,'student80'),(286,'student81','e97f16e6f5caeaa5c340e66636b50be7','student81@qq.com',NULL,'student81'),(287,'student82','e97f16e6f5caeaa5c340e66636b50be7','student82@qq.com',NULL,'student82'),(288,'student83','e97f16e6f5caeaa5c340e66636b50be7','student83@qq.com',NULL,'student83'),(289,'student84','e97f16e6f5caeaa5c340e66636b50be7','student84@qq.com',NULL,'student84'),(290,'student85','e97f16e6f5caeaa5c340e66636b50be7','student85@qq.com',NULL,'student85'),(291,'student86','e97f16e6f5caeaa5c340e66636b50be7','student86@qq.com',NULL,'student86'),(292,'student87','e97f16e6f5caeaa5c340e66636b50be7','student87@qq.com',NULL,'student87'),(293,'student88','e97f16e6f5caeaa5c340e66636b50be7','student88@qq.com',NULL,'student88'),(294,'student89','e97f16e6f5caeaa5c340e66636b50be7','student89@qq.com',NULL,'student89'),(295,'student90','e97f16e6f5caeaa5c340e66636b50be7','student90@qq.com',NULL,'student90'),(296,'student91','e97f16e6f5caeaa5c340e66636b50be7','student91@qq.com',NULL,'student91'),(297,'student92','e97f16e6f5caeaa5c340e66636b50be7','student92@qq.com',NULL,'student92'),(298,'student93','e97f16e6f5caeaa5c340e66636b50be7','student93@qq.com',NULL,'student93'),(299,'student94','e97f16e6f5caeaa5c340e66636b50be7','student94@qq.com',NULL,'student94'),(300,'student95','e97f16e6f5caeaa5c340e66636b50be7','student95@qq.com',NULL,'student95'),(301,'student96','e97f16e6f5caeaa5c340e66636b50be7','student96@qq.com',NULL,'student96'),(302,'student97','e97f16e6f5caeaa5c340e66636b50be7','student97@qq.com',NULL,'student97'),(303,'student98','e97f16e6f5caeaa5c340e66636b50be7','student98@qq.com',NULL,'student98'),(304,'student99','e97f16e6f5caeaa5c340e66636b50be7','student99@qq.com',NULL,'student99'),(305,'student100','e97f16e6f5caeaa5c340e66636b50be7','student100@qq.com',NULL,'student100'),(306,'lyh','e97f16e6f5caeaa5c340e66636b50be7','1046818625@qq.com',1,'liuyuhe'),(307,'liuyuhe','e97f16e6f5caeaa5c340e66636b50be7','liuyuhe@qq.com',NULL,'liuyuhe');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (10,'数据结构'),(11,'操作系统'),(12,'计算机网络'),(13,'计算机组成原理'),(14,'编译原理'),(15,'马克思主义原理'),(17,'测试课程1'),(18,'测试课程');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nikename` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'teacher','e97f16e6f5caeaa5c340e66636b50be7','tea@qq.com',NULL),(2,'teacher2','e97f16e6f5caeaa5c340e66636b50be7','teacher2@qq.com','teacher2'),(3,'liu','e97f16e6f5caeaa5c340e66636b50be7','1046818625@qq.com','liu'),(4,'tom','4b3628f04b66ff61f9f7bf13b4286511','tom@qq.com','tom');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `time` int DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `problems` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `classId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (3,'测验',86399000,'2022-05-01 07:00:00','1,2,3,4,',1),(4,'测验一',18000000,'2022-05-10 11:59:59','1,2,',1),(5,'课堂测验',18000000,'2022-05-10 11:59:59','1,3,',1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10 21:39:19
