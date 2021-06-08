-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Kubify
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `img` varchar(155) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `img1` varchar(45) DEFAULT NULL,
  `img2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'The Rolling Stones','rolling.jpeg','The Rolling Stones es una banda británica de rock originaria de Londres. La banda se formó en abril de 1962​ por Brian Jones, Mick Jagger, Keith Richards, Bill Wyman, Charlie Watts e Ian Stewart.2​ Brian Jones fue despedido en junio de 1969, falleciendo tres semanas después, siendo reemplazado por el guitarrista Mick Taylor, que dejaría el grupo en 1975 y sería a su vez reemplazado por Ronnie Wood. Están considerados como una de las más grandes e influyentes bandas de toda la historia del rock','Led Zeppelin-video.mp4',NULL),(2,'Led Zeppelin','led.jpeg','Led Zeppelin fue un grupo británico de hard rock fundado en Londres en 1968 por el guitarrista Jimmy Page, quien había pertenecido a The Yardbirds. La banda estuvo integrada por John Paul Jones como bajista y teclista, el vocalista Robert Plant y John Bonham a la batería (que había coincidido con Plant en The Band of Joy).',NULL,NULL),(3,'Queen','queen.jpeg','Queen es una banda británica de rock formada en 1970 en Londres por el cantante y pianista Freddie Mercury, el guitarrista Brian May, el baterista Roger Taylor y el bajista John Deacon. Si bien el grupo ha presentado bajas de dos de sus miembros (Mercury, fallecido en 1991, y Deacon, retirado en 1997), los integrantes restantes, Brian May y Roger Taylor, continúan trabajando bajo el nombre Queen, por lo que la banda aún se considera activa.',NULL,NULL),(4,'Pink Floyd','pink.jpeg','Pink Floyd fue una banda de rock británica, fundada en Londres en 1965. Es considerada un ícono cultural del siglo XX y una de las bandas más influyentes y aclamadas en la historia de la música, obtuvieron gran popularidad gracias a su música psicodélica que evolucionó hacia el rock progresivo y rock sinfónico con el paso del tiempo. Es conocida por sus canciones de alto contenido filosófico, la experimentación sónica, las innovadoras portadas de sus discos y sus elaborados espectáculos en vivo.',NULL,NULL),(5,'Deep Purple','deep.jpeg','Deep Purple es una banda británica de hard rock formada en 1968 en Hertford, Reino Unido. Está considerada como una de las pioneras de dicho subgénero, y los pioneros del heavy metal junto a Led Zeppelin y Black Sabbath. Su música ha incorporado elementos del rock progresivo, rock sinfónico, rock psicodélico, blues rock, funk rock, britpop y la música clásica. Deep Purple ha vendido más de 150 millones de discos en todo el mundo.',NULL,NULL),(6,'AC/DC','ac.jpeg','AC/DC es una banda de hard rock británica-australiana, formada en 1973 en Australia por los hermanos escoceses Malcolm y Angus Young. Sus álbumes se han vendido en un total estimado de 200 millones de copias, embarcándose en giras multitudinarias por todo el mundo, y sus éxitos han musicalizado varias producciones cinematográficas sobresalientes. Son famosas sus actuaciones en vivo, resultando vibrantes y exultantes espectáculos de primer orden.',NULL,NULL),(7,'The Ramones','los-ramones.jpeg','Ramones fue una banda de punk formada en Forest Hills, en el distrito de Queens (Nueva York, Estados Unidos) en 1974, y disuelta veintidós años más tarde, en 1996. Pioneros y líderes del naciente punk,​ cimentaron las bases de este género musical con composiciones simples, minimalistas, repetitivas y letras muy simples o incluso sin sentido, en clara oposición a la pomposidad y la fastuosidad de las bandas que triunfaban en el mercado de los años 1970',NULL,NULL),(8,'Kiss','kiss.png','Kiss (estilizado KISS) es una banda estadounidense de rock formada en Nueva York en enero de 1973 por el bajista Gene Simmons y el guitarrista Paul Stanley, a los que más tarde se unirían el batería Peter Criss y el guitarrista Ace Frehley. Conocidos por su maquillaje facial y sus extravagantes trajes.',NULL,NULL),(14,'undefined','1622785158154.png','undefined',NULL,NULL);
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `id_song` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `id` int unsigned NOT NULL,
  PRIMARY KEY (`id_song`),
  KEY `fk_id_idx` (`id`),
  CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `band` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (3,'ddede',1),(4,'gjhfhte',2);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1111','maria@hotmail.com');
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

-- Dump completed on 2021-06-04 10:51:50
