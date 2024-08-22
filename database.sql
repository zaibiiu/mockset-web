-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: botble
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'LdLx4pgFIAdYFEicvYLesesvLDHtYZya',1,'2024-07-27 06:10:13','2024-07-27 06:10:13','2024-07-27 06:10:13');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blocks_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'Alisha Schulist','alisha-schulist','Ea esse architecto soluta dolorem.','Occaecati voluptatem minima officia doloribus rerum cupiditate atque ea. Unde dolorem aut id illo officiis quo incidunt. Eligendi voluptatem sit dolor. Et qui consequatur maiores officiis. Quibusdam necessitatibus atque dolorum dolor commodi quaerat eos. Tenetur quo accusamus et alias. Eum quasi cumque necessitatibus aliquam non sed. Unde porro ratione occaecati et dicta. Sint unde vitae quod cupiditate. Et quod aspernatur dolor voluptas. Veniam corporis quas cumque omnis repudiandae minus.','published',NULL,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(2,'Wilhelm Nitzsche','wilhelm-nitzsche','Modi nihil aut est vel fuga.','Laborum molestiae modi saepe explicabo repudiandae quam. Dolorum ad ratione distinctio velit. Quia voluptas beatae sint. Amet doloremque rem nihil dolor ea facilis. Sequi provident quas cupiditate ullam illum. Minima esse quae itaque qui sint. Hic doloremque assumenda sit. Suscipit cupiditate tempore assumenda non alias. Ipsa ut odit occaecati consequatur voluptas est laboriosam. Velit soluta voluptatum excepturi impedit earum unde.','published',NULL,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(3,'Prof. Mariela Macejkovic','prof-mariela-macejkovic','Dolorem porro nihil eligendi.','Dolore laboriosam veniam rerum hic non maxime. Autem consequatur numquam quis illo molestias qui eveniet dignissimos. Hic veniam dicta voluptates. Nam sunt nesciunt nam. Facilis architecto rerum natus. Unde et tempora et eaque repellat. Sint alias laboriosam consequatur ut eum. Doloribus accusantium repellendus quia quaerat in. Reprehenderit facere distinctio facilis eum delectus laboriosam quaerat. Quo fugiat cupiditate vitae omnis labore.','published',NULL,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(4,'Cara Kertzmann','cara-kertzmann','Dolor asperiores exercitationem sint veniam.','Adipisci asperiores debitis aperiam sit a veniam sint cum. Voluptatem assumenda dignissimos ea natus sit molestiae. Et ex unde error ab autem. Molestiae corrupti aliquam et ut corrupti iure. Reprehenderit quia tempore praesentium. Est assumenda est omnis et et. Similique enim perferendis ut illum rerum voluptate quas. Hic praesentium omnis tempora et quo quo saepe. Magni ratione et non commodi. Tenetur porro aperiam sed vitae enim sed. Ad provident ut est.','published',NULL,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(5,'Judah Hodkiewicz','judah-hodkiewicz','Officiis quo et sit harum eum possimus debitis.','Sit rerum iure vel vel et quia ex ratione. Sed tenetur est quae. A et nemo voluptatibus accusantium quia quisquam reprehenderit. Et quis et reiciendis debitis iste. Sint fugiat et earum. Officiis quia optio adipisci eligendi. Earum praesentium quia id deleniti ut tempora possimus. Reprehenderit qui non architecto.','published',NULL,'2024-07-27 06:10:19','2024-07-27 06:10:19');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks_translations`
--

DROP TABLE IF EXISTS `blocks_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocks_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`blocks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks_translations`
--

LOCK TABLES `blocks_translations` WRITE;
/*!40000 ALTER TABLE `blocks_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Artificial Intelligence',0,'Alias qui impedit nihil soluta distinctio. Tempora in soluta suscipit. Ab deleniti dolores ducimus quas hic mollitia ipsa perferendis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-07-27 06:10:14','2024-07-27 06:10:14'),(2,'Cybersecurity',0,'Assumenda et voluptatem blanditiis. Nisi accusantium aut et eius doloremque. Facere perferendis qui consectetur fugit. Dolor fuga est error perferendis sequi dolores.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(3,'Blockchain Technology',0,'Rerum vel culpa nam. Atque praesentium animi quaerat non assumenda delectus odio qui. Ut in ea dolor aliquid excepturi odit qui. Consequuntur et explicabo explicabo illo omnis ab.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(4,'5G and Connectivity',0,'Ducimus officiis voluptatibus rem hic. Laudantium cumque debitis ut rerum autem sint. Quidem sequi aut accusamus est et. Commodi accusamus harum doloremque nihil et odit.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(5,'Augmented Reality (AR)',0,'Et sunt necessitatibus iure rerum aut aut iste commodi. Vero sed unde dicta hic qui dolorem. Laudantium omnis explicabo repellat architecto itaque.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(6,'Green Technology',0,'Et est magnam deleniti harum repudiandae. Delectus deleniti iste molestiae est. Tenetur molestiae laborum et sit porro molestiae.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(7,'Quantum Computing',0,'Est sapiente aperiam iusto porro enim exercitationem. Et cumque debitis nisi laudantium vel dolor. Voluptatum beatae porro minus amet qui quia.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(8,'Edge Computing',0,'Et voluptas voluptate est necessitatibus eveniet dignissimos. Tempora qui maiores aperiam nulla. Porro mollitia dicta officia aut tempore. Est ratione repellendus quo. Aperiam quidem in eaque.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-07-27 06:10:15','2024-07-27 06:10:15');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Prof. Lora Carter PhD','klein.akeem@example.com','934.830.3082','197 Kayla Points Apt. 064\nPort Mafalda, GA 96526','Et error quos voluptatem quam perspiciatis ullam.','Consequatur ut beatae nemo accusamus enim omnis voluptatem minima. Culpa quia hic sed error quae vel vel. Reprehenderit non et quas eveniet illum accusamus. Dicta distinctio voluptatem voluptas. Quia sed sint optio vitae ratione aut nobis. Id corrupti animi et tenetur aspernatur. Aliquam iusto ad dolore aut qui ipsa quibusdam. Aut voluptatem vitae non officia beatae nulla. Ipsum exercitationem amet et eos numquam eaque sunt rerum.',NULL,'read','2024-07-27 06:10:19','2024-07-27 06:10:19'),(2,'Ubaldo Kozey DDS','mante.william@example.com','608.512.1326','678 Jamel Curve Suite 478\nPort Dane, ME 48219','Voluptas animi quod non hic saepe pariatur rem.','Vero est possimus quo non. Esse est tempore adipisci corporis aut sunt ut incidunt. Ut repudiandae rerum labore voluptas et est a. Hic nam vero similique temporibus. Fugiat illum ipsa molestias ad. Ea recusandae at temporibus id quia. At reiciendis ipsa sed. Qui aspernatur voluptatum sed repellendus. Distinctio ex sit ipsam deleniti suscipit cum. Recusandae cumque et itaque.',NULL,'unread','2024-07-27 06:10:19','2024-07-27 06:10:19'),(3,'Mrs. Judy Cruickshank','uthompson@example.org','+1 (617) 485-6480','568 Quigley Squares Apt. 446\nStromanfort, AK 94659-5680','Fugit ad fugiat dolor aut.','Quae omnis soluta magnam atque. Error nesciunt est itaque vel eos vitae. Doloremque deserunt veritatis officiis placeat. Ea dicta magni aut qui distinctio. Vitae officia esse consequatur blanditiis vel saepe aut. Laboriosam asperiores pariatur corporis ut. In in blanditiis tempore vel voluptas. Consequatur odit veniam voluptatem voluptatem sed. Vitae ab hic odio deleniti unde ex totam. Dicta modi consequuntur rerum nesciunt similique. Qui ut mollitia ut aliquam consequatur voluptatibus.',NULL,'unread','2024-07-27 06:10:19','2024-07-27 06:10:19'),(4,'Dr. Bell Frami MD','keeling.marcos@example.org','352.587.1417','5064 Clint Station Apt. 264\nEast Onie, NC 20368','Vel rerum voluptas sed quisquam.','Ab autem in possimus tempora. Quas dolorem magni qui voluptatem enim. Vitae ipsam laborum non temporibus alias vel est. Quis excepturi tempore pariatur nam vel. Suscipit perspiciatis et pariatur voluptatem rem et. Reiciendis omnis labore repellat hic sit voluptatibus earum. Totam aut beatae perferendis assumenda recusandae sint. Sed aut et reprehenderit qui. Quo libero aut sit labore. Cupiditate magni aperiam voluptatem quo deserunt tempore voluptatem eos.',NULL,'unread','2024-07-27 06:10:19','2024-07-27 06:10:19'),(5,'Mrs. Callie Lynch','senger.ludwig@example.com','678-328-7031','8375 Reichel Garden\nThielchester, MA 62694-9867','Sed voluptatem rerum ad perspiciatis.','Quae tempore repellendus est itaque quidem. Earum ipsa fugit quod deserunt. Magni temporibus eum et quo sit autem eos. Sit qui optio distinctio. Ipsam temporibus nemo quos qui. Possimus veritatis deleniti voluptas soluta. Omnis enim quaerat praesentium. Fugit quibusdam explicabo quo aliquid voluptatem. Qui voluptate optio rem nobis. Illo voluptates et quis enim et sequi.',NULL,'read','2024-07-27 06:10:19','2024-07-27 06:10:19'),(6,'Alyson Johnson DVM','fkshlerin@example.com','+1.872.466.3533','964 Lemke Heights\nWest Peggie, IN 00054','Autem architecto consequatur architecto suscipit.','Nam omnis ullam nihil aut consequatur aliquam aut consequatur. Animi et earum dolore ullam et culpa hic. Deserunt corporis officiis quisquam. Earum officiis sint fuga assumenda. Itaque at consequatur nesciunt ut. Eius autem magnam cumque error aut quod. Tempore occaecati aut praesentium dolore provident harum. Voluptatem doloribus quae modi esse. Veritatis error quibusdam odio sit quos aut. Optio exercitationem non assumenda quia ratione molestias.',NULL,'unread','2024-07-27 06:10:19','2024-07-27 06:10:19'),(7,'Ms. Talia Parisian I','kub.arlene@example.net','325-204-8557','919 Trey Cliffs\nPort Dock, WA 33785','Nam quo est veritatis cum explicabo.','Laudantium suscipit consequuntur cum. Dolores sapiente officia velit similique tenetur quisquam repellendus. Velit minus quo eos est maiores recusandae. Voluptatem et modi laudantium dolores ut ratione aperiam. Repellendus porro sed id rem perspiciatis. Quod quia architecto cupiditate eveniet. Distinctio rem est delectus eum eum dicta. Dolores qui non sit voluptatum nostrum. Voluptas velit optio in quia at eius. Distinctio quia et dolorum labore. Ab in aut iusto minima et hic laudantium in.',NULL,'read','2024-07-27 06:10:19','2024-07-27 06:10:19'),(8,'Soledad Eichmann','ppurdy@example.org','+1 (984) 865-2874','895 McDermott Way Apt. 602\nSunnyburgh, MA 12993-6619','Recusandae libero quo dolorem dolorem.','Ut numquam maxime dolorum consequatur nobis neque non in. Quibusdam non sunt totam dolores. Rem voluptas sint quod modi cupiditate ratione modi. Nam quas omnis quasi ea deserunt voluptates. Incidunt et dolore beatae animi et iste. Aut quasi tempore ducimus at aut rem. Rerum voluptas omnis dolores repudiandae aut. Expedita incidunt qui minus fugiat quia est. Vero excepturi ratione sit. Quos earum optio repellendus tenetur ea nostrum blanditiis.',NULL,'read','2024-07-27 06:10:19','2024-07-27 06:10:19'),(9,'Elvie Russel','lgutmann@example.org','+1.469.821.3092','6330 Alessandra Via\nRippinburgh, VT 08562','Nihil recusandae sint nobis.','Ipsa consequuntur dicta architecto provident dignissimos ut iste. At voluptatibus fugiat adipisci officiis voluptatum. Expedita ipsam possimus non quia nihil consequuntur et quia. Nemo et vel rerum laudantium aspernatur voluptatum. Adipisci facilis doloribus esse consectetur impedit. Culpa exercitationem iste quae aut maxime ut aut. Et omnis et consectetur esse. Voluptas perspiciatis quo et quis eaque.',NULL,'read','2024-07-27 06:10:19','2024-07-27 06:10:19'),(10,'Remington Lynch','zcarroll@example.org','863.466.5327','86221 Mann Port\nMoisesmouth, OK 70846-8273','Dicta sit nemo placeat.','Perspiciatis omnis perspiciatis voluptatem aliquam asperiores a. Quos id id temporibus voluptatum distinctio. Sit maiores impedit omnis culpa et quidem eos. Ab necessitatibus in repudiandae deleniti quo. Officia praesentium illum placeat est. Rerum natus est et voluptatem. Eum repellendus omnis modi similique provident et soluta. Non atque aut sint amet et autem consequatur. Voluptas animi totam praesentium saepe natus cum.',NULL,'read','2024-07-27 06:10:19','2024-07-27 06:10:19');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `use_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_for_id` bigint unsigned NOT NULL,
  `field_item_id` bigint unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_fields_field_item_id_index` (`field_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_translations`
--

DROP TABLE IF EXISTS `custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_translations`
--

LOCK TABLES `custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_groups`
--

DROP TABLE IF EXISTS `field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_groups_created_by_index` (`created_by`),
  KEY `field_groups_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_groups`
--

LOCK TABLES `field_groups` WRITE;
/*!40000 ALTER TABLE `field_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_items`
--

DROP TABLE IF EXISTS `field_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `field_group_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `order` int DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `field_items_field_group_id_index` (`field_group_id`),
  KEY `field_items_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_items`
--

LOCK TABLES `field_items` WRITE;
/*!40000 ALTER TABLE `field_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Sunset','Eos dolores architecto quo commodi rerum vel sapiente. Fugit facilis praesentium perferendis est neque eius. Et autem dolor recusandae nam possimus.',1,0,'news/6.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(2,'Ocean Views','Perspiciatis adipisci cupiditate qui aut in eligendi eum ut. Pariatur quisquam ex nostrum quae necessitatibus.',1,0,'news/7.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(3,'Adventure Time','Atque nesciunt qui nihil nostrum. Error atque ea enim ea et. Accusantium ut similique animi quia.',1,0,'news/8.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(4,'City Lights','Praesentium quia quia dolorum praesentium quia omnis eum. Voluptate voluptas aliquid fugit voluptas.',1,0,'news/9.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(5,'Dreamscape','Qui est voluptas error. Sit sit hic vero vitae quia rerum molestias. Quibusdam delectus nesciunt temporibus. Debitis suscipit veritatis fuga error.',1,0,'news/10.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(6,'Enchanted Forest','Doloribus cupiditate voluptatem aut suscipit debitis. Qui quis laudantium id non nulla dolore. Consequuntur facilis explicabo qui cupiditate.',1,0,'news/11.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(7,'Golden Hour','Animi nesciunt saepe consequuntur est quia quidem. Nobis repudiandae et recusandae sed. Ut et occaecati harum cupiditate ipsam impedit et aut.',0,0,'news/12.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(8,'Serenity','Repudiandae dolorem doloremque dignissimos. Explicabo reprehenderit et quasi id voluptas. Maxime error officia eos quam voluptas rerum nisi.',0,0,'news/13.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(9,'Eternal Beauty','Nam nulla velit similique. Voluptatem incidunt iure porro. Porro reiciendis reprehenderit debitis. Error cupiditate voluptatem et sit asperiores.',0,0,'news/14.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(10,'Moonlight Magic','Quae ratione voluptas ut id laborum. Deleniti dolor odit sunt voluptatem. Ducimus beatae eaque accusamus.',0,0,'news/15.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(11,'Starry Night','Quasi et optio ad maiores ut voluptatum quia. Eos molestiae esse doloremque est autem. Occaecati sint quia quas error.',0,0,'news/16.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(12,'Hidden Gems','Nemo impedit veritatis sunt exercitationem quia quo magni quibusdam. Voluptas praesentium distinctio est consequuntur odio ut facilis.',0,0,'news/17.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(13,'Tranquil Waters','Animi eum facere praesentium qui non suscipit est. Omnis voluptas corrupti voluptatem molestiae.',0,0,'news/18.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(14,'Urban Escape','Doloribus est explicabo impedit. Veniam sunt voluptas quaerat impedit molestiae. Sint magni ut cumque aspernatur et tempore non.',0,0,'news/19.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(15,'Twilight Zone','Voluptatem ut ut laboriosam praesentium. Ipsam eaque earum eos laboriosam et repellat.',0,0,'news/20.jpg',1,'published','2024-07-27 06:10:15','2024-07-27 06:10:15');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(2,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(3,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(4,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(5,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(6,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(7,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',7,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(8,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',8,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(9,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',9,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(10,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',10,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(11,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',11,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(12,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',12,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(13,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',13,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(14,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',14,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15'),(15,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Fugiat fugiat laboriosam optio ad adipisci eum. Exercitationem quasi ratione sed nihil quia doloremque aliquam. Est explicabo hic dolor eos est.\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Libero quo quasi maxime perferendis. Exercitationem est qui nemo dolores tempora itaque.\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Quia voluptas velit provident velit perferendis. Molestiae sunt architecto fugit fuga et. Sunt aut rerum perspiciatis rerum.\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Sunt omnis aliquam et architecto ab vel. Officiis qui error quasi qui id asperiores cumque aliquam.\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Natus libero voluptas dicta provident. Non vel atque vero qui ut. Assumenda laudantium ut hic quia. Nulla est suscipit omnis.\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Eum dolorum et minima iste odio odio voluptatem. Error optio quibusdam non aut. Et eum dolor eaque sit.\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Eum dolor nobis adipisci nisi. Enim suscipit corporis quisquam. Et quis totam veritatis harum.\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Veniam aut odio libero omnis nesciunt ut. Quis aut nam dolores dolorem dolores aut aut. Aut recusandae quia ratione eos eius.\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Temporibus pariatur vel nulla voluptatem iste. Quaerat enim suscipit rem nihil iusto nisi et.\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Quidem nihil dolore repellendus explicabo sit. Delectus fugit rerum dolore non voluptatem.\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Rerum aspernatur distinctio sunt incidunt inventore molestiae. Sapiente similique non est cupiditate.\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Aut omnis est animi voluptas nobis. Dolore non aliquam ea voluptatem reiciendis.\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Officiis et non omnis. Quibusdam molestiae minima enim. Adipisci corrupti perferendis quis iure error. Laudantium in eos quam accusantium.\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Explicabo laudantium ut et id nulla. Voluptas omnis et velit laudantium sunt.\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Qui totam iure ratione est ipsum non voluptate porro. Atque illum quos doloribus voluptates. Consequatur eos vel corrupti aliquam.\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Adipisci et voluptatibus fuga neque. Cum et dicta fugiat necessitatibus. Dolorem et harum ut vel perspiciatis minus provident vitae.\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Quisquam et sapiente quo. Magni fuga qui corrupti adipisci maxime occaecati dolores. Occaecati laborum nesciunt aut qui cupiditate id.\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Nam omnis qui porro alias nihil quidem aliquid. Aut sint aliquid excepturi atque dolor et dolorem. Sed ut consequatur quia error.\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Non at eius laborum ducimus aliquam. In voluptatem facere dolor voluptatem.\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Ut dolore et earum facilis unde tempore. Consequatur libero est consequatur cumque ut est excepturi.\"}]',15,'Botble\\Gallery\\Models\\Gallery','2024-07-27 06:10:15','2024-07-27 06:10:15');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','3a4d727e3946e55682d1c519bc536640',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','40ebcfa65d8d4ec6f5ac55b0620aa72f',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','e6ec6520e4e6242c1b19ad8d383df915',2,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',9803,'news/1.jpg','[]','2024-07-27 06:10:13','2024-07-27 06:10:13',NULL,'public'),(2,0,'10','10',1,'image/jpeg',9803,'news/10.jpg','[]','2024-07-27 06:10:13','2024-07-27 06:10:13',NULL,'public'),(3,0,'11','11',1,'image/jpeg',9803,'news/11.jpg','[]','2024-07-27 06:10:13','2024-07-27 06:10:13',NULL,'public'),(4,0,'12','12',1,'image/jpeg',9803,'news/12.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(5,0,'13','13',1,'image/jpeg',9803,'news/13.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(6,0,'14','14',1,'image/jpeg',9803,'news/14.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(7,0,'15','15',1,'image/jpeg',9803,'news/15.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(8,0,'16','16',1,'image/jpeg',9803,'news/16.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(9,0,'17','17',1,'image/jpeg',9803,'news/17.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(10,0,'18','18',1,'image/jpeg',9803,'news/18.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(11,0,'19','19',1,'image/jpeg',9803,'news/19.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(12,0,'2','2',1,'image/jpeg',9803,'news/2.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(13,0,'20','20',1,'image/jpeg',9803,'news/20.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(14,0,'3','3',1,'image/jpeg',9803,'news/3.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(15,0,'4','4',1,'image/jpeg',9803,'news/4.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(16,0,'5','5',1,'image/jpeg',9803,'news/5.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(17,0,'6','6',1,'image/jpeg',9803,'news/6.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(18,0,'7','7',1,'image/jpeg',9803,'news/7.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(19,0,'8','8',1,'image/jpeg',9803,'news/8.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(20,0,'9','9',1,'image/jpeg',9803,'news/9.jpg','[]','2024-07-27 06:10:14','2024-07-27 06:10:14',NULL,'public'),(21,0,'1','1',2,'image/jpeg',9803,'members/1.jpg','[]','2024-07-27 06:10:15','2024-07-27 06:10:15',NULL,'public'),(22,0,'10','10',2,'image/jpeg',9803,'members/10.jpg','[]','2024-07-27 06:10:15','2024-07-27 06:10:15',NULL,'public'),(23,0,'11','11',2,'image/png',9803,'members/11.png','[]','2024-07-27 06:10:15','2024-07-27 06:10:15',NULL,'public'),(24,0,'2','2',2,'image/jpeg',9803,'members/2.jpg','[]','2024-07-27 06:10:15','2024-07-27 06:10:15',NULL,'public'),(25,0,'3','3',2,'image/jpeg',9803,'members/3.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(26,0,'4','4',2,'image/jpeg',9803,'members/4.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(27,0,'5','5',2,'image/jpeg',9803,'members/5.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(28,0,'6','6',2,'image/jpeg',9803,'members/6.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(29,0,'7','7',2,'image/jpeg',9803,'members/7.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(30,0,'8','8',2,'image/jpeg',9803,'members/8.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(31,0,'9','9',2,'image/jpeg',9803,'members/9.jpg','[]','2024-07-27 06:10:16','2024-07-27 06:10:16',NULL,'public'),(32,0,'favicon','favicon',3,'image/png',1122,'general/favicon.png','[]','2024-07-27 06:10:19','2024-07-27 06:10:19',NULL,'public'),(33,0,'logo','logo',3,'image/png',55286,'general/logo.png','[]','2024-07-27 06:10:19','2024-07-27 06:10:19',NULL,'public'),(34,0,'preloader','preloader',3,'image/gif',189758,'general/preloader.gif','[]','2024-07-27 06:10:19','2024-07-27 06:10:19',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2024-07-27 06:10:13','2024-07-27 06:10:13',NULL),(2,0,'members',NULL,'members',0,'2024-07-27 06:10:15','2024-07-27 06:10:15',NULL),(3,0,'general',NULL,'general',0,'2024-07-27 06:10:19','2024-07-27 06:10:19',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_activity_logs`
--

DROP TABLE IF EXISTS `member_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_activity_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_activity_logs`
--

LOCK TABLES `member_activity_logs` WRITE;
/*!40000 ALTER TABLE `member_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_password_resets`
--

DROP TABLE IF EXISTS `member_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `member_password_resets_email_index` (`email`),
  KEY `member_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_password_resets`
--

LOCK TABLES `member_password_resets` WRITE;
/*!40000 ALTER TABLE `member_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Spencer','Prosacco',NULL,NULL,'member@gmail.com','$2y$12$tCzO9KcYg4ME1pTrF5lZiuw.7FlaDKeIkNt2zgMHskVE3CtWIj9Z.',21,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(2,'Nestor','Botsford',NULL,NULL,'rmetz@gmail.com','$2y$12$UxAwmwnUX.gVDYSxMXQiHOGF5hu2sjZPOT8cgSG09ste3Tzo4K.C.',22,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(3,'Mercedes','Harber',NULL,NULL,'rowe.juston@yahoo.com','$2y$12$dw5iZF0lPHoA4ShLV56qmOLragKVIhfCAb4LqtHYX/L.WM3uc0gGi',23,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(4,'Wilfredo','Hansen',NULL,NULL,'zgrady@gmail.com','$2y$12$kwrB0GhPstdcvZ1yIMuCe.AN3QD9mJn63t9J7vhRBuzSGwCMKqveO',24,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(5,'Amalia','Upton',NULL,NULL,'kulas.faustino@schroeder.com','$2y$12$/cYTSqFJQiVxDrG5Nc5uS.YH1rbPrXQcnRmPh2AiNiOjf97AsWu8i',25,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(6,'Shaniya','McCullough',NULL,NULL,'fschuster@herzog.com','$2y$12$qOsRLgx/m6cZKeB4MSDJ0esy64MQU1q0vijWrJis87H7EvkGXWMTO',26,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(7,'Fredy','Gislason',NULL,NULL,'wilkinson.rebecca@hotmail.com','$2y$12$iL4tKksgt8iw7vFpwHds9uC62qIPwczXdMLz2chEsdxyV6y9OpTA6',27,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(8,'Ayla','Carroll',NULL,NULL,'nelle20@cronin.com','$2y$12$hvaoOCcAB/Iuv1Ogf1jBqeWA0Ry6tqFym6Hqd454ggnPnvYGEOibC',28,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(9,'Alexandro','Marquardt',NULL,NULL,'jazlyn.breitenberg@gmail.com','$2y$12$ru3/ITARBzhn3JYTgVHbF.C6RxOUpGAKCpNJa/8L8IR3zdeJd.jCu',29,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(10,'Granville','Effertz',NULL,NULL,'sipes.orland@swaniawski.net','$2y$12$lE6qPwx0EabXL3..hoj0GOkrn1yPy7AMkdJbUANvF0LBeT/1YXIxm',30,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published'),(11,'John','Smith',NULL,NULL,'john.smith@botble.com','$2y$12$kcagqUtuQNVRR3AUT99hdu646xlMH..t8UQHpV24bYzHo4lnJyTpG',31,NULL,NULL,'2024-07-27 13:10:16',NULL,NULL,'2024-07-27 06:10:16','2024-07-27 06:10:16','published');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-07-27 06:10:19','2024-07-27 06:10:19');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(2,1,0,NULL,NULL,'https://botble.com/go/download-cms',NULL,0,'Purchase',NULL,'_blank',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(3,1,0,2,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(4,1,0,5,'Botble\\Page\\Models\\Page','/galleries',NULL,0,'Galleries',NULL,'_self',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(5,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(6,2,0,NULL,NULL,'https://facebook.com','ti ti-brand-facebook',1,'Facebook',NULL,'_blank',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(7,2,0,NULL,NULL,'https://twitter.com','ti ti-brand-x',1,'Twitter',NULL,'_blank',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(8,2,0,NULL,NULL,'https://github.com','ti ti-brand-github',1,'GitHub',NULL,'_blank',0,'2024-07-27 06:10:19','2024-07-27 06:10:19'),(9,2,0,NULL,NULL,'https://linkedin.com','ti ti-brand-linkedin',1,'Linkedin',NULL,'_blank',0,'2024-07-27 06:10:19','2024-07-27 06:10:19');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-07-27 06:10:19','2024-07-27 06:10:19'),(2,'Social','social','published','2024-07-27 06:10:19','2024-07-27 06:10:19');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(27,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(28,'2023_08_21_090810_make_page_content_nullable',1),(29,'2023_09_14_021936_update_index_for_slugs_table',1),(30,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(31,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(32,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(33,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(34,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(35,'2024_07_12_100000_change_random_hash_for_media',1),(36,'2024_04_27_100730_improve_analytics_setting',2),(37,'2015_06_29_025744_create_audit_history',3),(38,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(39,'2017_02_13_034601_create_blocks_table',4),(40,'2021_12_03_081327_create_blocks_translations',4),(41,'2015_06_18_033822_create_blog_table',5),(42,'2021_02_16_092633_remove_default_value_for_author_type',5),(43,'2021_12_03_030600_create_blog_translations',5),(44,'2022_04_19_113923_add_index_to_table_posts',5),(45,'2023_08_29_074620_make_column_author_id_nullable',5),(46,'2016_06_17_091537_create_contacts_table',6),(47,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(48,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(49,'2024_03_25_000001_update_captcha_settings_for_contact',6),(50,'2024_04_19_063914_create_custom_fields_table',6),(51,'2017_03_27_150646_re_create_custom_field_tables',7),(52,'2022_04_30_030807_table_custom_fields_translation_table',7),(53,'2016_10_13_150201_create_galleries_table',8),(54,'2021_12_03_082953_create_gallery_translations',8),(55,'2022_04_30_034048_create_gallery_meta_translations_table',8),(56,'2023_08_29_075308_make_column_user_id_nullable',8),(57,'2016_10_03_032336_create_languages_table',9),(58,'2023_09_14_022423_add_index_for_language_table',9),(59,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(60,'2021_12_03_075608_create_page_translations',10),(61,'2023_07_06_011444_create_slug_translations_table',10),(62,'2017_10_04_140938_create_member_table',11),(63,'2023_10_16_075332_add_status_column',11),(64,'2024_03_25_000001_update_captcha_settings',11),(65,'2016_05_28_112028_create_system_request_logs_table',12),(66,'2016_10_07_193005_create_translations_table',13),(67,'2023_12_12_105220_drop_translations_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[featured-posts][/featured-posts]</div><div>[recent-posts title=\"What\'s new?\"][/recent-posts]</div><div>[featured-categories-posts title=\"Best for you\" category_id=\"\" enable_lazy_loading=\"yes\"][/featured-categories-posts]</div><div>[all-galleries limit=\"8\" title=\"Galleries\" enable_lazy_loading=\"yes\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2024-07-27 06:10:13','2024-07-27 06:10:13'),(2,'Blog','---',1,NULL,NULL,NULL,'published','2024-07-27 06:10:13','2024-07-27 06:10:13'),(3,'Contact','<p>Address: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Hotline: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>For the fastest reply, please use the contact form below.</p><p>[contact-form][/contact-form]</p>',1,NULL,NULL,NULL,'published','2024-07-27 06:10:13','2024-07-27 06:10:13'),(4,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,NULL,NULL,'published','2024-07-27 06:10:13','2024-07-27 06:10:13'),(5,'Galleries','<div>[gallery title=\"Galleries\" enable_lazy_loading=\"yes\"][/gallery]</div>',1,NULL,NULL,NULL,'published','2024-07-27 06:10:13','2024-07-27 06:10:13');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (7,1),(6,1),(6,2),(7,2),(8,3),(7,3),(6,4),(7,5),(3,5),(5,6),(8,6),(2,7),(7,7),(1,8),(4,8),(6,9),(4,9),(8,10),(6,10),(1,11),(7,11),(7,12),(2,12),(7,13),(6,13),(2,14),(3,14),(2,15),(5,15),(3,16),(2,16),(1,17),(4,17),(6,18),(7,19),(8,19),(6,20),(3,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (4,1),(7,1),(6,2),(8,2),(7,2),(4,3),(2,3),(3,3),(3,4),(1,5),(8,5),(6,5),(7,6),(5,6),(1,6),(5,7),(7,7),(8,7),(1,8),(6,8),(2,8),(7,9),(1,9),(8,9),(4,10),(1,10),(3,10),(7,11),(1,11),(8,12),(7,12),(6,12),(8,13),(7,13),(2,13),(5,14),(4,14),(6,15),(5,15),(3,16),(5,16),(7,16),(4,17),(2,17),(8,17),(1,18),(5,18),(8,18),(5,19),(4,19),(8,19),(2,20),(7,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Breakthrough in Quantum Computing: Computing Power Reaches Milestone','Researchers achieve a significant milestone in quantum computing, unlocking unprecedented computing power that has the potential to revolutionize various industries.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice felt a little bit of mushroom, and her eyes filled with cupboards and book-shelves; here and there they are!\' said the last few minutes to see the Hatter went on, very much to-night, I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said Alice, \'a great girl like you,\' (she might well say this), \'to go on with the birds hurried off at once, in a hoarse, feeble voice: \'I heard every word you fellows were saying.\' \'Tell us a story!\' said the Mock Turtle in a wondering tone. \'Why, what a wonderful dream it had struck her foot! She was looking for the accident of the house down!\' said the King. \'I can\'t help it,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she opened the door of the water, and seemed to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Mock Turtle went on. Her listeners were perfectly quiet till she heard her voice sounded hoarse and strange, and the baby violently.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Tortoise--\' \'Why did they draw the treacle from?\' \'You can draw water out of the goldfish kept running in her French lesson-book. The Mouse only shook its head to keep herself from being run over; and the little golden key and hurried off at once, while all the jurors had a pencil that squeaked. This of course, Alice could hardly hear the very middle of her head made her look up in her pocket, and pulled out a history of the jurors had a door leading right into a doze; but, on being pinched by.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice led the way, and nothing seems to suit them!\' \'I haven\'t the slightest idea,\' said the King. \'It began with the birds hurried off to the door, she walked up towards it rather timidly, saying to her lips. \'I know what to do, and in another moment it was certainly too much pepper in my time, but never ONE with such a thing as a boon, Was kindly permitted to pocket the spoon: While the Duchess sang the second verse of the day; and this was the fan and the words all coming different, and then nodded. \'It\'s no business there, at any rate,\' said Alice: \'allow me to him: She gave me a pair of the conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I mean what I should say what you would seem to see if there are, nobody attends to them--and you\'ve no idea what to uglify is, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, and then another confusion of voices--\'Hold up his.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I shall have to whisper a hint to Time, and round Alice, every now and then turned to the end: then stop.\' These were the two creatures got so much surprised, that for the moment they saw the White Rabbit, \'and that\'s the queerest thing about it.\' (The jury all brightened up again.) \'Please your Majesty,\' said the Gryphon, and the King and the words \'DRINK ME,\' but nevertheless she uncorked it and put it more clearly,\' Alice replied eagerly, for she was near enough to look at the proposal. \'Then the Dormouse said--\' the Hatter continued, \'in this way:-- \"Up above the world you fly, Like a tea-tray in the air. \'--as far out to sea. So they got their tails fast in their paws. \'And how did you manage to do that,\' said the Mock Turtle in the last concert!\' on which the cook and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took no notice of her voice, and the fall NEVER come to the confused clamour of the leaves: \'I should like.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1505,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(2,'5G Rollout Accelerates: Next-Gen Connectivity Transforms Communication','The global rollout of 5G technology gains momentum, promising faster and more reliable connectivity, paving the way for innovations in communication and IoT.','<p>Puss,\' she began, in rather a hard word, I will just explain to you how it was certainly English. \'I don\'t like them raw.\' \'Well, be off, and that if you hold it too long; and that you weren\'t to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' cried Alice hastily, afraid that it was only a pack of cards: the Knave \'Turn them over!\' The Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said in an offended tone. And she opened it, and kept doubling itself up and walking off to the little thing howled so, that he had a head could be NO mistake about it: it was addressed to the door, she walked on in a bit.\' \'Perhaps it doesn\'t matter a bit,\' she thought to herself, as she spoke; \'either you or your head must be a lesson to you to set about it; and as the Rabbit, and had no pictures or conversations in it, \'and what is the use of a tree. By the use of repeating all that stuff,\' the Mock Turtle, \'they--you\'ve seen them, of course?\'.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, a little now and then; such as, \'Sure, I don\'t like it, yer honour, at all, at all!\' \'Do as I was thinking I should frighten them out of the what?\' said the Mock Turtle, and said anxiously to herself, \'if one only knew how to get in?\' \'There might be hungry, in which the words came very queer to ME.\' \'You!\' said the Caterpillar. \'Well, I\'ve tried banks, and I\'ve tried hedges,\' the Pigeon went on, \'\"--found it advisable to go down the little golden key, and when she looked at her, and.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Seaography: then Drawling--the Drawling-master was an old woman--but then--always to have been changed for any of them. However, on the top of its mouth, and addressed her in an offended tone, \'was, that the Mouse had changed his mind, and was immediately suppressed by the hedge!\' then silence, and then raised himself upon tiptoe, put his shoes on. \'--and just take his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' She had quite forgotten the Duchess and the three gardeners at it, busily painting them red. Alice thought the poor child, \'for I can\'t see you?\' She was moving them about as curious as it happens; and if the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, sir\' said Alice, as she could, and soon found herself falling down a large caterpillar, that was lying on the trumpet, and then turned to the King, and the shrill voice of the guinea-pigs cheered, and was beating her violently with its eyelids, so he did,\' said.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I beg your pardon!\' cried Alice (she was obliged to write with one of the game, feeling very curious sensation, which puzzled her a good deal on where you want to be?\' it asked. \'Oh, I\'m not myself, you see.\' \'I don\'t know what to do THAT in a very hopeful tone though), \'I won\'t interrupt again. I dare say there may be different,\' said Alice; \'living at the Lizard in head downwards, and the party were placed along the sea-shore--\' \'Two lines!\' cried the Mouse, frowning, but very glad that it might injure the brain; But, now that I\'m doubtful about the twentieth time that day. \'A likely story indeed!\' said the Cat. \'Do you take me for asking! No, it\'ll never do to hold it. As soon as there seemed to be nothing but a pack of cards: the Knave was standing before them, in chains, with a sigh: \'it\'s always tea-time, and we\'ve no time she\'d have everybody executed, all round. (It was this last remark. \'Of course they were\', said the King. \'It began with the tarts, you know--\' \'But, it goes.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1888,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(3,'Tech Giants Collaborate on Open-Source AI Framework','Leading technology companies join forces to develop an open-source artificial intelligence framework, fostering collaboration and accelerating advancements in AI research.','<p>Queen. \'I never thought about it,\' said Alice. \'Come on, then,\' said the Duchess, as she spoke; \'either you or your head must be getting somewhere near the looking-glass. There was exactly one a-piece all round. (It was this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said. \'Fifteenth,\' said the Hatter. \'I deny it!\' said the Queen. \'Well, I can\'t be Mabel, for I know I do!\' said Alice indignantly, and she soon made out the Fish-Footman was gone, and, by the little door into that lovely garden. I think it so yet,\' said the Duchess, \'as pigs have to whisper a hint to Time, and round the hall, but they began solemnly dancing round and look up in her life before, and behind it, it occurred to her lips. \'I know what it meant till now.\' \'If that\'s all you know why it\'s called a whiting?\' \'I never thought about it,\' added the Dormouse. \'Fourteenth of March, I think you\'d better ask HER about it.\' \'She\'s in prison,\' the Queen had never left off writing on his slate with one.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I only wish they COULD! I\'m sure _I_ shan\'t be able! I shall think nothing of the room again, no wonder she felt a little bit of the wood to listen. \'Mary Ann! Mary Ann!\' said the Cat. \'Do you know I\'m mad?\' said Alice. \'Off with her head!\' about once in her pocket) till she shook the house, and wondering whether she ought to have wondered at this, that she had quite forgotten the words.\' So they had at the door with his knuckles. It was so much frightened that she was playing against herself.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>He looked anxiously round, to make out exactly what they WILL do next! As for pulling me out of the house, quite forgetting in the sun. (IF you don\'t know much,\' said Alice; \'I might as well as she did not like to show you! A little bright-eyed terrier, you know, as we were. My notion was that you think you could keep it to half-past one as long as there was no \'One, two, three, and away,\' but they were gardeners, or soldiers, or courtiers, or three pairs of tiny white kid gloves and a Long Tale They were indeed a queer-looking party that assembled on the twelfth?\' Alice went on, yawning and rubbing its eyes, for it was out of the Shark, But, when the Rabbit came up to the other, and growing sometimes taller and sometimes she scolded herself so severely as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course you don\'t!\' the Hatter were having tea at it: a Dormouse was sitting on a bough of a tree in the way YOU manage?\' Alice asked. \'We called him.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen\'s hedgehog just now, only it ran away when it had been, it suddenly appeared again. \'By-the-bye, what became of the guinea-pigs cheered, and was in the sun. (IF you don\'t explain it as to the King, and the King added in a natural way again. \'I should think you\'ll feel it a violent blow underneath her chin: it had been. But her sister on the floor, and a large pool all round the court was a treacle-well.\' \'There\'s no sort of present!\' thought Alice. \'I\'ve tried the effect of lying down with one of the trees under which she concluded that it led into a tidy little room with a soldier on each side, and opened their eyes and mouths so VERY tired of being such a wretched height to be.\' \'It is a long tail, certainly,\' said Alice, who always took a great deal of thought, and it was YOUR table,\' said Alice; \'you needn\'t be so kind,\' Alice replied, so eagerly that the meeting adjourn, for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in about half no time!.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1209,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(4,'SpaceX Launches Mission to Establish First Human Colony on Mars','Elon Musk\'s SpaceX embarks on a historic mission to establish the first human colony on Mars, marking a significant step toward interplanetary exploration.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Queen put on his spectacles. \'Where shall I begin, please your Majesty?\' he asked. \'Begin at the Cat\'s head began fading away the moment he was in March.\' As she said to herself how she would keep, through all her coaxing. Hardly knowing what she was shrinking rapidly; so she set to work nibbling at the Cat\'s head began fading away the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have been that,\' said the Hatter. \'Does YOUR watch tell you his history,\' As they walked off together, Alice heard it say to itself \'Then I\'ll go round a deal faster than it does.\' \'Which would NOT be an old conger-eel, that used to come before that!\' \'Call the first really clever thing the King said, turning to the three gardeners instantly threw themselves flat upon their faces, and the Gryphon added \'Come, let\'s try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all know whether it was.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>THAT\'S a good way off, and she went on, \'and most of \'em do.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\' said the Dodo said, \'EVERYBODY has won, and all must have a trial: For really this morning I\'ve nothing to do: once or twice she had been all the other end of every line: \'Speak roughly to your tea; it\'s getting late.\' So Alice began to repeat it, but her voice close to her, though, as they came nearer, Alice could hardly hear the Rabbit came near her, about four feet high.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I? Ah, THAT\'S the great wonder is, that there\'s any one left alive!\' She was close behind her, listening: so she bore it as well go in at the mushroom (she had kept a piece of evidence we\'ve heard yet,\' said the Caterpillar. Here was another puzzling question; and as Alice could see, when she first saw the Mock Turtle said: \'advance twice, set to work nibbling at the sudden change, but very politely: \'Did you say it.\' \'That\'s nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t believe it,\' said the King had said that day. \'No, no!\' said the one who had meanwhile been examining the roses. \'Off with his nose Trims his belt and his friends shared their never-ending meal, and the poor little thing grunted in reply (it had left off quarrelling with the end of half an hour or so there were TWO little shrieks, and more faintly came, carried on the slate. \'Herald, read the accusation!\' said the Dormouse crossed the court, arm-in-arm with the birds and animals that had made out that.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>THE VOICE OF THE SLUGGARD,\"\' said the Mock Turtle a little timidly: \'but it\'s no use in talking to him,\' said Alice angrily. \'It wasn\'t very civil of you to sit down without being invited,\' said the Hatter said, turning to Alice a good thing!\' she said to one of its little eyes, but it just grazed his nose, you know?\' \'It\'s the Cheshire Cat sitting on the door and went on just as if she could have told you that.\' \'If I\'d been the whiting,\' said Alice, seriously, \'I\'ll have nothing more happened, she decided to remain where she was, and waited. When the sands are all pardoned.\' \'Come, THAT\'S a good deal frightened at the top of its mouth again, and Alice called out \'The Queen! The Queen!\' and the jury wrote it down into its face to see that queer little toss of her head to keep back the wandering hair that WOULD always get into the garden. Then she went on growing, and she put one arm out of the gloves, and was beating her violently with its wings. \'Serpent!\' screamed the Queen. \'I.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1436,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(5,'Cybersecurity Advances: New Protocols Bolster Digital Defense','In response to evolving cyber threats, advancements in cybersecurity protocols enhance digital defense measures, protecting individuals and organizations from online attacks.','<p>Gryphon. \'Turn a somersault in the same thing with you,\' said the Gryphon: and it sat for a good deal until she had made her so savage when they arrived, with a cart-horse, and expecting every moment to be talking in his throat,\' said the King, with an M?\' said Alice. \'Call it what you mean,\' the March Hare. \'Exactly so,\' said the Rabbit\'s voice; and Alice looked all round the hall, but they began solemnly dancing round and look up in spite of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was very nearly in the distance, and she felt that she ran with all speed back to yesterday, because I was a body to cut it off from: that he shook his grey locks, \'I kept all my life, never!\' They had a bone in his confusion he bit a large canvas bag, which tied up at the top of her favourite word \'moral,\' and the baby violently up and down, and was immediately suppressed by the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up and throw us, with the end of.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Just at this moment the King, looking round the thistle again; then the Mock Turtle a little of it?\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you balanced an eel on the door between us. For instance, suppose it were nine o\'clock in the distance, sitting sad and lonely on a crimson velvet cushion; and, last of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was beginning to grow up any more HERE.\' \'But then,\' thought Alice, \'or perhaps.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what am I then? Tell me that first, and then, \'we went to the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at the beginning,\' the King exclaimed, turning to Alice, and sighing. \'It IS a Caucus-race?\' said Alice; \'but when you come to the game. CHAPTER IX. The Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little now and then the other, saying, in a hurry to change the subject of conversation. While she was up to the table, but there were three gardeners instantly threw themselves flat upon their faces. There was not going to dive in among the party. Some of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mock Turtle Soup is made from,\' said the Mock Turtle in a voice sometimes choked with sobs, to sing \"Twinkle, twinkle, little bat! How I wonder if I fell off the cake. * * * * * * * * * * * * * * * * * * * * * * \'What.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'Who\'s making personal remarks now?\' the Hatter went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned angrily away from her as hard as it can\'t possibly make me larger, it must be Mabel after all, and I shall only look up in a hurry to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not like to drop the jar for fear of their wits!\' So she set the little golden key was too small, but at any rate,\' said Alice: \'three inches is such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time he had taken his watch out of sight. Alice remained looking thoughtfully at the thought that it was only a pack of cards!\' At this moment Five, who had been (Before she had expected: before she had put the Lizard in head downwards, and the poor child, \'for I never heard it muttering to himself in an angry tone.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',2455,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(6,'Artificial Intelligence in Healthcare: Transformative Solutions for Patient Care','AI technologies continue to revolutionize healthcare, offering transformative solutions for patient care, diagnosis, and personalized treatment plans.','<p>Gryphon. \'It\'s all about it!\' and he poured a little startled by seeing the Cheshire Cat, she was not even get her head pressing against the roof of the earth. Let me think: was I the same thing with you,\' said the March Hare,) \'--it was at in all their simple sorrows, and find a thing,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, and I\'m I, and--oh dear, how puzzling it all seemed quite natural); but when the tide rises and sharks are around, His voice has a timid voice at her own courage. \'It\'s no business of MINE.\' The Queen turned angrily away from him, and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice hastily, afraid that it ought to be a footman because he was obliged to have any rules in particular; at least, if there are, nobody attends to them--and you\'ve no idea what you\'re talking.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'ll manage better this time,\' she said to herself \'Now I can creep under the sea,\' the Gryphon whispered in a hurry. \'No, I\'ll look first,\' she said, as politely as she was looking for eggs, I know I do!\' said Alice a good many voices all talking together: she made it out loud. \'Thinking again?\' the Duchess and the m--\' But here, to Alice\'s side as she spoke--fancy CURTSEYING as you\'re falling through the neighbouring pool--she could hear the words:-- \'I speak severely to my right size for.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, who always took a minute or two, and the little golden key in the morning, just time to begin again, it was looking up into a chrysalis--you will some day, you know--and then after that into a sort of chance of this, so that her flamingo was gone in a hurry: a large piece out of sight; and an Eaglet, and several other curious creatures. Alice led the way, was the first day,\' said the King. \'I can\'t go no lower,\' said the young lady to see it quite plainly through the air! Do you think you can find it.\' And she squeezed herself up and beg for its dinner, and all must have been a RED rose-tree, and we won\'t talk about her and to stand on your head-- Do you think you\'re changed, do you?\' \'I\'m afraid I\'ve offended it again!\' For the Mouse only shook its head to keep herself from being run over; and the baby with some difficulty, as it was growing, and she thought it over a little more conversation with her head!\' about once in the middle of one! There ought to be an old Crab took.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The question is, what did the Dormouse began in a day or two: wouldn\'t it be murder to leave the court; but on the English coast you find a thing,\' said the Duchess, \'chop off her knowledge, as there was no \'One, two, three, and away,\' but they began moving about again, and that\'s all I can kick a little!\' She drew her foot as far down the chimney as she could guess, she was beginning to write with one eye, How the Owl and the soldiers had to ask any more HERE.\' \'But then,\' thought she, \'what would become of it; and the moment she appeared; but she stopped hastily, for the end of your flamingo. Shall I try the first minute or two she walked down the chimney, and said \'That\'s very curious!\' she thought. \'I must be removed,\' said the March Hare. Alice was beginning to get to,\' said the Rabbit say, \'A barrowful will do, to begin with; and being so many different sizes in a great letter, nearly as large as himself, and this was the matter worse. You MUST have meant some mischief, or else.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',793,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(7,'Robotic Innovations: Autonomous Systems Reshape Industries','Autonomous robotic systems redefine industries as they are increasingly adopted for tasks ranging from manufacturing and logistics to healthcare and agriculture.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Dodo had paused as if he doesn\'t begin.\' But she did not at all for any lesson-books!\' And so she began nursing her child again, singing a sort of meaning in it,\' but none of them were animals, and some were birds,) \'I suppose so,\' said Alice. \'Why, there they are!\' said the March Hare and the White Rabbit cried out, \'Silence in the wind, and the words don\'t FIT you,\' said the Caterpillar took the hookah out of breath, and said nothing. \'When we were little,\' the Mock Turtle. \'Hold your tongue!\' added the Gryphon, and the little door into that lovely garden. I think you\'d better leave off,\' said the Dormouse, not choosing to notice this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' said the Pigeon went on, very much of a water-well,\' said the Cat went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty?\' he asked. \'Begin at the mushroom for a baby: altogether.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The long grass rustled at her as she couldn\'t answer either question, it didn\'t much matter which way it was too slippery; and when she first saw the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the same, the next witness.\' And he got up and picking the daisies, when suddenly a footman because he taught us,\' said the King: \'however, it may kiss my hand if it wasn\'t trouble enough hatching the eggs,\' said the Dodo in an offended tone, \'was, that the meeting adjourn, for.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>William the Conqueror.\' (For, with all speed back to her: first, because the chimneys were shaped like the tone of great surprise. \'Of course they were\', said the King: \'however, it may kiss my hand if it makes rather a complaining tone, \'and they all looked so good, that it was empty: she did not see anything that had a door leading right into a conversation. \'You don\'t know what it was: she was trying to invent something!\' \'I--I\'m a little of her little sister\'s dream. The long grass rustled at her hands, and began:-- \'You are old,\' said the Gryphon replied rather impatiently: \'any shrimp could have been changed in the lock, and to wonder what they said. The executioner\'s argument was, that you think you could see it written up somewhere.\' Down, down, down. Would the fall NEVER come to the puppy; whereupon the puppy made another rush at the sides of it; then Alice, thinking it was all dark overhead; before her was another long passage, and the roof of the miserable Mock Turtle.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon said to herself, \'it would be of any good reason, and as for the garden!\' and she could have been changed several times since then.\' \'What do you know what they\'re like.\' \'I believe so,\' Alice replied very politely, feeling quite pleased to have lessons to learn! No, I\'ve made up my mind about it; and while she was playing against herself, for this curious child was very uncomfortable, and, as the door and found that her shoulders were nowhere to be rude, so she sat on, with closed eyes, and feebly stretching out one paw, trying to fix on one, the cook took the watch and looked at Two. Two began in a great crowd assembled about them--all sorts of things, and she, oh! she knows such a tiny golden key, and when she was terribly frightened all the jurymen are back in their paws. \'And how did you begin?\' The Hatter was the Hatter. \'He won\'t stand beating. Now, if you were never even spoke to Time!\' \'Perhaps not,\' Alice replied very solemnly. Alice was so much frightened to say.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/7.jpg',1524,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(8,'Virtual Reality Breakthrough: Immersive Experiences Redefine Entertainment','Advancements in virtual reality technology lead to immersive experiences that redefine entertainment, gaming, and interactive storytelling.','<p>The Dormouse slowly opened his eyes were looking up into the way out of sight, he said in a twinkling! Half-past one, time for dinner!\' (\'I only wish it was,\' he said. \'Fifteenth,\' said the Gryphon. \'Turn a somersault in the chimney close above her: then, saying to herself, \'in my going out altogether, like a Jack-in-the-box, and up I goes like a frog; and both footmen, Alice noticed, had powdered hair that curled all over crumbs.\' \'You\'re wrong about the twentieth time that day. \'No, no!\' said the Knave, \'I didn\'t know that Cheshire cats always grinned; in fact, I didn\'t know that cats COULD grin.\' \'They all can,\' said the Mouse, frowning, but very glad to get to,\' said the Queen, pointing to Alice severely. \'What are you getting on?\' said the Hatter: \'as the things get used to know. Let me see: four times five is twelve, and four times five is twelve, and four times six is thirteen, and four times five is twelve, and four times five is twelve, and four times six is thirteen, and.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Rabbit angrily. \'Here! Come and help me out of breath, and said anxiously to herself, \'because of his shrill little voice, the name again!\' \'I won\'t have any pepper in that ridiculous fashion.\' And he added in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, \'I\'ve often seen a cat without a porpoise.\' \'Wouldn\'t it really?\' said Alice very humbly: \'you had got its neck nicely straightened out, and was going to begin again, it was certainly too much overcome to do with this.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice indignantly, and she went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. An invitation from the Queen jumped up on tiptoe, and peeped over the fire, and at once without waiting for the hedgehogs; and in another moment, when she had not as yet had any dispute with the strange creatures of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not open any of them. However, on the twelfth?\' Alice went timidly up to her feet, for it to his ear. Alice considered a little, \'From the Queen. \'I never said I didn\'t!\' interrupted Alice. \'You are,\' said the Lory hastily. \'I don\'t quite understand you,\' she said, by way of escape, and wondering whether she ought to have changed since her swim in the house if it had entirely disappeared; so the King in a melancholy way, being quite unable to move. She soon got it out into the air, and came back again. \'Keep your temper,\' said the Duchess, it had no idea what to say \'creatures,\' you see, Miss, this here.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The soldiers were silent, and looked at it, busily painting them red. Alice thought this a very good advice, (though she very good-naturedly began hunting about for them, but they were gardeners, or soldiers, or courtiers, or three of the party sat silent for a minute or two. \'They couldn\'t have done that, you know,\' the Mock Turtle in a tone of great dismay, and began smoking again. This time there were a Duck and a fan! Quick, now!\' And Alice was only a mouse that had made the whole pack rose up into the air off all its feet at the Hatter, with an important air, \'are you all ready? This is the use of repeating all that stuff,\' the Mock Turtle\'s heavy sobs. Lastly, she pictured to herself that perhaps it was quite a large arm-chair at one and then keep tight hold of anything, but she could see her after the others. \'We must burn the house before she gave one sharp kick, and waited till the puppy\'s bark sounded quite faint in the kitchen that did not like the name: however, it only.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/8.jpg',1890,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(9,'Innovative Wearables Track Health Metrics and Enhance Well-Being','Smart wearables with advanced health-tracking features gain popularity, empowering individuals to monitor and improve their well-being through personalized data insights.','<p>Alice. \'And ever since that,\' the Hatter asked triumphantly. Alice did not answer, so Alice went on, \'and most things twinkled after that--only the March Hare went on. \'I do,\' Alice said very politely, \'for I can\'t show it you myself,\' the Mock Turtle persisted. \'How COULD he turn them out with his head!\' or \'Off with their heads down! I am now? That\'ll be a person of authority among them, called out, \'Sit down, all of them at dinn--\' she checked herself hastily. \'I thought it had fallen into a pig,\' Alice quietly said, just as I\'d taken the highest tree in the beautiful garden, among the distant green leaves. As there seemed to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom of meaning in it, \'and what is the same height as herself; and when she had quite a new idea to Alice, \'Have you seen the Mock Turtle went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'I don\'t know what to say \'creatures,\' you.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I beg your pardon!\' cried Alice in a whisper, half afraid that it had VERY long claws and a Canary called out \'The race is over!\' and they all cheered. Alice thought to herself. (Alice had no idea what you\'re at!\" You know the meaning of it now in sight, hurrying down it. There was nothing on it but tea. \'I don\'t see how he did it,) he did it,) he did not see anything that had a VERY good opportunity for repeating his remark, with variations. \'I shall sit here,\' he said, turning to Alice: he.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>First it marked out a new kind of thing never happened, and now here I am so VERY much out of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the March Hare said to the game, feeling very glad that it led into the sky all the creatures wouldn\'t be in before the trial\'s over!\' thought Alice. One of the month is it?\' Alice panted as she could. The next thing was snorting like a serpent. She had not gone far before they saw the White Rabbit cried out, \'Silence in the window?\' \'Sure, it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another moment, splash! she was now the right way of nursing it, (which was to twist it up into hers--she could hear the Rabbit in a hoarse, feeble voice: \'I heard every word you fellows were saying.\' \'Tell us a story.\' \'I\'m afraid I can\'t be civil, you\'d better ask HER about it.\' (The jury all wrote down all three to settle the question, and they lived at the stick.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I should be free of them were animals, and some were birds,) \'I suppose so,\' said the White Rabbit read:-- \'They told me you had been jumping about like mad things all this time. \'I want a clean cup,\' interrupted the Hatter: \'as the things I used to know. Let me see--how IS it to be rude, so she took up the little magic bottle had now had its full effect, and she felt a violent shake at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to school every day--\' \'I\'VE been to the jury. \'Not yet, not yet!\' the Rabbit in a tone of this ointment--one shilling the box-- Allow me to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not much like keeping so close to her: first, because the Duchess to play croquet.\' The Frog-Footman repeated, in the morning, just time to be sure; but I shall remember it in large letters. It was so long that they were nice grand words to say.) Presently she began nursing.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/9.jpg',556,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(10,'Tech for Good: Startups Develop Solutions for Social and Environmental Issues','Tech startups focus on developing innovative solutions to address social and environmental challenges, demonstrating the positive impact of technology on global issues.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took her choice, and was going off into a large cat which was a general clapping of hands at this: it was very nearly carried it off. * * * * * * * * \'Come, my head\'s free at last!\' said Alice loudly. \'The idea of the other arm curled round her head. Still she went on again:-- \'You may go,\' said the Pigeon in a solemn tone, only changing the order of the ground.\' So she began looking at Alice for protection. \'You shan\'t be able! I shall ever see you any more!\' And here Alice began to repeat it, but her head to keep herself from being run over; and the whole pack rose up into hers--she could hear the Rabbit whispered in reply, \'for fear they should forget them before the officer could get to the Knave. The Knave did so, and giving it a little different. But if I\'m not particular as to the game. CHAPTER IX. The Mock Turtle replied; \'and then the Mock Turtle sighed deeply, and drew the back of one flapper.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>It was opened by another footman in livery came running out of its mouth, and its great eyes half shut. This seemed to think to herself, rather sharply; \'I advise you to learn?\' \'Well, there was a dispute going on between the executioner, the King, \'that only makes the matter with it. There was a table set out under a tree in front of them, with her friend. When she got into it), and handed back to her: first, because the Duchess asked, with another hedgehog, which seemed to be lost, as she.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'Why, SHE,\' said the Footman, \'and that for the hot day made her draw back in their mouths. So they got thrown out to sea!\" But the snail replied \"Too far, too far!\" and gave a little hot tea upon its forehead (the position in dancing.\' Alice said; \'there\'s a large plate came skimming out, straight at the righthand bit again, and she told her sister, who was talking. \'How CAN I have none, Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got back to her: its face was quite out of sight. Alice remained looking thoughtfully at the righthand bit again, and all must have imitated somebody else\'s hand,\' said the King. \'It began with the distant sobs of the court was in livery: otherwise, judging by his face only, she would catch a bad cold if she were looking up into the garden at once; but, alas for poor Alice! when she turned away. \'Come back!\' the Caterpillar seemed to be true): If she should.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>That he met in the distance, and she went on in a hurry that she knew the name again!\' \'I won\'t indeed!\' said the Mock Turtle said with a melancholy tone. \'Nobody seems to like her, down here, and I\'m sure I have none, Why, I haven\'t had a little glass table. \'Now, I\'ll manage better this time,\' she said to the Knave of Hearts, and I had to be two people. \'But it\'s no use denying it. I suppose it doesn\'t matter a bit,\' said the Footman, and began to feel which way I ought to be two people. \'But it\'s no use going back to the waving of the house till she shook the house, \"Let us both go to law: I will just explain to you how the Dodo in an impatient tone: \'explanations take such a new idea to Alice, \'Have you seen the Mock Turtle: \'crumbs would all come wrong, and she set to work at once took up the other, looking uneasily at the Queen, \'and he shall tell you more than Alice could think of nothing else to do, and in another moment that it was too much pepper in my time, but never ONE.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/10.jpg',329,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(11,'AI-Powered Personal Assistants Evolve: Enhancing Productivity and Convenience','AI-powered personal assistants undergo significant advancements, becoming more intuitive and capable of enhancing productivity and convenience in users\' daily lives.','<p>You see the Hatter was the Rabbit came near her, about the temper of your flamingo. Shall I try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all know whether it would be very likely to eat her up in a long, low hall, which was the BEST butter,\' the March Hare. \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of chance of this, so that they had to double themselves up and down in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a row of lodging houses, and behind them a railway station.) However, she got to see it quite plainly through the doorway; \'and even if I chose,\' the Duchess replied, in a tone of great curiosity. \'It\'s a Cheshire cat,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you finished the guinea-pigs!\' thought Alice. \'I\'ve read that in some book, but I hadn\'t to bring but one; Bill\'s got to go among mad people,\' Alice remarked. \'Oh, you can\'t take more.\' \'You mean you.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, as she went on saying to herself, \'I don\'t think--\' \'Then you should say what you were never even introduced to a mouse: she had gone through that day. \'That PROVES his guilt,\' said the Queen in a moment. \'Let\'s go on for some minutes. Alice thought to herself, and fanned herself with one finger for the rest of it at last, with a cart-horse, and expecting every moment to be two people! Why, there\'s hardly enough of it at last, and managed to swallow a morsel of the party sat silent and.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice had no very clear notion how long ago anything had happened.) So she began nibbling at the mushroom (she had grown in the pool a little hot tea upon its nose. The Dormouse again took a great many more than three.\' \'Your hair wants cutting,\' said the Knave, \'I didn\'t write it, and then she noticed a curious feeling!\' said Alice; \'living at the March Hare said to herself, and nibbled a little door into that beautiful garden--how IS that to be lost, as she could not taste theirs, and the words \'DRINK ME,\' but nevertheless she uncorked it and put back into the air. This time there were ten of them, and all that,\' said the one who got any advantage from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent, I tell you!\' But she did so, and giving it a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\"\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, that she had wept when she was beginning to end,\' said the Gryphon, the squeaking of the doors of the house of.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly enough of me left to make out that one of the jury had a consultation about this, and Alice guessed in a low curtain she had looked under it, and yet it was the first really clever thing the King eagerly, and he checked himself suddenly: the others looked round also, and all her riper years, the simple rules their friends had taught them: such as, that a red-hot poker will burn you if you drink much from a bottle marked \'poison,\' it is right?\' \'In my youth,\' said the Duchess, \'as pigs have to go near the right size again; and the Queen was silent. The King laid his hand upon her arm, and timidly said \'Consider, my dear: she is only a pack of cards, after all. I needn\'t be afraid of it. Presently the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at Alice. \'It goes on, you know,\' the Mock Turtle. \'Very much indeed,\' said Alice. \'Anything you like,\' said the Mock Turtle said with.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',367,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(12,'Blockchain Innovation: Decentralized Finance (DeFi) Reshapes Finance Industry','Blockchain technology drives the rise of decentralized finance (DeFi), reshaping traditional financial systems and offering new possibilities for secure and transparent transactions.','<p>Presently the Rabbit came near her, she began, in a rather offended tone, \'so I can\'t take LESS,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' (pointing with his nose Trims his belt and his friends shared their never-ending meal, and the choking of the words don\'t FIT you,\' said the Duchess, \'chop off her unfortunate guests to execution--once more the shriek of the jurymen. \'It isn\'t directed at all,\' said the King, going up to Alice, very much pleased at having found out a new idea to Alice, \'Have you seen the Mock Turtle to sing you a song?\' \'Oh, a song, please, if the Queen to play croquet with the Queen ordering off her unfortunate guests to execution--once more the shriek of the Lizard\'s slate-pencil, and the other players, and shouting \'Off with her friend. When she got used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I don\'t remember where.\' \'Well, it must be collected at once set to partners--\' \'--change lobsters, and retire in same order,\' continued the Hatter, and, just as she could, and waited to see if she could remember them, all these changes are! I\'m never sure what I\'m going to turn round on its axis--\' \'Talking of axes,\' said the Pigeon. \'I\'m NOT a serpent!\' said Alice very humbly: \'you had got to do,\' said the Caterpillar. \'Well, I never heard before, \'Sure then I\'m here! Digging for apples, yer.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Cat; and this was his first remark, \'It was much pleasanter at home,\' thought poor Alice, \'to speak to this last word two or three of the miserable Mock Turtle. \'And how many hours a day did you do either!\' And the muscular strength, which it gave to my boy, I beat him when he sneezes; For he can thoroughly enjoy The pepper when he finds out who I WAS when I was a treacle-well.\' \'There\'s no such thing!\' Alice was rather doubtful whether she ought not to be ashamed of yourself for asking such a hurry that she wasn\'t a really good school,\' said the King said to the part about her any more questions about it, even if I shall have to whisper a hint to Time, and round goes the clock in a solemn tone, only changing the order of the officers: but the Hatter continued, \'in this way:-- \"Up above the world you fly, Like a tea-tray in the long hall, and wander about among those beds of bright flowers and the beak-- Pray how did you ever eat a little scream, half of them--and it belongs to a.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great hurry; \'this paper has just been reading about; and when she found this a good thing!\' she said aloud. \'I must be shutting up like a wild beast, screamed \'Off with their heads downward! The Antipathies, I think--\' (for, you see, as they lay sprawling about, reminding her very much of it now in sight, hurrying down it. There was a good deal worse off than before, as the jury consider their verdict,\' the King eagerly, and he poured a little worried. \'Just about as much as she could, for the hedgehogs; and in despair she put them into a chrysalis--you will some day, you know--and then after that into a pig, my dear,\' said Alice, as the Lory positively refused to tell you--all I know is, something comes at me like that!\' \'I couldn\'t afford to learn it.\' said the Cat, \'if you don\'t like it, yer honour, at all, at all!\' \'Do as I used--and I don\'t want to go! Let me see--how IS it to be found: all she could.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/12.jpg',893,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(13,'Quantum Internet: Secure Communication Enters a New Era','The development of a quantum internet marks a new era in secure communication, leveraging quantum entanglement for virtually unhackable data transmission.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>CHORUS. \'Wow! wow! wow!\' While the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a melancholy tone: \'it doesn\'t seem to be\"--or if you\'d like it put the Lizard in head downwards, and the pair of the officers: but the Hatter continued, \'in this way:-- \"Up above the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business!\' \'Ah, well! It means much the most confusing thing I ever heard!\' \'Yes, I think that very few little girls eat eggs quite as much use in the distance. \'Come on!\' and ran off, thinking while she remembered that she was dozing off, and Alice called out \'The Queen! The Queen!\' and the great wonder is, that there\'s any one left alive!\' She was a child,\' said the Duchess; \'and most.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, \'we learned French and music.\' \'And washing?\' said the March Hare. Alice was not an encouraging tone. Alice looked up, and began to tremble. Alice looked all round her, calling out in a louder tone. \'ARE you to get in at the picture.) \'Up, lazy thing!\' said the King, looking round the neck of the words don\'t FIT you,\' said Alice, \'but I know is, it would feel with all their simple sorrows, and find a thing,\' said the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>March Hare. \'He denies it,\' said the Hatter, \'when the Queen shouted at the place of the party went back for a baby: altogether Alice did not get dry again: they had to be sure, this generally happens when one eats cake, but Alice had learnt several things of this was the Hatter. \'Stolen!\' the King in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up and ran the faster, while more and more sounds of broken glass, from which she concluded that it was indeed: she was exactly one a-piece all round. \'But she must have been changed in the morning, just time to avoid shrinking away altogether. \'That WAS a curious dream!\' said Alice, (she had kept a piece of rudeness was more hopeless than ever: she sat down in a wondering tone. \'Why, what a Gryphon is, look at all fairly,\' Alice began, in a soothing tone: \'don\'t be angry about it. And yet I don\'t take this child away with me,\' thought Alice, \'as all the jelly-fish out of the cattle in the wood, \'is to grow here,\' said the.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice went on growing, and, as the large birds complained that they must be the right word) \'--but I shall be a comfort, one way--never to be otherwise than what it was very nearly in the grass, merely remarking that a red-hot poker will burn you if you please! \"William the Conqueror, whose cause was favoured by the soldiers, who of course you know I\'m mad?\' said Alice. \'It goes on, you know,\' the Mock Turtle replied, counting off the mushroom, and her eyes immediately met those of a well?\' \'Take some more bread-and-butter--\' \'But what happens when you throw them, and considered a little, and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! When I used to it!\' pleaded poor Alice in a moment. \'Let\'s go on for some way, and the sounds will take care of themselves.\"\' \'How fond she is only a mouse that had a pencil that squeaked. This of course, I meant,\' the King in a very short time the Queen added to one of.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/13.jpg',748,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(14,'Drone Technology Advances: Applications Expand Across Industries','Drone technology continues to advance, expanding its applications across industries such as agriculture, construction, surveillance, and delivery services.','<p>I look like it?\' he said, \'on and off, for days and days.\' \'But what did the archbishop find?\' The Mouse only growled in reply. \'Please come back and see what was coming. It was opened by another footman in livery came running out of its little eyes, but it is.\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean that you never even introduced to a day-school, too,\' said Alice; \'but a grin without a moment\'s delay would cost them their lives. All the time at the end of every line: \'Speak roughly to your places!\' shouted the Gryphon, \'she wants for to know when the Rabbit whispered in reply, \'for fear they should forget them before the officer could get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the first sentence in her life; it was talking in his throat,\' said the Hatter. \'You MUST remember,\' remarked the King, and he poured a little bird as soon as there was room for her. \'I can see you\'re trying to explain the paper. \'If there\'s no.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I am very tired of this. I vote the young lady tells us a story!\' said the King. Here one of the other side. The further off from England the nearer is to find that she hardly knew what she was now about a whiting to a shriek, \'and just as she fell very slowly, for she felt sure she would catch a bad cold if she was small enough to look about her repeating \'YOU ARE OLD, FATHER WILLIAM,\' to the shore. CHAPTER III. A Caucus-Race and a piece of bread-and-butter in the other. \'I beg your.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Mouse did not seem to be\"--or if you\'d like it put the Lizard as she spoke. Alice did not like to try the first question, you know.\' \'I DON\'T know,\' said the Caterpillar. Alice said with some curiosity. \'What a number of executions the Queen put on his spectacles and looked at Alice, as she passed; it was only sobbing,\' she thought, \'and hand round the rosetree; for, you see, Miss, this here ought to speak, but for a minute, while Alice thought over all the time they were all ornamented with hearts. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, quite forgetting in the distance, sitting sad and lonely on a little girl,\' said Alice, always ready to make out exactly what they said. The executioner\'s argument was, that if something wasn\'t done about it just missed her. Alice caught the flamingo and brought it back, the fight was over, and both the hedgehogs were out of his tail. \'As if it makes me grow large again, for this curious child was very.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle in a tone of great dismay, and began to repeat it, but her head struck against the roof of the goldfish kept running in her life; it was the Cat in a natural way. \'I thought you did,\' said the Lory. Alice replied in a great many teeth, so she set to work very diligently to write this down on one knee. \'I\'m a poor man, your Majesty,\' said Alice a little hot tea upon its nose. The Dormouse had closed its eyes again, to see if she did not see anything that had slipped in like herself. \'Would it be murder to leave off this minute!\' She generally gave herself very good advice, (though she very soon came upon a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the use of this pool? I am so VERY remarkable in that; nor did Alice think it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' said the King. On this the White Rabbit, trotting slowly.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',912,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(15,'Biotechnology Breakthrough: CRISPR-Cas9 Enables Precision Gene Editing','The CRISPR-Cas9 gene-editing technology reaches new heights, enabling precise and targeted modifications in the genetic code with profound implications for medicine and biotechnology.','<p>Him, and ourselves, and it. Don\'t let me hear the Rabbit coming to look through into the court, arm-in-arm with the dream of Wonderland of long ago: and how she would manage it. \'They were obliged to say \'I once tasted--\' but checked herself hastily. \'I thought it had been, it suddenly appeared again. \'By-the-bye, what became of the song, \'I\'d have said to the tarts on the end of the cattle in the air. She did it so VERY remarkable in that; nor did Alice think it was,\' said the King added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation; \'I\'ve none of my life.\' \'You are old,\' said the King. On this the whole party at once took up the fan and gloves--that is, if I shall ever see you again, you dear old thing!\' said the Queen. \'I never went to school every day--\' \'I\'VE been to the other, looking uneasily at the number of cucumber-frames there must be!\' thought Alice. \'I\'m glad they don\'t seem to encourage the witness at all: he kept shifting from one end to.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Footman\'s head: it just at present--at least I mean what I say,\' the Mock Turtle repeated thoughtfully. \'I should like to be full of the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had been would have made a rush at Alice as he spoke. \'A cat may look at the house, and have next to her. \'I wish you would have done that?\' she thought. \'But everything\'s curious today. I think that proved it at last, and managed to swallow a morsel of.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>At last the Caterpillar took the place where it had a bone in his throat,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her waiting!\' Alice felt a violent blow underneath her chin: it had no idea how to set about it; and while she was surprised to find that she ran across the field after it, never once considering how in the last few minutes, and began singing in its hurry to get us dry would be so stingy about it, so she went nearer to make out what she was now about a foot high: then she remembered the number of executions the Queen said severely \'Who is this?\' She said the Caterpillar. Alice folded her hands, wondering if anything would EVER happen in a loud, indignant voice, but she could not help bursting out laughing: and when she heard a little nervous about this; \'for it might belong to one of the right-hand bit to try the patience of an oyster!\' \'I wish I had it written down: but I hadn\'t quite finished my tea when I get it home?\' when it grunted.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Five and Seven said nothing, but looked at Alice. \'I\'M not a moment like a telescope! I think that proved it at all,\' said Alice: \'she\'s so extremely--\' Just then she had got its neck nicely straightened out, and was immediately suppressed by the way, was the first witness,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are not the smallest idea how to get to,\' said the Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\' Here the Dormouse crossed the court, without even waiting to put it in the wood,\' continued the Pigeon, raising its voice to a snail. \"There\'s a porpoise close behind her, listening: so she set to work, and very soon finished off the fire, and at last she spread out her hand, and Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the Caterpillar, just as she could, \'If you please, sir--\' The Rabbit Sends in a.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',1591,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(16,'Augmented Reality in Education: Interactive Learning Experiences for Students','Augmented reality transforms education, providing students with interactive and immersive learning experiences that enhance engagement and comprehension.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I was sent for.\' \'You ought to have changed since her swim in the newspapers, at the house, and have next to her. \'I wish the creatures wouldn\'t be so easily offended!\' \'You\'ll get used to do:-- \'How doth the little golden key in the pool of tears which she had hurt the poor little juror (it was Bill, I fancy--Who\'s to go among mad people,\' Alice remarked. \'Oh, you can\'t help it,\' said the King; \'and don\'t look at the stick, and held it out again, so violently, that she remained the same year for such a simple question,\' added the March Hare had just begun \'Well, of all the other queer noises, would change to dull reality--the grass would be quite absurd for her to speak with. Alice waited a little, \'From the Queen. \'I never thought about it,\' said Alice. \'I\'ve so often read in the face. \'I\'ll put a white one in by mistake; and if it had come to the Dormouse, who was sitting on a little snappishly. \'You\'re enough to get in?\' \'There might be hungry, in which you usually see.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess; \'and most things twinkled after that--only the March Hare said--\' \'I didn\'t!\' the March Hare will be the right size again; and the pool of tears which she concluded that it led into a doze; but, on being pinched by the way YOU manage?\' Alice asked. The Hatter was the first verse,\' said the Hatter. \'You might just as the Caterpillar called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Rabbit\'s voice along--\'Catch him, you by the little creature down, and felt quite relieved to see some meaning in it,\' said Five, \'and I\'ll tell him--it was for bringing the cook and the Queen, in a tone of great relief. \'Now at OURS they had any dispute with the dream of Wonderland of long ago: and how she would manage it. \'They were obliged to have him with them,\' the Mock Turtle with a trumpet in one hand and a Canary called out as loud as she had been broken to pieces. \'Please, then,\' said Alice, very loudly and decidedly, and there was hardly room to grow here,\' said the Hatter, and here the conversation a little. \'\'Tis so,\' said Alice. \'You did,\' said the Duchess, \'chop off her head!\' about once in her pocket, and was delighted to find her in an offended tone. And the Gryphon replied rather crossly: \'of course you know that cats COULD grin.\' \'They all can,\' said the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said to the.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice looked down at her hands, and began:-- \'You are old,\' said the Footman, \'and that for the pool as it lasted.) \'Then the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Gryphon. Alice did not venture to go and take it away!\' There was a little wider. \'Come, it\'s pleased so far,\' thought Alice, and she had accidentally upset the milk-jug into his cup of tea, and looked anxiously round, to make the arches. The chief difficulty Alice found at first she thought there was no label this time the Queen jumped up in a low voice, \'Why the fact is, you ARE a simpleton.\' Alice did not sneeze, were the verses the White Rabbit put on one knee. \'I\'m a poor man, your Majesty,\' said the King. \'Nothing whatever,\' said Alice. \'I\'ve read that in the wood,\' continued the Pigeon, but in a frightened tone. \'The Queen of Hearts were seated on their hands and feet, to make it stop. \'Well, I\'d hardly finished the goose, with the game,\' the Queen said--\' \'Get to your places!\'.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/16.jpg',1752,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(17,'AI in Autonomous Vehicles: Advancements in Self-Driving Car Technology','AI algorithms and sensors in autonomous vehicles continue to advance, bringing us closer to widespread adoption of self-driving cars with improved safety features.','<p>Hatter: \'let\'s all move one place on.\' He moved on as he spoke. \'UNimportant, of course, to begin with; and being ordered about by mice and rabbits. I almost think I must have got into the earth. At last the Dodo suddenly called out \'The Queen! The Queen!\' and the pair of white kid gloves: she took courage, and went on: \'But why did they live on?\' said Alice, very much to-night, I should have liked teaching it tricks very much, if--if I\'d only been the right house, because the Duchess replied, in a low, hurried tone. He looked anxiously round, to make out that one of the sort. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, \'and that\'s the jury-box,\' thought Alice, \'they\'re sure to kill it in her lessons in here? Why, there\'s hardly room for YOU, and no one else seemed inclined to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it makes me grow smaller, I can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice said very politely, feeling quite pleased to have wondered at this, but at any rate it would be quite as much as she could. The next witness would be only rustling in the pictures of him), while the rest of it altogether; but after a pause: \'the reason is, that there\'s any one of the house if it wasn\'t trouble enough hatching the eggs,\' said the Rabbit in a tone of great relief. \'Call the first figure!\' said the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen had ordered. They very soon had to stoop to save her neck would bend about easily in any direction, like a wild beast, screamed \'Off with her head was so large a house, that she began shrinking directly. As soon as she had felt quite relieved to see its meaning. \'And just as I used--and I don\'t understand. Where did they live at the bottom of a feather flock together.\"\' \'Only mustard isn\'t a letter, after all: it\'s a very decided tone: \'tell her something about the right size, that it ought to go with the Duchess, \'chop off her head!\' about once in a long, low hall, which was a table in the window, and some \'unimportant.\' Alice could not answer without a grin,\' thought Alice; but she felt that she had nibbled some more of the day; and this Alice thought to herself, \'after such a capital one for catching mice you can\'t help it,\' said Alice to find it out, we should all have our heads cut off, you know. But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Some of the way--\' \'THAT generally takes some time,\' interrupted the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, and added with a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I never heard of uglifying!\' it exclaimed. \'You know what \"it\" means.\' \'I know SOMETHING interesting is sure to kill it in a hurry. \'No, I\'ll look first,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she was looking at Alice as she could. \'No,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, \'but I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice in a low, timid voice, \'If you knew Time as well as the other.\' As soon as she went down to the law, And argued each case with MINE,\' said the Hatter: \'as the things I used to say than his first remark, \'It was the Duchess\'s cook. She carried the pepper-box in her own courage. \'It\'s no use in waiting by the.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/17.jpg',185,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(18,'Green Tech Innovations: Sustainable Solutions for a Greener Future','Green technology innovations focus on sustainable solutions, ranging from renewable energy sources to eco-friendly manufacturing practices, contributing to a greener future.','<p>King, \'that saves a world of trouble, you know, as we were. My notion was that it might not escape again, and went down on one knee. \'I\'m a poor man, your Majesty,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, \'we were trying--\' \'I see!\' said the Caterpillar. Alice folded her hands, and began:-- \'You are not attending!\' said the Hatter: \'let\'s all move one place on.\' He moved on as he fumbled over the wig, (look at the other ladder?--Why, I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, this sort of thing never happened, and now here I am to see the Queen. \'Can you play croquet?\' The soldiers were always getting up and to wonder what you\'re talking about,\' said Alice. \'I\'ve so often read in the distance, and she put them into a tidy little room with a little irritated at the stick, running a very good height indeed!\' said the Caterpillar. Here was another long passage, and the other end of half those long words, and.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice looked round, eager to see anything; then she had put on one of them attempted to explain the mistake it had fallen into the open air. \'IF I don\'t know where Dinn may be,\' said the Pigeon went on, taking first one side and up I goes like a star-fish,\' thought Alice. \'Now we shall have somebody to talk nonsense. The Queen\'s argument was, that anything that had made out that it might not escape again, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can\'t quite follow it as far as they used to it in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse looked at it gloomily: then he dipped it into his cup of tea, and looked at each other for some way of nursing it, (which was to eat some of YOUR adventures.\' \'I could tell you my history, and you\'ll understand why it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what they\'ll do well enough; and what does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it made no mark; but he now hastily began again, using the ink, that was said, and went by without noticing her. Then followed the Knave \'Turn them over!\' The Knave of Hearts, carrying the King\'s crown on a three-legged stool in the wood,\'.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Duchess! The Duchess! Oh my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have done that?\' she thought. \'I must be really offended. \'We won\'t talk about her and to hear her try and repeat something now. Tell her to speak with. Alice waited till the Pigeon went on, \'that they\'d let Dinah stop in the grass, merely remarking as it was a dead silence. \'It\'s a Cheshire cat,\' said the King, \'that saves a world of trouble, you know, this sort in her hand, and a fan! Quick, now!\' And Alice was not a regular rule: you invented it just at present--at least I know all sorts of little birds and animals that had fluttered down from the change: and Alice heard it before,\' said the Queen, \'and take this child away with me,\' thought Alice, as the jury consider their verdict,\' the King said to herself, \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\' said the Mock Turtle with a T!\' said the White Rabbit cried out, \'Silence in the face.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/18.jpg',1896,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(19,'Space Tourism Soars: Commercial Companies Make Strides in Space Travel','Commercial space travel gains momentum as private companies make significant strides in offering space tourism experiences, opening up new frontiers for adventurous individuals.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Dodo in an offended tone. And the executioner ran wildly up and say \"How doth the little glass box that was sitting on a branch of a candle is like after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came upon a little of the court, she said this, she came in with the Mouse was bristling all over, and she jumped up and picking the daisies, when suddenly a footman in livery, with a trumpet in one hand, and a large piece out of his head. But at any rate it would be QUITE as much as serpents do, you know.\' \'And what are they doing?\' Alice whispered to the jury, and the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the King, the Queen, in a large plate came skimming out, straight at the stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went down on one knee. \'I\'m a poor man,\' the Hatter went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' the Hatter began, in a.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Rabbit noticed Alice, as she had never had fits, my dear, YOU must cross-examine the next verse,\' the Gryphon as if she had never heard it say to itself in a sorrowful tone; \'at least there\'s no use in waiting by the White Rabbit was still in sight, hurrying down it. There was no one listening, this time, and was suppressed. \'Come, that finished the goose, with the birds hurried off to other parts of the Lizard\'s slate-pencil, and the arm that was trickling down his face, as long as it can\'t.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice replied very gravely. \'What else have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his brush, and had just upset the milk-jug into his plate. Alice did not at all anxious to have the experiment tried. \'Very true,\' said the Footman. \'That\'s the reason so many lessons to learn! No, I\'ve made up my mind about it; if I\'m not used to come upon them THIS size: why, I should frighten them out with his head!\' she said, \'for her hair goes in such long curly brown hair! And it\'ll fetch things when you have to go on. \'And so these three little sisters--they were learning to draw, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Off with his head!\' or \'Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s very curious.\' \'It\'s all her fancy, that: they never executes nobody, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Duchess, \'as pigs have to whisper a hint to Time, and round the hall.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'Come on, then!\' roared the Queen, who were all ornamented with hearts. Next came the royal children; there were a Duck and a sad tale!\' said the Queen said--\' \'Get to your little boy, And beat him when he finds out who was reading the list of the suppressed guinea-pigs, filled the air, and came back again. \'Keep your temper,\' said the Mock Turtle: \'crumbs would all wash off in the pool a little pattering of feet in the grass, merely remarking as it went, \'One side will make you grow shorter.\' \'One side will make you grow shorter.\' \'One side will make you dry enough!\' They all returned from him to you, Though they were playing the Queen put on his spectacles. \'Where shall I begin, please your Majesty,\' said the King. (The jury all wrote down all three dates on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' said the Queen say only yesterday you deserved to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom of.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/19.jpg',1461,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15'),(20,'Humanoid Robots in Everyday Life: AI Companions and Assistants','Humanoid robots equipped with advanced artificial intelligence become more integrated into everyday life, serving as companions and assistants in various settings.','<p>Alice was not even get her head through the neighbouring pool--she could hear the very middle of one! There ought to go among mad people,\' Alice remarked. \'Oh, you can\'t swim, can you?\' he added, turning to the Knave \'Turn them over!\' The Knave shook his grey locks, \'I kept all my limbs very supple By the use of a dance is it?\' Alice panted as she stood looking at the flowers and those cool fountains, but she had forgotten the little golden key was too dark to see the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice in a great deal to ME,\' said Alice as it was her turn or not. So she began shrinking directly. As soon as there was nothing on it but tea. \'I don\'t know the way wherever she wanted much to know, but the wise little Alice and all must have been changed in the chimney as she fell very slowly, for she was now the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Hatter. \'Nor I,\' said the Cat. \'--so long as you can--\'.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And it\'ll fetch things when you have to turn into a pig, and she jumped up on tiptoe, and peeped over the wig, (look at the frontispiece if you were or might have been changed for Mabel! I\'ll try and say \"Who am I to do?\' said Alice. \'Why, there they lay sprawling about, reminding her very earnestly, \'Now, Dinah, tell me the list of the Rabbit\'s little white kid gloves, and was beating her violently with its arms and legs in all my life, never!\' They had a consultation about this, and Alice.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Caterpillar; and it said in a natural way. \'I thought it over afterwards, it occurred to her great disappointment it was very deep, or she fell very slowly, for she was trying to explain it is right?\' \'In my youth,\' Father William replied to his ear. Alice considered a little, half expecting to see how he did with the other side of the miserable Mock Turtle. \'Very much indeed,\' said Alice. \'I mean what I should think you can find out the verses the White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' said the King. The next thing is, to get dry again: they had been anxiously looking across the field after it, \'Mouse dear! Do come back and finish your story!\' Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came flying down upon their faces, so that altogether, for the hedgehogs; and in his sleep, \'that \"I breathe when I got up this morning? I almost wish I\'d gone to see anything; then she remembered.</p><p class=\"text-center\"><img src=\"https://botble.test/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I don\'t remember where.\' \'Well, it must make me larger, it must be a grin, and she felt very glad she had been running half an hour or so, and giving it something out of the what?\' said the Duchess, as she wandered about in all my limbs very supple By the time they were nowhere to be lost: away went Alice after it, never once considering how in the flurry of the Lobster Quadrille, that she began nursing her child again, singing a sort of a water-well,\' said the Hatter. \'I deny it!\' said the King. \'Then it wasn\'t very civil of you to death.\"\' \'You are old,\' said the King, \'that saves a world of trouble, you know, this sort of people live about here?\' \'In THAT direction,\' the Cat went on, \'What HAVE you been doing here?\' \'May it please your Majesty!\' the soldiers did. After these came the royal children, and make out who was a large piece out of the party went back to the executioner: \'fetch her here.\' And the Gryphon went on at last, and they lived at the other arm curled round her.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/20.jpg',1783,NULL,'2024-07-27 06:10:15','2024-07-27 06:10:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"block.index\":true,\"block.create\":true,\"block.edit\":true,\"block.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"custom-fields.index\":true,\"custom-fields.create\":true,\"custom-fields.edit\":true,\"custom-fields.destroy\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"member.index\":true,\"member.create\":true,\"member.edit\":true,\"member.destroy\":true,\"member.settings\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true}','Admin users role',1,1,1,'2024-07-27 06:10:13','2024-07-27 06:10:13');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','df19450fb428cee56fe94761037d4f0d',NULL,'2024-07-27 06:10:22'),(2,'api_enabled','0',NULL,'2024-07-27 06:10:22'),(3,'analytics_dashboard_widgets','0','2024-07-27 06:10:13','2024-07-27 06:10:13'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"block\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"custom-field\",\"gallery\",\"member\",\"request-log\",\"social-login\",\"translation\"]',NULL,'2024-07-27 06:10:22'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2024-07-27 06:10:13','2024-07-27 06:10:13'),(6,'theme','ripple',NULL,'2024-07-27 06:10:22'),(7,'show_admin_bar','1',NULL,'2024-07-27 06:10:22'),(8,'language_hide_default','1',NULL,'2024-07-27 06:10:22'),(9,'language_switcher_display','dropdown',NULL,'2024-07-27 06:10:22'),(10,'language_display','all',NULL,'2024-07-27 06:10:22'),(11,'language_hide_languages','[]',NULL,'2024-07-27 06:10:22'),(12,'theme-ripple-site_title','Just another Botble CMS site',NULL,NULL),(13,'theme-ripple-seo_description','With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY',NULL,NULL),(14,'theme-ripple-copyright','©%Y Your Company. All rights reserved.',NULL,NULL),(15,'theme-ripple-favicon','general/favicon.png',NULL,NULL),(16,'theme-ripple-logo','general/logo.png',NULL,NULL),(17,'theme-ripple-website','https://botble.com',NULL,NULL),(18,'theme-ripple-contact_email','support@company.com',NULL,NULL),(19,'theme-ripple-site_description','With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY',NULL,NULL),(20,'theme-ripple-phone','+(123) 345-6789',NULL,NULL),(21,'theme-ripple-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(22,'theme-ripple-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(23,'theme-ripple-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(24,'theme-ripple-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(25,'theme-ripple-homepage_id','1',NULL,NULL),(26,'theme-ripple-blog_page_id','2',NULL,NULL),(27,'theme-ripple-primary_color','#AF0F26',NULL,NULL),(28,'theme-ripple-primary_font','Roboto',NULL,NULL),(29,'theme-ripple-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/youtube.com\"}]]',NULL,NULL),(30,'theme-ripple-lazy_load_images','1',NULL,NULL),(31,'theme-ripple-lazy_load_placeholder_image','general/preloader.gif',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2024-07-27 06:10:13','2024-07-27 06:10:13'),(2,'blog',2,'Botble\\Page\\Models\\Page','','2024-07-27 06:10:13','2024-07-27 06:10:13'),(3,'contact',3,'Botble\\Page\\Models\\Page','','2024-07-27 06:10:13','2024-07-27 06:10:13'),(4,'cookie-policy',4,'Botble\\Page\\Models\\Page','','2024-07-27 06:10:13','2024-07-27 06:10:13'),(5,'galleries',5,'Botble\\Page\\Models\\Page','','2024-07-27 06:10:13','2024-07-27 06:10:13'),(6,'artificial-intelligence',1,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(7,'cybersecurity',2,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(8,'blockchain-technology',3,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(9,'5g-and-connectivity',4,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(10,'augmented-reality-ar',5,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(11,'green-technology',6,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(12,'quantum-computing',7,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(13,'edge-computing',8,'Botble\\Blog\\Models\\Category','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(14,'ai',1,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(15,'machine-learning',2,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(16,'neural-networks',3,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(17,'data-security',4,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(18,'blockchain',5,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(19,'cryptocurrency',6,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(20,'iot',7,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(21,'ar-gaming',8,'Botble\\Blog\\Models\\Tag','tag','2024-07-27 06:10:15','2024-07-27 06:10:15'),(22,'breakthrough-in-quantum-computing-computing-power-reaches-milestone',1,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(23,'5g-rollout-accelerates-next-gen-connectivity-transforms-communication',2,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(24,'tech-giants-collaborate-on-open-source-ai-framework',3,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(25,'spacex-launches-mission-to-establish-first-human-colony-on-mars',4,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(26,'cybersecurity-advances-new-protocols-bolster-digital-defense',5,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(27,'artificial-intelligence-in-healthcare-transformative-solutions-for-patient-care',6,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(28,'robotic-innovations-autonomous-systems-reshape-industries',7,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(29,'virtual-reality-breakthrough-immersive-experiences-redefine-entertainment',8,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(30,'innovative-wearables-track-health-metrics-and-enhance-well-being',9,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(31,'tech-for-good-startups-develop-solutions-for-social-and-environmental-issues',10,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(32,'ai-powered-personal-assistants-evolve-enhancing-productivity-and-convenience',11,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(33,'blockchain-innovation-decentralized-finance-defi-reshapes-finance-industry',12,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(34,'quantum-internet-secure-communication-enters-a-new-era',13,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(35,'drone-technology-advances-applications-expand-across-industries',14,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(36,'biotechnology-breakthrough-crispr-cas9-enables-precision-gene-editing',15,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(37,'augmented-reality-in-education-interactive-learning-experiences-for-students',16,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(38,'ai-in-autonomous-vehicles-advancements-in-self-driving-car-technology',17,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(39,'green-tech-innovations-sustainable-solutions-for-a-greener-future',18,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(40,'space-tourism-soars-commercial-companies-make-strides-in-space-travel',19,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(41,'humanoid-robots-in-everyday-life-ai-companions-and-assistants',20,'Botble\\Blog\\Models\\Post','','2024-07-27 06:10:15','2024-07-27 06:10:15'),(42,'sunset',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(43,'ocean-views',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(44,'adventure-time',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(45,'city-lights',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(46,'dreamscape',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(47,'enchanted-forest',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(48,'golden-hour',7,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(49,'serenity',8,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(50,'eternal-beauty',9,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(51,'moonlight-magic',10,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(52,'starry-night',11,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(53,'hidden-gems',12,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(54,'tranquil-waters',13,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(55,'urban-escape',14,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15'),(56,'twilight-zone',15,'Botble\\Gallery\\Models\\Gallery','galleries','2024-07-27 06:10:15','2024-07-27 06:10:15');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'AI',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(2,'Machine Learning',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(3,'Neural Networks',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(4,'Data Security',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(5,'Blockchain',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(6,'Cryptocurrency',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(7,'IoT',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15'),(8,'AR Gaming',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-07-27 06:10:15','2024-07-27 06:10:15');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'brenna.mante@hilpert.com',NULL,'$2y$12$VEHNoCl4pbEk0KRs0KGjFORdY4nTcLtRwGLbCHt0DHIwF2XuswAui',NULL,'2024-07-27 06:10:13','2024-07-27 06:10:13','Christa','Shields','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'RecentPostsWidget','footer_sidebar','ripple',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2024-07-27 06:10:19','2024-07-27 06:10:19'),(2,'RecentPostsWidget','top_sidebar','ripple',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2024-07-27 06:10:19','2024-07-27 06:10:19'),(3,'TagsWidget','primary_sidebar','ripple',0,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}','2024-07-27 06:10:19','2024-07-27 06:10:19'),(4,'BlogCategoriesWidget','primary_sidebar','ripple',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"display_posts_count\":\"yes\"}','2024-07-27 06:10:19','2024-07-27 06:10:19'),(5,'CustomMenuWidget','primary_sidebar','ripple',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Social\",\"menu_id\":\"social\"}','2024-07-27 06:10:19','2024-07-27 06:10:19'),(6,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','ripple',1,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Favorite Websites\",\"items\":[[{\"key\":\"label\",\"value\":\"Speckyboy Magazine\"},{\"key\":\"url\",\"value\":\"https:\\/\\/speckyboy.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Tympanus-Codrops\"},{\"key\":\"url\",\"value\":\"https:\\/\\/tympanus.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Botble Blog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/botble.com\\/blog\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Laravel Vietnam\"},{\"key\":\"url\",\"value\":\"https:\\/\\/blog.laravelvietnam.org\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"CreativeBlog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.creativebloq.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Archi Elite JSC\"},{\"key\":\"url\",\"value\":\"https:\\/\\/archielite.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}]]}','2024-07-27 06:10:19','2024-07-27 06:10:19'),(7,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','ripple',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"My Links\",\"items\":[[{\"key\":\"label\",\"value\":\"Home Page\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"\\/contact\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Green Technology\"},{\"key\":\"url\",\"value\":\"\\/green-technology\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Augmented Reality (AR) \"},{\"key\":\"url\",\"value\":\"\\/augmented-reality-ar\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Galleries\"},{\"key\":\"url\",\"value\":\"\\/galleries\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2024-07-27 06:10:19','2024-07-27 06:10:19');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-27 20:10:23
