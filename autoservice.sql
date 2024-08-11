/*
SQLyog Trial v13.1.9 (64 bit)
MySQL - 8.0.30 : Database - AutoService
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`AutoService` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `AutoService`;

/*Table structure for table `car_brands` */

DROP TABLE IF EXISTS `car_brands`;

CREATE TABLE `car_brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `car_brands` */

insert  into `car_brands`(`id`,`name`) values 
(10,'Audi'),
(5,'Changan'),
(12,'Chevrolet'),
(1,'FIAT'),
(6,'Hummer'),
(11,'Jaguar'),
(7,'Jeep'),
(3,'Mazda'),
(9,'Mitsubishi'),
(2,'Peugeot'),
(4,'Toyota'),
(8,'ВАЗ');

/*Table structure for table `car_models` */

DROP TABLE IF EXISTS `car_models`;

CREATE TABLE `car_models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `body_type` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `car_models_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `car_brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `car_models` */

insert  into `car_models`(`id`,`brand_id`,`name`,`start_date`,`end_date`,`body_type`,`image_url`) values 
(1,1,'Punto','1993-07-04','2006-02-01','hatchback','/catalog/hatchback/476.970.jpg'),
(2,2,'207','2006-01-01','2012-01-01','hatchback','/catalog/hatchback/610x400x0x626279b870df4.jpg'),
(3,3,'2','2002-01-01','2020-01-01','hatchback','/catalog/hatchback/05332eb4-mazda3d2_6.jpg'),
(4,5,'Benni','2006-01-01','2011-01-01','hatchback','/catalog/hatchback/6369.webp'),
(5,4,'Yaris','1999-01-01','2009-01-01','hatchback','/catalog/hatchback/63217b79f5-b31231.jpg'),
(6,4,'Raum','1997-01-04','2011-01-01','hatchback','/catalog/hatchback/2245183649.jpg'),
(7,4,'Yaris 2','1999-01-01','2019-01-01','hatchback','/catalog/hatchback/2519341335.jpg'),
(8,1,'Punto 2','1993-01-01','2012-01-01','hatchback','/catalog/hatchback/fb1e71b57bd7da15cd2d01113c4fce37.jpg'),
(9,6,'H2','2002-01-01','2009-01-01','jeep','/catalog/jeep/7lesv3himwp95ul25dwr6cyuy807tuy2.jpg'),
(10,7,'Wrangler Rubicon','1993-01-01','2025-01-01','jeep','/catalog/jeep/9.webp'),
(11,8,'Нива 4x4','1990-01-01','2025-01-01','jeep','/catalog/jeep/0380-1-800x800.jpg'),
(12,8,'Нива 4x4 2','1990-01-01','2025-01-01','jeep','/catalog/jeep/666-800x800.jpg'),
(13,7,'Wrangler ','1993-01-01','2025-01-01','jeep','/catalog/jeep/1120.webp'),
(14,7,'Wrangler 2','1993-01-01','2025-01-01','jeep','/catalog/jeep/53336.750x0.jpg'),
(15,7,'Wrangler 3','1993-01-01','2025-01-01','jeep','/catalog/jeep/113147_porogi-oem-dlya-jeep-wrangler-jk-2007-2.jpg'),
(16,7,'Wrangler Rubicon 2','1993-01-01','2025-01-01','jeep','/catalog/jeep/600000309654b0.webp'),
(17,7,'Wrangler 4','1993-01-01','2025-01-01','jeep','/catalog/jeep/H9daff851ac3d4698b184bcbadaddf3f1Y.webp'),
(18,7,'Wrangler 5','1993-01-01','2025-01-01','jeep','/catalog/jeep/Jeep-Wrangler-Rubicon-Recon-1a.jpg'),
(19,3,'3','2003-01-01','2018-01-01','sedan','/catalog/sedan/87d79442ac5f11e993dfbcee7be013be_87d79443ac5f11e993dfbcee7be013be-800x800-1.jpg'),
(20,3,'6','2003-01-01','2018-01-01','sedan','/catalog/sedan/7955_zolta_mazda_6.jpg'),
(21,9,'Lancer Evolution','2008-01-01','2025-01-01','sedan','/catalog/sedan/366954-legkovy-avto-20.jpg'),
(22,10,'TT','1998-01-01','2025-01-01','sedan','/catalog/sedan/1614569147_17-p-avtomobil-na-belom-fone-19.png'),
(23,11,'XE','2014-01-01','2025-01-01','sedan','/catalog/sedan/1639493609_18-hdpic-club-p-avtomobil-bez-fona-18.png'),
(24,3,'3 (2)','2003-01-01','2018-01-01','sedan','/catalog/sedan/2859846729.png'),
(28,12,'Cruze','2003-01-01','2018-01-01','sedan','/catalog/sedan/chevroletcarschevroletchevyautomobile.png.webp'),
(29,3,'6 (2)','2003-01-01','2018-01-01','sedan','/catalog/sedan/stekla-far-mazda-6-gg-2003-2004-2005-2006-2007-2008.jpg');

/*Table structure for table `car_services` */

DROP TABLE IF EXISTS `car_services`;

CREATE TABLE `car_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `duration_hours` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `car_services_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `car_services` */

insert  into `car_services`(`id`,`model_id`,`service_name`,`cost`,`duration_hours`) values 
(1,11,'замена тормозных колодок передних',500.00,0.50),
(2,15,'замена дисков',2000.00,0.50),
(3,21,'работа 3',10000.00,20.00),
(4,23,'работа 4',50000.00,40.00),
(5,2,'работа 5',6000.00,10.00);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
