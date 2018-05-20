CREATE DATABASE  IF NOT EXISTS `dblab` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dblab`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dblab
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Food'),(2,'Drink'),(3,'Veggie and Fruit'),(4,'Bean and Seed'),(5,'Accessory');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rafaelia','Fynes','72 Brickson Park Terrace','Benavila','251-352-5014'),(2,'Aggy','Churcher','57 Nobel Park','Casa Nova','618-395-8365'),(3,'Neils','Bruckner','48916 Mccormick Court','Kalchevaya','180-448-0933'),(4,'Ruben','Ranaghan','20 American Ash Drive','Velké Pavlovice','435-925-3635'),(5,'Marlene','Gable','80465 American Ash Court','Kutacane','921-789-9182'),(6,'Callie','Kibbee','960 Portage Parkway','Nazaré','888-365-2484'),(7,'Benedicto','Waylett','113 Texas Plaza','Mrzezino','683-440-3108'),(8,'Kerry','Ruller','76302 Heffernan Parkway','Dūāb','732-236-7586'),(9,'Hartwell','Antoney','547 Crest Line Trail','Tanabe','198-408-9462'),(10,'Cherice','Johananov','95053 Banding Terrace','Cha’anpu','799-557-5015'),(11,'Arny','Whewill','15 Huxley Drive','Bondoukou','697-695-3338'),(12,'Billie','Duffree','189 Pearson Lane','Ruokolahti','347-423-2448'),(13,'Lucas','Donalson','36926 Debra Place','Rizal','471-364-3661'),(14,'Denny','Diwell','8 Corscot Avenue','Melaka','894-462-4554'),(15,'Isabelita','Grady','33918 1st Avenue','Chinameca','528-406-6396'),(16,'Amelita','Colleran','4 Green Trail','Göteborg','251-589-2250'),(17,'Gannon','Wace','1038 Hollow Ridge Crossing','Causwagan','470-934-2268'),(18,'Kitti','De Angelo','10 Mayer Park','North York','971-692-2316'),(19,'Emera','Newman','10869 Dottie Way','Duanjia','379-101-5615'),(20,'David','Sterley','49459 Artisan Crossing','Olofström','399-307-7010'),(21,'Gregg','Stratford','656 Hanover Street','Bokani','398-500-1536'),(22,'Drusie','Hebborne','5 Messerschmidt Terrace','Montpellier','510-309-6651'),(23,'Jobey','Valenta','8516 Cody Center','Duntou','355-833-2920'),(24,'Demetris','Denning','2 Vidon Parkway','Blaye','393-766-2880'),(25,'Sollie','Beniesh','418 Sherman Lane','Fengshou','158-689-4502'),(26,'Jorrie','Goaley','7 Corry Way','Tongyang','895-683-1450'),(27,'Minda','Milius','181 Walton Road','Chantepie','563-141-9658'),(28,'Joice','Aire','6 Chinook Avenue','Sumberejo','986-856-7113'),(29,'Kalindi','Aujouanet','399 Eagle Crest Road','Beiqijia','976-380-6437'),(30,'Donnamarie','Cowlard','444 Sage Alley','Mekkaw','884-471-3484'),(31,'Jobyna','Fabri','67888 Hovde Avenue','Parakou','952-232-7259'),(32,'Leroi','Emmanueli','505 Grasskamp Circle','Tengqiao','761-878-2416'),(33,'Marlon','Cockett','04551 Vera Plaza','Jaba‘','366-539-7712'),(34,'Corny','Scotney','95153 Transport Parkway','Arenal','741-412-9178'),(35,'Sebastien','Matthis','66862 Marcy Way','Diaopu','738-506-2884'),(36,'Denise','Osipenko','671 Sutteridge Crossing','Bi’r al Ḩufayy','651-854-8560'),(37,'Alisun','Romaynes','1852 Bay Plaza','Piet Retief','373-823-4485'),(38,'Gerri','Ortet','8 Bay Plaza','Panbang','889-209-9537'),(39,'Freeland','Seeley','907 Colorado Parkway','Astromil','746-952-2685'),(40,'Elset','Morfield','050 Green Road','Saidpur','474-229-7756'),(41,'Mel','Eastman','1 Larry Plaza','Bekondo','874-879-9149'),(42,'Caril','Lorenzo','11 Forest Trail','Nagrak','604-828-9744'),(43,'Merline','Ben','8 Fordem Street','Florencio Sánchez','854-163-7670'),(44,'Silva','Beckworth','0526 Summer Ridge Lane','Syców','389-522-0589'),(45,'Alfreda','Rosbottom','0269 American Ash Way','Pasto','352-393-9366'),(46,'Freddy','Thirtle','72 Spohn Court','Maliiha','281-543-8533'),(47,'Tuesday','Spender','3494 Weeping Birch Place','Sigavé','372-778-9018'),(48,'Reinaldos','Uppett','797 David Parkway','Mojokerto','272-856-6401'),(49,'Calla','Cousen','6912 8th Avenue','Belén','275-402-7796'),(50,'Wylie','Vevers','85 Esch Park','Tartaro','421-585-6290'),(51,'Linnet','Grimoldby','247 Pearson Parkway','Yili','552-982-6347'),(52,'Lisabeth','Bein','2991 Mandrake Circle','Furukawa','967-290-4466'),(53,'Henri','Gerran','35997 Gale Parkway','Hirvensalmi','952-173-7963'),(54,'Parker','Yes','06 Di Loreto Junction','Puputan','811-456-4119'),(55,'Myrvyn','Gerardi','33 Buell Point','Banshu','640-641-5538'),(56,'Edouard','Hebditch','8 Spohn Street','Skórzec','550-989-4756'),(57,'Vale','Bibb','2340 Drewry Drive','Macari','808-644-3355'),(58,'Alia','Winsper','68968 Mesta Hill','Al ‘Āliyah','483-736-4088'),(59,'Reggi','Fleisch','0 Esker Place','Cayenne','415-959-4578'),(60,'Desdemona','Kempton','09 Debs Street','Uva','699-477-2855'),(61,'Missy','Blazic','4006 Ramsey Center','Wagini','860-454-4891'),(62,'Jenilee','Squires','011 Thompson Avenue','Dongshan','526-760-2778'),(63,'Reese','Butson','946 Sullivan Plaza','Chavão','477-155-7298'),(64,'Thane','Cotes','9770 Clarendon Crossing','Briceni','127-606-7919'),(65,'Clyde','Evanson','1 Dixon Crossing','Canindé','687-179-2438'),(66,'Trey','Paolazzi','07944 Sage Plaza','Jianshe','680-575-0159'),(67,'Flemming','Ellyatt','7 Bartillon Park','Vila Franca','969-134-0176'),(68,'Pet','Yuille','8380 Dahle Drive','Bertelhe','469-273-4846'),(69,'Marc','Inett','68 Clemons Avenue','Chulakivka','769-928-7051'),(70,'Persis','Rycraft','985 Kings Lane','Bluff','659-384-7478'),(71,'Levon','Sherewood','3315 Eastwood Hill','Halimpu','725-624-3182'),(72,'Paquito','Athowe','3 Cottonwood Circle','Ochër','674-735-7819'),(73,'Hastie','Dy','56421 Cherokee Court','Kabalo','897-245-3075'),(74,'Elton','Dewing','9793 Rigney Place','Gueset','633-180-3303'),(75,'Giacinta','Winspurr','619 Carioca Point','Bangbayang','401-321-5448'),(76,'Hilary','Reimer','281 3rd Place','Przybyszówka','525-370-8325'),(77,'Debby','Kits','3803 Duke Way','Assis','534-752-1578'),(78,'Ernst','Edington','482 Starling Way','Prokhladnyy','673-629-6138'),(79,'Nicky','Samuel','281 Eliot Junction','Puunage','727-178-1617'),(80,'Worthington','Hixley','46 Superior Road','Itoman','613-648-8276'),(81,'Jessey','Brimfield','1 Center Lane','Jorowaru Daya','669-383-4090'),(82,'Jone','Brennon','3 Cascade Terrace','Morinville','487-264-6803'),(83,'Trude','Busse','3 Bartillon Way','Tangtuzhui','714-403-5854'),(84,'Bendick','Habbert','840 Scott Drive','Shanglian','688-727-7561'),(85,'Wolfgang','Siviter','9 Pawling Drive','Aloleng','424-301-2412'),(86,'Ingra','Maclean','219 Dapin Court','Calvário','551-474-0226'),(87,'Kirstin','Delacourt','96614 Kensington Way','Várzea','871-187-0755'),(88,'Aurora','Reavell','36 Dryden Trail','Chiclayo','682-295-3058'),(89,'Frederique','Patron','78 Golden Leaf Circle','Cilated','994-963-2356'),(90,'Nita','Harbidge','52 Dixon Crossing','Boca de Uchire','985-572-1263'),(91,'Hester','Clough','6 Schurz Street','Nueve de Julio','789-858-8437'),(92,'Samara','Dall','5 Dapin Lane','Kabar Utara','339-927-8096'),(93,'Sharyl','Peterkin','0 Lunder Center','Cedry Wielkie','510-671-7104'),(94,'Heindrick','Rocks','66 Luster Junction','Yuzui','702-101-5043'),(95,'Meredith','Happs','024 Lien Court','Daruoyan','527-975-9459'),(96,'Chuck','Scarlin','64 Anthes Lane','Zábřeh','531-168-9926'),(97,'Crichton','Wiltshire','6823 Claremont Drive','Colomi','290-890-0229'),(98,'Barny','Swatridge','571 Morrow Parkway','Samur','462-338-9820'),(99,'Kaylil','Netti','4 Sage Crossing','Nizhnyaya Omka','460-382-7858'),(100,'Corene','Easson','6178 Doe Crossing Plaza','Pocito','649-862-5612');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `order_customerID` (`CustomerID`),
  CONSTRAINT `order_customerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,76,'2015-01-18'),(2,93,'2015-02-24'),(3,50,'2015-03-27'),(4,15,'2015-04-01'),(5,26,'2015-04-20'),(6,19,'2015-05-15'),(7,69,'2015-06-11'),(8,11,'2015-06-25'),(9,7,'2015-07-04'),(10,29,'2015-07-12'),(11,72,'2015-07-16'),(12,31,'2015-07-26'),(13,77,'2015-08-15'),(14,39,'2015-08-29'),(15,46,'2015-09-08'),(16,58,'2015-10-03'),(17,40,'2015-10-13'),(18,2,'2015-11-12'),(19,30,'2015-12-12'),(20,9,'2016-01-02'),(21,57,'2016-01-18'),(22,30,'2016-02-19'),(23,85,'2016-03-17'),(24,68,'2016-03-19'),(25,40,'2016-04-27'),(26,49,'2016-06-03'),(27,62,'2016-06-10'),(28,51,'2016-06-16'),(29,31,'2016-06-16'),(30,25,'2016-06-30'),(31,36,'2016-07-01'),(32,38,'2016-07-01'),(33,12,'2016-07-03'),(34,30,'2016-07-29'),(35,47,'2016-08-08'),(36,4,'2016-08-10'),(37,74,'2016-08-11'),(38,80,'2016-09-10'),(39,46,'2016-09-24'),(40,66,'2016-10-26'),(41,60,'2016-11-01'),(42,11,'2016-11-29'),(43,46,'2016-12-09'),(44,5,'2016-12-25'),(45,99,'2017-01-13'),(46,53,'2017-02-21'),(47,81,'2017-02-26'),(48,47,'2017-03-23'),(49,68,'2017-04-29'),(50,49,'2017-05-18');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `orderDetail_productID` (`ProductID`),
  CONSTRAINT `orderDetail_orderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  CONSTRAINT `orderDetail_productID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,6,18),(1,15,3),(1,33,4),(1,46,23),(2,28,14),(2,49,19),(3,40,30),(4,11,26),(4,36,22),(5,24,17),(6,19,18),(6,25,6),(6,30,6),(7,13,3),(7,16,4),(7,40,7),(7,43,21),(8,4,3),(8,45,17),(9,5,25),(9,14,2),(9,26,11),(10,20,4),(11,1,4),(11,20,10),(11,50,29),(12,24,14),(12,27,15),(13,30,15),(14,3,26),(14,12,20),(14,18,9),(14,34,15),(15,5,27),(15,15,15),(15,16,16),(15,19,2),(15,40,27),(16,21,9),(16,24,17),(16,37,20),(16,39,15),(16,49,2),(17,8,24),(17,20,13),(18,17,29),(18,18,25),(19,25,7),(20,49,28),(21,6,16),(21,9,12),(21,20,7),(21,31,29),(21,48,17),(22,10,15),(22,15,19),(22,32,2),(22,39,6),(22,50,12),(23,17,4),(23,20,13),(23,22,27),(23,27,2),(24,30,5),(24,41,9),(24,45,21),(25,19,9),(26,22,27),(26,24,12),(26,31,6),(26,39,4),(26,45,18),(27,49,13),(28,26,22),(29,5,23),(29,12,7),(29,23,3),(29,37,15),(30,12,22),(30,14,6),(30,24,6),(30,25,18),(31,16,18),(31,25,6),(31,38,11),(31,39,24),(31,46,10),(32,36,23),(33,27,14),(33,49,15),(34,9,19),(34,28,1),(34,31,5),(35,1,12),(35,40,12),(35,50,2),(36,7,29),(36,19,10),(36,22,16),(36,41,28),(37,13,5),(37,21,6),(37,22,19),(37,37,3),(37,38,4),(38,9,23),(38,32,3),(38,37,13),(39,8,15),(39,35,6),(39,36,12),(39,38,24),(39,42,26),(40,3,1),(40,10,1),(40,23,11),(40,47,21),(40,50,18),(41,17,30),(41,31,10),(41,39,25),(41,41,18),(42,8,1),(42,19,16),(42,34,21),(43,42,30),(44,8,6),(45,37,21),(46,41,3),(46,44,10),(47,13,28),(47,14,4),(47,20,1),(47,24,17),(47,34,23),(48,20,14),(48,28,28),(48,33,18),(48,39,4),(49,14,20),(49,37,24),(49,46,13),(50,15,5),(50,19,15),(50,32,22),(50,38,20);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `UnitPrice` int(11) DEFAULT NULL,
  `UnitsInStock` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `product_categoryID` (`CategoryID`),
  KEY `product_supplierID` (`SupplierID`),
  CONSTRAINT `product_categoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE,
  CONSTRAINT `product_supplierID` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Onions - Vidalia',3,10,5,80),(2,'Glucose',2,7,13,343),(3,'Honey - Lavender',2,25,15,184),(4,'Carroway Seed',4,13,11,400),(5,'Artichoke - Bottom, Canned',2,28,10,425),(6,'Vodka - Hot, Lnferno',3,10,4,284),(7,'Beef - Montreal Smoked Brisket',1,30,14,140),(8,'Mushroom - Enoki, Fresh',3,18,4,112),(9,'Garbage Bags - Clear',5,8,6,315),(10,'Hummus - Spread',1,14,2,236),(11,'Beans - Kidney, Red Dry',4,11,4,463),(12,'Lentils - Green Le Puy',5,16,9,207),(13,'Wine - Fat Bastard Merlot',2,20,9,51),(14,'Fruit Mix - Light',2,30,1,261),(15,'Fudge - Chocolate Fudge',1,14,9,488),(16,'Cheese Cheddar Processed',1,6,15,169),(17,'Oil - Sunflower',1,23,11,58),(18,'Beef Dry Aged Tenderloin Aaa',1,14,10,400),(19,'Flower - Carnations',5,9,9,249),(20,'Veal - Brisket, Provimi, Bone - In',5,29,7,335),(21,'Remy Red',5,26,13,115),(22,'Grenadine',1,19,3,459),(23,'Wine - Casablanca Valley',2,11,13,422),(24,'Sugar - Brown, Individual',5,7,10,353),(25,'Syrup - Monin, Swiss Choclate',5,12,12,483),(26,'Shortbread - Cookie Crumbs',1,15,2,306),(27,'Wine - Casablanca Valley',2,25,11,420),(28,'Dried Peach',3,9,4,288),(29,'Tomatillo',3,15,4,189),(30,'Crab - Blue, Frozen',1,21,11,463),(31,'Rhubarb',3,18,11,127),(32,'Icecream - Dibs',1,27,10,204),(33,'Salad Dressing',1,15,2,195),(34,'Potatoes - Yukon Gold 5 Oz',3,25,4,285),(35,'Compound - Orange',3,12,9,106),(36,'Persimmons',3,26,1,184),(37,'Ice Cream Bar - Drumstick',1,8,3,243),(38,'Coffee - Flavoured',2,28,4,423),(39,'Extract - Almond',4,20,10,227),(40,'Beef Striploin Aaa',1,17,4,334),(41,'Flour - So Mix Cake White',5,24,5,458),(42,'Quinoa',4,23,15,494),(43,'Doilies - 7, Paper',5,19,7,489),(44,'Red Currants',3,2,7,479),(45,'Soup - French Onion',1,23,6,462),(46,'Flour - Masa De Harina Mexican',5,12,5,98),(47,'Tray - 12in Rnd Blk',5,17,13,81),(48,'Cheese - Pied De Vents',1,26,11,472),(49,'Bread - Hamburger Buns',1,3,14,265),(50,'Butcher Twine 4r',1,17,15,248);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Smith-Hirthe','43740 Laurel Court','Prilep','328-592-3527'),(2,'Swaniawski-Romaguera','8897 Jenna Point','Bernardo Larroudé','997-945-4063'),(3,'O\'Reilly and Sons','9 Schmedeman Plaza','Monastir','833-896-4803'),(4,'Hand, Yost and Auer','7230 Shopko Street','Na Tan','754-797-3269'),(5,'Botsford-Gaylord','32650 Blackbird Terrace','Riobamba','794-159-5844'),(6,'Nienow-Tillman','8 Huxley Crossing','Bolhrad','286-543-3489'),(7,'Little LLC','85 Bunting Junction','Stockholm','601-530-7637'),(8,'Moen and Sons','2 Montana Trail','Lagoa','771-459-2993'),(9,'Streich LLC','75438 Magdeline Way','Sanli','860-859-6584'),(10,'Stroman, Harris and Dooley','7987 Warbler Way','Neuquén','908-956-6549'),(11,'Marquardt-Senger','187 Carey Alley','Dunmanway','881-649-3046'),(12,'Mueller, Kutch and White','5903 Atwood Plaza','Hövsan','965-495-7610'),(13,'Okuneva-Reynolds','6781 Kings Point','Koźmin Wielkopolski','636-939-1933'),(14,'Sanford and Sons','062 Sachtjen Terrace','Karpacz','928-631-2369'),(15,'Kshlerin LLC','89 Acker Way','Santa Bárbara','965-308-3104'),(16,'Christiansen, Graham and Cummings','79992 Brown Place','Ungca','886-193-4615'),(17,'Medhurst-Wyman','18 Hovde Drive','Wanshi','918-771-5596'),(18,'Johnson LLC','37372 Esch Hill','Stratónion','804-965-4859'),(19,'Shanahan Inc','048 Burrows Street','Andahuaylas','104-764-0031'),(20,'Lowe, Okuneva and Turcotte','0 Gulseth Terrace','Dembī Dolo','675-715-8884'),(21,'Bogisich-Hagenes','28015 Melody Avenue','Jastrzębia Góra','270-385-6519'),(22,'Krajcik, Morissette and Moore','93802 Arizona Road','Torre do Pinhão','404-193-3301'),(23,'Terry-Miller','650 Riverside Crossing','New York City','212-396-5345'),(24,'Smitham, Hintz and McDermott','02 Caliangt Lane','Nueva Ocotepeque','357-423-6961'),(25,'Schmidt-Hayes','07870 Clove Park','Sydney','385-988-8821'),(26,'Hackett-Schaden','747 Bay Avenue','Linchen','776-654-2086'),(27,'Dare, Stanton and Funk','38 Towne Road','Lyuban’','260-280-3060'),(28,'Ruecker, Ratke and Cronin','79 Porter Plaza','Bom Sucesso','822-162-4826'),(29,'Nitzsche Group','7 Myrtle Terrace','Wan’an','744-712-8571'),(30,'Anderson, Kautzer and Veum','81194 Debra Hill','Chengbei','793-612-1201');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dblab'
--

--
-- Dumping routines for database 'dblab'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-19 21:15:58
