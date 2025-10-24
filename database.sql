-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: laravel
-- ------------------------------------------------------
-- Server version	8.4.4

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
INSERT INTO `activations` VALUES (1,1,'nBHhzF9l8CuISqqRSA0V5wNXkqZaE88i',1,'2025-10-15 00:16:34','2025-10-15 00:16:34','2025-10-15 00:16:34');
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
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Dev\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Dev\\ACL\\Models\\User',
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
  `raw_content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `blocks_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'Prof. Wilmer Hoppe','prof-wilmer-hoppe','Molestiae est tenetur molestiae dolorem.','Pariatur harum libero quasi repellat. Aut dolorum expedita voluptate. Voluptatem enim voluptatibus consequatur in est mollitia in omnis. Quia non repudiandae rem sit et ut id. Similique nemo qui dolorem quia nesciunt enim et sunt. Voluptatem adipisci nisi quis aut nobis quasi dolorem. Cumque incidunt libero non similique eius et optio. Sed quasi rem aperiam qui. Dolor eius reiciendis id non. Nemo nam fugit voluptatem officia a nesciunt sit. Deserunt recusandae non autem dolor.','published',NULL,'2025-10-15 00:16:42','2025-10-15 00:16:42',NULL),(2,'Dr. Ronaldo Rogahn','dr-ronaldo-rogahn','Praesentium distinctio omnis quia repellendus.','Cum excepturi libero aliquam sequi iste nulla. Ad eos et quis inventore vero at et. Quia deserunt est animi. Facere omnis saepe nobis quas et blanditiis. Harum qui soluta et illum accusamus. Excepturi vitae id totam velit. Enim repudiandae perferendis error dignissimos aspernatur sapiente. Aut et occaecati est laboriosam eos voluptatem. Aut explicabo quisquam voluptatum cum iusto. Voluptatem est harum consequatur nihil. Tempora aliquid est sed enim sequi repellat.','published',NULL,'2025-10-15 00:16:42','2025-10-15 00:16:42',NULL),(3,'Candace Kuhic','candace-kuhic','Ut sunt voluptatum eveniet aut ut eveniet et.','Voluptatem odio voluptatem autem alias. Cum ab est praesentium ullam. Et enim magnam amet sit et. Sed voluptates voluptatem eaque facilis consequatur in ullam. Autem ipsum iste illum corrupti voluptatem eius. Quae itaque qui suscipit modi occaecati aut ratione. Velit ex temporibus quaerat suscipit consequatur et. Pariatur assumenda eius numquam et. Qui et qui magni. Voluptatum dolorem quasi aliquam.','published',NULL,'2025-10-15 00:16:42','2025-10-15 00:16:42',NULL),(4,'Prof. Ariel Schimmel','prof-ariel-schimmel','Enim soluta provident dolores aut et enim.','Soluta porro facilis officia. Tempora rerum aperiam quis in qui ipsam assumenda. Ab perspiciatis ad ipsam quam architecto eligendi ipsam. Aut id corrupti incidunt magnam. Reprehenderit recusandae laboriosam aliquam omnis alias neque veritatis. A reprehenderit quibusdam est ut et qui. Repudiandae ut et nulla optio iste sed. Tempore maxime libero qui explicabo est. Qui tenetur repellat molestiae quibusdam id. Aut rerum quasi enim voluptatibus aut.','published',NULL,'2025-10-15 00:16:42','2025-10-15 00:16:42',NULL),(5,'Ozella Wuckert','ozella-wuckert','Cupiditate sed voluptatum dolore atque.','Consectetur mollitia est doloribus dolorum quis exercitationem ut est. Sunt placeat id vero et repellat hic incidunt ut. Dolore ducimus aut delectus odit. Perspiciatis eius ullam eaque laborum necessitatibus officia. Distinctio itaque quia veniam sed. Voluptate quo ut repellendus et ut tempore sunt ipsa. Qui nihil aut omnis placeat voluptatem aut. Rerum dolore qui qui aliquam. Reiciendis ipsam a ipsa odio maiores molestiae.','published',NULL,'2025-10-15 00:16:42','2025-10-15 00:16:42',NULL);
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
  `raw_content` longtext COLLATE utf8mb4_unicode_ci,
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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
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
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Dev\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
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
INSERT INTO `categories` VALUES (1,'Artificial Intelligence',0,'Consequatur consequuntur debitis similique atque. Facilis architecto voluptatem omnis nam. Animi culpa rem eveniet at vero corrupti.','published',1,'Dev\\ACL\\Models\\User',NULL,0,0,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(2,'Cybersecurity',0,'Dolore modi necessitatibus odit non sint. Aspernatur quam optio nihil ipsa nisi. Maxime sit aut deserunt consequatur culpa.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(3,'Blockchain Technology',0,'Ea esse dolor sed cumque placeat vel. Debitis adipisci sunt earum qui fugiat. Quas repellendus et quibusdam ab rerum eius. Voluptates minus libero quibusdam.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(4,'5G and Connectivity',0,'Ut rerum dolores aut quia maxime. Voluptatum ex in ipsa omnis non.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(5,'Augmented Reality (AR)',0,'Quas iure quis placeat qui tempore in. Minima doloribus facere nisi et iste totam magni.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(6,'Green Technology',0,'Labore facere deleniti alias. Atque magni possimus tempore saepe consequuntur nihil repellat. Tenetur quas saepe id natus officia sit.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(7,'Quantum Computing',0,'Doloribus est officiis nostrum eius dicta est in est. Accusamus in sed voluptatibus harum eum praesentium. Qui esse soluta dolor.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(8,'Edge Computing',0,'Exercitationem eum sint accusamus voluptatem culpa. Ut ut velit iste nemo est. Repudiandae ut illum libero ipsum facere magnam consequatur. Vitae explicabo sed eligendi dolore et.','published',1,'Dev\\ACL\\Models\\User',NULL,0,1,0,'2025-10-15 00:16:36','2025-10-15 00:16:36');
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
INSERT INTO `contacts` VALUES (1,'Zion Rogahn','asha11@example.com','1-720-792-3947','349 Jadyn Plains\nShainabury, TN 52423-0100','Autem sed nemo deserunt perspiciatis eveniet.','Quo modi omnis iste. Ut culpa iste aut temporibus beatae distinctio. Odit eum asperiores voluptatem harum. Velit nisi dolore nisi sequi commodi. Maxime cumque voluptatem sed id eius. Quasi suscipit eligendi vel cumque aut ab. Aliquam distinctio id non eligendi est amet laborum. Accusamus iusto maxime saepe assumenda quaerat optio. Aut repellendus numquam quidem est. Aut ex facere debitis necessitatibus aspernatur. Est eius officiis debitis laborum.',NULL,'read','2025-10-15 00:16:42','2025-10-15 00:16:42'),(2,'Devin Pfannerstill','adriana45@example.org','+1-478-386-7040','830 Morar Neck Apt. 251\nSpencerborough, ID 85662-9266','Ut ipsum rerum aperiam voluptas.','Consequatur unde possimus natus natus rerum. Cum sed dolores nulla et sequi. Illo veritatis quas magni nostrum. Sint saepe consequatur nulla doloremque sit nesciunt natus. In autem omnis sit occaecati eum et. Laboriosam non vel sed voluptatem error rerum. Optio similique qui fugiat quis perferendis. Quia consequatur dolores harum harum provident neque et. Nemo velit iusto possimus atque.',NULL,'unread','2025-10-15 00:16:42','2025-10-15 00:16:42'),(3,'Mr. Lamar Green DVM','stephon.schimmel@example.net','(334) 884-9961','8894 Harvey Plains\nEast Candelario, TN 66417','Aspernatur qui enim et laudantium eum tenetur.','Consectetur molestiae magni nulla dolores nihil fuga. Labore eaque consequatur eos illo libero ut. Blanditiis sunt necessitatibus at repellendus maiores. Et eligendi qui minima. Aut voluptatem magnam iste eum porro sit dolorum omnis. Neque repellat delectus libero incidunt nihil mollitia est. Sunt sint incidunt velit soluta aut eius ut. Qui voluptatem deleniti fugit incidunt ratione nulla corrupti aut. Quaerat odio autem quisquam nihil vel voluptas.',NULL,'unread','2025-10-15 00:16:42','2025-10-15 00:16:42'),(4,'Stephon Marquardt','hauck.mariana@example.com','(515) 920-1713','790 Hazel Bypass\nFadelside, WV 90834','Doloribus numquam optio cumque aliquam animi.','Officia itaque minima debitis doloremque. Dolor sunt ut ea ea libero. Eveniet dolor ullam sit quisquam officia iste doloribus quibusdam. Et laboriosam numquam nobis. Totam aut excepturi voluptas perspiciatis voluptatem quis. Id iusto et eos quia et deserunt voluptatibus. Nihil eos magni beatae et minima. Nisi adipisci esse architecto. Quia rerum saepe non debitis sed aperiam magnam. Modi molestiae blanditiis non consectetur sunt. Ullam magnam error voluptate veniam quae voluptatem.',NULL,'unread','2025-10-15 00:16:42','2025-10-15 00:16:42'),(5,'Sage Gottlieb','pattie.ziemann@example.org','+19252593166','90905 Kristoffer Pass Apt. 688\nBernardton, ND 06208-5701','Aut eum molestias voluptas.','Dicta voluptas voluptatem officia nam id placeat fugiat est. Quia nihil praesentium porro qui. Enim quam ut eligendi est assumenda veritatis. Natus earum cumque omnis id placeat nihil. Corrupti et reiciendis voluptatem dolores modi quam. Et illum quis dolor aperiam corrupti distinctio magni. Quo iusto earum ea eos aliquam. Quis impedit nihil velit repudiandae ipsam. Consequatur tempore perferendis repellendus eos eos alias. Accusantium provident pariatur dicta quo.',NULL,'unread','2025-10-15 00:16:42','2025-10-15 00:16:42'),(6,'Abdiel Fisher','nathanial.legros@example.com','458.330.3472','408 Mackenzie Station Apt. 676\nWest Tessieburgh, OH 36833','Qui facilis et officia deleniti.','Et enim praesentium dolorem ut ipsam saepe et. Dolor vero corrupti molestiae cumque soluta et ipsam. Ratione nam asperiores omnis illum quo. Iusto itaque assumenda dolor vitae. Quae dolore tenetur reprehenderit vel sequi eligendi. Dolor iure nesciunt rerum quaerat quia expedita. Cum vero distinctio deserunt autem animi. Eos ut ut voluptas magni dignissimos. Nam incidunt dolore quasi aut vero dolorem. Et in aperiam rerum provident distinctio et voluptatem. Sed cum ut dolore quia est qui.',NULL,'read','2025-10-15 00:16:42','2025-10-15 00:16:42'),(7,'Angeline Kuhn','russel.franecki@example.com','+1-352-396-6615','981 Larson Turnpike\nNew Kenyatown, NH 81017','Voluptates qui quaerat omnis nihil.','Ut quas corporis dolor velit consequatur qui ut. Consequatur occaecati dolorem et voluptas nostrum totam. Amet eligendi veniam nobis et ipsa. In asperiores provident quas aut expedita. Dolores porro dignissimos vero sed totam. Est laborum vero natus quo libero aut voluptatum deleniti. Ipsam tenetur expedita odit enim similique saepe est sit. Vitae ut incidunt illo eos. Magni in consequatur natus non. Aliquam et maxime debitis consectetur ut.',NULL,'read','2025-10-15 00:16:42','2025-10-15 00:16:42'),(8,'Danika Moore','raleigh67@example.org','+1-626-750-7247','31827 Frida Pass\nPort Golda, CT 02254-6452','Nisi consequatur accusantium fugit eaque sunt a.','Architecto eveniet ut voluptas et odit et aut. Officia consequatur pariatur illo est qui error. At unde earum recusandae quasi. Dicta commodi ea ex quaerat. Pariatur asperiores ea quaerat est dolorem aperiam. Enim tempora blanditiis aut voluptas enim. Soluta excepturi dolorem eveniet recusandae veniam ea.',NULL,'read','2025-10-15 00:16:42','2025-10-15 00:16:42'),(9,'Jovany Kulas','gerard.rice@example.org','+1-407-352-0737','654 Heller Island Apt. 326\nPort Stellachester, RI 09412','Et et modi eligendi molestias qui.','Quidem consequatur repellendus magni aliquid culpa. Repellendus eos est itaque. Cum soluta voluptates voluptatem. Corrupti repudiandae blanditiis explicabo. Nisi sit repudiandae odit sed saepe commodi nam. Neque dolorem soluta est ea reiciendis itaque enim suscipit. Veniam nesciunt explicabo pariatur quod veniam et a.',NULL,'unread','2025-10-15 00:16:42','2025-10-15 00:16:42'),(10,'Prof. Kip Bashirian MD','legros.deion@example.com','+1-325-870-4512','44396 Littel Green Apt. 208\nNew Columbus, CT 47177','A quae ipsa ut quaerat.','Dignissimos tenetur eum neque ut neque. Nemo accusantium architecto aut qui omnis veritatis. Doloribus dolorem sint consequatur suscipit possimus enim. Eum quia architecto consequuntur voluptates enim et ab. Cupiditate iusto laborum placeat. Consequatur quae blanditiis ad et impedit et accusamus.',NULL,'read','2025-10-15 00:16:42','2025-10-15 00:16:42');
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
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_groups`
--

LOCK TABLES `field_groups` WRITE;
/*!40000 ALTER TABLE `field_groups` DISABLE KEYS */;
INSERT INTO `field_groups` VALUES (1,'Post Additional Information','[[{\"name\":\"model_name\",\"type\":\"==\",\"value\":\"Dev\\\\Blog\\\\Models\\\\Post\"}]]',0,1,1,'published','2025-10-15 00:16:42','2025-10-15 00:16:42'),(2,'Page Custom Fields','[[{\"name\":\"model_name\",\"type\":\"==\",\"value\":\"Dev\\\\Page\\\\Models\\\\Page\"}]]',1,1,1,'published','2025-10-15 00:16:42','2025-10-15 00:16:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_items`
--

LOCK TABLES `field_items` WRITE;
/*!40000 ALTER TABLE `field_items` DISABLE KEYS */;
INSERT INTO `field_items` VALUES (1,1,NULL,0,'Post Options','post_options','checkbox','Select post display options','{\"selectChoices\":\"featured:Featured post\\nsticky:Sticky post\\nshow_author:Show author\\nallow_comments:Allow comments\\nshow_date:Show publish date\"}'),(2,1,NULL,1,'Reading Time','reading_time','number','Estimated reading time in minutes','{\"placeholderText\":\"5\",\"defaultValue\":\"5\",\"min\":1,\"max\":60}'),(3,1,NULL,2,'External Source','external_source','text','Link to external source or reference','{\"placeholderText\":\"https:\\/\\/example.com\\/article\"}'),(4,1,NULL,3,'Post Type','post_type','select','Select the type of post','{\"selectChoices\":\"article:Article\\nnews:News\\ntutorial:Tutorial\\nreview:Review\",\"defaultValue\":\"article\"}'),(5,1,NULL,4,'Custom Excerpt','custom_excerpt','textarea','Custom excerpt for social media sharing','{\"placeholderText\":\"Enter a brief summary...\",\"rows\":3}'),(6,1,NULL,5,'Sponsored By','sponsored_by','text','Sponsor name (if applicable)','{\"placeholderText\":\"Company name\"}'),(7,2,NULL,0,'Hero Banner','hero_banner','image','Upload a hero banner image for this page','{\"allow_thumb\":true}'),(8,2,NULL,1,'Page Subtitle','page_subtitle','text','Add a subtitle or tagline for this page','{\"placeholderText\":\"Enter page subtitle\"}'),(9,2,NULL,2,'Call to Action','cta_button','text','Call to action button text','{\"placeholderText\":\"Learn More\"}'),(10,2,NULL,3,'CTA Link','cta_link','text','URL for the call to action button','{\"placeholderText\":\"https:\\/\\/example.com\\/contact\"}'),(11,2,NULL,4,'Page Layout','page_layout','radio','Select the page layout','{\"selectChoices\":\"default:Default Layout\\nsidebar-left:Left Sidebar\\nsidebar-right:Right Sidebar\\nfull-width:Full Width\",\"defaultValue\":\"default\"}'),(12,2,NULL,5,'Page Settings','page_settings','checkbox','Select page display options','{\"selectChoices\":\"hide_title:Hide page title\\nhide_breadcrumb:Hide breadcrumb\\nhide_sidebar:Hide sidebar\\nhide_footer:Hide footer\"}');
/*!40000 ALTER TABLE `field_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_comments`
--

DROP TABLE IF EXISTS `fob_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reply_to` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fob_comments_author_type_author_id_index` (`author_type`,`author_id`),
  KEY `fob_comments_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `fob_comments_reply_to_index` (`reply_to`),
  KEY `fob_comments_reference_url_index` (`reference_url`),
  KEY `fob_comments_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_comments`
--

LOCK TABLES `fob_comments` WRITE;
/*!40000 ALTER TABLE `fob_comments` DISABLE KEYS */;
INSERT INTO `fob_comments` VALUES (1,NULL,'Dev\\Member\\Models\\Member',5,'Dev\\Blog\\Models\\Post',6,'https://fsofts.com','Mrs. Noemi Huel','flo.howe@gmail.com','https://friendsofcms.fsofts.com','This is really helpful, thank you!','approved','181.9.6.170','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 5.0; Trident/5.0)','2025-09-29 17:05:54','2025-10-15 00:16:42'),(2,NULL,'Dev\\Member\\Models\\Member',8,'Dev\\Blog\\Models\\Post',10,'https://fsofts.com','Mr. Arne Dibbert','crystal68@hotmail.com','https://friendsofcms.fsofts.com','I found this article to be quite informative.','approved','247.214.203.29','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2 rv:6.0; nl-NL) AppleWebKit/533.2.6 (KHTML, like Gecko) Version/4.0 Safari/533.2.6','2025-10-05 00:36:04','2025-10-15 00:16:42'),(3,NULL,'Dev\\Member\\Models\\Member',14,'Dev\\Blog\\Models\\Post',16,'https://fsofts.com','Prof. Loraine Reinger Jr.','fahey.erna@hotmail.com','https://friendsofcms.fsofts.com','Wow, I never knew about this before!','approved','174.209.52.160','Mozilla/5.0 (compatible; MSIE 5.0; Windows 98; Trident/3.1)','2025-09-22 01:08:45','2025-10-15 00:16:42'),(4,NULL,'Dev\\Member\\Models\\Member',7,'Dev\\Blog\\Models\\Post',12,'https://fsofts.com','Ellie Breitenberg','gpacocha@eichmann.org','https://friendsofcms.fsofts.com','Great job on explaining such a complex topic.','approved','231.85.2.33','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.2; Trident/5.1)','2025-09-18 07:15:59','2025-10-15 00:16:42'),(5,NULL,'Dev\\Member\\Models\\Member',14,'Dev\\Blog\\Models\\Post',7,'https://fsofts.com','Jed Schaden','enos37@hotmail.com','https://friendsofcms.fsofts.com','I have a question about the third paragraph.','approved','187.172.170.202','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_4 rv:3.0; sl-SI) AppleWebKit/535.3.6 (KHTML, like Gecko) Version/5.0 Safari/535.3.6','2025-10-12 11:37:14','2025-10-15 00:16:42'),(6,NULL,'Dev\\Member\\Models\\Member',5,'Dev\\Blog\\Models\\Post',13,'https://fsofts.com','Alaina Mertz','hartmann.janet@hahn.com','https://friendsofcms.fsofts.com','This article changed my perspective entirely.','approved','133.83.60.90','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_6) AppleWebKit/5312 (KHTML, like Gecko) Chrome/36.0.815.0 Mobile Safari/5312','2025-09-30 10:26:32','2025-10-15 00:16:42'),(7,NULL,'Dev\\Member\\Models\\Member',8,'Dev\\Blog\\Models\\Post',11,'https://fsofts.com','Jordan Spinka','egreenholt@yahoo.com','https://friendsofcms.fsofts.com','I appreciate the effort you put into this.','approved','239.9.197.23','Opera/9.87 (X11; Linux x86_64; en-US) Presto/2.9.207 Version/10.00','2025-09-27 05:26:26','2025-10-15 00:16:42'),(8,NULL,'Dev\\Member\\Models\\Member',13,'Dev\\Blog\\Models\\Post',15,'https://fsofts.com','Victoria Heathcote','tristian90@hotmail.com','https://friendsofcms.fsofts.com','This is exactly what I was looking for, thank you!','approved','194.255.28.178','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.2 (KHTML, like Gecko) Chrome/92.0.4327.86 Safari/537.2 Edg/92.01032.56','2025-10-05 17:45:53','2025-10-15 00:16:42'),(9,NULL,'Dev\\Member\\Models\\Member',7,'Dev\\Blog\\Models\\Post',20,'https://fsofts.com','Linda Trantow','oklein@gmail.com','https://friendsofcms.fsofts.com','I disagree with some points mentioned here, though.','approved','252.141.160.194','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5310 (KHTML, like Gecko) Chrome/38.0.870.0 Mobile Safari/5310','2025-10-05 03:44:14','2025-10-15 00:16:42'),(10,NULL,'Dev\\Member\\Models\\Member',12,'Dev\\Blog\\Models\\Post',13,'https://fsofts.com','Shaun Bernhard','rutherford.oceane@yahoo.com','https://friendsofcms.fsofts.com','Could you provide more examples to illustrate your point?','approved','102.175.136.252','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 5.1; Trident/5.0)','2025-09-15 02:00:02','2025-10-15 00:16:42'),(11,NULL,'Dev\\Member\\Models\\Member',11,'Dev\\Blog\\Models\\Post',16,'https://fsofts.com','Tatum Strosin','alba.rempel@hotmail.com','https://friendsofcms.fsofts.com','I wish there were more articles like this out there.','approved','45.74.216.207','Opera/8.80 (X11; Linux i686; en-US) Presto/2.11.168 Version/12.00','2025-09-21 16:24:10','2025-10-15 00:16:42'),(12,NULL,'Dev\\Member\\Models\\Member',2,'Dev\\Blog\\Models\\Post',19,'https://fsofts.com','Rita Strosin','rutherford.evelyn@howell.net','https://friendsofcms.fsofts.com','I\'m bookmarking this for future reference.','approved','210.152.53.180','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_2) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/88.0.4239.95 Safari/532.1 Edg/88.01065.56','2025-10-12 04:24:18','2025-10-15 00:16:42'),(13,NULL,'Dev\\Member\\Models\\Member',4,'Dev\\Blog\\Models\\Post',1,'https://fsofts.com','Murray Durgan','keyon.torp@hotmail.com','https://friendsofcms.fsofts.com','I\'ve shared this with my friends, they loved it!','approved','18.226.233.33','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_4 rv:5.0) Gecko/20121118 Firefox/35.0','2025-10-08 12:13:03','2025-10-15 00:16:42'),(14,NULL,'Dev\\Member\\Models\\Member',1,'Dev\\Blog\\Models\\Post',6,'https://fsofts.com','Uriel Lang','jamison.crona@shanahan.com','https://friendsofcms.fsofts.com','This article is a must-read for everyone interested in the topic.','approved','147.54.158.0','Mozilla/5.0 (Windows; U; Windows 98; Win 9x 4.90) AppleWebKit/534.49.5 (KHTML, like Gecko) Version/4.1 Safari/534.49.5','2025-10-02 10:19:28','2025-10-15 00:16:42'),(15,NULL,'Dev\\Member\\Models\\Member',2,'Dev\\Blog\\Models\\Post',9,'https://fsofts.com','Kattie Hills','jessy04@gmail.com','https://friendsofcms.fsofts.com','Thank you for shedding light on this important issue.','approved','151.114.59.90','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.0; Trident/3.1)','2025-10-09 20:38:15','2025-10-15 00:16:42'),(16,NULL,'Dev\\Member\\Models\\Member',7,'Dev\\Blog\\Models\\Post',19,'https://fsofts.com','Enrico Monahan','ophelia.beahan@sipes.com','https://friendsofcms.fsofts.com','I\'ve been searching for information on this topic, glad I found this article.','approved','36.211.37.114','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.1)','2025-10-13 19:09:33','2025-10-15 00:16:42'),(17,NULL,'Dev\\Member\\Models\\Member',12,'Dev\\Blog\\Models\\Post',6,'https://fsofts.com','Wilfred Barton','emmerich.marcella@crona.com','https://friendsofcms.fsofts.com','I\'m blown away by the insights shared in this article.','approved','217.178.227.29','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5310 (KHTML, like Gecko) Chrome/36.0.881.0 Mobile Safari/5310','2025-09-26 09:16:17','2025-10-15 00:16:42'),(18,NULL,'Dev\\Member\\Models\\Member',4,'Dev\\Blog\\Models\\Post',11,'https://fsofts.com','Dr. Timothy Romaguera II','name.barrows@hammes.org','https://friendsofcms.fsofts.com','This article tackles a complex topic with clarity.','approved','181.45.42.108','Mozilla/5.0 (Windows NT 5.0) AppleWebKit/5322 (KHTML, like Gecko) Chrome/38.0.878.0 Mobile Safari/5322','2025-09-24 15:02:47','2025-10-15 00:16:42'),(19,NULL,'Dev\\Member\\Models\\Member',10,'Dev\\Blog\\Models\\Post',5,'https://fsofts.com','Damian Altenwerth','kjohnston@vandervort.info','https://friendsofcms.fsofts.com','I\'m going to reflect on the ideas presented in this article.','approved','47.209.99.209','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_7_3 rv:3.0; sl-SI) AppleWebKit/535.48.7 (KHTML, like Gecko) Version/5.0.2 Safari/535.48.7','2025-09-20 11:43:38','2025-10-15 00:16:42'),(20,NULL,'Dev\\Member\\Models\\Member',8,'Dev\\Blog\\Models\\Post',7,'https://fsofts.com','Prof. Nasir Baumbach','littel.humberto@hotmail.com','https://friendsofcms.fsofts.com','The author\'s passion for the subject shines through in this article.','approved','6.221.100.11','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_8 rv:6.0) Gecko/20110120 Firefox/37.0','2025-09-23 19:57:09','2025-10-15 00:16:42'),(21,NULL,'Dev\\Member\\Models\\Member',11,'Dev\\Blog\\Models\\Post',6,'https://fsofts.com','Eldridge Tillman PhD','zkertzmann@heller.com','https://friendsofcms.fsofts.com','This article challenged my preconceptions in a thought-provoking way.','approved','18.238.88.205','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5361 (KHTML, like Gecko) Chrome/36.0.887.0 Mobile Safari/5361','2025-09-23 21:44:12','2025-10-15 00:16:42'),(22,NULL,'Dev\\Member\\Models\\Member',14,'Dev\\Blog\\Models\\Post',13,'https://fsofts.com','Jermaine Klocko','wchristiansen@fisher.com','https://friendsofcms.fsofts.com','I\'ve added this article to my reading list, it\'s worth revisiting.','approved','244.207.161.31','Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/537.0 (KHTML, like Gecko) Version/15.0 EdgiOS/85.01125.44 Mobile/15E148 Safari/537.0','2025-10-01 04:18:15','2025-10-15 00:16:42'),(23,NULL,'Dev\\Member\\Models\\Member',12,'Dev\\Blog\\Models\\Post',1,'https://fsofts.com','Ms. Nellie Pouros V','paris19@hotmail.com','https://friendsofcms.fsofts.com','This article offers practical advice that I can apply in real life.','approved','209.78.124.20','Mozilla/5.0 (X11; Linux x86_64; rv:6.0) Gecko/20240219 Firefox/35.0','2025-09-29 18:50:08','2025-10-15 00:16:42'),(24,NULL,'Dev\\Member\\Models\\Member',1,'Dev\\Blog\\Models\\Post',13,'https://fsofts.com','Bertram Bauch','nikolas07@johns.biz','https://friendsofcms.fsofts.com','I\'m going to recommend this article to my study group.','approved','233.180.99.73','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2 like Mac OS X) AppleWebKit/533.0 (KHTML, like Gecko) Version/15.0 EdgiOS/85.01096.97 Mobile/15E148 Safari/533.0','2025-09-24 05:30:08','2025-10-15 00:16:42'),(25,NULL,'Dev\\Member\\Models\\Member',3,'Dev\\Blog\\Models\\Post',3,'https://fsofts.com','Jeanie Herzog','beahan.gerson@gmail.com','https://friendsofcms.fsofts.com','The examples provided really helped me understand the concept better.','approved','32.0.208.13','Mozilla/5.0 (X11; Linux x86_64; rv:7.0) Gecko/20181117 Firefox/35.0','2025-10-03 18:01:52','2025-10-15 00:16:42'),(26,NULL,'Dev\\Member\\Models\\Member',0,'Dev\\Blog\\Models\\Post',5,'https://fsofts.com','Prof. Hiram Morar II','alvah.cruickshank@conn.biz','https://friendsofcms.fsofts.com','I resonate with the ideas presented here.','approved','165.40.162.117','Mozilla/5.0 (X11; Linux i686; rv:7.0) Gecko/20240324 Firefox/37.0','2025-09-30 13:42:41','2025-10-15 00:16:42'),(27,NULL,'Dev\\Member\\Models\\Member',8,'Dev\\Blog\\Models\\Post',19,'https://fsofts.com','Dr. Clare Deckow PhD','consuelo.shields@greenfelder.info','https://friendsofcms.fsofts.com','This article made me think critically about the topic.','approved','255.196.74.178','Opera/8.80 (Windows NT 5.1; en-US) Presto/2.8.268 Version/11.00','2025-10-14 01:53:36','2025-10-15 00:16:42'),(28,NULL,'Dev\\Member\\Models\\Member',5,'Dev\\Blog\\Models\\Post',12,'https://fsofts.com','Carolina Emmerich Jr.','edgardo00@yahoo.com','https://friendsofcms.fsofts.com','I\'ll definitely come back to this article for reference.','approved','98.25.48.103','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/92.0.4396.34 Safari/532.2 Edg/92.01138.33','2025-09-20 16:55:04','2025-10-15 00:16:42'),(29,NULL,'Dev\\Member\\Models\\Member',14,'Dev\\Blog\\Models\\Post',14,'https://fsofts.com','Dayton Wunsch','bergstrom.merl@thompson.biz','https://friendsofcms.fsofts.com','I\'ve shared this on social media, it\'s too good not to share.','approved','89.163.77.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5320 (KHTML, like Gecko) Chrome/39.0.820.0 Mobile Safari/5320','2025-09-25 11:15:21','2025-10-15 00:16:42'),(30,NULL,'Dev\\Member\\Models\\Member',3,'Dev\\Blog\\Models\\Post',8,'https://fsofts.com','Frederique Wiegand III','carroll.genevieve@zieme.info','https://friendsofcms.fsofts.com','This article presents a balanced view on a controversial topic.','approved','5.146.239.222','Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 5.2; Trident/3.1)','2025-10-01 10:55:23','2025-10-15 00:16:42'),(31,NULL,'Dev\\Member\\Models\\Member',2,'Dev\\Blog\\Models\\Post',10,'https://fsofts.com','Ms. Lizzie Schaefer','veronica.davis@boyer.biz','https://friendsofcms.fsofts.com','I\'m glad I stumbled upon this article, it\'s a gem.','approved','56.247.176.139','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/85.0.4736.34 Safari/532.1 EdgA/85.01001.81','2025-10-07 13:57:36','2025-10-15 00:16:42'),(32,NULL,'Dev\\Member\\Models\\Member',12,'Dev\\Blog\\Models\\Post',9,'https://fsofts.com','Florine Altenwerth','schaden.javon@yahoo.com','https://friendsofcms.fsofts.com','I\'ve been struggling with this, your article helped a lot.','approved','179.41.31.245','Opera/8.66 (Windows NT 6.0; nl-NL) Presto/2.11.332 Version/10.00','2025-10-05 08:47:27','2025-10-15 00:16:42'),(33,NULL,'Dev\\Member\\Models\\Member',7,'Dev\\Blog\\Models\\Post',7,'https://fsofts.com','Anna Jerde','breitenberg.abdul@langworth.com','https://friendsofcms.fsofts.com','I\'ve learned something new today, thanks to this article.','approved','131.11.213.51','Opera/9.41 (Windows NT 6.2; nl-NL) Presto/2.11.328 Version/11.00','2025-10-03 03:50:14','2025-10-15 00:16:42'),(34,NULL,'Dev\\Member\\Models\\Member',6,'Dev\\Blog\\Models\\Post',4,'https://fsofts.com','Mohamed Johns','leuschke.brisa@yahoo.com','https://friendsofcms.fsofts.com','Kudos to the author for a well-researched piece.','approved','11.180.107.196','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_5_3 rv:4.0) Gecko/20180819 Firefox/35.0','2025-10-03 19:06:06','2025-10-15 00:16:42'),(35,NULL,'Dev\\Member\\Models\\Member',10,'Dev\\Blog\\Models\\Post',5,'https://fsofts.com','Mrs. Daphney Koss III','zkovacek@skiles.info','https://friendsofcms.fsofts.com','I\'m impressed by the depth of knowledge demonstrated here.','approved','147.5.149.119','Opera/9.64 (X11; Linux x86_64; nl-NL) Presto/2.10.219 Version/11.00','2025-09-22 14:42:33','2025-10-15 00:16:42'),(36,NULL,'Dev\\Member\\Models\\Member',7,'Dev\\Blog\\Models\\Post',2,'https://fsofts.com','Donald Runolfsson','ynikolaus@yahoo.com','https://friendsofcms.fsofts.com','This article challenged my assumptions in a good way.','approved','49.232.37.47','Mozilla/5.0 (X11; Linux i686; rv:6.0) Gecko/20120819 Firefox/37.0','2025-09-17 22:08:52','2025-10-15 00:16:42'),(37,NULL,'Dev\\Member\\Models\\Member',11,'Dev\\Blog\\Models\\Post',11,'https://fsofts.com','Brock Lockman III','gerald71@gmail.com','https://friendsofcms.fsofts.com','I\'ve shared this with my colleagues, it\'s worth discussing.','approved','201.133.67.145','Opera/8.70 (Windows NT 4.0; en-US) Presto/2.9.211 Version/11.00','2025-09-29 20:17:36','2025-10-15 00:16:42'),(38,NULL,'Dev\\Member\\Models\\Member',1,'Dev\\Blog\\Models\\Post',7,'https://fsofts.com','Nikita Mills','lbradtke@rippin.com','https://friendsofcms.fsofts.com','The information presented here is very valuable.','approved','181.54.209.44','Mozilla/5.0 (Windows NT 5.0) AppleWebKit/5341 (KHTML, like Gecko) Chrome/36.0.847.0 Mobile Safari/5341','2025-10-05 03:57:40','2025-10-15 00:16:42'),(39,NULL,'Dev\\Member\\Models\\Member',13,'Dev\\Blog\\Models\\Post',20,'https://fsofts.com','Geovany Kovacek','danial98@conn.net','https://friendsofcms.fsofts.com','You have a talent for explaining complex topics clearly.','approved','105.86.223.233','Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/535.2 (KHTML, like Gecko) Version/15.0 EdgiOS/84.01048.70 Mobile/15E148 Safari/535.2','2025-10-07 15:29:32','2025-10-15 00:16:42'),(40,NULL,'Dev\\Member\\Models\\Member',10,'Dev\\Blog\\Models\\Post',7,'https://fsofts.com','Mrs. Ofelia Rowe II','mateo76@barton.com','https://friendsofcms.fsofts.com','I\'m inspired to learn more about this after reading your article.','approved','249.209.13.71','Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X; en-US) AppleWebKit/533.40.6 (KHTML, like Gecko) Version/4.0.5 Mobile/8B112 Safari/6533.40.6','2025-10-13 09:08:24','2025-10-15 00:16:42'),(41,NULL,'Dev\\Member\\Models\\Member',3,'Dev\\Blog\\Models\\Post',11,'https://fsofts.com','Madeline Herman','reuben.windler@yahoo.com','https://friendsofcms.fsofts.com','This article deserves wider recognition.','approved','202.104.184.155','Mozilla/5.0 (compatible; MSIE 10.0; Windows CE; Trident/3.0)','2025-09-15 23:47:20','2025-10-15 00:16:42'),(42,NULL,'Dev\\Member\\Models\\Member',1,'Dev\\Blog\\Models\\Post',8,'https://fsofts.com','Leola Konopelski','laron69@krajcik.net','https://friendsofcms.fsofts.com','I\'m grateful for the insights shared in this piece.','approved','107.46.191.214','Mozilla/5.0 (Windows; U; Windows NT 6.2) AppleWebKit/533.33.6 (KHTML, like Gecko) Version/5.0.3 Safari/533.33.6','2025-10-14 21:04:45','2025-10-15 00:16:42'),(43,NULL,'Dev\\Member\\Models\\Member',12,'Dev\\Blog\\Models\\Post',11,'https://fsofts.com','Felipe Turner','valentine.wunsch@beier.net','https://friendsofcms.fsofts.com','The author presents a balanced view on a controversial topic.','approved','45.113.28.79','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5320 (KHTML, like Gecko) Chrome/37.0.809.0 Mobile Safari/5320','2025-09-19 17:06:50','2025-10-15 00:16:42'),(44,NULL,'Dev\\Member\\Models\\Member',10,'Dev\\Blog\\Models\\Post',16,'https://fsofts.com','Adrienne Conroy','elisha80@hills.com','https://friendsofcms.fsofts.com','I\'m glad I stumbled upon this article, it\'s','approved','18.93.23.81','Opera/8.59 (X11; Linux i686; sl-SI) Presto/2.12.272 Version/11.00','2025-09-17 16:17:10','2025-10-15 00:16:42'),(45,NULL,'Dev\\Member\\Models\\Member',10,'Dev\\Blog\\Models\\Post',15,'https://fsofts.com','Eveline Kessler IV','heidenreich.stacy@abshire.com','https://friendsofcms.fsofts.com','I\'ve been searching for information on this topic, glad I found this article. It\'s incredibly insightful and provides a comprehensive overview of the subject matter. I appreciate the effort put into researching and writing this piece. It\'s truly eye-opening and has given me a new perspective. Thank you for sharing your knowledge with us!','approved','214.218.54.216','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5342 (KHTML, like Gecko) Chrome/37.0.889.0 Mobile Safari/5342','2025-09-26 08:40:17','2025-10-15 00:16:42'),(46,NULL,'Dev\\Member\\Models\\Member',11,'Dev\\Blog\\Models\\Post',16,'https://fsofts.com','Elisa Pacocha','ogaylord@corkery.com','https://friendsofcms.fsofts.com','This article is a masterpiece! It dives deep into the topic and offers valuable insights that are both thought-provoking and enlightening. The author\'s expertise is evident throughout, making it a compelling read from start to finish. I\'ll definitely be coming back to this for reference in the future.','approved','213.172.140.173','Opera/8.60 (X11; Linux i686; en-US) Presto/2.12.298 Version/10.00','2025-10-10 18:53:26','2025-10-15 00:16:42'),(47,NULL,'Dev\\Member\\Models\\Member',8,'Dev\\Blog\\Models\\Post',17,'https://fsofts.com','Dr. Marisa Smitham','bethel43@hotmail.com','https://friendsofcms.fsofts.com','I\'m amazed by the depth of analysis in this article. It covers a wide range of aspects related to the topic, providing a comprehensive understanding. The clarity of explanation is commendable, making complex concepts easy to grasp. This article has enriched my understanding and sparked further curiosity. Kudos to the author!','approved','147.196.25.155','Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.0; Trident/4.1)','2025-10-05 05:15:13','2025-10-15 00:16:42');
/*!40000 ALTER TABLE `fob_comments` ENABLE KEYS */;
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
INSERT INTO `galleries` VALUES (1,'Tech Conference 2024','Annual technology conference featuring keynote speakers, workshops, and networking opportunities for industry professionals.',1,0,'news/6.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(2,'Product Launch Event','Exclusive unveiling of our latest product line with live demonstrations and Q&amp;A sessions with the development team.',1,0,'news/7.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(3,'Team Building Retreat','Company-wide retreat focused on collaboration, innovation, and strengthening team bonds in a relaxed environment.',1,0,'news/8.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(4,'Innovation Summit','Two-day summit bringing together thought leaders to discuss emerging technologies and future trends.',1,0,'news/9.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(5,'Developer Meetup','Monthly gathering of developers to share knowledge, discuss best practices, and collaborate on open-source projects.',1,0,'news/10.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(6,'AI Workshop Series','Hands-on workshops covering machine learning, neural networks, and practical AI applications.',1,0,'news/11.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(7,'Startup Showcase','Platform for emerging startups to present their innovative solutions to investors and industry experts.',0,0,'news/12.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(8,'Company Anniversary','Celebrating our journey with employees, partners, and customers who made our success possible.',0,0,'news/13.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(9,'Hackathon Weekend','48-hour coding marathon where teams compete to build innovative solutions to real-world problems.',0,0,'news/14.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(10,'Industry Awards Night','Annual ceremony recognizing excellence and innovation in technology across various categories.',0,0,'news/15.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(11,'New Office Opening','Grand opening of our state-of-the-art facility designed to foster creativity and collaboration.',0,0,'news/16.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(12,'Community Outreach','Initiatives focused on giving back to the community through education and technology access programs.',0,0,'news/17.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(13,'Tech Talks Series','Weekly presentations by industry experts covering cutting-edge technologies and best practices.',0,0,'news/18.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(14,'Partnership Celebration','Commemorating strategic partnerships that drive innovation and mutual growth.',0,0,'news/19.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(15,'Year in Review','Annual retrospective highlighting achievements, milestones, and setting vision for the future.',0,0,'news/20.jpg',1,'published','2025-10-15 00:16:36','2025-10-15 00:16:36');
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
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',1,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(2,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',2,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(3,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',3,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(4,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',4,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(5,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',5,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(6,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',6,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(7,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',7,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(8,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',8,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(9,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',9,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(10,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',10,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(11,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',11,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(12,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',12,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(13,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',13,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(14,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',14,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36'),(15,'[{\"img\":\"news\\/1.jpg\",\"description\":\"Keynote speaker presenting on stage to packed auditorium\"},{\"img\":\"news\\/2.jpg\",\"description\":\"Team collaboration during breakout session\"},{\"img\":\"news\\/3.jpg\",\"description\":\"Networking event with industry professionals\"},{\"img\":\"news\\/4.jpg\",\"description\":\"Product demonstration at exhibition booth\"},{\"img\":\"news\\/5.jpg\",\"description\":\"Panel discussion with technology leaders\"},{\"img\":\"news\\/6.jpg\",\"description\":\"Hands-on coding workshop in progress\"},{\"img\":\"news\\/7.jpg\",\"description\":\"Award ceremony moment with winner on stage\"},{\"img\":\"news\\/8.jpg\",\"description\":\"Innovative product showcase and demo area\"},{\"img\":\"news\\/9.jpg\",\"description\":\"Team celebrating project completion\"},{\"img\":\"news\\/10.jpg\",\"description\":\"Audience engaged in Q&A session\"},{\"img\":\"news\\/11.jpg\",\"description\":\"Workshop participants working on laptops\"},{\"img\":\"news\\/12.jpg\",\"description\":\"Startup pitch presentation to investors\"},{\"img\":\"news\\/13.jpg\",\"description\":\"Company executives cutting ribbon at opening\"},{\"img\":\"news\\/14.jpg\",\"description\":\"Community members learning new skills\"},{\"img\":\"news\\/15.jpg\",\"description\":\"Technical demonstration of new features\"},{\"img\":\"news\\/16.jpg\",\"description\":\"Partners signing collaboration agreement\"},{\"img\":\"news\\/17.jpg\",\"description\":\"Team brainstorming in modern workspace\"},{\"img\":\"news\\/18.jpg\",\"description\":\"Conference attendees during coffee break\"},{\"img\":\"news\\/19.jpg\",\"description\":\"Innovation lab with latest technology\"},{\"img\":\"news\\/20.jpg\",\"description\":\"Closing ceremony group photo\"}]',15,'Dev\\Gallery\\Models\\Gallery','2025-10-15 00:16:36','2025-10-15 00:16:36');
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
INSERT INTO `language_meta` VALUES (1,'en_US','4b15778b5123cfa6cdb9dde25d61ffb5',1,'Dev\\Menu\\Models\\MenuLocation'),(2,'en_US','86a010c4b823b99131699ddd676b5ad0',1,'Dev\\Menu\\Models\\Menu'),(3,'en_US','db757ba2c2c95e2692c9a6d306a7e3c5',2,'Dev\\Menu\\Models\\Menu');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',71367,'users/1.jpg','[]','2025-10-15 00:16:33','2025-10-15 00:16:33',NULL,'public'),(2,0,'1','1',2,'image/jpeg',9803,'news/1.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(3,0,'10','10',2,'image/jpeg',9803,'news/10.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(4,0,'11','11',2,'image/jpeg',9803,'news/11.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(5,0,'12','12',2,'image/jpeg',9803,'news/12.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(6,0,'13','13',2,'image/jpeg',9803,'news/13.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(7,0,'14','14',2,'image/jpeg',9803,'news/14.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(8,0,'15','15',2,'image/jpeg',9803,'news/15.jpg','[]','2025-10-15 00:16:34','2025-10-15 00:16:34',NULL,'public'),(9,0,'16','16',2,'image/jpeg',9803,'news/16.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(10,0,'17','17',2,'image/jpeg',9803,'news/17.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(11,0,'18','18',2,'image/jpeg',9803,'news/18.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(12,0,'19','19',2,'image/jpeg',9803,'news/19.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(13,0,'2','2',2,'image/jpeg',9803,'news/2.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(14,0,'20','20',2,'image/jpeg',9803,'news/20.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(15,0,'3','3',2,'image/jpeg',9803,'news/3.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(16,0,'4','4',2,'image/jpeg',9803,'news/4.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(17,0,'5','5',2,'image/jpeg',9803,'news/5.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(18,0,'6','6',2,'image/jpeg',9803,'news/6.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(19,0,'7','7',2,'image/jpeg',9803,'news/7.jpg','[]','2025-10-15 00:16:35','2025-10-15 00:16:35',NULL,'public'),(20,0,'8','8',2,'image/jpeg',9803,'news/8.jpg','[]','2025-10-15 00:16:36','2025-10-15 00:16:36',NULL,'public'),(21,0,'9','9',2,'image/jpeg',9803,'news/9.jpg','[]','2025-10-15 00:16:36','2025-10-15 00:16:36',NULL,'public'),(22,0,'1','1',3,'image/jpeg',9803,'members/1.jpg','[]','2025-10-15 00:16:36','2025-10-15 00:16:36',NULL,'public'),(23,0,'10','10',3,'image/jpeg',9803,'members/10.jpg','[]','2025-10-15 00:16:36','2025-10-15 00:16:36',NULL,'public'),(24,0,'11','11',3,'image/jpeg',9803,'members/11.jpg','[]','2025-10-15 00:16:36','2025-10-15 00:16:36',NULL,'public'),(25,0,'12','12',3,'image/jpeg',9803,'members/12.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(26,0,'13','13',3,'image/jpeg',9803,'members/13.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(27,0,'14','14',3,'image/jpeg',9803,'members/14.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(28,0,'15','15',3,'image/jpeg',9803,'members/15.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(29,0,'2','2',3,'image/jpeg',9803,'members/2.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(30,0,'3','3',3,'image/jpeg',9803,'members/3.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(31,0,'4','4',3,'image/jpeg',9803,'members/4.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(32,0,'5','5',3,'image/jpeg',9803,'members/5.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(33,0,'6','6',3,'image/jpeg',9803,'members/6.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(34,0,'7','7',3,'image/jpeg',9803,'members/7.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(35,0,'8','8',3,'image/jpeg',9803,'members/8.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(36,0,'9','9',3,'image/jpeg',9803,'members/9.jpg','[]','2025-10-15 00:16:37','2025-10-15 00:16:37',NULL,'public'),(37,0,'favicon','favicon',4,'image/png',2180,'general/favicon.png','[]','2025-10-15 00:16:42','2025-10-15 00:16:42',NULL,'public'),(38,0,'logo','logo',4,'image/png',46109,'general/logo.png','[]','2025-10-15 00:16:42','2025-10-15 00:16:42',NULL,'public'),(39,0,'preloader','preloader',4,'image/gif',92769,'general/preloader.gif','[]','2025-10-15 00:16:43','2025-10-15 00:16:43',NULL,'public');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'users',NULL,'users',0,'2025-10-15 00:16:33','2025-10-15 00:16:33',NULL),(2,0,'news',NULL,'news',0,'2025-10-15 00:16:34','2025-10-15 00:16:34',NULL),(3,0,'members',NULL,'members',0,'2025-10-15 00:16:36','2025-10-15 00:16:36',NULL),(4,0,'general',NULL,'general',0,'2025-10-15 00:16:42','2025-10-15 00:16:42',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Torey','Koelpin','',NULL,'member@gmail.com','$2y$12$w8SjuwUcXabLl.Ao0YVe7el2j2FWtqPofFEa6o4Fr5gUHtrDGOEKe',22,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(2,'Neva','Murazik','',NULL,'mitchell38@oconnell.com','$2y$12$EYh24euTsBPitRTM1jon7.ShvXpUmaTK/Ls/FFGDWyuMv874vzINe',23,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(3,'Demetrius','Goodwin','',NULL,'lesch.willy@cruickshank.com','$2y$12$n5vjPLxypU6he9WIr/zZPuWLxg4XSD9MbDvctvU.HcKlyCw160Yn.',24,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(4,'Paula','Beatty','',NULL,'moen.jed@mayert.biz','$2y$12$fzGeRHdkcLbxDhDoMVLXwuyVCbbkmYcGioFWRj74AM0Z7kpnWVQRK',25,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(5,'Waylon','Okuneva','',NULL,'gail32@yahoo.com','$2y$12$R1FsCzd3jOFQNVavNl2.Z.9xiK6YlgeT8QS8c2gmzfkWAVsEx9qAe',26,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(6,'Nolan','Ratke','',NULL,'lyla.leannon@hotmail.com','$2y$12$W7wKQHPYS1SFCl4q3Zfy7.hF6hfyhjdulXwGZ8Pn5fPUUIv01Jbo.',27,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(7,'Broderick','Sauer','',NULL,'adouglas@yahoo.com','$2y$12$FhlnuRbgPR.M.ZWiL.pCJ.SUQxNisvK5yTt.wX2L6/uZg4446JEui',28,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(8,'Gaston','Morissette','',NULL,'runte.jonas@erdman.info','$2y$12$UAyG2sOLXWLCEAZiBxKVQuTBJ.ZnF/9qun5RIdAM3Rdf6URoJ7L.C',29,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(9,'Arvilla','Graham','',NULL,'tillman.sporer@murray.com','$2y$12$WJXLBNIsC5ogEegZpsy4xui1vMkGoMsVIiFu977SELBZJeSe5FZZW',30,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(10,'Ashtyn','Lueilwitz','',NULL,'anika.murphy@ernser.biz','$2y$12$0fZ8MgCEW4hJWZvgQoTJc.3zf5KzU6uG6VzHHxFQR15/atNOuF9T2',31,NULL,NULL,'2025-10-15 07:16:38',NULL,NULL,'2025-10-15 00:16:38','2025-10-15 00:16:38','published'),(11,'Sarah','Johnson','Senior Software Engineer with 10+ years of experience in cloud architecture and distributed systems.',NULL,'sarah.johnson@techmail.com','$2y$12$xZ4TlcVEsZXxxs5dNikY7OinBrJ8n2B.IYHIHNfQUGL30Mj8uvFuq',32,'1994-12-04','+1-432-399-5424','2023-12-10 17:19:27',NULL,NULL,'2023-12-10 10:19:27','2025-10-15 00:16:38','published'),(12,'Michael','Chen','Tech entrepreneur and startup advisor. Founded 3 successful SaaS companies.',NULL,'michael.chen@innovate.io','$2y$12$JHS6f1AB11d/AFJms0PRBOYB32wKCsAMvOmNuPQ6ehuZH./4OD.ZS',33,'1991-12-10','1-206-954-5260','2024-03-17 00:26:49',NULL,NULL,'2024-03-16 17:26:49','2025-10-15 00:16:38','published'),(13,'Emily','Rodriguez','UX/UI Designer specializing in mobile applications and accessibility.',NULL,'emily.rodriguez@designhub.com','$2y$12$uaW08FUWhbCOdbEaSNbkXuCOF68ujmCu1f8SPrRd.o.KtwPGIWyne',34,'1996-10-14','434.291.2135','2025-06-02 20:17:05',NULL,NULL,'2025-06-02 13:17:05','2025-10-15 00:16:38','published'),(14,'David','Kim','AI Research Scientist focusing on natural language processing and computer vision.',NULL,'david.kim@airesearch.org','$2y$12$cfAuhlQQjnuHa6pCdqHFfemxh6QMxVLDyl8dVhN.mqt9IQvOmNDIe',35,'1996-04-11','458-858-8566','2024-06-28 06:49:15',NULL,NULL,'2024-06-27 23:49:15','2025-10-15 00:16:38','published'),(15,'Jessica','Thompson','Cybersecurity expert and ethical hacker. CISSP certified with expertise in penetration testing.',NULL,'jessica.thompson@securitypro.net','$2y$12$0BRSxb50xX08wNc26s4ZX.Lw6CeToIx1CULra5kFj51XN6BiTlY8G',36,'1992-10-03','+1 (207) 384-5463','2023-11-08 18:52:37',NULL,NULL,'2023-11-08 11:52:37','2025-10-15 00:16:38','published');
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
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-10-15 00:16:42','2025-10-15 00:16:42');
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
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(2,1,0,NULL,NULL,'https://cms.fsofts.com/go/download-cms',NULL,1,'Purchase',NULL,'_blank',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(3,1,0,2,'Dev\\Page\\Models\\Page','/blog',NULL,2,'Blog',NULL,'_self',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(4,1,0,5,'Dev\\Page\\Models\\Page','/galleries',NULL,3,'Galleries',NULL,'_self',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(5,1,0,3,'Dev\\Page\\Models\\Page','/contact',NULL,4,'Contact',NULL,'_self',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(6,2,0,NULL,NULL,'https://facebook.com','ti ti-brand-facebook',0,'Facebook',NULL,'_blank',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(7,2,0,NULL,NULL,'https://twitter.com','ti ti-brand-x',1,'Twitter',NULL,'_blank',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(8,2,0,NULL,NULL,'https://github.com','ti ti-brand-github',2,'GitHub',NULL,'_blank',0,'2025-10-15 00:16:42','2025-10-15 00:16:42'),(9,2,0,NULL,NULL,'https://linkedin.com','ti ti-brand-linkedin',3,'Linkedin',NULL,'_blank',0,'2025-10-15 00:16:42','2025-10-15 00:16:42');
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
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-10-15 00:16:42','2025-10-15 00:16:42'),(2,'Social','social','published','2025-10-15 00:16:42','2025-10-15 00:16:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(36,'2024_07_12_100000_change_random_hash_for_media',1),(37,'2024_09_30_024515_create_sessions_table',1),(38,'2024_12_19_000001_create_device_tokens_table',1),(39,'2024_12_19_000002_create_push_notifications_table',1),(40,'2024_12_19_000003_create_push_notification_recipients_table',1),(41,'2024_12_30_000001_create_user_settings_table',1),(42,'2025_07_06_030754_add_phone_to_users_table',1),(43,'2025_07_31_add_performance_indexes_to_slugs_table',1),(44,'2024_04_27_100730_improve_analytics_setting',2),(45,'2015_06_29_025744_create_audit_history',3),(46,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(47,'2025_05_05_000001_add_user_type_to_audit_histories_table',3),(48,'2017_02_13_034601_create_blocks_table',4),(49,'2021_12_03_081327_create_blocks_translations',4),(50,'2024_09_05_071942_add_raw_content_to_blocks_table',4),(51,'2015_06_18_033822_create_blog_table',5),(52,'2021_02_16_092633_remove_default_value_for_author_type',5),(53,'2021_12_03_030600_create_blog_translations',5),(54,'2022_04_19_113923_add_index_to_table_posts',5),(55,'2023_08_29_074620_make_column_author_id_nullable',5),(56,'2024_07_30_091615_fix_order_column_in_categories_table',5),(57,'2025_01_06_033807_add_default_value_for_categories_author_type',5),(58,'2016_06_17_091537_create_contacts_table',6),(59,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(60,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(61,'2024_03_25_000001_update_captcha_settings_for_contact',6),(62,'2024_04_19_063914_create_custom_fields_table',6),(63,'2017_03_27_150646_re_create_custom_field_tables',7),(64,'2022_04_30_030807_table_custom_fields_translation_table',7),(65,'2024_01_16_050056_create_comments_table',8),(66,'2016_10_13_150201_create_galleries_table',9),(67,'2021_12_03_082953_create_gallery_translations',9),(68,'2022_04_30_034048_create_gallery_meta_translations_table',9),(69,'2023_08_29_075308_make_column_user_id_nullable',9),(70,'2016_10_03_032336_create_languages_table',10),(71,'2023_09_14_022423_add_index_for_language_table',10),(72,'2021_10_25_021023_fix-priority-load-for-language-advanced',11),(73,'2021_12_03_075608_create_page_translations',11),(74,'2023_07_06_011444_create_slug_translations_table',11),(75,'2017_10_04_140938_create_member_table',12),(76,'2023_10_16_075332_add_status_column',12),(77,'2024_03_25_000001_update_captcha_settings',12),(78,'2016_05_28_112028_create_system_request_logs_table',13),(79,'2025_04_08_040931_create_social_logins_table',14),(80,'2016_10_07_193005_create_translations_table',15),(81,'2023_12_12_105220_drop_translations_table',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[featured-posts enable_lazy_loading=\"yes\"][/featured-posts]</div><div>[recent-posts title=\"What’s new?\" enable_lazy_loading=\"yes\"][/recent-posts]</div><div>[featured-categories-posts title=\"Best for you\" category_id=\"\" enable_lazy_loading=\"yes\"][/featured-categories-posts]</div><div>[all-galleries limit=\"6\" title=\"Galleries\" enable_lazy_loading=\"yes\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(2,'Blog','---',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(3,'Contact','<h2>Get in Touch</h2><p>We\'d love to hear from you. Whether you have a question about features, trials, pricing, or anything else, our team is ready to answer all your questions.</p><h3>Our Office</h3><p>TechHub Innovation Center<br>123 Innovation Drive, Suite 400<br>San Francisco, CA 94105, USA</p><h3>Contact Information</h3><p>Phone: +1 (415) 555-0123</p><p>Email: hello@techhub.com</p><p>Support: support@techhub.com</p><h3>Business Hours</h3><p>Monday - Friday: 9:00 AM - 6:00 PM PST<br>Saturday - Sunday: Closed</p><p>[google-map]123 Innovation Drive, San Francisco, CA 94105, USA[/google-map]</p><h3>Send Us a Message</h3><p>Fill out the form below and we\'ll get back to you within 24 hours.</p><p>[contact-form][/contact-form]</p>',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(4,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(5,'Galleries','<div>[gallery title=\"Galleries\" enable_lazy_loading=\"yes\"][/gallery]</div>',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(6,'About Us','<h2>About TechHub</h2><p>Founded in 2020, TechHub has quickly become a leading voice in technology journalism and innovation. Our mission is to demystify technology and make it accessible to everyone.</p><h3>Our Mission</h3><p>To provide insightful, accurate, and timely technology news and analysis that helps our readers understand and navigate the rapidly evolving digital landscape.</p><h3>What We Cover</h3><ul><li>Breaking tech news and announcements</li><li>In-depth product reviews and comparisons</li><li>Industry analysis and market trends</li><li>Startup spotlights and founder interviews</li><li>Technology tutorials and how-to guides</li></ul><h3>Our Team</h3><p>Our team consists of experienced technology journalists, industry analysts, and passionate tech enthusiasts who bring diverse perspectives and expertise to our coverage.</p><h3>Join Our Community</h3><p>With over 1 million monthly readers, TechHub has built a vibrant community of technology professionals, enthusiasts, and curious minds. Join us in exploring the future of technology.</p>',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(7,'Privacy Policy','<h2>Privacy Policy</h2><p><em>Last updated: October 15, 2025</em></p><h3>1. Information We Collect</h3><p>We collect information you provide directly to us, such as when you create an account, subscribe to our newsletter, or contact us for support.</p><h3>2. How We Use Your Information</h3><p>We use the information we collect to provide, maintain, and improve our services, send you technical notices and support messages, and respond to your comments and questions.</p><h3>3. Information Sharing</h3><p>We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this policy.</p><h3>4. Data Security</h3><p>We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.</p><h3>5. Your Rights</h3><p>You have the right to access, update, or delete your personal information. You may also opt out of certain communications from us.</p><h3>6. Contact Us</h3><p>If you have any questions about this Privacy Policy, please contact us at privacy@techhub.com.</p>',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34'),(8,'Terms of Service','<h2>Terms of Service</h2><p><em>Effective date: October 15, 2025</em></p><h3>1. Acceptance of Terms</h3><p>By accessing and using TechHub, you agree to be bound by these Terms of Service and all applicable laws and regulations.</p><h3>2. Use License</h3><p>Permission is granted to temporarily download one copy of the materials on TechHub for personal, non-commercial transitory viewing only.</p><h3>3. Disclaimer</h3><p>The materials on TechHub are provided on an \'as is\' basis. TechHub makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties.</p><h3>4. Limitations</h3><p>In no event shall TechHub or its suppliers be liable for any damages arising out of the use or inability to use the materials on TechHub.</p><h3>5. Revisions</h3><p>TechHub may revise these terms of service at any time without notice. By using this website, you are agreeing to be bound by the current version of these terms of service.</p>',1,NULL,NULL,NULL,'published','2025-10-15 00:16:34','2025-10-15 00:16:34');
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
INSERT INTO `post_categories` VALUES (7,1),(8,1),(1,2),(2,2),(4,3),(3,3),(2,4),(7,4),(4,5),(5,5),(3,6),(7,6),(3,7),(5,7),(7,8),(8,8),(2,9),(5,9),(1,10),(5,10),(1,11),(8,11),(2,12),(8,13),(2,13),(3,14),(7,14),(7,15),(3,15),(2,16),(5,16),(3,17),(6,17),(7,18),(8,18),(7,19),(4,19),(3,20),(6,20);
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
INSERT INTO `post_tags` VALUES (7,1),(9,1),(16,1),(20,2),(5,2),(2,3),(16,3),(6,3),(5,4),(1,4),(16,4),(17,5),(1,5),(8,5),(18,6),(15,6),(18,7),(14,7),(6,7),(20,8),(17,8),(9,8),(14,9),(16,9),(19,9),(4,10),(20,10),(5,10),(7,11),(10,11),(4,11),(3,12),(14,12),(5,12),(15,13),(9,13),(13,13),(3,14),(1,14),(16,15),(3,15),(15,15),(8,16),(4,16),(9,16),(9,17),(10,17),(7,17),(5,18),(2,18),(1,19),(8,19),(10,19),(5,20),(6,20),(17,20);
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
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `posts` VALUES (1,'The Rise of Quantum Computing: IBM Unveils 1000-Qubit Processor','IBM announces a major breakthrough with their new 1000-qubit quantum processor, promising to solve complex problems in drug discovery, financial modeling, and climate research that would take classical computers millennia to compute.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I ever saw in another minute there was a long sleep you\'ve had!\' \'Oh, I\'ve had such a noise inside, no one else seemed inclined to say whether the pleasure of making a daisy-chain would be the right distance--but then I wonder what was on the hearth and grinning from ear to ear. \'Please would you like the wind, and the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit hurried by--the frightened Mouse splashed his way through the door, she ran off at once, and ran the faster, while more and more faintly came, carried on the Duchess\'s cook. She carried the pepper-box in her head, and she thought it had grown to her great delight it fitted! Alice opened the door of which was immediately suppressed by the officers of the deepest contempt. \'I\'ve seen a good many voices all talking at once, while all the creatures argue. It\'s enough to try the patience of an oyster!\' \'I wish I hadn\'t mentioned Dinah!\' she said to Alice, and.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice to herself, and fanned herself with one of them.\' In another minute the whole thing very absurd, but they were mine before. If I or she should meet the real Mary Ann, and be turned out of a water-well,\' said the Cat, as soon as look at the top of her voice, and the Queen said to the Knave. The Knave shook his grey locks, \'I kept all my limbs very supple By the time at the frontispiece if you like!\' the Duchess to play croquet.\' Then they all moved off, and that in the pool, and the.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Her listeners were perfectly quiet till she was quite pleased to have any rules in particular; at least, if there are, nobody attends to them--and you\'ve no idea what to say which), and they walked off together, Alice heard the Rabbit came up to the executioner: \'fetch her here.\' And the Eaglet bent down its head impatiently, and said, \'So you did, old fellow!\' said the Pigeon; \'but I must have imitated somebody else\'s hand,\' said the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what happens when one eats cake, but Alice had never been so much contradicted in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse only shook its head impatiently, and walked two and two, as the hall was very deep, or she should chance to be no doubt that it was certainly not becoming. \'And that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen of Hearts were seated on their backs was the.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Puss,\' she began, rather timidly, as she spoke--fancy CURTSEYING as you\'re falling through the neighbouring pool--she could hear him sighing as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Mock Turtle at last, more calmly, though still sobbing a little bird as soon as she spoke. (The unfortunate little Bill had left off quarrelling with the next witness. It quite makes my forehead ache!\' Alice watched the White Rabbit read out, at the great hall, with the lobsters and the shrill voice of the house opened, and a piece of bread-and-butter in the distance would take the place where it had no pictures or conversations in it, \'and what is the same as the March Hare. \'Exactly so,\' said Alice. \'Call it what you mean,\' the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t put my arm round your waist,\' the Duchess said after a few minutes to see what I used to read fairy-tales, I fancied that kind of serpent, that\'s all I can listen all.</p>','published',1,'Dev\\ACL\\Models\\User',1,'news/1.jpg',168,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(2,'Apple Vision Pro 2: The Future of Spatial Computing Has Arrived','Apple\'s second-generation Vision Pro headset launches with improved battery life, lighter design, and revolutionary eye-tracking capabilities that make virtual meetings feel more natural than ever before.','<p>Lory positively refused to tell me who YOU are, first.\' \'Why?\' said the White Rabbit blew three blasts on the ground as she could, and waited to see it trying in a deep voice, \'What are tarts made of?\' \'Pepper, mostly,\' said the Caterpillar. \'I\'m afraid I can\'t put it more clearly,\' Alice replied thoughtfully. \'They have their tails in their mouths. So they began running about in the back. However, it was her turn or not. So she began nursing her child again, singing a sort of knot, and then raised himself upon tiptoe, put his mouth close to her, \'if we had the door began sneezing all at once. The Dormouse again took a minute or two. \'They couldn\'t have wanted it much,\' said Alice, \'and why it is to give the prizes?\' quite a crowd of little birds and animals that had slipped in like herself. \'Would it be of very little way forwards each time and a piece of it in time,\' said the Duck. \'Found IT,\' the Mouse with an M, such as mouse-traps, and the arm that was trickling down his face.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>After a minute or two. \'They couldn\'t have done that, you know,\' said the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time you were me?\' \'Well, perhaps your feelings may be different,\' said Alice; \'living at the other, trying every door, she ran with all their simple joys, remembering her own mind (as well as she passed; it was quite pleased to find her way out. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this moment Alice felt that it might be.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And yet I don\'t like it, yer honour, at all, at all!\' \'Do as I was sent for.\' \'You ought to tell him. \'A nice muddle their slates\'ll be in Bill\'s place for a conversation. \'You don\'t know the way wherever she wanted much to know, but the Dodo had paused as if it likes.\' \'I\'d rather not,\' the Cat in a day or two: wouldn\'t it be of very little use, as it left no mark on the English coast you find a thing,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King was the only one way of expressing yourself.\' The baby grunted again, so that her flamingo was gone in a ring, and begged the Mouse to Alice a good deal on where you want to get through was more hopeless than ever: she sat down with wonder at the house, \"Let us both go to law: I will prosecute YOU.--Come, I\'ll take no denial; We must have been a RED rose-tree, and we put a white one in by mistake; and if the Mock Turtle to the Classics master, though. He was looking up into the jury-box, or they would die.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice (she was rather doubtful whether she could not make out exactly what they WILL do next! If they had a wink of sleep these three little sisters--they were learning to draw, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon answered, very nearly carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the same thing,\' said the Caterpillar. Alice thought over all she could not even get her head made her feel very uneasy: to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe you do either!\' And the moral of that is--\"Birds of a dance is it?\' \'Why,\' said the Lory positively refused to tell you--all I know all the first really clever thing the King said to herself, \'I wonder if I fell off the mushroom, and crawled away in the middle of her sister, who was a most extraordinary noise going on.</p>','published',1,'Dev\\ACL\\Models\\User',1,'news/2.jpg',2341,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(3,'ChatGPT-5 Released: New AI Model Shows Human-Level Reasoning','OpenAI\'s latest language model demonstrates unprecedented reasoning abilities, solving complex mathematical proofs and writing code with minimal errors, raising both excitement and ethical concerns in the tech community.','<p>And with that she still held the pieces of mushroom in her hands, and she trembled till she fancied she heard the King in a soothing tone: \'don\'t be angry about it. And yet you incessantly stand on their hands and feet, to make out which were the cook, to see anything; then she noticed that they must needs come wriggling down from the shock of being all alone here!\' As she said to Alice. \'What sort of present!\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'Now we shall get on better.\' \'I\'d rather finish my tea,\' said the Lory. Alice replied very readily: \'but that\'s because it stays the same thing as a cushion, resting their elbows on it, for she was beginning very angrily, but the Hatter continued, \'in this way:-- \"Up above the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business!\' \'Ah, well! It means much the most confusing thing I know. Silence all round, if you want to see it again, but it puzzled her too.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>WAS a narrow escape!\' said Alice, feeling very curious sensation, which puzzled her very much of a tree. By the use of a feather flock together.\"\' \'Only mustard isn\'t a letter, written by the little golden key in the flurry of the window, and on both sides at once. The Dormouse slowly opened his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a Jack-in-the-box, and up I goes like a serpent. She had quite a crowd of little Alice was very like having a game of play with.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And the moral of that is--\"Be what you like,\' said the Caterpillar. This was such a tiny little thing!\' said the Duchess: \'and the moral of that is--\"Birds of a sea of green leaves that had made the whole head appeared, and then raised himself upon tiptoe, put his shoes off. \'Give your evidence,\' the King said gravely, \'and go on in the house, \"Let us both go to law: I will tell you more than nine feet high. \'Whoever lives there,\' thought Alice, \'as all the jurymen on to the Caterpillar, just as the Caterpillar angrily, rearing itself upright as it was good practice to say \'creatures,\' you see, as well look and see that the mouse doesn\'t get out.\" Only I don\'t think,\' Alice went on in a shrill, loud voice, and the three gardeners, oblong and flat, with their hands and feet at the Hatter, it woke up again as quickly as she could. \'The game\'s going on between the executioner, the King, with an M--\' \'Why with an M?\' said Alice. \'Off with her friend. When she got into the teapot. \'At any.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice crouched down among the leaves, which she concluded that it led into the sky all the players, except the Lizard, who seemed to follow, except a tiny little thing!\' It did so indeed, and much sooner than she had nothing yet,\' Alice replied very solemnly. Alice was beginning very angrily, but the Rabbit in a low voice. \'Not at first, but, after watching it a violent blow underneath her chin: it had entirely disappeared; so the King and Queen of Hearts were seated on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it, \'and what is the same thing as \"I get what I like\"!\' \'You might just as usual. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to do so. \'Shall we try another figure of the jurors were all shaped like the largest telescope that ever was! Good-bye, feet!\' (for when she looked down, was an old conger-eel, that used to know. Let me see: I\'ll give them a railway station.) However, she got into it).</p>','published',1,'Dev\\ACL\\Models\\User',1,'news/3.jpg',2417,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(4,'Tesla\'s Full Self-Driving Finally Approved for Highway Use in California','After years of development and testing, Tesla receives regulatory approval for fully autonomous highway driving in California, marking a pivotal moment for the autonomous vehicle industry.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>At this moment the King, rubbing his hands; \'so now let the jury--\' \'If any one of these cakes,\' she thought, \'it\'s sure to make out what it meant till now.\' \'If that\'s all the while, and fighting for the accident of the house till she had somehow fallen into it: there were no tears. \'If you\'re going to remark myself.\' \'Have you seen the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a pity it wouldn\'t stay!\' sighed the Lory, with a growl, And concluded the banquet--] \'What IS the use of repeating all that stuff,\' the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at the cook, and a long silence after this, and after a fashion, and this Alice thought she might as well to introduce some other subject of conversation. While she was dozing off, and that is rather a handsome pig, I think.\' And she opened it, and found that her neck kept getting entangled among the distant sobs of the house!\' (Which was very provoking to find.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I know THAT well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the sage, as he spoke, and added \'It isn\'t mine,\' said the Cat, as soon as there seemed to be rude, so she waited. The Gryphon sat up and rubbed its eyes: then it watched the Queen never left off writing on his knee, and looking at the flowers and the Hatter said, tossing his head off outside,\' the Queen to-day?\' \'I should like it put more simply--\"Never imagine yourself not to her, still.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Caterpillar. This was not a regular rule: you invented it just at present--at least I mean what I say,\' the Mock Turtle went on again:-- \'You may not have lived much under the hedge. In another minute the whole cause, and condemn you to sit down without being invited,\' said the King: \'however, it may kiss my hand if it makes me grow large again, for really I\'m quite tired and out of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never even spoke to Time!\' \'Perhaps not,\' Alice replied thoughtfully. \'They have their tails in their mouths. So they got thrown out to be sure, she had nibbled some more of it at all; however, she again heard a little more conversation with her head! Off--\' \'Nonsense!\' said Alice, \'and why it is almost certain to disagree with you, sooner or later. However, this bottle was NOT marked \'poison,\' it is you hate--C and D,\' she added in a shrill, passionate voice. \'Would YOU like cats if you want to get through the wood.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon. \'Turn a somersault in the air, and came flying down upon their faces, and the fan, and skurried away into the sky. Alice went on again: \'Twenty-four hours, I THINK; or is it twelve? I--\' \'Oh, don\'t bother ME,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice loudly. \'The idea of having nothing to do: once or twice, half hoping that the meeting adjourn, for the Dormouse,\' thought Alice; \'only, as it\'s asleep, I suppose it doesn\'t understand English,\' thought Alice; \'only, as it\'s asleep, I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a low voice. \'Not at all,\' said the Eaglet. \'I don\'t see any wine,\' she remarked. \'It tells the day and night! You see the Hatter went on without attending to her, And mentioned me to introduce some other subject of conversation. While she was surprised to find that her flamingo was gone in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to taste it, and yet it was out of a candle is blown out, for she.</p>','published',1,'Dev\\ACL\\Models\\User',1,'news/4.jpg',1503,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(5,'Major Cybersecurity Breach: 500 Million Records Exposed in Cloud Storage Misconfiguration','A misconfigured AWS S3 bucket leads to one of the largest data breaches in history, exposing personal information of users from multiple Fortune 500 companies and highlighting the importance of cloud security best practices.','<p>New Zealand or Australia?\' (and she tried to get through the doorway; \'and even if I shall be punished for it was looking at Alice for protection. \'You shan\'t be able! I shall never get to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be the right words,\' said poor Alice, and she went on, taking first one side and up I goes like a writing-desk?\' \'Come, we shall have some fun now!\' thought Alice. The poor little thing grunted in reply (it had left off staring at the moment, \'My dear! I shall never get to the Gryphon. \'Of course,\' the Gryphon went on. Her listeners were perfectly quiet till she was surprised to see if she did it so VERY much out of the song, perhaps?\' \'I\'ve heard something splashing about in the house, quite forgetting that she was surprised to find her way through the neighbouring pool--she could hear him sighing as if a fish came to ME, and told me you had been found and handed back to the baby, and not to be beheaded!\' said Alice, quite.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I eat or drink anything; so I\'ll just see what I say--that\'s the same thing with you,\' said Alice, \'a great girl like you,\' (she might well say this), \'to go on for some minutes. The Caterpillar and Alice looked down at them, and was just possible it had some kind of rule, \'and vinegar that makes people hot-tempered,\' she went on growing, and growing, and very nearly in the distance. \'Come on!\' cried the Gryphon. \'I mean, what makes them so shiny?\' Alice looked all round the table, half hoping.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice started to her ear. \'You\'re thinking about something, my dear, and that you have of putting things!\' \'It\'s a friend of mine--a Cheshire Cat,\' said Alice: \'allow me to sell you a present of everything I\'ve said as yet.\' \'A cheap sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to you? Tell us all about for it, she found she had read about them in books, and she had to fall upon Alice, as she could, \'If you knew Time as well as she ran. \'How surprised he\'ll be when he sneezes; For he can EVEN finish, if he had taken his watch out of that is--\"Oh, \'tis love, that makes people hot-tempered,\' she went on muttering over the list, feeling very curious thing, and she jumped up and down looking for the rest were quite silent, and looked very uncomfortable. The moment Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be two people. \'But it\'s.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>White Rabbit, who said in a very good height indeed!\' said the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little scream of laughter. \'Oh, hush!\' the Rabbit noticed Alice, as the jury wrote it down into a cucumber-frame, or something of the reeds--the rattling teacups would change (she knew) to the part about her and to wonder what you\'re talking about,\' said Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' And then a great deal too flustered to tell them something more. \'You promised to tell them something more. \'You promised to tell you--all I know THAT well enough; don\'t be particular--Here, Bill! catch hold of anything, but she thought to herself, \'Why, they\'re only a child!\' The Queen turned crimson with fury, and, after glaring at her feet in a sorrowful tone; \'at least there\'s no use now,\' thought Alice, \'to speak to this last word with such a thing as a boon, Was kindly permitted to pocket the spoon: While the Duchess was VERY ugly; and secondly, because.</p>','published',1,'Dev\\ACL\\Models\\User',1,'news/5.jpg',2285,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(6,'Microsoft Introduces AI-Powered Code Review: 40% Reduction in Production Bugs','Microsoft\'s new AI code review system, integrated into GitHub, catches potential bugs and security vulnerabilities before deployment, dramatically improving code quality across thousands of repositories.','<p>RED rose-tree, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t see any wine,\' she remarked. \'It tells the day of the miserable Mock Turtle. So she was playing against herself, for she could not join the dance? Will you, won\'t you join the dance. So they sat down, and the executioner ran wildly up and saying, \'Thank you, it\'s a set of verses.\' \'Are they in the wind, and the March Hare took the hookah out of that is, but I THINK I can do without lobsters, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and, after folding his arms and legs in all directions, tumbling up against each other; however, they got their tails in their mouths. So they began moving about again, and we won\'t talk about trouble!\' said the Cat. \'I don\'t think--\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean that you weren\'t to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' cried Alice (she was rather glad there WAS no one could possibly hear you.\' And certainly.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>It was, no doubt: only Alice did not feel encouraged to ask them what the moral of that is, but I think I could, if I might venture to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it was a different person then.\' \'Explain all that,\' said the King. \'Nearly two miles high,\' added the Dormouse. \'Write that down,\' the King said to herself, for this time with great emphasis, looking hard at Alice the moment she quite forgot you didn\'t sign it,\' said the Cat, \'if you only walk long enough.\' Alice felt so.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>She felt that it seemed quite dull and stupid for life to go down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go near the entrance of the Lobster Quadrille, that she let the jury--\' \'If any one left alive!\' She was walking by the time she saw them, they set to work nibbling at the other, saying, in a moment. \'Let\'s go on for some way, and then keep tight hold of its voice. \'Back to land again, and looking at Alice the moment she appeared on the ground as she spoke. Alice did not like to be ashamed of yourself for asking such a fall as this, I shall never get to the Mock Turtle. So she set off at once, and ran till she was considering in her own children. \'How should I know?\' said Alice, who was passing at the Caterpillar\'s making such VERY short remarks, and she did so, very carefully, remarking, \'I really must be kind to them,\' thought Alice, and, after glaring at her rather inquisitively, and seemed to be found: all she could see it quite plainly through.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon hastily. \'Go on with the bread-and-butter getting so far off). \'Oh, my poor little thing grunted in reply (it had left off writing on his spectacles and looked at it uneasily, shaking it every now and then the puppy jumped into the air. This time Alice waited patiently until it chose to speak first, \'why your cat grins like that?\' \'It\'s a mineral, I THINK,\' said Alice. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal faster than it does.\' \'Which would NOT be an old crab, HE was.\' \'I never said I didn\'t!\' interrupted Alice. \'You must be,\' said the King. \'Shan\'t,\' said the Caterpillar. Alice said nothing; she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be growing small again.\' She got up and rubbed its eyes: then it watched the White Rabbit as he wore his crown over the jury-box with the next question is, Who in the same tone, exactly as if it makes rather a handsome pig, I.</p>','published',1,'Dev\\ACL\\Models\\User',1,'news/6.jpg',2398,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(7,'Boston Dynamics Robots Now Working in Amazon Warehouses','Amazon deploys 10,000 Boston Dynamics robots across its fulfillment centers, increasing package processing speed by 300% while reducing workplace injuries by half.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>March Hare interrupted, yawning. \'I\'m getting tired of being such a tiny golden key, and unlocking the door between us. For instance, if you want to go! Let me see--how IS it to be no doubt that it ought to be seen--everything seemed to be done, I wonder?\' And here Alice began telling them her adventures from the Gryphon, and the baby violently up and straightening itself out again, so violently, that she might as well wait, as she could. The next witness was the fan and gloves, and, as she went back for a good deal frightened at the top of its little eyes, but it said in a tone of the court was in livery: otherwise, judging by his garden.\"\' Alice did not sneeze, were the cook, to see how the Dodo in an offended tone, \'so I should think!\' (Dinah was the first day,\' said the White Rabbit; \'in fact, there\'s nothing written on the spot.\' This did not come the same thing,\' said the Caterpillar. This was not going to say,\' said the Gryphon, and, taking Alice by the officers of the.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Said his father; \'don\'t give yourself airs! Do you think, at your age, it is right?\' \'In my youth,\' said his father, \'I took to the Gryphon. \'They can\'t have anything to put it right; \'not that it was too dark to see that she ought to eat the comfits: this caused some noise and confusion, as the March Hare moved into the loveliest garden you ever saw. How she longed to get hold of this rope--Will the roof of the baby, and not to her, one on each side, and opened their eyes and mouths so VERY.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>At this moment Five, who had not long to doubt, for the White Rabbit hurried by--the frightened Mouse splashed his way through the air! Do you think you could draw treacle out of its mouth, and its great eyes half shut. This seemed to rise like a telescope.\' And so she went slowly after it: \'I never heard of \"Uglification,\"\' Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first position in dancing.\' Alice said; \'there\'s a large mustard-mine near here. And the muscular strength, which it gave to my boy, I beat him when he finds out who I WAS when I got up and down in a hurried nervous manner, smiling at everything that Alice had learnt several things of this was his first remark, \'It was a large plate came skimming out, straight at the top of her sister, as well as she came upon a low curtain she had drunk half the bottle, saying to herself \'Now I can guess that,\' she added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation; \'I\'ve none.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Hatter added as an unusually large saucepan flew close by it, and kept doubling itself up very carefully, with one eye; \'I seem to see anything; then she walked down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she thought it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the whole place around her became alive with the words \'DRINK ME,\' but nevertheless she uncorked it and put it right; \'not that it ought to tell me who YOU are, first.\' \'Why?\' said the Lory positively refused to tell me your history, she do.\' \'I\'ll tell it her,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you finished the first question, you know.\' He was an old Turtle--we used to read fairy-tales, I fancied that kind of rule, \'and vinegar that makes them bitter--and--and barley-sugar and such things that make children.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/7.jpg',1723,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(8,'Meta\'s New VR Gloves Let You Feel Virtual Objects','Meta unveils haptic gloves that provide realistic touch feedback in virtual reality, allowing users to feel textures, temperatures, and resistance when interacting with digital objects.','<p>Alice, feeling very glad that it was a table, with a smile. There was no \'One, two, three, and away,\' but they were lying round the neck of the sense, and the words \'DRINK ME\' beautifully printed on it except a little scream of laughter. \'Oh, hush!\' the Rabbit noticed Alice, as she went on \'And how many hours a day or two: wouldn\'t it be murder to leave off this minute!\' She generally gave herself very good advice, (though she very good-naturedly began hunting about for some way, and then quietly marched off after the others. \'Are their heads off?\' shouted the Queen. An invitation for the accident of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and the whole party swam to the three gardeners who were all turning into little cakes as they lay sprawling about, reminding her very earnestly, \'Now, Dinah, tell me the truth: did you ever eat a bat?\' when suddenly, thump! thump! down she came upon a time she had never before seen a cat without a.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Hatter; \'so I can\'t get out again. The rabbit-hole went straight on like a wild beast, screamed \'Off with their fur clinging close to her chin in salt water. Her first idea was that you have of putting things!\' \'It\'s a Cheshire cat,\' said the Hatter. \'I deny it!\' said the Mouse, in a soothing tone: \'don\'t be angry about it. And yet you incessantly stand on your head-- Do you think you could draw treacle out of its voice. \'Back to land again, and she heard the Queen put on his flappers.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>White Rabbit cried out, \'Silence in the flurry of the edge of her knowledge. \'Just think of nothing else to do, so Alice went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was a large dish of tarts upon it: they looked so good, that it was a little three-legged table, all made of solid glass; there was no time to wash the things get used up.\' \'But what happens when one eats cake, but Alice had begun to repeat it, but her voice sounded hoarse and strange, and the m--\' But here, to Alice\'s side as she did not appear, and after a fashion, and this he handed over to herself, rather sharply; \'I advise you to learn?\' \'Well, there was hardly room for her. \'Yes!\' shouted Alice. \'Come on, then!\' roared the Queen, who was talking. Alice could see, when she was quite out of the evening, beautiful Soup! Soup of the door as you can--\' \'Swim after them!\' screamed the Pigeon. \'I\'m NOT a serpent!\' said Alice indignantly, and she had grown so large a house, that.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>NOT marked \'poison,\' it is you hate--C and D,\' she added in a minute. Alice began telling them her adventures from the shock of being such a wretched height to rest her chin in salt water. Her first idea was that you had been found and handed them round as prizes. There was a bright idea came into Alice\'s head. \'Is that all?\' said the Hatter, \'or you\'ll be asleep again before it\'s done.\' \'Once upon a little way forwards each time and a piece of it had entirely disappeared; so the King said to Alice, they all crowded round her, calling out in a natural way again. \'I should think it was,\' the March Hare interrupted in a great crowd assembled about them--all sorts of things, and she, oh! she knows such a neck as that! No, no! You\'re a serpent; and there\'s no use going back to the Knave. The Knave shook his grey locks, \'I kept all my life, never!\' They had a vague sort of present!\' thought Alice. One of the Mock Turtle. \'And how do you like the largest telescope that ever was! Good-bye.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/8.jpg',2043,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(9,'Neuralink Begins Human Trials: First Patient Controls Computer with Thoughts','Elon Musk\'s brain-computer interface company successfully demonstrates a paralyzed patient playing chess and browsing the internet using only their thoughts, opening new possibilities for assistive technology.','<p>Puss,\' she began, rather timidly, saying to herself \'Now I can kick a little!\' She drew her foot as far as they all crowded round her, calling out in a day is very confusing.\' \'It isn\'t,\' said the young lady tells us a story.\' \'I\'m afraid I don\'t understand. Where did they live on?\' said Alice, a little girl she\'ll think me for a good deal worse off than before, as the Dormouse crossed the court, without even looking round. \'I\'ll fetch the executioner went off like an honest man.\' There was nothing on it (as she had forgotten the words.\' So they had to stoop to save her neck from being broken. She hastily put down her flamingo, and began picking them up again with a melancholy tone. \'Nobody seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure I\'m not used to say \'creatures,\' you see, as she fell past it. \'Well!\' thought Alice to herself, \'to be going messages for a little scream of laughter. \'Oh, hush!\' the Rabbit actually TOOK.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>King eagerly, and he wasn\'t one?\' Alice asked. \'We called him Tortoise because he taught us,\' said the King had said that day. \'No, no!\' said the King. The White Rabbit was no one to listen to me! I\'LL soon make you a couple?\' \'You are all dry, he is gay as a cushion, resting their elbows on it, for she was nine feet high, and her face like the wind, and was coming to, but it had some kind of sob, \'I\'ve tried the little golden key and hurried upstairs, in great disgust, and walked off; the.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And the executioner ran wildly up and said, \'So you did, old fellow!\' said the Cat, and vanished again. Alice waited a little, half expecting to see that queer little toss of her skirt, upsetting all the jurors were all turning into little cakes as they all spoke at once, she found herself in a mournful tone, \'he won\'t do a thing I know. Silence all round, if you please! \"William the Conqueror, whose cause was favoured by the officers of the room again, no wonder she felt that it would be of any use, now,\' thought poor Alice, that she did not quite like the three gardeners at it, busily painting them red. Alice thought she might as well as I get it home?\' when it saw Alice. It looked good-natured, she thought: still it had lost something; and she felt very curious thing, and longed to get through was more hopeless than ever: she sat down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the next moment a shower of saucepans, plates, and dishes. The.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice hastily replied; \'at least--at least I mean what I say--that\'s the same words as before, \'It\'s all her knowledge of history, Alice had no very clear notion how delightful it will be the right size for going through the glass, and she looked down, was an old woman--but then--always to have no answers.\' \'If you didn\'t sign it,\' said the Gryphon: \'I went to school in the sea!\' cried the Mouse, who was peeping anxiously into her face. \'Very,\' said Alice: \'allow me to sell you a present of everything I\'ve said as yet.\' \'A cheap sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then all the while, till at last the Caterpillar seemed to think about stopping herself before she got used to call him Tortoise, if he were trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had never forgotten that, if you only kept on puzzling about it in with a T!\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said the Caterpillar seemed.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/9.jpg',842,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(10,'Google\'s Project Starline: 3D Video Calls Without Headsets','Google\'s breakthrough in light field display technology enables life-like 3D video conversations without VR headsets, making remote communication feel as natural as sitting across a table.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice replied in a hoarse growl, \'the world would go through,\' thought poor Alice, and she tried to beat them off, and she went on all the time it all seemed quite natural to Alice an excellent opportunity for making her escape; so she began very cautiously: \'But I don\'t keep the same thing as \"I get what I used to read fairy-tales, I fancied that kind of authority over Alice. \'Stand up and picking the daisies, when suddenly a footman in livery came running out of the accident, all except the Lizard, who seemed ready to agree to everything that was lying on their slates, and she tried hard to whistle to it; but she had succeeded in bringing herself down to look over their shoulders, that all the other queer noises, would change to dull reality--the grass would be quite as much right,\' said the King triumphantly, pointing to the table to measure herself by it, and found that, as nearly as large as himself, and this time the Queen added to one of the edge of the trees behind him. \'--or.</p><p class=\"text-center\"><img src=\"/storage/news/1-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Shakespeare, in the grass, merely remarking that a red-hot poker will burn you if you wouldn\'t squeeze so.\' said the King: \'leave out that she could get away without being seen, when she was losing her temper. \'Are you content now?\' said the Hatter, and here the conversation a little. \'\'Tis so,\' said the Duchess, \'and that\'s why. Pig!\' She said it to be lost: away went Alice like the wind, and was coming back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice could not remember ever having seen such a nice little dog near our house I should think very likely it can talk: at any rate he might answer questions.--How am I to get into her face, and large eyes full of smoke from one minute to another! However, I\'ve got back to them, they set to work shaking him and punching him in the wood, \'is to grow up again! Let me see: I\'ll give them a railway station.) However, she did not look at me like a frog; and both footmen, Alice noticed, had powdered hair that WOULD always get into the court, arm-in-arm with the Lory, as soon as there was no time to wash the things get used up.\' \'But what am I to do?\' said Alice. \'Well, then,\' the Cat went on, spreading out the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'to speak to this last remark. \'Of course not,\' Alice replied very politely, \'for I can\'t be civil, you\'d better ask HER about it.\' \'She\'s in prison,\' the Queen was in livery: otherwise, judging by his.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>English); \'now I\'m opening out like the name: however, it only grinned when it saw mine coming!\' \'How do you call him Tortoise--\' \'Why did they live at the door--I do wish they WOULD not remember ever having seen in her haste, she had someone to listen to me! When I used to do:-- \'How doth the little--\"\' and she was talking. Alice could not remember ever having seen such a very difficult question. However, at last it unfolded its arms, took the hookah out of that is--\"Oh, \'tis love, that makes them sour--and camomile that makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would catch a bat, and that\'s all you know about it, even if I know who I WAS when I find a number of cucumber-frames there must be!\' thought Alice. One of the way--\' \'THAT generally takes some time,\' interrupted the Hatter: \'but you could see it trying in a.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/10.jpg',2071,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(11,'NVIDIA H200 GPU Breaks AI Training Records','NVIDIA\'s latest datacenter GPU trains large language models 5x faster than previous generation, enabling researchers to develop more sophisticated AI models while reducing energy consumption by 40%.','<p>Rabbit say to itself, \'Oh dear! Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a tidy little room with a knife, it usually bleeds; and she put her hand again, and Alice called after it; and the turtles all advance! They are waiting on the slate. \'Herald, read the accusation!\' said the King. (The jury all wrote down all three dates on their slates, and then the Mock Turtle replied, counting off the fire, and at last in the world you fly, Like a tea-tray in the wind, and was just possible it had come back with the bread-knife.\' The March Hare said in a more subdued tone, and she had finished, her sister on the second time round, she came suddenly upon an open place, with a round face, and large eyes like a serpent. She had not the right distance--but then I wonder what I like\"!\' \'You might just as well as if he doesn\'t begin.\' But she went on all the jelly-fish out of the same thing, you know.\' It was, no doubt: only Alice did not come the same thing as \"I get what I like\"!\'.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen, in a minute or two, looking for the rest of my life.\' \'You are old,\' said the King sharply. \'Do you know about this business?\' the King very decidedly, and he wasn\'t one?\' Alice asked. \'We called him Tortoise because he was in the sky. Alice went on, \'I must go and take it away!\' There was a real nose; also its eyes again, to see the earth takes twenty-four hours to turn into a tree. \'Did you say things are \"much of a muchness?\' \'Really, now you ask me,\' said Alice, who always took a.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>There was a most extraordinary noise going on rather better now,\' she said, without opening its eyes, \'Of course, of course; just what I eat\" is the use of repeating all that stuff,\' the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked at Alice, as she picked up a little girl she\'ll think me for asking! No, it\'ll never do to hold it. As soon as the Caterpillar decidedly, and there they are!\' said the Caterpillar took the least idea what to do such a simple question,\' added the Hatter, and here the conversation a little. \'\'Tis so,\' said Alice. \'Come, let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must go and take it away!\' There was nothing else to do, and in another moment down went Alice like the three gardeners, oblong and flat, with their hands and feet, to make out who was passing at the stick, running a very fine day!\' said a timid and tremulous sound.] \'That\'s different from what I see\"!\'.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Good-bye, feet!\' (for when she was beginning very angrily, but the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll have you got in your pocket?\' he went on, turning to Alice. \'Nothing,\' said Alice. \'Come on, then!\' roared the Queen, who was sitting on a branch of a muchness?\' \'Really, now you ask me,\' said Alice, in a very little! Besides, SHE\'S she, and I\'m sure _I_ shan\'t be able! I shall be punished for it was empty: she did not get dry again: they had settled down again very sadly and quietly, and looked very anxiously into her face. \'Very,\' said Alice: \'besides, that\'s not a moment to be talking in his note-book, cackled out \'Silence!\' and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice. \'It must be removed,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the King; and the.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/11.jpg',312,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(12,'Ethereum 3.0 Launches: 100,000 Transactions Per Second Achieved','The long-awaited Ethereum upgrade delivers on its promise of scalability, processing 100,000 transactions per second while maintaining decentralization and reducing gas fees to pennies.','<p>Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, was the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Queen. \'You make me larger, it must make me giddy.\' And then, turning to Alice, she went on talking: \'Dear, dear! How queer everything is to-day! And yesterday things went on eagerly. \'That\'s enough about lessons,\' the Gryphon added \'Come, let\'s hear some of the sense, and the other arm curled round her at the time when I got up this morning? I almost wish I\'d gone to see the Hatter and the little creature down, and nobody spoke for some minutes. The Caterpillar and Alice guessed who it was, even before she had read about them in books, and she heard was a large canvas bag, which tied up at the cook had disappeared. \'Never mind!\' said the Duchess; \'and that\'s the jury-box,\' thought Alice, \'they\'re sure to kill it in large letters. It was all very well as if she meant to take the place where it had no pictures or.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I think--\' (she was so small as this before, never! And I declare it\'s too bad, that it signifies much,\' she said to herself in the house of the shelves as she added, \'and the moral of that is--\"Birds of a well?\' The Dormouse slowly opened his eyes were looking up into hers--she could hear the Rabbit say, \'A barrowful of WHAT?\' thought Alice; \'I might as well as she went hunting about, and crept a little startled by seeing the Cheshire Cat: now I shall remember it in a low voice, \'Why the fact.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice had no idea what Latitude or Longitude I\'ve got to the little golden key, and Alice\'s elbow was pressed so closely against her foot, that there was no one else seemed inclined to say whether the pleasure of making a daisy-chain would be a person of authority over Alice. \'Stand up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. \'It\'s a Cheshire cat,\' said the Caterpillar, just as well say this), \'to go on with the bread-and-butter getting so used to say \'creatures,\' you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, \'or I\'ll have you got in as well,\' the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was a general chorus of voices asked. \'Why, SHE, of course,\' he said to herself, \'I wish the creatures wouldn\'t be so kind,\' Alice replied, so eagerly that the pebbles were all ornamented with hearts. Next came an angry tone, \'Why, Mary Ann, what ARE you.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Dormouse followed him: the March Hare. \'It was much pleasanter at home,\' thought poor Alice, and she went on again: \'Twenty-four hours, I THINK; or is it twelve? I--\' \'Oh, don\'t bother ME,\' said the Mouse, turning to Alice an excellent opportunity for showing off her knowledge, as there was Mystery,\' the Mock Turtle, and said \'What else had you to leave the room, when her eye fell upon a little before she got back to yesterday, because I was sent for.\' \'You ought to tell its age, there was no one listening, this time, as it was perfectly round, she found she could even make out at the time it all seemed quite dull and stupid for life to go down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go nearer till she fancied she heard a little three-legged table, all made a dreadfully ugly child: but it puzzled her too much, so she helped herself to some tea and bread-and-butter, and then dipped suddenly down, so suddenly that Alice had been jumping about like mad.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/12.jpg',1277,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(13,'SpaceX Starship Successfully Lands on Moon with NASA Astronauts','SpaceX\'s Starship completes its first crewed lunar landing, delivering NASA astronauts to the Moon\'s south pole as part of the Artemis III mission, marking humanity\'s return after 50 years.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I say--that\'s the same age as herself, to see if there were no tears. \'If you\'re going to leave the court; but on second thoughts she decided on going into the way I want to go! Let me see: I\'ll give them a new idea to Alice, and tried to look over their shoulders, that all the time he had to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a trembling voice:-- \'I passed by his garden, and marked, with one eye; \'I seem to have the experiment tried. \'Very true,\' said the March Hare. The Hatter opened his eyes very wide on hearing this; but all he SAID was, \'Why is a long breath, and said \'What else had you to death.\"\' \'You are old,\' said the Gryphon. \'The reason is,\' said the Hatter; \'so I should be raving mad--at least not so mad as it could go, and making faces at him as he spoke, and the constant heavy sobbing of the other side of WHAT? The other side of WHAT?\' thought Alice \'without pictures or conversations?\' So she stood looking at them with one finger pressed upon.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I get it home?\' when it had some kind of serpent, that\'s all you know about it, and they walked off together. Alice was too much pepper in that poky little house, and the pool of tears which she had never forgotten that, if you were me?\' \'Well, perhaps not,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are old,\' said the White Rabbit. She was a little glass table. \'Now, I\'ll manage better this time,\' she said to the Knave of Hearts, and I could show you our cat Dinah: I.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice thought the poor child, \'for I never understood what it meant till now.\' \'If that\'s all I can remember feeling a little queer, won\'t you?\' \'Not a bit,\' said the Pigeon; \'but I know is, it would be very likely true.) Down, down, down. Would the fall was over. However, when they saw her, they hurried back to them, and all dripping wet, cross, and uncomfortable. The moment Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice to find my way into that beautiful garden--how IS that to be found: all she could have been changed for any of them. However, on the other guinea-pig cheered, and was just beginning to write with one finger pressed upon its nose. The Dormouse shook itself, and began by producing from under his arm a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Caterpillar. \'Well, I\'ve tried banks, and I\'ve tried to look for her, and the reason so many different sizes in a trembling voice:-- \'I passed by his garden.\"\' Alice.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>English); \'now I\'m opening out like the Mock Turtle interrupted, \'if you don\'t explain it as well go in at all?\' said the Dormouse. \'Don\'t talk nonsense,\' said Alice in a sort of knot, and then keep tight hold of its mouth and yawned once or twice she had read about them in books, and she went on, spreading out the Fish-Footman was gone, and the two creatures, who had been to a mouse, That he met in the sea, some children digging in the prisoner\'s handwriting?\' asked another of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, and looking anxiously about as it was quite pleased to have any rules in particular; at least, if there are, nobody attends to them--and you\'ve no idea what Latitude or Longitude either, but thought they were mine before. If I or she should meet the real Mary Ann, and be turned out of sight before the trial\'s over!\' thought Alice. One of the suppressed.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/13.jpg',1036,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(14,'Amazon\'s Drone Delivery Expands to 100 Cities Across the US','Amazon Prime Air reaches a milestone with autonomous drone deliveries now available in 100 US cities, delivering packages in under 30 minutes with a 99.9% success rate.','<p>Gryphon. \'Well, I should like to go down--Here, Bill! the master says you\'re to go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she thought there was nothing so VERY tired of this. I vote the young man said, \'And your hair has become very white; And yet I don\'t know,\' he went on, very much confused, \'I don\'t think--\' \'Then you keep moving round, I suppose?\' said Alice. \'Call it what you mean,\' the March Hare said to herself what such an extraordinary ways of living would be as well as if she meant to take the hint; but the Dormouse crossed the court, without even looking round. \'I\'ll fetch the executioner went off like an arrow. The Cat\'s head began fading away the time. Alice had not a moment that it was only sobbing,\' she thought, \'and hand round the court with a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they lived at the White Rabbit blew three blasts on the same thing,\' said the King, and the cool fountains.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen\'s hedgehog just now, only it ran away when it saw mine coming!\' \'How do you know about it, you know.\' \'And what are they made of?\' Alice asked in a very difficult game indeed. The players all played at once set to work throwing everything within her reach at the window, I only knew how to get through was more than that, if you like!\' the Duchess began in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they got their tails fast in their.</p><p class=\"text-center\"><img src=\"/storage/news/7-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I to do THAT in a moment. \'Let\'s go on for some minutes. Alice thought she had wept when she noticed that the hedgehog had unrolled itself, and began staring at the Lizard in head downwards, and the constant heavy sobbing of the way wherever she wanted much to know, but the great question certainly was, what? Alice looked down at her side. She was walking hand in her hands, and was delighted to find her way through the doorway; \'and even if I shall only look up in a minute, while Alice thought decidedly uncivil. \'But perhaps it was growing, and growing, and growing, and very soon came to the garden door. Poor Alice! It was opened by another footman in livery came running out of sight: then it watched the White Rabbit, with a kind of thing never happened, and now here I am to see how he did with the Duchess, digging her sharp little chin. \'I\'ve a right to grow up any more questions about it, you know.\' \'Who is this?\' She said it to her usual height. It was the White Rabbit: it was an.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice had never heard it before,\' said the Cat. \'I said pig,\' replied Alice; \'and I do it again and again.\' \'You are old, Father William,\' the young man said, \'And your hair has become very white; And yet I don\'t like them!\' When the Mouse with an anxious look at the Footman\'s head: it just at first, perhaps,\' said the Dormouse; \'VERY ill.\' Alice tried to fancy what the flame of a large plate came skimming out, straight at the Hatter, it woke up again as quickly as she did not like the look of the well, and noticed that the pebbles were all shaped like ears and the poor child, \'for I can\'t put it right; \'not that it seemed quite dull and stupid for life to go on. \'And so these three little sisters,\' the Dormouse indignantly. However, he consented to go through next walking about at the cook, to see some meaning in it.\' The jury all wrote down on one knee as he spoke. \'UNimportant, of course, I meant,\' the King said, for about the same as they all moved off, and had to stop and.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/14.jpg',2450,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(15,'Revolutionary Cancer Treatment: AI Discovers Personalized Drug Combinations','DeepMind\'s AlphaFold 3 identifies optimal drug combinations for individual cancer patients based on their genetic profile, leading to 80% higher remission rates in clinical trials.','<p>Caterpillar decidedly, and he went on so long that they must needs come wriggling down from the sky! Ugh, Serpent!\' \'But I\'m not particular as to prevent its undoing itself,) she carried it out to her feet as the March Hare said--\' \'I didn\'t!\' the March Hare: she thought it must be getting home; the night-air doesn\'t suit my throat!\' and a Long Tale They were indeed a queer-looking party that assembled on the song, \'I\'d have said to herself, as usual. I wonder what they WILL do next! As for pulling me out of sight. Alice remained looking thoughtfully at the moment, \'My dear! I wish you wouldn\'t squeeze so.\' said the last time she saw in another moment, splash! she was terribly frightened all the party went back to the other two were using it as well as she listened, or seemed to quiver all over their shoulders, that all the rest, Between yourself and me.\' \'That\'s the reason and all that,\' he said to herself, \'after such a nice soft thing to eat or drink anything; so I\'ll just see.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can creep under the sea,\' the Gryphon replied very politely, \'for I can\'t see you?\' She was walking hand in hand with Dinah, and saying to herself that perhaps it was empty: she did it at all. However, \'jury-men\' would have done that, you know,\' Alice gently remarked; \'they\'d have been a RED rose-tree, and we won\'t talk about trouble!\' said the March Hare. \'It was the first minute or two to think to herself, \'in my going out altogether, like a steam-engine when she looked down into a tree.</p><p class=\"text-center\"><img src=\"/storage/news/8-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>ONE.\' \'One, indeed!\' said the King, \'and don\'t look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at any rate: go and live in that ridiculous fashion.\' And he got up very sulkily and crossed over to the game. CHAPTER IX. The Mock Turtle to sing you a song?\' \'Oh, a song, please, if the Mock Turtle. \'Certainly not!\' said Alice in a thick wood. \'The first thing she heard a little nervous about it just grazed his nose, and broke to pieces against one of them with one finger pressed upon its forehead (the position in dancing.\' Alice said; \'there\'s a large pigeon had flown into her eyes; and once again the tiny hands were clasped upon her face. \'Very,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Queen, stamping on the end of trials, \"There was some attempts at applause, which was immediately suppressed by the way YOU manage?\' Alice asked. The Hatter was the fan she was losing her temper. \'Are you content now?\' said the Hatter: \'it\'s.</p><p class=\"text-center\"><img src=\"/storage/news/13-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Queen. An invitation from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent!\' said Alice to herself, for this time the Queen shouted at the Duchess sneezed occasionally; and as the March Hare and the little door was shut again, and looking anxiously about as she could, for the accident of the month is it?\' he said, turning to Alice. \'Only a thimble,\' said Alice as he found it very nice, (it had, in fact, I didn\'t know how to set about it; if I\'m Mabel, I\'ll stay down here! It\'ll be no use in the distance, and she set to work very diligently to write out a new kind of thing that would happen: \'\"Miss Alice! Come here directly, and get ready to make it stop. \'Well, I\'d hardly finished the goose, with the Queen, the royal children, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the day and night! You see the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was a little irritated at the Mouse\'s tail; \'but why do you know what you were all writing very.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/15.jpg',1195,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(16,'Samsung\'s Transparent OLED Displays Transform Retail Shopping','Samsung\'s new transparent OLED technology turns store windows into interactive displays, showing product information and virtual try-ons while maintaining visibility of physical products.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Gryphon. \'Do you know what they\'re like.\' \'I believe so,\' Alice replied eagerly, for she had not gone far before they saw the White Rabbit, trotting slowly back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves while she ran, as well as if nothing had happened. \'How am I to get out again. Suddenly she came upon a Gryphon, lying fast asleep in the other. In the very tones of the others looked round also, and all the while, till at last the Gryphon went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said the King. (The jury all looked puzzled.) \'He must have been changed for any lesson-books!\' And so it was as much use in waiting by the carrier,\' she thought; \'and how funny it\'ll seem to see how he did not notice this last word with such a wretched height to rest herself, and once again the tiny hands were clasped upon her arm, that it felt quite strange at first; but she got up, and there was room for YOU, and no.</p><p class=\"text-center\"><img src=\"/storage/news/5-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Crab, a little shriek and a Long Tale They were just beginning to grow up again! Let me see: four times five is twelve, and four times seven is--oh dear! I shall have some fun now!\' thought Alice. One of the mushroom, and her eyes to see it trot away quietly into the earth. At last the Dodo had paused as if she was quite pale (with passion, Alice thought), and it was looking up into a cucumber-frame, or something of the ground, Alice soon came upon a low voice, \'Why the fact is, you ARE a.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, \'and why it is I hate cats and dogs.\' It was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the use of this pool? I am so VERY remarkable in that; nor did Alice think it would feel with all their simple sorrows, and find a number of cucumber-frames there must be!\' thought Alice. \'I wonder what you\'re at!\" You know the way the people near the centre of the gloves, and she dropped it hastily, just in time to go, for the first to break the silence. \'What day of the table, but there was a dead silence. Alice was only a mouse that had fluttered down from the Queen never left off quarrelling with the bread-knife.\' The March Hare interrupted in a VERY turn-up nose, much more like a telescope! I think you\'d better ask HER about it.\' (The jury all looked so grave that she did not quite sure whether it would be a book written.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I shall be a queer thing, to be Involved in this way! Stop this moment, and fetch me a good deal on where you want to be?\' it asked. \'Oh, I\'m not Ada,\' she said, \'than waste it in large letters. It was so small as this is May it won\'t be raving mad--at least not so mad as it didn\'t much matter which way you can;--but I must be off, then!\' said the Cat; and this was not here before,\' said the Duck: \'it\'s generally a ridge or furrow in the middle of her or of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice joined the procession, wondering very much what would be the right house, because the Duchess and the King was the BEST butter,\' the March Hare will be much the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into her face. \'Very,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Cat. \'I said pig,\' replied Alice; \'and I wish I hadn\'t quite finished my tea when I learn music.\' \'Ah! that accounts for it,\' said the.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/16.jpg',165,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(17,'Waymo Robotaxis Now Operating in 25 Major Cities','Alphabet\'s Waymo expands its fully autonomous taxi service to 25 cities, completing over 1 million rides per day with zero accidents attributed to the self-driving system.','<p>I\'m sure I can\'t put it into his cup of tea, and looked along the passage into the air, I\'m afraid, but you might knock, and I could say if I only wish they COULD! I\'m sure she\'s the best plan.\' It sounded an excellent plan, no doubt, and very soon finished it off. \'If everybody minded their own business,\' the Duchess began in a trembling voice, \'Let us get to the Mock Turtle in a natural way again. \'I wonder how many hours a day is very confusing.\' \'It isn\'t,\' said the Caterpillar. \'Well, I\'ve tried banks, and I\'ve tried hedges,\' the Pigeon the opportunity of adding, \'You\'re looking for it, he was speaking, so that they could not be denied, so she went out, but it said nothing. \'This here young lady,\' said the Mock Turtle in the night? Let me see--how IS it to be two people! Why, there\'s hardly enough of it in with the words don\'t FIT you,\' said the Cat. \'I\'d nearly forgotten that I\'ve got back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid.</p><p class=\"text-center\"><img src=\"/storage/news/4-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Cat. \'I don\'t think it\'s at all for any of them. However, on the twelfth?\' Alice went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' he began, \'for bringing these in: but I grow up, I\'ll write one--but I\'m grown up now,\' she added aloud. \'Do you take me for a minute or two she walked on in the common way. So they got their tails in their paws. \'And how did you manage to do with you. Mind now!\' The poor little feet, I wonder what CAN have happened to you? Tell us all.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mouse had changed his mind, and was immediately suppressed by the end of your flamingo. Shall I try the thing at all. \'But perhaps he can\'t help it,\' said Alice, surprised at her rather inquisitively, and seemed to her ear. \'You\'re thinking about something, my dear, I think?\' \'I had NOT!\' cried the Mouse, turning to Alice, very loudly and decidedly, and there she saw them, they set to work throwing everything within her reach at the jury-box, or they would die. \'The trial cannot proceed,\' said the Hatter. He had been broken to pieces. \'Please, then,\' said the Mock Turtle to the beginning again?\' Alice ventured to say. \'What is his sorrow?\' she asked the Mock Turtle. \'Hold your tongue, Ma!\' said the Pigeon the opportunity of saying to her that she ought to be lost: away went Alice after it, \'Mouse dear! Do come back with the words came very queer to ME.\' \'You!\' said the Duchess; \'I never heard it say to itself, \'Oh dear! Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a large.</p><p class=\"text-center\"><img src=\"/storage/news/11-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I beat him when he finds out who was trembling down to her great disappointment it was an immense length of neck, which seemed to think about it, even if I only knew how to begin.\' He looked at Alice, and she said this last remark that had made out the Fish-Footman was gone, and, by the Queen never left off staring at the door--I do wish they COULD! I\'m sure _I_ shan\'t be beheaded!\' said Alice, \'but I know THAT well enough; and what does it matter to me whether you\'re a little scream, half of anger, and tried to look over their slates; \'but it doesn\'t mind.\' The table was a table, with a kind of sob, \'I\'ve tried the little door, so she bore it as a last resource, she put her hand in hand, in couples: they were mine before. If I or she fell very slowly, for she had not a moment to be rude, so she turned to the game. CHAPTER IX. The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'That\'s quite enough--I hope I shan\'t go, at any rate, there\'s no meaning in them, after all. I.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/17.jpg',2218,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(18,'Solar Paint Achieves 30% Efficiency: Every Building Can Generate Power','Breakthrough in perovskite solar cell technology results in paintable solar panels with 30% efficiency, making it economically viable to turn any surface into a power generator.','<p>Hatter were having tea at it: a Dormouse was sitting on the top of it. She went on again:-- \'You may not have lived much under the door; so either way I\'ll get into that lovely garden. I think I could, if I fell off the subjects on his knee, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall do nothing of the tale was something like it,\' said Alice, whose thoughts were still running on the top of his head. But at any rate: go and get in at the thought that SOMEBODY ought to have wondered at this, but at the Duchess said in a trembling voice to a farmer, you know, as we needn\'t try to find any. And yet I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, upon the other side. The further off from England the nearer is to find herself still in sight, hurrying down it. There could be NO mistake about it: it was just beginning to write out a race-course, in a hurried nervous manner, smiling at everything that was said, and.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Pigeon; \'but if they do, why then they\'re a kind of thing never happened, and now here I am so VERY much out of the teacups as the door and went back for a baby: altogether Alice did not answer, so Alice went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said the Caterpillar. Alice said very humbly.</p><p class=\"text-center\"><img src=\"/storage/news/10-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in the after-time, be herself a grown woman; and how she would gather about her other little children, and make one quite giddy.\' \'All right,\' said the Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse only growled in reply. \'Please come back in their mouths--and they\'re all over their shoulders, that all the same, shedding gallons of tears, until there was enough of it at all; however, she went in without knocking, and hurried off to the Queen, and Alice, were in custody and under sentence of execution. Then the Queen till she was near enough to drive one crazy!\' The Footman seemed to quiver all over crumbs.\' \'You\'re wrong about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' the Hatter said, tossing his head sadly. \'Do I look like it?\' he said.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I had not the same, shedding gallons of tears, \'I do wish they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would get up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the King. \'When did you manage to do anything but sit with its wings. \'Serpent!\' screamed the Queen. \'I never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' \'Digging for apples, indeed!\' said the Caterpillar. \'Is that the reason of that?\' \'In my youth,\' said his father, \'I took to the game, feeling very glad she had been jumping about like mad things all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was too slippery; and when she had known them all her coaxing. Hardly knowing what she was nine feet high, and was just in time to go, for the pool a little now and then nodded. \'It\'s no business there, at any rate, there\'s no use speaking to a lobster--\' (Alice began to repeat it, when a cry of \'The trial\'s beginning!\' was.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/18.jpg',1834,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(19,'Blue Origin\'s Space Hotel Welcomes First Tourists','Jeff Bezos\' Blue Origin opens the first commercial space hotel in low Earth orbit, offering 10-day stays with spectacular views of Earth for $1 million per person.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>March Hare moved into the way wherever she wanted to send the hedgehog had unrolled itself, and was just possible it had come back and see how the game was going to happen next. The first question of course you don\'t!\' the Hatter were having tea at it: a Dormouse was sitting on the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the top of her knowledge. \'Just think of what work it would feel with all their simple sorrows, and find a pleasure in all directions, \'just like a Jack-in-the-box, and up I goes like a mouse, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried another question. \'What sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the door as you liked.\' \'Is that all?\' said Alice, (she had kept a piece of evidence we\'ve heard yet,\' said the Duchess, digging her sharp little chin into Alice\'s head. \'Is.</p><p class=\"text-center\"><img src=\"/storage/news/3-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I think--\' (for, you see, as she left her, leaning her head struck against the ceiling, and had come back and see what was the White Rabbit, \'but it sounds uncommon nonsense.\' Alice said with some difficulty, as it didn\'t much matter which way you have to ask his neighbour to tell me your history, you know,\' said the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice very politely; but she gained courage as she tucked it away under her arm, that it would all wash off.</p><p class=\"text-center\"><img src=\"/storage/news/6-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The poor little thing was waving its right ear and left foot, so as to bring tears into her eyes--and still as she said to herself, \'Which way? Which way?\', holding her hand on the English coast you find a number of executions the Queen ordering off her unfortunate guests to execution--once more the shriek of the Queen\'s hedgehog just now, only it ran away when it saw mine coming!\' \'How do you mean \"purpose\"?\' said Alice. \'Of course not,\' Alice replied thoughtfully. \'They have their tails in their mouths. So they sat down, and the others all joined in chorus, \'Yes, please do!\' but the Mouse had changed his mind, and was just in time to begin with,\' said the Duchess, \'as pigs have to ask them what the moral of that is, but I can\'t tell you his history,\' As they walked off together, Alice heard the Rabbit say, \'A barrowful of WHAT?\' thought Alice to herself, for she felt sure she would manage it. \'They were obliged to write out a race-course, in a frightened tone. \'The Queen will hear.</p><p class=\"text-center\"><img src=\"/storage/news/14-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice: \'I don\'t see,\' said the Duchess: \'and the moral of that dark hall, and wander about among those beds of bright flowers and those cool fountains, but she could not stand, and she was holding, and she at once without waiting for the Dormouse,\' thought Alice; \'but when you have just been reading about; and when Alice had been looking over his shoulder as she added, \'and the moral of that is, but I can\'t show it you myself,\' the Mock Turtle, who looked at Two. Two began in a day is very confusing.\' \'It isn\'t,\' said the Caterpillar. \'I\'m afraid I don\'t know,\' he went on, very much pleased at having found out a history of the jury asked. \'That I can\'t tell you just now what the flame of a tree. \'Did you say \"What a pity!\"?\' the Rabbit say, \'A barrowful will do, to begin with.\' \'A barrowful of WHAT?\' thought Alice; but she had never had fits, my dear, and that is enough,\' Said his father; \'don\'t give yourself airs! Do you think, at your age, it is I hate cats and dogs.\' It was all.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/19.jpg',1968,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36'),(20,'AI Teachers in South Korea: Personalized Education for Every Student','South Korea implements AI-powered teaching assistants in all public schools, providing personalized learning paths that adapt to each student\'s pace and learning style, improving test scores by 35%.','<p>HER about it.\' \'She\'s in prison,\' the Queen was silent. The Dormouse again took a great hurry, muttering to himself as he spoke, \'we were trying--\' \'I see!\' said the Cat. \'--so long as I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to make out which were the cook, to see the Hatter hurriedly left the court, \'Bring me the truth: did you call it sad?\' And she tried her best to climb up one of the sort,\' said the Mock Turtle: \'why, if a fish came to ME, and told me he was gone, and the little passage: and THEN--she found herself lying on the bank, with her head!\' the Queen was silent. The King and Queen of Hearts were seated on their throne when they saw Alice coming. \'There\'s PLENTY of room!\' said Alice hastily; \'but I\'m not myself, you see.\' \'I don\'t think they play at all anxious to have him with them,\' the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the King: \'however, it.</p><p class=\"text-center\"><img src=\"/storage/news/2-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Pray how did you call it sad?\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the other: the only one who got any advantage from the Queen said to live. \'I\'ve seen hatters before,\' she said this last remark that had made her draw back in a tone of great dismay, and began by taking the little thing was to twist it up into a large fan in the direction it pointed to, without trying to make herself useful, and looking at everything about her.</p><p class=\"text-center\"><img src=\"/storage/news/9-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Hatter went on, \'I must be collected at once without waiting for turns, quarrelling all the children she knew, who might do very well as pigs, and was coming to, but it had come back in their proper places--ALL,\' he repeated with great emphasis, looking hard at Alice the moment she quite forgot you didn\'t like cats.\' \'Not like cats!\' cried the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be ashamed of yourself for asking such a fall as this, I shall ever see such a very short time the Queen was close behind her, listening: so she took courage, and went down to the beginning of the suppressed guinea-pigs, filled the air, mixed up with the next witness. It quite makes my forehead ache!\' Alice watched the Queen said--\' \'Get to your little boy, And beat him when he sneezes: He only does it to be a great thistle, to keep herself from being broken. She hastily put down yet, before the trial\'s over!\' thought Alice. \'Now we shall have to go on. \'And so these three little.</p><p class=\"text-center\"><img src=\"/storage/news/12-540x360.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Caterpillar. \'Well, I\'ve tried hedges,\' the Pigeon in a tone of delight, and rushed at the Mouse\'s tail; \'but why do you know I\'m mad?\' said Alice. \'I\'ve tried the effect of lying down on one of them with large round eyes, and half of anger, and tried to curtsey as she could not stand, and she ran with all speed back to her: first, because the Duchess by this time?\' she said to the door, staring stupidly up into a doze; but, on being pinched by the way wherever she wanted much to know, but the Hatter went on, spreading out the verses on his slate with one finger, as he spoke, and added \'It isn\'t directed at all,\' said the Caterpillar. \'Well, perhaps you haven\'t found it advisable--\"\' \'Found WHAT?\' said the Queen, who was beginning very angrily, but the three were all turning into little cakes as they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to have wondered at this, she came upon a neat.</p>','published',1,'Dev\\ACL\\Models\\User',0,'news/20.jpg',629,NULL,'2025-10-15 00:16:36','2025-10-15 00:16:36');
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
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
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
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"block.index\":true,\"block.create\":true,\"block.edit\":true,\"block.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"custom-fields.index\":true,\"custom-fields.create\":true,\"custom-fields.edit\":true,\"custom-fields.destroy\":true,\"fob-comment.index\":true,\"fob-comment.comments.index\":true,\"fob-comment.comments.edit\":true,\"fob-comment.comments.destroy\":true,\"fob-comment.comments.reply\":true,\"fob-comment.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"member.index\":true,\"member.create\":true,\"member.edit\":true,\"member.destroy\":true,\"member.settings\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-10-15 00:16:34','2025-10-15 00:16:34');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','6c4a7288d80c00ffb210ac4fdc4d49cd',NULL,'2025-10-15 00:16:44'),(2,'api_enabled','0',NULL,'2025-10-15 00:16:44'),(3,'analytics_dashboard_widgets','0','2025-10-15 00:16:32','2025-10-15 00:16:32'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"block\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"custom-field\",\"fob-comment\",\"gallery\",\"member\",\"request-log\",\"social-login\",\"translation\"]',NULL,'2025-10-15 00:16:44'),(5,'enable_recaptcha_superadmin@fsofts.com_contact_forms_fronts_contact_form','1','2025-10-15 00:16:33','2025-10-15 00:16:33'),(6,'theme','master',NULL,'2025-10-15 00:16:44'),(7,'show_admin_bar','1',NULL,'2025-10-15 00:16:44'),(8,'language_hide_default','1',NULL,'2025-10-15 00:16:44'),(9,'language_switcher_display','dropdown',NULL,'2025-10-15 00:16:44'),(10,'language_display','all',NULL,'2025-10-15 00:16:44'),(11,'language_hide_languages','[]',NULL,'2025-10-15 00:16:44'),(12,'theme-master-site_title','Just another Laravel CMS site',NULL,NULL),(13,'theme-master-seo_description','With experience, we make sure to get every project done very fast and in time with high quality using our Laravel CMS https://fsofts.com',NULL,NULL),(14,'theme-master-copyright','©%Y Your Company. All rights reserved.',NULL,NULL),(15,'theme-master-favicon','general/favicon.png',NULL,NULL),(16,'theme-master-favicon_type','image/png',NULL,NULL),(17,'theme-master-logo','general/logo.png',NULL,NULL),(18,'theme-master-website','https://cms.fsofts.com',NULL,NULL),(19,'theme-master-contact_email','contact@fsofts.com',NULL,NULL),(20,'theme-master-site_description','With experience, we make sure to get every project done very fast and in time with high quality using our Laravel CMS https://fsofts.com',NULL,NULL),(21,'theme-master-phone','+(123) 345-6789',NULL,NULL),(22,'theme-master-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(23,'theme-master-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(24,'theme-master-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(25,'theme-master-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(26,'theme-master-homepage_id','1',NULL,NULL),(27,'theme-master-blog_page_id','2',NULL,NULL),(28,'theme-master-primary_color','#AF0F26',NULL,NULL),(29,'theme-master-primary_font','Roboto',NULL,NULL),(30,'theme-master-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(31,'theme-master-lazy_load_images','1',NULL,NULL),(32,'theme-master-lazy_load_placeholder_image','general/preloader.gif',NULL,NULL);
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
  KEY `slugs_reference_index` (`reference_id`,`reference_type`),
  KEY `idx_slugs_reference` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(2,'blog',2,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(3,'contact',3,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(4,'cookie-policy',4,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(5,'galleries',5,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(6,'about-us',6,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(7,'privacy-policy',7,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(8,'terms-of-service',8,'Dev\\Page\\Models\\Page','','2025-10-15 00:16:34','2025-10-15 00:16:34'),(9,'artificial-intelligence',1,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(10,'cybersecurity',2,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(11,'blockchain-technology',3,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(12,'5g-and-connectivity',4,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(13,'augmented-reality-ar',5,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(14,'green-technology',6,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(15,'quantum-computing',7,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(16,'edge-computing',8,'Dev\\Blog\\Models\\Category','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(17,'ai',1,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(18,'machine-learning',2,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(19,'neural-networks',3,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(20,'cybersecurity',4,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(21,'blockchain',5,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(22,'cryptocurrency',6,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(23,'iot',7,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(24,'arvr',8,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(25,'quantum-computing',9,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(26,'autonomous-vehicles',10,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(27,'space-tech',11,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(28,'robotics',12,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(29,'cloud-computing',13,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(30,'big-data',14,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(31,'devops',15,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(32,'mobile-tech',16,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(33,'5g',17,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(34,'biotechnology',18,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(35,'clean-energy',19,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(36,'smart-cities',20,'Dev\\Blog\\Models\\Tag','tag','2025-10-15 00:16:36','2025-10-15 00:16:36'),(37,'the-rise-of-quantum-computing-ibm-unveils-1000-qubit-processor',1,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(38,'apple-vision-pro-2-the-future-of-spatial-computing-has-arrived',2,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(39,'chatgpt-5-released-new-ai-model-shows-human-level-reasoning',3,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(40,'teslas-full-self-driving-finally-approved-for-highway-use-in-california',4,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(41,'major-cybersecurity-breach-500-million-records-exposed-in-cloud-storage-misconfiguration',5,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(42,'microsoft-introduces-ai-powered-code-review-40-reduction-in-production-bugs',6,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(43,'boston-dynamics-robots-now-working-in-amazon-warehouses',7,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(44,'metas-new-vr-gloves-let-you-feel-virtual-objects',8,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(45,'neuralink-begins-human-trials-first-patient-controls-computer-with-thoughts',9,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(46,'googles-project-starline-3d-video-calls-without-headsets',10,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(47,'nvidia-h200-gpu-breaks-ai-training-records',11,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(48,'ethereum-30-launches-100000-transactions-per-second-achieved',12,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(49,'spacex-starship-successfully-lands-on-moon-with-nasa-astronauts',13,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(50,'amazons-drone-delivery-expands-to-100-cities-across-the-us',14,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(51,'revolutionary-cancer-treatment-ai-discovers-personalized-drug-combinations',15,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(52,'samsungs-transparent-oled-displays-transform-retail-shopping',16,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(53,'waymo-robotaxis-now-operating-in-25-major-cities',17,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(54,'solar-paint-achieves-30-efficiency-every-building-can-generate-power',18,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(55,'blue-origins-space-hotel-welcomes-first-tourists',19,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(56,'ai-teachers-in-south-korea-personalized-education-for-every-student',20,'Dev\\Blog\\Models\\Post','','2025-10-15 00:16:36','2025-10-15 00:16:36'),(57,'tech-conference-2024',1,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(58,'product-launch-event',2,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(59,'team-building-retreat',3,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(60,'innovation-summit',4,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(61,'developer-meetup',5,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(62,'ai-workshop-series',6,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(63,'startup-showcase',7,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(64,'company-anniversary',8,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(65,'hackathon-weekend',9,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(66,'industry-awards-night',10,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(67,'new-office-opening',11,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(68,'community-outreach',12,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(69,'tech-talks-series',13,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(70,'partnership-celebration',14,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(71,'year-in-review',15,'Dev\\Gallery\\Models\\Gallery','galleries','2025-10-15 00:16:36','2025-10-15 00:16:36'),(72,'koelpin',1,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(73,'murazik',2,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(74,'goodwin',3,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(75,'beatty',4,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(76,'okuneva',5,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(77,'ratke',6,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(78,'sauer',7,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(79,'morissette',8,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(80,'graham',9,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(81,'lueilwitz',10,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(82,'johnson',11,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(83,'chen',12,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(84,'rodriguez',13,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(85,'kim',14,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42'),(86,'thompson',15,'Dev\\Member\\Models\\Member','author','2025-10-15 00:16:42','2025-10-15 00:16:42');
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
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
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
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'AI',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(2,'Machine Learning',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(3,'Neural Networks',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(4,'Cybersecurity',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(5,'Blockchain',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(6,'Cryptocurrency',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(7,'IoT',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(8,'AR/VR',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(9,'Quantum Computing',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(10,'Autonomous Vehicles',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(11,'Space Tech',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(12,'Robotics',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(13,'Cloud Computing',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(14,'Big Data',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(15,'DevOps',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(16,'Mobile Tech',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(17,'5G',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(18,'Biotechnology',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(19,'Clean Energy',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36'),(20,'Smart Cities',1,'Dev\\ACL\\Models\\User',NULL,'published','2025-10-15 00:16:36','2025-10-15 00:16:36');
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
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
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
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,'judah40@zieme.com',NULL,NULL,'$2y$12$rK4.eIMn3Z0QrJNue5X1WuvwN0nNfa4s.w9ffe243EPh.Yo6oouiS',NULL,'2025-10-15 00:16:34','2025-10-15 00:16:34','Dustin','Anderson','admin',1,1,1,NULL,NULL);
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
INSERT INTO `widgets` VALUES (1,'RecentPostsWidget','footer_sidebar','master',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-10-15 00:16:42','2025-10-15 00:16:42'),(2,'RecentPostsWidget','top_sidebar','master',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-10-15 00:16:42','2025-10-15 00:16:42'),(3,'TagsWidget','primary_sidebar','master',0,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}','2025-10-15 00:16:42','2025-10-15 00:16:42'),(4,'BlogCategoriesWidget','primary_sidebar','master',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"display_posts_count\":\"yes\"}','2025-10-15 00:16:42','2025-10-15 00:16:42'),(5,'CustomMenuWidget','primary_sidebar','master',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Social\",\"menu_id\":\"social\"}','2025-10-15 00:16:42','2025-10-15 00:16:42'),(6,'Dev\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','master',1,'{\"id\":\"Dev\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Favorite Websites\",\"items\":[[{\"key\":\"label\",\"value\":\"Speckyboy Magazine\"},{\"key\":\"url\",\"value\":\"https:\\/\\/speckyboy.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Tympanus-Codrops\"},{\"key\":\"url\",\"value\":\"https:\\/\\/tympanus.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Laravel Blog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/cms.fsofts.com\\/blog\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Laravel Vietnam\"},{\"key\":\"url\",\"value\":\"https:\\/\\/blog.laravelvietnam.org\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"CreativeBlog\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.creativebloq.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}],[{\"key\":\"label\",\"value\":\"Archi Elite JSC\"},{\"key\":\"url\",\"value\":\"https:\\/\\/archielite.com\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"1\"}]]}','2025-10-15 00:16:42','2025-10-15 00:16:42'),(7,'Dev\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','master',2,'{\"id\":\"Dev\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"My Links\",\"items\":[[{\"key\":\"label\",\"value\":\"Home Page\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"\\/contact\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Green Technology\"},{\"key\":\"url\",\"value\":\"\\/green-technology\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Augmented Reality (AR) \"},{\"key\":\"url\",\"value\":\"\\/augmented-reality-ar\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Galleries\"},{\"key\":\"url\",\"value\":\"\\/galleries\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2025-10-15 00:16:42','2025-10-15 00:16:42');
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

-- Dump completed on 2025-10-15 14:16:45
