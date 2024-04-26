/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - spp_xaverius
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`spp_xaverius` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `spp_xaverius`;

/*Table structure for table `bank_sekolahs` */

DROP TABLE IF EXISTS `bank_sekolahs`;

CREATE TABLE `bank_sekolahs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `nama_rekening` varchar(255) NOT NULL,
  `nomor_rekening` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bank_sekolahs` */

insert  into `bank_sekolahs`(`id`,`kode`,`nama_bank`,`nama_rekening`,`nomor_rekening`,`created_at`,`updated_at`) values 
(10,'008','Bank Mandiri','YAYASAN XAVERIUS 1 JAMBI','789546421','2023-05-19 11:39:33','2023-05-19 11:39:33');

/*Table structure for table `banks` */

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sandi_bank` varchar(20) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banks` */

insert  into `banks`(`id`,`sandi_bank`,`nama_bank`) values 
(1,'002','Bank BRI'),
(2,'008','Bank Mandiri'),
(3,'009','Bank BNI'),
(4,'427','Bank Syariah Indonesia (Eks. BNI Syariah)'),
(5,'451','Bank Syariah Indonesia (Eks. Bank Syariah Mandiri, BSM)'),
(6,'422','Bank Syariah Indonesia (Eks. BRI Syariah)'),
(7,'200','Bank BTN'),
(8,'022','Bank CIMB'),
(9,'022','Bank CIMB Niaga Syariah'),
(10,'147','Bank Muamalat'),
(11,'213','Bank BTPN'),
(12,'547','Bank BTPN Syariah');

/*Table structure for table `biayas` */

DROP TABLE IF EXISTS `biayas`;

CREATE TABLE `biayas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `biayas` */

insert  into `biayas`(`id`,`parent_id`,`nama`,`jumlah`,`user_id`,`created_at`,`updated_at`) values 
(1,NULL,'SPP 2023 - Januari',200,2,'2023-06-02 12:52:00','2023-06-02 12:54:27'),
(2,1,'PRAMUKA',454000,2,'2023-06-02 12:53:00','2023-06-02 12:53:00'),
(3,NULL,'SPP 2023',454000,2,'2023-06-02 12:58:59','2023-06-02 12:58:59'),
(4,NULL,'SPP 2023',455000,2,'2023-06-02 13:01:44','2023-06-02 13:01:44');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(17,'2014_10_12_000000_create_users_table',1),
(18,'2014_10_12_100000_create_password_resets_table',1),
(19,'2019_08_19_000000_create_failed_jobs_table',1),
(20,'2019_12_14_000001_create_personal_access_tokens_table',1),
(21,'2023_01_12_081441_create_siswas_table',1),
(22,'2023_01_13_054242_add_foto_to_siswas_table',1),
(23,'2023_01_17_112249_create_biayas_table',1),
(25,'2023_01_17_162251_create_tagihans_table',2),
(26,'2023_01_18_142816_create_tagihan_details_table',3),
(28,'2023_01_18_153539_create_pembayarans_table',4),
(29,'2021_08_08_100000_create_banks_tables',5),
(30,'2023_01_20_142654_create_bank_sekolahs_table',6),
(31,'2023_01_22_000022_create_wali_banks_table',7),
(33,'2023_01_23_000926_add_wali_bank_id_and_sekolah_bank_id_to_pembayarans_table',8),
(34,'2023_01_24_123624_create_notifications_table',9),
(36,'2023_01_24_154825_add_tanggal_konfirmasi_to_pembayaran_table',10),
(37,'2023_01_24_161545_drop_status_konfirmasi_to_pembayaran_table',11),
(39,'2023_05_26_151233_add_parent_id_to_biayas_table',12),
(40,'2023_05_26_224622_add_biaya_id_to_siswas_table',13),
(41,'2023_05_26_231404_create_statuses_table',14),
(42,'2014_10_00_000000_create_settings_table',15),
(43,'2014_10_00_000001_add_group_column_on_settings_table',15);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) values 
('1c1b5d86-416b-4c20-87c2-d3f509744b6a','App\\Notifications\\TagihanNotification','App\\Models\\User',50,'{\"tagihan_id\":2,\"title\":\"Tagihan SPPSamsul Nababan\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/2\"}',NULL,'2023-06-02 12:48:53','2023-06-02 12:48:53'),
('5847dd44-3768-40a7-a217-edb6170d3b6b','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":3,\"title\":\"Tagihan SPPCung\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/3\"}',NULL,'2023-06-02 12:42:28','2023-06-02 12:42:28'),
('6fcbfcdc-da05-4b9d-ad6c-21d5910e2ade','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":1,\"title\":\"Tagihan SPPStefina\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/1\"}',NULL,'2023-06-02 12:42:54','2023-06-02 12:42:54'),
('7bfa602f-7881-4554-a09a-28f2fa396809','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":1,\"title\":\"Tagihan SPPStefina\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/1\"}',NULL,'2023-06-02 12:42:28','2023-06-02 12:42:28'),
('9b243e3c-7724-4ea6-a762-6c0f11f81b8c','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":3,\"title\":\"Tagihan SPPStefina\",\"massages\":\"Tagihan SPP Bulan Mei 2023\",\"url\":\"http:\\/\\/localhost:8000\\/walimurid\\/tagihan\\/3\"}',NULL,'2023-05-28 00:00:40','2023-05-28 00:00:40'),
('9ced17b6-7c12-4444-8720-24f95bcebdae','App\\Notifications\\TagihanNotification','App\\Models\\User',16,'{\"tagihan_id\":2,\"title\":\"Tagihan SPPDevililica\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/2\"}',NULL,'2023-06-02 12:42:54','2023-06-02 12:42:54'),
('9f5c8a5c-fa5a-47c2-a807-19d9813397d8','App\\Notifications\\TagihanNotification','App\\Models\\User',16,'{\"tagihan_id\":4,\"title\":\"Tagihan SPPDevililica\",\"massages\":\"Tagihan SPP Bulan Mei 2023\",\"url\":\"http:\\/\\/localhost:8000\\/walimurid\\/tagihan\\/4\"}',NULL,'2023-05-28 00:00:40','2023-05-28 00:00:40'),
('a6d97880-b8f2-4e03-9b57-de270e1762fa','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":3,\"title\":\"Tagihan SPPCung\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/3\"}',NULL,'2023-06-02 12:42:54','2023-06-02 12:42:54'),
('ad4cb4f5-7d21-41b0-ad22-94fafc590707','App\\Notifications\\TagihanNotification','App\\Models\\User',70,'{\"tagihan_id\":1,\"title\":\"Tagihan SPPPrabawa Prasetya\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/1\"}',NULL,'2023-06-02 12:48:53','2023-06-02 12:48:53'),
('b21376a7-9eb3-4f5e-8aec-72fc555ea561','App\\Notifications\\TagihanNotification','App\\Models\\User',16,'{\"tagihan_id\":2,\"title\":\"Tagihan SPPDevililica\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/2\"}',NULL,'2023-06-02 11:12:00','2023-06-02 11:12:00'),
('b459503c-9cca-44cf-87b5-1bd97c02202f','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":3,\"title\":\"Tagihan SPPCung\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/3\"}',NULL,'2023-06-02 11:12:00','2023-06-02 11:12:00'),
('d105a7e7-80d3-44b8-81b3-dbdaf965d997','App\\Notifications\\TagihanNotification','App\\Models\\User',16,'{\"tagihan_id\":2,\"title\":\"Tagihan SPPDevililica\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/2\"}',NULL,'2023-06-02 12:42:28','2023-06-02 12:42:28'),
('d19207f7-5565-4bb4-916b-a29f1047eb0b','App\\Notifications\\TagihanNotification','App\\Models\\User',134,'{\"tagihan_id\":3,\"title\":\"Tagihan SPPWani Zulaika\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/3\"}',NULL,'2023-06-02 12:48:53','2023-06-02 12:48:53'),
('f386f67a-a552-4a8a-8a3e-4c19c9738b6b','App\\Notifications\\TagihanNotification','App\\Models\\User',15,'{\"tagihan_id\":1,\"title\":\"Tagihan SPPStefina\",\"massages\":\"Tagihan SPP Bulan Juni 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/walimurid\\/tagihan\\/1\"}',NULL,'2023-06-02 11:12:00','2023-06-02 11:12:00');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `pembayarans` */

DROP TABLE IF EXISTS `pembayarans`;

CREATE TABLE `pembayarans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_sekolah_id` bigint(20) unsigned DEFAULT NULL,
  `wali_bank_id` bigint(20) unsigned DEFAULT NULL,
  `tagihan_id` bigint(20) unsigned NOT NULL,
  `wali_id` bigint(20) unsigned NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `tanggal_konfirmasi` datetime DEFAULT NULL,
  `jumlah_dibayar` double NOT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembayarans_tagihan_id_index` (`tagihan_id`),
  KEY `pembayarans_wali_id_index` (`wali_id`),
  KEY `pembayarans_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pembayarans` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `val` text DEFAULT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`name`,`val`,`group`,`created_at`,`updated_at`) values 
(1,'app_name','SMP XAVERIUS 1','default','2023-05-28 00:27:32','2023-05-28 00:35:13'),
(2,'app_email','yayasanxaverius1jambi@gmail.com','default','2023-05-28 00:27:32','2023-05-28 00:27:32'),
(3,'app_phone','08987654321','default','2023-05-28 00:27:32','2023-05-28 00:27:32'),
(4,'app_address','Jl. Abdul Rahman Saleh No.19','default','2023-05-28 00:27:32','2023-05-28 00:31:44'),
(5,'app_pagination',NULL,'default','2023-05-28 00:27:32','2023-05-28 00:27:32');

/*Table structure for table `siswas` */

DROP TABLE IF EXISTS `siswas`;

CREATE TABLE `siswas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wali_id` int(11) DEFAULT NULL,
  `wali_status` varchar(255) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `jurusan` varchar(20) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `angkatan` int(11) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `biaya_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siswas_nisn_unique` (`nisn`),
  KEY `siswas_wali_id_index` (`wali_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `siswas` */

insert  into `siswas`(`id`,`wali_id`,`wali_status`,`nama`,`nisn`,`foto`,`jurusan`,`kelas`,`angkatan`,`user_id`,`created_at`,`updated_at`,`biaya_id`) values 
(1,70,'ok','Prabawa Prasetya','2676264761',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(2,50,'ok','Samsul Nababan','8734138200',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(3,134,'ok','Wani Zulaika','3230145268',NULL,'RPL','1',2021,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(4,109,'ok','Mulyanto Sihombing','3743477060',NULL,'RPL','1',2020,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(5,137,'ok','Kardi Mulya Mansur S.Kom','9461997385',NULL,'RPL','1',2020,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(6,47,'ok','Gandi Saputra S.Kom','9828730071',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(7,119,'ok','Yance Fujiati','9773405797',NULL,'RPL','1',2020,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(8,139,'ok','Zelaya Zizi Wijayanti S.E.I','8685324855',NULL,'RPL','1',2020,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(9,57,'ok','Farhunnisa Handayani','9875239916',NULL,'RPL','1',2021,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(10,56,'ok','Chandra Edison Situmorang S.Sos','9288853152',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(11,152,'ok','Gina Wulandari','4669046985',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(12,153,'ok','Naradi Salahudin','6210107333',NULL,'RPL','1',2021,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(13,150,'ok','Harsanto Artawan Mustofa M.Ak','6258260081',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(14,148,'ok','Laila Haryanti','2475848707',NULL,'RPL','1',2021,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(15,37,'ok','Caturangga Lulut Tamba','3271343434',NULL,'RPL','1',2022,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(16,72,'ok','Hasta Hutasoit','7742564765',NULL,'RPL','1',2021,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(17,33,'ok','Ghani Saptono','4841518255',NULL,'RPL','1',2021,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(18,100,'ok','Lalita Melani','2050359184',NULL,'RPL','1',2020,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(19,32,'ok','Dagel Muhammad Gunawan','3737791885',NULL,'RPL','1',2020,1,'2023-06-02 12:48:13','2023-06-02 12:48:13',1),
(20,112,'ok','Dian Jessica Wulandari S.Psi','7260162067',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(21,22,'ok','Karya Budiman','6134779784',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(22,115,'ok','Yani Mardhiyah','5135312853',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(23,49,'ok','Purwanto Winarno','7475456309',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(24,105,'ok','Usyi Suryatmi','4542883363',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(25,18,'ok','Jaiman Galih Tamba','5402110271',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(26,103,'ok','Prabu Laksana Sihombing','8222483340',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(27,142,'ok','Rachel Laila Mulyani M.Pd','9060185054',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(28,93,'ok','Indah Wijayanti','5210379915',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(29,64,'ok','Nabila Wulandari','9373052432',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(30,22,'ok','Galur Najmudin','4464165793',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(31,46,'ok','Alika Puspasari S.E.I','4768035459',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(32,144,'ok','Cahyanto Napitupulu','5503594316',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(33,24,'ok','Adhiarja Tampubolon','5724338146',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(34,161,'ok','Jatmiko Dacin Permadi','9209112328',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(35,25,'ok','Unjani Hassanah','3592953824',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(36,127,'ok','Wulan Oktaviani','6751700649',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(37,21,'ok','Mariadi Balidin Rajasa S.E.I','4878061834',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(38,71,'ok','Bakianto Marwata Dabukke','7440839310',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(39,43,'ok','Galih Wahyudin M.Kom.','4197699835',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(40,110,'ok','Maida Wulan Kuswandari S.Kom','9171913029',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(41,54,'ok','Indra Cemplunk Waluyo S.Ked','2421856778',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(42,152,'ok','Agus Kemba Salahudin M.Ak','3515133594',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(43,154,'ok','Luwar Caraka Gunawan S.Pd','3198400970',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(44,143,'ok','Lili Wahyuni','4216394195',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(45,129,'ok','Sabar Luwes Sirait','5514600039',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(46,108,'ok','Nabila Laras Usada','8939718185',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(47,135,'ok','Elon Wasita S.H.','3921816638',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(48,95,'ok','Elon Raihan Waskita M.TI.','5186869342',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(49,79,'ok','Dariati Prakosa Suryono S.Gz','3679926603',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(50,144,'ok','Cahya Manullang','8022623145',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(51,36,'ok','Diah Amelia Padmasari S.E.I','4090552805',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(52,121,'ok','Taufik Budiman','8450152108',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(53,49,'ok','Cengkal Hidayat S.Kom','8326788589',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(54,70,'ok','Ulva Nadia Hastuti','7410520871',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(55,97,'ok','Harsana Sihotang','6923605759',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(56,87,'ok','Olivia Safitri','7353687547',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(57,38,'ok','Ika Maida Hastuti M.Farm','4127140775',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(58,22,'ok','Saadat Zulkarnain','1833594137',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(59,88,'ok','Mujur Kasusra Gunarto S.Pd','5119655020',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(60,126,'ok','Paulin Paramita Mardhiyah S.Psi','6656246942',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(61,155,'ok','Among Pratama','8092616009',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(62,121,'ok','Utama Saefullah','1229353882',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(63,158,'ok','Martana Nasab Wahyudin','5059723657',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(64,137,'ok','Gandi Tampubolon','9849491575',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(65,87,'ok','Hesti Lailasari','4335120400',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(66,67,'ok','Jessica Ratna Novitasari S.Kom','6074000006',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(67,148,'ok','Adhiarja Mursinin Marbun M.Pd','5516147913',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(68,72,'ok','Gawati Mandasari','4362077767',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(69,27,'ok','Artawan Dongoran','1413058763',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(70,107,'ok','Gawati Puspita','9337750875',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(71,51,'ok','Mujur Irnanto Hidayanto','6602351914',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(72,153,'ok','Utama Damanik','2475902195',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(73,107,'ok','Cakrawala Suwarno','5985240778',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(74,112,'ok','Empluk Napitupulu S.T.','6809208948',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(75,53,'ok','Puji Citra Rahmawati M.Kom.','5061023024',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(76,47,'ok','Safina Pudjiastuti','8372922594',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(77,18,'ok','Hardana Dongoran','5347105288',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(78,118,'ok','Dewi Namaga','5646475424',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(79,86,'ok','Jagaraga Rusman Wibowo M.M.','2130744956',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(80,56,'ok','Irfan Siregar','6364258916',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(81,104,'ok','Wulan Permata S.Farm','9195033146',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(82,33,'ok','Sari Ifa Namaga S.E.I','5000240487',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(83,116,'ok','Tirtayasa Tampubolon S.Sos','1036414777',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(84,19,'ok','Syahrini Talia Mardhiyah','2323085350',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(85,47,'ok','Jaswadi Simbolon','3180643513',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(86,162,'ok','Shania Wijayanti','1211180283',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(87,155,'ok','Ina Nasyiah','3975781676',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(88,57,'ok','Karen Padmasari M.Farm','7055914860',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(89,32,'ok','Viman Cakrajiya Sitorus S.Pt','6172416226',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(90,129,'ok','Silvia Hassanah','6501210483',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(91,95,'ok','Mulyanto Maulana S.Sos','7489348282',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(92,57,'ok','Tirta Sitorus','8107964304',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(93,88,'ok','Wulan Astuti S.Ked','2376727788',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(94,41,'ok','Padmi Padma Riyanti','2762546487',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(95,49,'ok','Jamalia Lailasari','3848880265',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(96,88,'ok','Lalita Rahayu','8094384021',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(97,105,'ok','Nadine Puspita S.H.','1000013522',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(98,66,'ok','Daruna Saputra','5299370043',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(99,117,'ok','Ella Ajeng Winarsih','6357872235',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(100,35,'ok','Clara Rika Kusmawati M.Ak','2284135159',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(101,87,'ok','Iriana Wulandari','6182057152',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(102,19,'ok','Elvina Maya Melani S.E.I','2436076667',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(103,65,'ok','Opung Ajimin Prasasta','1581622142',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(104,57,'ok','Yani Yessi Wulandari','1543273352',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(105,53,'ok','Ganep Paiman Mandala S.Sos','4524705942',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(106,85,'ok','Yulia Novitasari','4327103086',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(107,21,'ok','Maria Juli Nurdiyanti','3589503596',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(108,20,'ok','Cahya Tampubolon','9345504667',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(109,53,'ok','Rahman Simanjuntak','1785669064',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(110,86,'ok','Eman Hutapea S.Farm','5453181429',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(111,157,'ok','Dodo Mansur','6406952106',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(112,40,'ok','Prabu Mahendra S.E.','4749711590',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(113,67,'ok','Ajimat Prayoga','6415411819',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(114,30,'ok','Gilda Rahmawati','6123888927',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(115,24,'ok','Zelda Utami','3134568669',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(116,85,'ok','Prayitna Marsudi Simanjuntak S.Pt','3110884300',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(117,102,'ok','Kurnia Pradana S.Pt','3892586908',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(118,89,'ok','Pranawa Hairyanto Prayoga S.Ked','7564222057',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(119,148,'ok','Salman Rajata M.Pd','9245173127',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(120,112,'ok','Sadina Winarsih S.Ked','7460277431',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(121,115,'ok','Nasim Mursita Situmorang','8827902736',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(122,74,'ok','Putri Siti Palastri S.Psi','4475192179',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(123,115,'ok','Almira Mutia Rahayu M.TI.','8410838911',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(124,110,'ok','Irfan Ganda Najmudin M.TI.','8750610465',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(125,21,'ok','Legawa Aris Santoso M.Ak','6228915399',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(126,63,'ok','Balijan Sihotang S.Pd','6890510859',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(127,19,'ok','Yunita Silvia Puspasari','5691079393',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(128,31,'ok','Galih Mansur','5680402334',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(129,15,'ok','Nadine Hartati','6166333287',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(130,128,'ok','Lutfan Januar','5759320298',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(131,100,'ok','Siska Hartati','1085927827',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(132,158,'ok','Farhunnisa Astuti','6675278429',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(133,68,'ok','Ayu Amelia Hassanah','6922787927',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(134,75,'ok','Maman Praba Halim M.Farm','9098551458',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(135,108,'ok','Adiarja Mangunsong M.Farm','2017166889',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(136,16,'ok','Qori Yuniar','8172859373',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(137,139,'ok','Mutia Mala Purwanti','2633258786',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(138,46,'ok','Humaira Aryani','6157179592',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(139,145,'ok','Gabriella Prastuti','6759992721',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(140,102,'ok','Lintang Ana Permata','2720147319',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(141,127,'ok','Ana Mayasari M.TI.','4032615163',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(142,119,'ok','Daruna Zulkarnain','5511318012',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(143,107,'ok','Jane Suartini','1510752847',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(144,27,'ok','Olivia Oktaviani','1852217200',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(145,115,'ok','Melinda Febi Purwanti S.E.I','3902425179',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(146,166,'ok','Cindy Juli Zulaika S.Farm','8159383030',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(147,118,'ok','Tiara Hariyah','2982433750',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(148,153,'ok','Tina Nurul Hastuti S.E.I','3784577574',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(149,20,'ok','Septi Puspasari S.E.','9139338704',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(150,21,'ok','Vera Mulyani','1216461404',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(151,44,'ok','Keisha Siti Hastuti M.Farm','1065002670',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(152,60,'ok','Devi Citra Usada','5480389256',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(153,104,'ok','Lega Kemba Wacana M.Farm','7808275175',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(154,25,'ok','Malika Usada','5646789975',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(155,87,'ok','Ghani Mulyanto Sihombing','5323612562',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(156,154,'ok','Cahya Lanang Prakasa S.Sos','4265885292',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(157,152,'ok','Daru Narpati S.Pd','3692899305',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(158,35,'ok','Gabriella Zizi Purnawati','6694391818',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(159,37,'ok','Kamaria Paulin Pudjiastuti','4184281222',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(160,84,'ok','Anastasia Mardhiyah M.M.','1891285111',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(161,22,'ok','Kamidin Wage Habibi S.Kom','3120533050',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(162,147,'ok','Anggabaya Suwarno S.Gz','2255019286',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(163,79,'ok','Yusuf Raharja Damanik','8094042358',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(164,134,'ok','Wulan Utami','9257333989',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(165,136,'ok','Anastasia Kamila Sudiati','3730522275',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(166,130,'ok','Umi Usyi Nurdiyanti','2941261335',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(167,157,'ok','Artawan Wibisono','4061992543',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(168,65,'ok','Victoria Wulandari','2165745622',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(169,165,'ok','Karimah Septi Pratiwi M.TI.','3848123731',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(170,56,'ok','Ismail Budiman','3320906613',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(171,47,'ok','Cindy Wastuti','3349349279',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(172,20,'ok','Cakrabuana Upik Najmudin M.Ak','3667282885',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(173,135,'ok','Hesti Susanti S.Sos','2238421320',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(174,158,'ok','Danang Mahfud Irawan S.Pd','6226475168',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(175,61,'ok','Kasiyah Utami','7731168639',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(176,145,'ok','Lutfan Hutagalung M.Ak','9205097302',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(177,79,'ok','Satya Simon Wasita','3373922262',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(178,40,'ok','Lalita Gawati Suryatmi','2374078236',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(179,146,'ok','Eka Utami','7385527005',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(180,45,'ok','Farah Tami Suryatmi','1699201921',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(181,148,'ok','Waluyo Hardiansyah','3478040895',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(182,140,'ok','Janet Hassanah','5766812290',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(183,33,'ok','Rudi Tamba','9932743375',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(184,62,'ok','Lasmono Marwata Habibi S.I.Kom','2344867578',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(185,50,'ok','Gandewa Jaeman Widodo','3773621587',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(186,45,'ok','Julia Nasyidah','7246350187',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(187,111,'ok','Jumadi Dariati Wibisono S.Sos','6373003861',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(188,165,'ok','Betania Zalindra Oktaviani S.Pt','2531111681',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(189,128,'ok','Olga Respati Firmansyah S.E.I','2773405205',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(190,30,'ok','Marsudi Mustofa','3155949694',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(191,165,'ok','Yuliana Raisa Farida S.E.I','2636530160',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(192,135,'ok','Adinata Samsul Maheswara S.Kom','4279371469',NULL,'RPL','1',2020,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(193,93,'ok','Langgeng Mahendra','9747885612',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(194,100,'ok','Ajimin Endra Winarno S.Sos','2539215106',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(195,71,'ok','Edi Pradipta','8206673132',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(196,85,'ok','Kamidin Lazuardi','2131066568',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(197,125,'ok','Lembah Budiman','6543917468',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(198,74,'ok','Edi Sinaga','6864655560',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(199,122,'ok','Ghaliyati Handayani S.Sos','4958011116',NULL,'RPL','1',2022,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1),
(200,59,'ok','Ade Hasanah S.Pd','8190619672',NULL,'RPL','1',2021,1,'2023-06-02 12:48:14','2023-06-02 12:48:14',1);

/*Table structure for table `statuses` */

DROP TABLE IF EXISTS `statuses`;

CREATE TABLE `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `reason` text DEFAULT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuses_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `statuses` */

insert  into `statuses`(`id`,`name`,`reason`,`model_type`,`model_id`,`created_at`,`updated_at`) values 
(1,'aktif',NULL,'App\\Models\\Siswa',1,'2023-05-26 23:22:20','2023-05-26 23:22:20'),
(2,'non-aktif',NULL,'App\\Models\\Siswa',1,'2023-05-26 23:35:20','2023-05-26 23:35:20'),
(3,'non-aktif',NULL,'App\\Models\\Siswa',1,'2023-05-26 23:36:07','2023-05-26 23:36:07'),
(4,'aktif',NULL,'App\\Models\\Siswa',1,'2023-05-26 23:37:49','2023-05-26 23:37:49'),
(5,'non-aktif',NULL,'App\\Models\\Siswa',1,'2023-05-26 23:37:52','2023-05-26 23:37:52'),
(6,'aktif',NULL,'App\\Models\\Siswa',1,'2023-05-26 23:40:45','2023-05-26 23:40:45'),
(7,'aktif',NULL,'App\\Models\\Siswa',2,'2023-05-27 23:05:26','2023-05-27 23:05:26'),
(8,'aktif',NULL,'App\\Models\\Siswa',3,'2023-05-28 22:42:28','2023-05-28 22:42:28');

/*Table structure for table `tagihan_details` */

DROP TABLE IF EXISTS `tagihan_details`;

CREATE TABLE `tagihan_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tagihan_id` bigint(20) unsigned NOT NULL,
  `nama_biaya` varchar(255) NOT NULL,
  `jumlah_biaya` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tagihan_details` */

/*Table structure for table `tagihans` */

DROP TABLE IF EXISTS `tagihans`;

CREATE TABLE `tagihans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siswa_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `angkatan` int(11) DEFAULT NULL,
  `kelas` int(11) DEFAULT NULL,
  `tanggal_tagihan` date NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `denda` double DEFAULT NULL,
  `status` enum('baru','angsur','lunas') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tagihans_siswa_id_index` (`siswa_id`),
  KEY `tagihans_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tagihans` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `akses` enum('operator','wali','admin') DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `nohp_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`akses`,`nohp`,`nohp_verified_at`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Admin','admin@admin.com','admin','081234567890',NULL,NULL,'$2y$10$xd5OaqhOVQ36Htqo3oRw8OzvIJQgRHhd3KtPJn1DeQjSAH7/CXpnq',NULL,'2023-01-18 09:43:39','2023-01-18 09:43:39'),
(2,'operator','operator@contoh.com','operator','081234567890','2023-01-18 09:45:31',NULL,'$2y$10$CQn.ZfeuUWWDSD71izSST.TUrmxHXgi76jirz9nBj5FIA02.aBFYu',NULL,'2023-01-18 09:45:31','2023-01-18 09:45:31'),
(15,'Stephen','stephen@gmail.com','wali','082184748220',NULL,NULL,'$2y$10$ejophbaT9NfjVUYHtihNpeoY/bTMlZoH1H66lhcIh0hxMiYAOdL/y',NULL,'2023-05-19 11:41:02','2023-05-19 11:41:02'),
(16,'Angellica','angellica@gmail.com','wali','082184748221',NULL,NULL,'$2y$10$OF9nma4xV/mPd0fFXmQ5PeS9i0f9kur.TodVI84effOKVsgCHvyRe',NULL,'2023-05-19 11:41:23','2023-05-19 11:41:23'),
(17,'Hamima Malika Purwanti','dariati72@example.org','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$W/CjaoeX9Yv2CZRDU3vnHOmCZPQAyaG40TFadHmbLCUWsmA1kQ1DS','lUU8Mj7Ntn','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(18,'Samiah Hasna Hassanah S.I.Kom','dnainggolan@example.net','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$AuMbzjjbadg6IgS6a1zAD.XcBpXAImnzl7URnoDCX2fEw6JP0Ra5G','Qyd4NhLGCR','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(19,'Oni Utami','oktaviani.dalima@example.net','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$FlmycrRzpnk03EIFONxYKuM8.3Rb1Qh73Z5rWLd045hY0tah4U9e.','91daqYUMaD','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(20,'Genta Zulaikha Suryatmi','gilang17@example.net','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$NUorjVCuBEFVZ6jJF6cOx.hRgUs0V7EXXY6mHphPVC8C96giNg6Vm','KGELjLPHbo','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(21,'Tina Mulyani','lazuardi.teguh@example.com','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$9O.Sl5Pk6gFQOFigNVouCOw0up54.JCZPtHSmRgQOeth21OQ4a7q2','icvnEAZts7','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(22,'Gatot Lurhur Tamba S.Farm','daryani02@example.com','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$lWltwVOH0GwXi5.u4f2xBeOZKEIRr3.FjU7QOkRzglGItVU.de9RW','ulByzkqCeA','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(23,'Jumadi Gunarto','salahudin.lulut@example.com','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$WzhCq/tKoNkZqXa8MQz8YuNSj17IXtyGuN/JdVQXYdni52bWm7Po2','wtd8agwzE2','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(24,'Amalia Purnawati S.H.','wmaulana@example.com','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$ehfvxu/cnJnaJvPATV7SbeJvYgEQvgaN0wq6Q7sRKeSEbGj/6v69q','Sb3bhsN0EW','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(25,'Ana Melani','cahyadi.usada@example.org','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$IE5ERME3KczZBfjDy/k/cun34q.jldrYefWbqfFE56axLV3Mrm5Gq','u0SelV18Ji','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(26,'Teguh Mustofa','pranowo.widya@example.org','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$eHnEOzQWwMI2DnZ2GVm27OIDuBNqYCfgfmLU1cG8OfenV39EBnwp.','zIUwtMZ0TG','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(27,'Najwa Kuswandari','budiyanto.saiful@example.com','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$H5hpeupNIU.XF7dDrd/igu.1Dkc/2VPP2yT.lQ3ZEUjM4WsuzLa56','9LSNu4hljK','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(28,'Tiara Hamima Susanti M.Pd','jagaraga61@example.org','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$3vz8nvUO5pUCS2EFUPGUNe.JUsfMfI7/0NAVDmn.uFIExd2sdw5C.','BngX4nLepr','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(29,'Ulva Lalita Rahimah S.Pd','frahmawati@example.com','wali',NULL,NULL,'2023-05-31 18:06:56','$2y$10$wtIkw./h8pB7anyUdMGrZO7VizvUc0Gz4sN5I74UoHsRa4dCfzrKO','8hSmxorJ7E','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(30,'Latika Halimah','qoktaviani@example.com','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$xEDk/4BnrI/jAO0oz9EUbexxQYM52DRGLurvcguQS0ysT3xE05Apy','GC3p8nUbzu','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(31,'Perkasa Waskita','ganda55@example.org','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$LAUoVrYyappIDFrjJYeD3.SM.TmGHCrgCYFNehXoXVntVxzRa6q52','nrtNb6TS06','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(32,'Padmi Purwanti','usada.farah@example.org','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$VDhNxZJrLCqFi.uZIux.QeL3wtPimDr.XDKj7FtAY9FkXHxZ/7rRK','vMgUKGOFsq','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(33,'Kayla Padmasari','vicky10@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$uhp2OeV1JksDqUtB1rWvgOTW/ASGdGiT/CJSOhqG91drbgABxx47K','kUCX94Ggw9','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(34,'Carla Eka Aryani','betania.aryani@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$4oxOY0AjUS0NfKsi.fB97OvR4U99lv2kGJpraFuEKqxkrjbYa.Lam','7k8q7ivll3','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(35,'Hani Utami','mangunsong.emil@example.com','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$x3DPOiWYr1qIeVvEPnI.bexrQf/ClvQ4/fE3yJ1qOE0GpgDQPG052','CY9vsg38hV','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(36,'Slamet Sitorus','jumadi.dongoran@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$CHXJeCZxh3s0ZrE.xOEdFOjp7f/0FWx3QdjVUd0d1B7zQ3ii7VhA.','753AjrtJuV','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(37,'Jessica Nilam Usada M.M.','kusmawati.pranawa@example.com','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$HA7xFoi9m4KPed1ix80LxeRpnqZYtSBgL.yMHhWUsQa/bH2Eee3Sa','x0IyG3hWoG','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(38,'Paris Nasyidah','budi.dongoran@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$.GHGQ5wIwEzcxizJ1gltcueOCL3Fz/Fwhr41K8kGih9.voMYiKESi','sdUyIn41Aa','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(39,'Garang Megantara S.H.','prima.saragih@example.com','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$B8NZ3tog4yL45vS4xiRStuaR.aHtr.AISTsbtbw9rkDv1wYVo4nZq','dYTjggAnuf','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(40,'Najwa Laksmiwati','hyolanda@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$tGyY6PHdaPmGn0tuYNI5meE.OgSd8pG0zVU9uh9ppC.Xp/M4WEXk2','JdLr2l6fwI','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(41,'Umi Yuliarti S.Gz','winarsih.anom@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$6Kn2aV3sXiroiiJ2.sAJ3elWyziOnOu6/zeYUZRBXo8.k0TJ9z3dO','kwj6myIHw6','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(42,'Paiman Rajasa','sakura.habibi@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$5Jb4sLC0ONe/YDnbaF9lbuuxpiH46ha1Q4S2Vd6mCFPp8/zYO2Dim','Zt32yB3zwJ','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(43,'Jagaraga Pranowo S.H.','bakti.setiawan@example.net','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$e/oZNsqLYSA4XsHaW/ki2eO.Z5Rnaanm.JQ8DmYucp0edL6/uQR6S','sWYPyOHWjP','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(44,'Vega Iswahyudi M.Farm','pratama.galih@example.org','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$dbLbWGdM.HsYOPJbJpv.c.hlXrX2M/MV2RVBno4Tvbs3DDdM5i3A6','f9bVopZoVU','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(45,'Radit Anggriawan','harjasa.melani@example.org','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$0mTU5MEJRILac5As0/IBcuDEnIiGuEqNRGrnqM8lhHd4/ul37y00u','LndciuB7b7','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(46,'Lurhur Balamantri Firgantoro M.Farm','wutami@example.com','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$9J0uvPZdStWERwGyrF.TYuUShS78Lzep99AnoPl1vliEwrZJ9VB.S','aChj9XaTyA','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(47,'Cindy Pudjiastuti','umar.hastuti@example.org','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$ULKaLsK8qy2iMJPu5v3B1ux6F7NsDUTHwlWiMVORWE/3.QAXfTbeK','A9ENQLyCAb','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(48,'Ifa Suryatmi M.M.','kawaya63@example.com','wali',NULL,NULL,'2023-05-31 18:06:57','$2y$10$t41UczeIgzOkJk1AFLDJveFfhR2qivYJl9vs4ZNB8gR1vXPGCtNEG','xvCgQnpRcw','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(49,'Elisa Prastuti','natalia56@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$0dPKhUxTdAqG7C5NnB89BuCiXZMqjHzHMpRZqjp7NJfHpVybyuVYK','0vQl7uieqK','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(50,'Salimah Wastuti','qhutapea@example.com','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$OouUDRU9PaDv7Bvs/KwIa.L1EvhWi.jKQwTl7AkVA0SuLE0qqOFW2','Zqjrpg8ogI','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(51,'Elma Rahmawati','widodo.elvina@example.org','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$ZweYZNJWzP9JDT5VbWlSvuzZdoM9GFc3UIdsCtwC4F4lR/XEqU51q','feIg6VBRMV','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(52,'Karsana Nasab Gunawan S.E.','maya80@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$zxwwpRzGEuPKFL6/oGBK.OPDfBrtSRba/.BwJR28rV5eUG9Du/iJK','kjyPfyjFNS','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(53,'Gamani Vino Hutasoit','heru91@example.com','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$cXA7o5cDo7BcqXTxa.MSvuDdkp1G8QiGYXKTTgJDupvFjgg7HpCCG','IFL5A1PVNa','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(54,'Marsito Prayoga M.Farm','nfarida@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$RVtgWb04XRmAnWoCF4.iWe.im3bv.l7Gp8j.SuVZ1AiRsuqTHmCOO','tkRfIfLiBS','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(55,'Luwar Firmansyah M.TI.','hakim.novi@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$XWAtejMNIdO6KEvExnPDdea6DTR1lRgTS4Qhqiim8xxgqsVtJlMcC','6EVfuPLGfj','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(56,'Cornelia Yolanda','wastuti.daru@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$2NefL5wrNglbqvQ73HGyWuGaf.Q1D.VvndIZmuN2LsGZyTdwKOCGW','i59GUX99j3','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(57,'Vinsen Warta Ramadan','bakidin.nuraini@example.org','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$Hmc9pHTjn0yisvA6.UbfguOYeL9OCEyIGJVs0We64Dg2fMqh6/Ov6','avenb4tT3U','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(58,'Galih Wibowo','usamah.umaya@example.org','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$WnkaGAzMXmbMF1.6SInilerg/lV3OF1pW0r6INL.vTxeMtgtWbXFS','7LcBHtk9oV','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(59,'Janet Yuniar M.Pd','kalim60@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$LMTSiBZzTMOrFMENbu/USuYAaYU3zcTbEWcn4aUrStGJQTjnMbNp2','uInuMtKuhJ','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(60,'Limar Marpaung S.T.','sihotang.sidiq@example.com','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$.XAeXS9E7ldhdbWw9bf38OinKd/sl5y.h/qomKFNaLxKdWnajhhum','TmfPYVlAdf','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(61,'Catur Arta Lazuardi','sihombing.muni@example.com','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$KwP.hbagQfl14dEbaChz5ewPZX9rP/ICGjF5YiwvNHacASUXFUNxq','LtJgZV5HK6','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(62,'Harjo Jabal Setiawan S.Gz','bambang05@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$H1Yw.jZgwC5C1IXyrWLrg.AS.00puYi.uOeGMAOAFLufB9l3ALbm2','C7sQ38M7mN','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(63,'Cakrabirawa Prayogo Natsir','enteng68@example.com','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$KyOX2hdTD6yoGn0Fi2kpXOBmxThS7q5nsAHojlYKyrq48cXMDtj9q','rhz1f8xILs','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(64,'Jane Handayani','naradi15@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$3AZatSlTE.6y9WikgsPPzuLbwpBUuHJwU7YC/fm5QHkzvyu/uDjL2','qIkUyFu0cq','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(65,'Hana Andriani','cwaskita@example.net','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$bATWmkYh2ocPnplueC90XO3424uZFTAXTdg5X5Z7Dc5G4fABkz/Va','j0u6m3M3DC','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(66,'Bajragin Wijaya M.Kom.','paulin.wahyuni@example.org','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$.nWYRi7U9M8KhPpxvvIYneUK9Z/sCJ4kUtJTeb/.dZp2u3Sw1alle','lxRPljib0S','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(67,'Fitria Hariyah','unovitasari@example.com','wali',NULL,NULL,'2023-05-31 18:06:58','$2y$10$a28VIAJeZvJyMyC8Ipv0iuUM.SiO4JOJd5sE3iXBkdVKvkMbqGfhu','N7PKZjzFos','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(68,'Maryadi Mansur S.IP','cindy92@example.net','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$IqmXqsayeeAtTx/4AcmA/O6E7q3LzuqIuFhJ57DaqsOrkCnPG4ZQW','RuG1Mjc6cl','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(69,'Gilda Riyanti','psihombing@example.net','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$RYwJ9ks6nFx/9dWMPeGSpeO2/3qE36Msb/8.peP8Ugacaya0TpwE2','9KEU5TYU4s','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(70,'Patricia Ophelia Widiastuti','kardi.tarihoran@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$yWCjTIh.b7yjjCtaU7Ax1eV4y1KLAGPjF3XD257YyMqijcP5Nhnsq','aFre9VHlwD','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(71,'Kenes Gunawan','nuraini.satya@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$.3bBfRf8l3SfKX50rKChnuf1WklDgzguma5MzKV7Q4wk9yQ0qmuSK','wwjaWdcgx1','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(72,'Febi Wulandari','slamet39@example.com','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$TtwXs/HspZs8uBvc.rOr8ulmmRN7IEXzJsBFxz.fzdzH37YL0V.ra','Vtto3Ljboo','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(73,'Cemeti Joko Sinaga','hwinarsih@example.com','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$ywkQ3vpbCISd2BkPHmBKHeO9a6MpwSfkd10RMiwCzhO6LMfMduFC.','JKMu52w0WI','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(74,'Maman Pangestu','gatot52@example.com','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$sHCACrsU2LteBB3UcAsQweBHCK4ltrmInGQN51B3gU430CGrExy66','YXkg1WETiT','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(75,'Maimunah Hastuti','nrima75@example.com','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$sBD2sS.2A9UZqpLmch229Od7l3WoUvF9lyrDlOMVKy8rnKv7R2iFW','n190YCfoWp','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(76,'Ifa Gilda Agustina','mdamanik@example.com','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$Wj4WEL9E61Pxufa09hD.cOJQTWHaMemZ2tmx2fIcoVFsBcruHnFUq','Xhq0D5bkC3','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(77,'Ayu Eli Rahmawati','murti.aryani@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$Ds1YSxxYTLrw6GqMO9gH1uo0WoRt5z7vBiJJuMOEDfs4iRlFzqORm','uTwVz7haiI','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(78,'Umi Mardhiyah','paramita.mangunsong@example.net','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$DDxEWyexcFC9cjaF4UTeX.cpn5p9k4Lk4U8F3lUxmz2jZaa.EKb4u','hLz6M7Aha0','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(79,'Nyoman Gunawan','marsito11@example.net','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$ScyoQfXvR3Cjj.K0lV4r3ePansOzHvVeLYxLk683KDbZALlg.N1Ei','mn5APLShC8','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(80,'Lanjar Hidayat','uyulianti@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$dMH.ssK9wRYYRYIZNQQy1e3ZDPmh0Dfl87XbTF5cFxR6bpiUSjL4K','BN5jHrC9Jp','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(81,'Virman Wasita','titin00@example.net','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$.2ssUBzKjPT8a.Dh7x.faOgk0iwBWDeSL21HT3Z6dGMlIo64h6GFm','lF94NbGLLt','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(82,'Prabowo Wibisono M.Farm','sinaga.usman@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$l1IFfGdYAh20Wpc3aciSfOQGHNABBBxSi96yHlXVWxPFLvLNucN2C','yvpNvorfLx','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(83,'Emin Natsir','puput65@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$kzQzP.XZvSJv9LoAnmjebeyA1.ucSJvr4/Z6B2gEKTvwPPK7IbR6q','SoXXKn3S4U','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(84,'Asmadi Caturangga Haryanto','marwata56@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$dqPLL/44d7K6CQ4TpBJMVuKoQaDgMVUBYTu9SlN0GHIPq/OnOwl1G','a3J1nkJkdr','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(85,'Raihan Pratama','galiono16@example.org','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$9Yy1w64d82fKvi8IKEK1BeFK6SHlf8j6KOJ7i3V0aiBML4RxSNRt6','XsxmDpYwm5','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(86,'Marsito Garan Sirait S.Gz','owaskita@example.net','wali',NULL,NULL,'2023-05-31 18:06:59','$2y$10$cwWxicJ3fY9XBpRrg7dsXOhe.IzjcTOi6wsn/nV06aKMgQJjWSwjG','U7CjOghezQ','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(87,'Darimin Dabukke','lanjar.hastuti@example.org','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$B9qqOZ3FGG04JABfaQJKy.sQKy8shCv44Ir2XUgLae1R9eq98KhPO','o5ay764dyk','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(88,'Cawisadi Saefullah','rkusumo@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$EeE8g7L5Zdo/9fONwpOt2.FSwhxrTo0ogsToQlFoUw73yMIhc5Vbm','C12n3ZJ3Sr','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(89,'Ian Zulkarnain','winarsih.utama@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$fkpulogEmYv8FeZuHg/B4OrUSlkLmDHGZ8/0EtrGXaglqtJboKXBW','SuMIDumPzv','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(90,'Gambira Among Suryono S.Psi','pratiwi.ade@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$nBZfka0G0Ye44rTM54Qa/OEzdYYWsrlVapl7HZlH4wRMGMxbRH2Ni','G8it8XUxee','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(91,'Sabrina Novitasari','lasmono.hutagalung@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$5NlqkQ8CLe.Rp258fO/cOuR6Z7YOR.Lh8urYBjZfgHMLXZApIsuTm','RbVTzSB7FX','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(92,'Martani Lanang Suwarno','guyainah@example.com','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$VDCqoi4KDkzScjS49HNWNu5lKGHC4Kw1.Xho75r23UHP64VrH9qnG','rFDAj7hMOT','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(93,'Kayun Megantara','osiregar@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$7nPsyaPBZV3cUK7R9V1CM.4GU98NS/nwlAeD95SyDBnr9OVklZ3le','8okukuLXOl','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(94,'Jumari Muhammad Marbun S.Farm','dinda.yolanda@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$8v9iu5nO82fRyFVX970AqeNxi7HIjrVNAg8YBtxxZqw.BL0sa5mDG','wRNuqxZ9dL','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(95,'Cahyo Sitorus','haryanti.umi@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$LKqy9IjQQRblOMjw4s4zxeJ4wLns1592WjuVz5nF8v3MZRmrSJq3m','PGL25S2v2x','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(96,'Bella Tania Prastuti','zutama@example.com','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$GSaVeyN.e.JiUAN3BIiTeu5T0ARuzRqwKJpT1cDflMBWL/1A58Ify','fbZzDCiTcN','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(97,'Danang Simbolon','pnababan@example.org','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$GpfaaxbmEKoigxhdcNspVefkWJUNeSyTBZDe7/Q8434xEmmOWH.uG','YkjWqPomLU','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(98,'Vanesa Mayasari','andriani.elvin@example.com','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$qNp1MdlQ6QVBomLwxlcS1OvYt6TEPA3ShQxdw0Zjr2Uj/tsiUO03K','zqPNHu4F03','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(99,'Sabrina Dinda Rahmawati S.Farm','wani.yolanda@example.com','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$tk3rUeAdsxueLOaxdZXnDOOoKjkxzsHK3muTKQFom/3EQKlB5gAsS','DhXr6KlFy3','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(100,'Legawa Simanjuntak','dasa.usada@example.org','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$S6.REtQTyMJNTf0KJ73xdu8fubfd8VGJE0PlMWwW4gWDEHVBuFHrm','gE0lMVPmAJ','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(101,'Endah Halimah','laras54@example.org','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$IGamzsua.SOTO.9Sp6/1bOXxQSfiEnBMATCKQoCqqP0C1l9voEPSG','93cbQFuIDp','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(102,'Harja Wahyudin','jati71@example.org','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$tBNy2.e79OdNZMuRBSG6YOaxFg9Z2tA8/HTRbLmE3tbxsH6UHKwx6','wt9FKyzgYg','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(103,'Martana Anggriawan S.T.','tami15@example.com','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$Ir/7/gqz4hGhI2z1L.Kb9uBZJiEFIQyYmWvh28CoMjgM6vTrxNIOi','mSUV80sKeO','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(104,'Slamet Jarwa Tampubolon S.I.Kom','dodo.aryani@example.org','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$sUg.sh1kim5Q06D0EuTpwOoGwRVu.zWPjHa8UG0.wsW3nyzUDwbuG','ncQniCigVo','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(105,'Umar Manullang','ana93@example.net','wali',NULL,NULL,'2023-05-31 18:07:00','$2y$10$rmYrP.JCjWMWvBGuaY70rOLXX0jFrXQEmYpLERQW7K0lrWjstfw6G','KWYvvevid2','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(106,'Ridwan Simanjuntak','putu37@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$4QFOsT7rQgGFocW7wgpUueipyLP4x1AWjkFYIifQutzDYsdBDFInG','56dtLb63zj','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(107,'Gaduh Kasiran Natsir','bahuwirya.adriansyah@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$diEOaAH0.URmR84ohniIlevTTjcEnwU28fGL8jQDtoEhwKI/XzQVm','TdKfuL0RYn','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(108,'Zizi Nuraini M.Kom.','fsimbolon@example.org','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$TEBe6N1NZWRQ.CMxUc0MoO0XEYdo/sQx0efkeFeq/aVWtLCGbnRqq','PMTYFofJKO','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(109,'Ivan Simanjuntak','lukita.mardhiyah@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$X3DSbcLErot03qMrUGoapeV5dwdga4YFEcFxG9jPqNz9KeT.ETrcW','zKuKVib6lA','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(110,'Karman Jaya Saefullah','citra72@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$51W/DSFl1cgVuOcoAVySqe2r8SfUo0JhfVzhjF6bgeArkJu0TExci','PK4LkjJ0Ut','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(111,'Karsana Nugroho','adiarja.halim@example.org','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$WnvRNkwsX12oeM6F8dBqgeKCy9rduacU/KSYMEE.tKe6ooU6Viao.','B4fBDNGaYS','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(112,'Karen Melani','rlestari@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$5j92AVdSTob9Zem1hkkZD.TmqH.x3jsuTKS47N8tdw0pSnCTnK23u','8ZxWWP9RD5','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(113,'Timbul Januar M.Pd','lanang.napitupulu@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$oI0by1Cp2RJdZvgKrbqfOOAjzElYvMlyhLGSh18h2vu45qSzVnVn2','F1LjZtfjLg','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(114,'Azalea Uyainah','daru06@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$77T85Ns.fyAyK7KDRCYfaOOhthPkjjCWPoDuosjZdfIa0i2RiQYlO','g8YDpSszw2','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(115,'Harjaya Marbun M.Kom.','gading96@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$HQOU.B2RwLpSypGYFI/C3eypJg3jR8VuvcqJ9wdZxv9X9GuxQSBrW','3wphToUPUb','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(116,'Zulfa Nabila Agustina','suryatmi.cinta@example.org','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$DgO.v0sK11kJ7BfSu8rXie38W1VJt4y/yjOtBIW70WtevGhJXeTTm','gYBjXPJtJ1','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(117,'Azalea Cinta Kusmawati S.Sos','purwanti.ikin@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$J0u5h71IUEIH0C0W8PyRfOqMPPb9SABPEGLIQkA4e7hnlQgasDFoS','LUu9JBNZPC','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(118,'Nurul Farida','rika94@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$ANuhPILQUvSzViB0Ds3zWeURKADOEJxh99d35A7nvm9v8nnOllgru','pLEUEiS4wR','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(119,'Reksa Halim','emaryati@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$QvjT4edrIJ5KfWblwIzQMeL789s89yKh2CVvAatNlZmFv9L9iY56q','UOxQ37cgCf','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(120,'Jefri Dabukke','prabowo41@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$WiUo6ZKE5L9knzUSuaPAteQHX4og6cyu/fwcKEXXRtGkOycUIDinW','58efhIwjIP','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(121,'Gangsar Pangestu M.Ak','kmulyani@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$6GgEND2AUmLW5RsjWLgo3.aiRABjG.NJXC63RMqFuLnhqrTm77Qyi','X44ykK2hfc','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(122,'Yulia Palastri','hidayanto.emil@example.net','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$ca1edlub4gLUUhWPW.cfSOq.4PMSLha16OK39ogbfxiODqNylEDLu','Ntpon3Lg01','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(123,'Wisnu Martaka Thamrin S.E.','suwarno.ulva@example.com','wali',NULL,NULL,'2023-05-31 18:07:01','$2y$10$x279SM29PglA5zdtkhb5me1crgX/8qn1lhHQ8YtojG6HMx7isvLYm','P3TxcMxlE6','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(124,'Zizi Salimah Hartati','dwaluyo@example.org','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$8KNKLnKdpt/atpEnaKKIGe9ve7ctZIQ/FF0vfPF6z7kNVzczasY0O','5emV0dlQRm','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(125,'Simon Utama S.Farm','bmardhiyah@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$/Ut5RIMpPbawW/BjWKPPyuZPgxpiPQfcd4.ZyKv5XKxUUG3Cz8Cvm','nmiliXHlRX','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(126,'Violet Namaga S.I.Kom','uli.mayasari@example.org','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$wado05/wBy3xw0MMdHSEvek18QWwx.99DP5SEn6DigttbXo7c1Ede','HEoKFEloEI','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(127,'Laras Safitri M.Ak','dinda89@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$.H9wWv06EhQMp61M/7xrXu2TfjOaIFnu8uu9FBuPr43nlntpoAMzy','FYSJjv5fyi','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(128,'Ika Riyanti','handayani.titi@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$VCNWX1ESX6mAoFDED9fdm.UDT7NTgvSuxLdu.BaWa99DlJhaN3IGW','bl68wrCtgu','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(129,'Irma Diah Padmasari S.Sos','ydamanik@example.com','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$mu.tDvdhVAkVULuzozzjReUuPq.Qqtla5JOfHdCLz47rXKWXvCJSe','j1f4k9BMH5','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(130,'Satya Sirait','raharja.pangestu@example.org','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$UxFBlQnqSSQtyslZTgAp4uyXlIR5MeEBIAXKneUhaWIKNkL78PxQa','2VLX3Rbz0b','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(131,'Cinthia Melani M.Ak','simanjuntak.tira@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$QBZIR4lV6pS0gpHSKa0UFuNKSb/tq5ej0rCV/I/wKLoo3jDeJsmw6','GwM7z8pt3w','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(132,'Hasan Marsito Suwarno','owidiastuti@example.com','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$8hG3uICAl47UlRi/Os1IRO3D6F78ra7YyFXjQBtPsYvTYlJpyT5f.','4aOpcKnwvh','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(133,'Usman Putu Saragih S.Sos','permata.wahyu@example.com','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$58dybOQlQM350bvNGPdKh.BH2PbvpozsJGZXwjZVO3pqkKiJSs1TG','4183t3XqoC','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(134,'Ella Fujiati','xbudiyanto@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$Is/ma12LKwFe7dN3rTaT.eBSSD2DBudhMftq1IQveaPfaTcr4n.v.','rIuXIVliWk','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(135,'Iriana Safitri S.Kom','estiono45@example.com','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$CYaGQRRJTUcOJFPTCu2cxuGrA5Lws4A4i3lWiwp/b3HGayrR.7aDq','c7g4Tl87Y2','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(136,'Radit Hutapea','autama@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$5S4fzYk01SaspwlPaGUFT.o97elru/fWg7VSn9rj.RWStdlfFzsne','WjbILDvCpg','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(137,'Ana Nuraini','oni26@example.org','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$mBR3dltn56FeBuhS.d5JyuThDsDew9bLZtyFfPTC2B1SUuW2bOoje','5qy36zmQun','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(138,'Ghaliyati Salimah Uyainah S.H.','hrahmawati@example.org','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$OjeFcGBSnLhOmkrEE0kS6OcjLf/.5sqBI3cECJf.MI3QUWnbrFB8e','CUFp9XUt8v','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(139,'Dipa Prabowo','martaka.nainggolan@example.com','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$8dSJYqJAsoq1IWXHm6hKx.v.LY/eBBv2M2flwuZ0DhiQpksPv9bmu','CwUs6C46be','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(140,'Darmanto Bakiono Wijaya','anggriawan.kezia@example.net','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$maOFJPZ6DmTwd0sCfPdqIOyegoKfsJclHRVgnKUMb/5YJvxSO2U3W','WZZGURYGuX','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(141,'Lidya Agustina','syolanda@example.org','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$2Ao70qsovhV0EPVXl6FJ0ens0WhhOMrZVPQP/3pqiZ.kiBtmIPHwO','s0Vps2UC3E','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(142,'Janet Kamila Nuraini S.T.','wadi.rahayu@example.com','wali',NULL,NULL,'2023-05-31 18:07:02','$2y$10$vVPDwijyMVaLmMQppczJ4uzDLKE2NWrREFiB81XnyaL1fgI8il4WW','v7i9PwxEbK','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(143,'Iriana Melani','yunita.namaga@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$yKL.tvIv0DZBVb8kDATSvO61PLxhR9oLRZCRxIe9AtDUrYwAUeKAW','hFwdpd9FjY','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(144,'Farhunnisa Gina Laksita S.I.Kom','irfan98@example.com','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$u5jcPd7QlS7heTFbRGAhvuCQT..6W8/5O.fUWoZNeYkCfTig/jB5S','n8sMVQPcbr','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(145,'Adiarja Halim','kiandra.hassanah@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$iQxP3W.feJUh47zUa7jnKu2KFpUlBTQ2fN5ZGjXmSg3sOnpCLN.Iq','AnNU0z1SJG','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(146,'Okto Maulana','nabila.kuswoyo@example.com','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$usELwHtKyvU8pEUrhQppWOhcFpo3yaPpvFeFMNsGmisExDOuxVoWS','FTRKyzqzvV','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(147,'Eluh Narpati','paulin.waluyo@example.com','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$3Q/6z5NYo3Ko6AE1ouAHqO1a1wpflq67NCCb/Erv08qucEBKOE2fm','Rc9KGhMsM6','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(148,'Ratih Febi Fujiati','wulandari.latika@example.com','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$hgWXrgZICqtkKSZ5mZHWtukQqQDN3a78ikLneLlf.8FHHeqEfScC6','aeRpYowD6s','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(149,'Calista Salsabila Hariyah S.Ked','natalia.situmorang@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$d.Ou4/NUAknEvLJnRcHR9OdP.tTn2YkBOV7UYa9S6lt.C51ha9ddq','pdzSxM1ovb','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(150,'Sabri Widodo S.IP','jandriani@example.org','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$y2DzQt8KlK18r1GgmKLQq.khGuQpHKGJ1vr11TIINncdzYks1PHO6','AAZPrB1jtM','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(151,'Gantar Damanik','phariyah@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$OzYYSSbR7DmNrGE3weaDVexSNjBFPp3aW9pfxEj7DJSsKjgYCiXTe','vUeoEfQwrG','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(152,'Ajimin Saptono S.Sos','ulya.riyanti@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$DOxuzhhQS/Op7FEa0UFPHu61SM0yhaY9MBlDpsz.X20/F0zv9okPO','EdIysvWgQu','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(153,'Hendri Gamani Budiman S.Pd','dagustina@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$XNL5tvr6RT2heDkWSiWqnOahaGwbB6ROhOYR0qBwq7UeI9HbmihTC','HENiW9bEEj','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(154,'Okta Marbun','dimaz.puspita@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$Gus2zFDEadya0vgzC3.D.eAF5ijphKBc78muvixOH9ZgSwNTuwzKu','XpDLIU3FeE','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(155,'Eluh Marbun','enteng49@example.org','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$uyLaqIQeiBBXrovtzLSQjeOfar1Zikl6V2fTCK/BwhNC30UYYho2u','MplGFSzeVm','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(156,'Legawa Hakim S.I.Kom','gambira.suryono@example.org','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$xf3zJ3ugtfRjIp17aF5TAOQMfZcBGh2SWn1tmrLYGcCRg7JUNnKYu','yKQaqidtsT','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(157,'Cakrawangsa Wahyudin S.IP','jhardiansyah@example.com','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$epFbJXFgMJarMEFdTl/LPOCNzCnFimJd1tqt2G9ASfa67VN/Nwm.a','vM0dL21Gsx','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(158,'Jais Situmorang S.Ked','winda98@example.org','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$uQeQmzsdehOIuBR2Em4snuQiEa8OkCUGk9C5NjFlxh4q23.Jrx.sC','huTyDM7tMJ','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(159,'Kamal Tarihoran','iwibowo@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$/Hh3qUEpWu59J54GMa9.Te5JO4A9O3PgwxoFkIyLcV0Z4r4SiAefO','XTynhu7kfl','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(160,'Ghaliyati Nasyiah','estiono88@example.net','wali',NULL,NULL,'2023-05-31 18:07:03','$2y$10$VRVmISZjZipy.8ADTBdRy.vutoazpFMlx/kvGwvlhx90ZZRLSyTL2','G1pUswddSe','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(161,'Pandu Malik Simanjuntak','pradana.cici@example.com','wali',NULL,NULL,'2023-05-31 18:07:04','$2y$10$fU/QmnQVrYBRCwChahlcZ.O8JQ11L6ihUlOl9btjzd6kw8eHOl8he','vvW2ihRujl','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(162,'Queen Uyainah M.Kom.','hasta10@example.net','wali',NULL,NULL,'2023-05-31 18:07:04','$2y$10$KO4xowDphYikuri/zGxCc.5jwnKzRSfhJtfE2j3VTqktEDK5jvmSq','ZVSUHqccHK','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(163,'Humaira Laksmiwati','caket82@example.org','wali',NULL,NULL,'2023-05-31 18:07:04','$2y$10$LbUd3RS5N4vp4Q1ykqvtGeubBbLMV0uHGC6mm2SqGCWOdOrZFesXq','LhzNbkY4yw','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(164,'Fitriani Hastuti','gharyanti@example.com','wali',NULL,NULL,'2023-05-31 18:07:04','$2y$10$1pnWYxsBJqSaM0HtsWfjS.Q24qeStcf7vqGf3trM6GIGNpl5sed6W','K1EEXtinwR','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(165,'Ilyas Hutasoit','betania.mulyani@example.net','wali',NULL,NULL,'2023-05-31 18:07:04','$2y$10$sMvbZzaY2nSBXijyAcmAYeBSSh3RTMJiA081n2YLbuMKSwj4GctkK','WGIlRKcmIH','2023-05-31 18:07:04','2023-05-31 18:07:04'),
(166,'Danang Umay Widodo S.Ked','xkusumo@example.net','wali',NULL,NULL,'2023-05-31 18:07:04','$2y$10$nK2SzoV7NfjueIrbJSaQDO.00sNSOhheZfXl07YicB8t/sTAGrEI6','uDL6BZNDI1','2023-05-31 18:07:04','2023-05-31 18:07:04');

/*Table structure for table `wali_banks` */

DROP TABLE IF EXISTS `wali_banks`;

CREATE TABLE `wali_banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wali_id` bigint(20) unsigned NOT NULL COMMENT 'wali id adalah primary key di user id',
  `kode` varchar(255) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `nama_rekening` varchar(255) NOT NULL,
  `nomor_rekening` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wali_banks` */

insert  into `wali_banks`(`id`,`wali_id`,`kode`,`nama_bank`,`nama_rekening`,`nomor_rekening`,`created_at`,`updated_at`) values 
(7,15,'002','Bank BRI','Stephen','784512','2023-05-19 12:03:09','2023-05-19 12:03:09'),
(8,16,'002','Bank BRI','Angellica','8956231245','2023-05-22 15:06:02','2023-05-22 15:06:02');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
