/*
 Navicat MySQL Data Transfer

 Source Server         : pbreeze
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : pb

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 18/02/2025 17:00:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _template
-- ----------------------------
DROP TABLE IF EXISTS `_template`;
CREATE TABLE `_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of _template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subject` (`subject_type`,`subject_id`) USING BTREE,
  KEY `causer` (`causer_type`,`causer_id`) USING BTREE,
  KEY `activity_log_log_name_index` (`log_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_of_service` datetime NOT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of appointments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cache
-- ----------------------------
BEGIN;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES ('users', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:5:{i:0;O:15:\"App\\Models\\User\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"users\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:6;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:8:\"Inactive\";s:10:\"first_name\";s:4:\"Bart\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Simpson\";s:5:\"email\";s:24:\"bart.simpson@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-07-21 22:38:29\";s:10:\"created_at\";s:19:\"2024-07-21 22:38:29\";s:10:\"updated_at\";s:19:\"2024-09-03 20:25:11\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:3;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:6;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:8:\"Inactive\";s:10:\"first_name\";s:4:\"Bart\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Simpson\";s:5:\"email\";s:24:\"bart.simpson@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-07-21 22:38:29\";s:10:\"created_at\";s:19:\"2024-07-21 22:38:29\";s:10:\"updated_at\";s:19:\"2024-09-03 20:25:11\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:3;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:17:\"email_verified_at\";s:8:\"datetime\";s:8:\"password\";s:6:\"hashed\";s:10:\"deleted_at\";s:8:\"datetime\";s:10:\"created_at\";s:8:\"datetime\";s:10:\"updated_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:4:{i:0;s:9:\"full_name\";i:1;s:16:\"created_at_human\";i:2;s:16:\"updated_at_human\";i:3;s:16:\"updated_at_human\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:2:{i:0;s:8:\"password\";i:1;s:14:\"remember_token\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:4:\"role\";i:1;s:6:\"status\";i:2;s:10:\"first_name\";i:3;s:9:\"last_name\";i:4;s:5:\"email\";i:5;s:8:\"password\";i:6;s:10:\"created_by\";i:7;s:10:\"updated_by\";i:8;s:10:\"deleted_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;s:10:\"\0*\0sort_by\";a:4:{s:10:\"first_name\";s:10:\"First Name\";s:11:\"middle_name\";s:11:\"Middle Name\";s:9:\"last_name\";s:9:\"Last Name\";s:5:\"email\";s:5:\"Email\";}s:19:\"\0*\0authPasswordName\";s:8:\"password\";s:20:\"\0*\0rememberTokenName\";s:14:\"remember_token\";}i:1;O:15:\"App\\Models\\User\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"users\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:8;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:6:\"Krusty\";s:11:\"middle_name\";s:3:\"The\";s:9:\"last_name\";s:5:\"Clown\";s:5:\"email\";s:24:\"krusty.clown@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-03-19 19:50:23\";s:10:\"created_at\";s:19:\"2024-03-19 19:50:23\";s:10:\"updated_at\";s:19:\"2024-07-18 10:47:28\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:1;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:8;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:6:\"Krusty\";s:11:\"middle_name\";s:3:\"The\";s:9:\"last_name\";s:5:\"Clown\";s:5:\"email\";s:24:\"krusty.clown@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-03-19 19:50:23\";s:10:\"created_at\";s:19:\"2024-03-19 19:50:23\";s:10:\"updated_at\";s:19:\"2024-07-18 10:47:28\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:1;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:17:\"email_verified_at\";s:8:\"datetime\";s:8:\"password\";s:6:\"hashed\";s:10:\"deleted_at\";s:8:\"datetime\";s:10:\"created_at\";s:8:\"datetime\";s:10:\"updated_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:4:{i:0;s:9:\"full_name\";i:1;s:16:\"created_at_human\";i:2;s:16:\"updated_at_human\";i:3;s:16:\"updated_at_human\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:2:{i:0;s:8:\"password\";i:1;s:14:\"remember_token\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:4:\"role\";i:1;s:6:\"status\";i:2;s:10:\"first_name\";i:3;s:9:\"last_name\";i:4;s:5:\"email\";i:5;s:8:\"password\";i:6;s:10:\"created_by\";i:7;s:10:\"updated_by\";i:8;s:10:\"deleted_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;s:10:\"\0*\0sort_by\";a:4:{s:10:\"first_name\";s:10:\"First Name\";s:11:\"middle_name\";s:11:\"Middle Name\";s:9:\"last_name\";s:9:\"Last Name\";s:5:\"email\";s:5:\"Email\";}s:19:\"\0*\0authPasswordName\";s:8:\"password\";s:20:\"\0*\0rememberTokenName\";s:14:\"remember_token\";}i:2;O:15:\"App\\Models\\User\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"users\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:5;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:4:\"Lisa\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Simpson\";s:5:\"email\";s:24:\"lisa.simpson@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-07-10 06:00:43\";s:10:\"created_at\";s:19:\"2024-07-10 06:00:43\";s:10:\"updated_at\";s:19:\"2024-08-09 18:43:14\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:3;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:5;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:4:\"Lisa\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Simpson\";s:5:\"email\";s:24:\"lisa.simpson@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-07-10 06:00:43\";s:10:\"created_at\";s:19:\"2024-07-10 06:00:43\";s:10:\"updated_at\";s:19:\"2024-08-09 18:43:14\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:3;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:17:\"email_verified_at\";s:8:\"datetime\";s:8:\"password\";s:6:\"hashed\";s:10:\"deleted_at\";s:8:\"datetime\";s:10:\"created_at\";s:8:\"datetime\";s:10:\"updated_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:4:{i:0;s:9:\"full_name\";i:1;s:16:\"created_at_human\";i:2;s:16:\"updated_at_human\";i:3;s:16:\"updated_at_human\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:2:{i:0;s:8:\"password\";i:1;s:14:\"remember_token\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:4:\"role\";i:1;s:6:\"status\";i:2;s:10:\"first_name\";i:3;s:9:\"last_name\";i:4;s:5:\"email\";i:5;s:8:\"password\";i:6;s:10:\"created_by\";i:7;s:10:\"updated_by\";i:8;s:10:\"deleted_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;s:10:\"\0*\0sort_by\";a:4:{s:10:\"first_name\";s:10:\"First Name\";s:11:\"middle_name\";s:11:\"Middle Name\";s:9:\"last_name\";s:9:\"Last Name\";s:5:\"email\";s:5:\"Email\";}s:19:\"\0*\0authPasswordName\";s:8:\"password\";s:20:\"\0*\0rememberTokenName\";s:14:\"remember_token\";}i:3;O:15:\"App\\Models\\User\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"users\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:7;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:5:\"Marge\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Simpson\";s:5:\"email\";s:25:\"marge.simpson@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-07-03 22:04:39\";s:10:\"created_at\";s:19:\"2024-07-03 22:04:39\";s:10:\"updated_at\";s:19:\"2024-11-09 06:17:20\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:3;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:7;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:5:\"Marge\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Simpson\";s:5:\"email\";s:25:\"marge.simpson@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2024-07-03 22:04:39\";s:10:\"created_at\";s:19:\"2024-07-03 22:04:39\";s:10:\"updated_at\";s:19:\"2024-11-09 06:17:20\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:3;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:17:\"email_verified_at\";s:8:\"datetime\";s:8:\"password\";s:6:\"hashed\";s:10:\"deleted_at\";s:8:\"datetime\";s:10:\"created_at\";s:8:\"datetime\";s:10:\"updated_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:4:{i:0;s:9:\"full_name\";i:1;s:16:\"created_at_human\";i:2;s:16:\"updated_at_human\";i:3;s:16:\"updated_at_human\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:2:{i:0;s:8:\"password\";i:1;s:14:\"remember_token\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:4:\"role\";i:1;s:6:\"status\";i:2;s:10:\"first_name\";i:3;s:9:\"last_name\";i:4;s:5:\"email\";i:5;s:8:\"password\";i:6;s:10:\"created_by\";i:7;s:10:\"updated_by\";i:8;s:10:\"deleted_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;s:10:\"\0*\0sort_by\";a:4:{s:10:\"first_name\";s:10:\"First Name\";s:11:\"middle_name\";s:11:\"Middle Name\";s:9:\"last_name\";s:9:\"Last Name\";s:5:\"email\";s:5:\"Email\";}s:19:\"\0*\0authPasswordName\";s:8:\"password\";s:20:\"\0*\0rememberTokenName\";s:14:\"remember_token\";}i:4;O:15:\"App\\Models\\User\":34:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"users\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:16:{s:2:\"id\";i:9;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:9:\"Principal\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Skinner\";s:5:\"email\";s:29:\"principal.skinner@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2023-12-31 12:16:54\";s:10:\"created_at\";s:19:\"2023-12-31 12:16:54\";s:10:\"updated_at\";s:19:\"2024-04-10 00:50:11\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:2;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:11:\"\0*\0original\";a:16:{s:2:\"id\";i:9;s:4:\"role\";s:5:\"Nurse\";s:6:\"status\";s:6:\"Active\";s:10:\"first_name\";s:9:\"Principal\";s:11:\"middle_name\";s:0:\"\";s:9:\"last_name\";s:7:\"Skinner\";s:5:\"email\";s:29:\"principal.skinner@example.com\";s:8:\"password\";N;s:14:\"remember_token\";N;s:17:\"email_verified_at\";s:19:\"2023-12-31 12:16:54\";s:10:\"created_at\";s:19:\"2023-12-31 12:16:54\";s:10:\"updated_at\";s:19:\"2024-04-10 00:50:11\";s:10:\"deleted_at\";N;s:10:\"created_by\";i:2;s:10:\"updated_by\";N;s:10:\"deleted_by\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:17:\"email_verified_at\";s:8:\"datetime\";s:8:\"password\";s:6:\"hashed\";s:10:\"deleted_at\";s:8:\"datetime\";s:10:\"created_at\";s:8:\"datetime\";s:10:\"updated_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:4:{i:0;s:9:\"full_name\";i:1;s:16:\"created_at_human\";i:2;s:16:\"updated_at_human\";i:3;s:16:\"updated_at_human\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:2:{i:0;s:8:\"password\";i:1;s:14:\"remember_token\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:9:{i:0;s:4:\"role\";i:1;s:6:\"status\";i:2;s:10:\"first_name\";i:3;s:9:\"last_name\";i:4;s:5:\"email\";i:5;s:8:\"password\";i:6;s:10:\"created_by\";i:7;s:10:\"updated_by\";i:8;s:10:\"deleted_by\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;s:10:\"\0*\0sort_by\";a:4:{s:10:\"first_name\";s:10:\"First Name\";s:11:\"middle_name\";s:11:\"Middle Name\";s:9:\"last_name\";s:9:\"Last Name\";s:5:\"email\";s:5:\"Email\";}s:19:\"\0*\0authPasswordName\";s:8:\"password\";s:20:\"\0*\0rememberTokenName\";s:14:\"remember_token\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2055235035);
COMMIT;

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `on_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `address_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of contacts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for discussion_posts
-- ----------------------------
DROP TABLE IF EXISTS `discussion_posts`;
CREATE TABLE `discussion_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discussion_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of discussion_posts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for discussion_users
-- ----------------------------
DROP TABLE IF EXISTS `discussion_users`;
CREATE TABLE `discussion_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `discussion_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of discussion_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for discussions
-- ----------------------------
DROP TABLE IF EXISTS `discussions`;
CREATE TABLE `discussions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of discussions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `on_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `folder` varchar(255) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of documents
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for encounter_users
-- ----------------------------
DROP TABLE IF EXISTS `encounter_users`;
CREATE TABLE `encounter_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `encounter_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of encounter_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for encounters
-- ----------------------------
DROP TABLE IF EXISTS `encounters`;
CREATE TABLE `encounters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of encounters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `jobs_queue_index` (`queue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of patients
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_users
-- ----------------------------
DROP TABLE IF EXISTS `schedule_users`;
CREATE TABLE `schedule_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_users
-- ----------------------------
BEGIN;
INSERT INTO `schedule_users` (`id`, `user_id`, `schedule_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (1, 2, 5, '2025-02-18 19:38:59', NULL, NULL, 1, NULL, NULL);
INSERT INTO `schedule_users` (`id`, `user_id`, `schedule_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (2, 2, 6, '2025-02-18 21:17:13', NULL, NULL, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedules
-- ----------------------------
BEGIN;
INSERT INTO `schedules` (`id`, `type`, `date`, `start`, `end`, `location`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (6, 'My Type', '2025-02-20', '08:00:00', '14:00:00', 'Office', 'My Schedule Title', 'asdasdasdasd', '2025-02-18 21:17:13', '2025-02-18 21:17:13', NULL, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sessions_user_id_index` (`user_id`) USING BTREE,
  KEY `sessions_last_activity_index` (`last_activity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `on_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(50) NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_primary` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (1, 'Super Admin', 'Active', 'John', 'Ben', 'Doe', 'john.doe@example.com', NULL, NULL, '2020-01-01 08:00:00', '2020-01-01 08:00:00', '2020-01-01 08:00:00', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (2, 'Doctor', 'Active', 'Homer', '', 'Simpson', 'homer.simpson@example.com', NULL, NULL, '2021-11-21 00:19:33', '2021-11-21 00:19:33', '2021-12-02 05:31:54', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (3, 'Doctor', 'Inactive', 'Ned', '', 'Flanders', 'ned.flanders@example.com', NULL, NULL, '2024-06-25 16:20:50', '2024-06-25 16:20:50', '2024-09-10 04:14:04', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (4, 'Doctor', 'Active', 'Moe', '', 'Szyslak', 'moe.szyslak@example.com', NULL, NULL, '2023-12-25 05:47:17', '2023-12-25 05:47:17', '2024-09-26 11:08:17', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (5, 'Nurse', 'Active', 'Lisa', '', 'Simpson', 'lisa.simpson@example.com', NULL, NULL, '2024-07-10 06:00:43', '2024-07-10 06:00:43', '2024-08-09 18:43:14', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (6, 'Patient', 'Inactive', 'Charles!', '', 'Chadwick!', 'charles.chadwick@example.com', '$2y$12$yAQZFZab4fFp7stdsPuC0uOyENkuACfWsg.PzvZX3eYtiKSFi7SoG', NULL, '2024-07-21 22:38:29', '2024-07-21 22:38:29', '2025-02-18 10:42:35', NULL, 3, 1, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (7, 'Nurse', 'Active', 'Marge', '', 'Simpson', 'marge.simpson@example.com', NULL, NULL, '2024-07-03 22:04:39', '2024-07-03 22:04:39', '2024-11-09 06:17:20', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (8, 'Nurse', 'Active', 'Krusty', 'The', 'Clown', 'krusty.clown@example.com', NULL, NULL, '2024-03-19 19:50:23', '2024-03-19 19:50:23', '2024-07-18 10:47:28', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (9, 'Nurse', 'Active', 'Principal', '', 'Skinner', 'principal.skinner@example.com', NULL, NULL, '2023-12-31 12:16:54', '2023-12-31 12:16:54', '2024-04-10 00:50:11', NULL, 2, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (10, 'Staff', 'Active', 'Charles', 'Montgomery', 'Burns', 'charles.burns@example.com', NULL, NULL, '2024-04-07 01:27:25', '2024-04-07 01:27:25', '2024-06-02 02:52:46', NULL, 4, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (11, 'Staff', 'Inactive', 'Milhouse', '', 'Van Houten', 'milhouse.van houten@example.com', NULL, NULL, '2024-07-20 20:01:03', '2024-07-20 20:01:03', '2024-09-13 06:34:20', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (12, 'Staff', 'Active', 'Chief', '', 'Wiggum', 'chief.wiggum@example.com', NULL, NULL, '2024-04-27 08:09:59', '2024-04-27 08:09:59', '2024-11-14 16:47:40', NULL, 8, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (13, 'Staff', 'Active', 'Abraham', 'Grandpa', 'Simpson', 'abraham.simpson@example.com', NULL, NULL, '2024-07-20 11:10:00', '2024-07-20 11:10:00', '2024-10-09 11:06:14', NULL, 7, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (14, 'Staff', 'Active', 'Sideshow', '', 'Bob', 'sideshow.bob@example.com', NULL, NULL, '2024-07-07 19:11:16', '2024-07-07 19:11:16', '2024-11-07 03:48:42', NULL, 7, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (15, 'Staff', 'Active', 'Apu', '', 'Nahasapeemapetilon', 'apu.nahasapeemapetilon@example.com', NULL, NULL, '2024-07-17 14:39:52', '2024-07-17 14:39:52', '2024-09-07 19:29:10', NULL, 5, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (16, 'Staff', 'Active', 'Kent', '', 'Brockman', 'kent.brockman@example.com', NULL, NULL, '2024-05-18 04:04:21', '2024-05-18 04:04:21', '2024-06-30 20:03:47', NULL, 8, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (17, 'Staff', 'Active', 'Comic Book', '', 'Guy', 'comic book.guy@example.com', NULL, NULL, '2024-06-23 23:07:07', '2024-06-23 23:07:07', '2024-07-09 12:59:25', NULL, 8, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (18, 'Patient', 'Active', 'Edna', '', 'Krabappel', 'edna.krabappel@example.com', NULL, NULL, '2024-05-23 23:00:46', '2024-05-23 23:00:46', '2024-10-07 22:50:34', NULL, 12, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (19, 'Patient', 'Inactive', 'Nelson', '', 'Muntz', 'nelson.muntz@example.com', NULL, NULL, '2024-07-27 09:11:27', '2024-07-27 09:11:27', '2024-10-18 01:13:45', NULL, 7, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (20, 'Patient', 'Active', 'Lenny', '', 'Leonard', 'lenny.leonard@example.com', NULL, NULL, '2024-03-25 23:22:29', '2024-03-25 23:22:29', '2024-08-29 20:30:35', NULL, 9, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (21, 'Patient', 'Active', 'Mayor', '', 'Quimby', 'mayor.quimby@example.com', NULL, NULL, '2024-03-10 22:08:00', '2024-03-10 22:08:00', '2024-05-10 11:37:31', NULL, 2, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (22, 'Patient', 'Active', 'Waylon', '', 'Smithers', 'waylon.smithers@example.com', NULL, NULL, '2024-07-08 13:01:50', '2024-07-08 13:01:50', '2024-10-31 16:51:55', NULL, 12, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (23, 'Patient', 'Active', 'Maggie', '', 'Simpson', 'maggie.simpson@example.com', NULL, NULL, '2024-06-04 03:59:32', '2024-06-04 03:59:32', '2024-06-11 04:55:54', NULL, 16, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (24, 'Patient', 'Active', 'Groundskeeper', '', 'Willie', 'groundskeeper.willie@example.com', NULL, NULL, '2024-08-10 20:13:48', '2024-08-10 20:13:48', '2024-11-13 11:28:00', NULL, 2, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (25, 'Patient', 'Active', 'Barney', '', 'Gumble', 'barney.gumble@example.com', NULL, NULL, '2024-06-29 13:47:20', '2024-06-29 13:47:20', '2024-08-24 15:01:52', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (26, 'Patient', 'Active', 'Selma', '', 'Bouvier', 'selma.bouvier@example.com', NULL, NULL, '2024-08-08 10:11:03', '2024-08-08 10:11:03', '2024-10-27 18:07:38', NULL, 11, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (27, 'Patient', 'Active', 'Carl', '', 'Carlson', 'carl.carlson@example.com', NULL, NULL, '2024-07-30 16:12:19', '2024-07-30 16:12:19', '2024-08-27 11:39:17', NULL, 11, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (28, 'Patient', 'Active', 'Ralph', '', 'Wiggum', 'ralph.wiggum@example.com', NULL, NULL, '2024-08-13 07:26:19', '2024-08-13 07:26:19', '2024-11-03 15:33:13', NULL, 15, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (29, 'Patient', 'Inactive', 'Patty', '', 'Bouvier', 'patty.bouvier@example.com', NULL, NULL, '2024-04-15 12:16:50', '2024-04-15 12:16:50', '2024-05-05 16:56:19', NULL, 4, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (30, 'Patient', 'Active', 'Martin', '', 'Prince', 'martin.prince@example.com', NULL, NULL, '2024-08-13 06:54:12', '2024-08-13 06:54:12', '2024-09-27 01:40:00', NULL, 11, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (31, 'Patient', 'Active', 'Professor', 'John', 'Frink', 'professor.frink@example.com', NULL, NULL, '2024-07-24 16:58:35', '2024-07-24 16:58:35', '2024-09-23 05:32:26', NULL, 14, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (32, 'Patient', 'Active', 'Snake', '', 'Jailbird', 'snake.jailbird@example.com', NULL, NULL, '2024-05-17 03:10:27', '2024-05-17 03:10:27', '2024-06-23 14:24:03', NULL, 4, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (33, 'Patient', 'Active', 'Cletus', '', 'Spuckler', 'cletus.spuckler@example.com', NULL, NULL, '2024-07-10 20:46:32', '2024-07-10 20:46:32', '2024-09-11 02:11:35', NULL, 14, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (34, 'Patient', 'Active', 'Rainier', '', 'Wolfcastle', 'rainier.wolfcastle@example.com', NULL, NULL, '2024-08-11 13:24:42', '2024-08-11 13:24:42', '2024-08-16 12:39:02', NULL, 7, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (35, 'Patient', 'Active', 'Agnes', '', 'Skinner', 'agnes.skinner@example.com', NULL, NULL, '2021-05-09 00:21:59', '2021-05-09 00:21:59', '2022-06-16 02:02:27', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (36, 'Patient', 'Active', 'Sideshow', '', 'Mel', 'sideshow.mel@example.com', NULL, NULL, '2024-06-24 21:30:59', '2024-06-24 21:30:59', '2024-08-20 00:20:58', NULL, 16, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (37, 'Patient', 'Active', 'Otto', '', 'Mann', 'otto.mann@example.com', NULL, NULL, '2024-07-31 21:37:24', '2024-07-31 21:37:24', '2024-08-04 02:35:25', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (38, 'Patient', 'Active', 'Fat', '', 'Tony', 'fat.tony@example.com', NULL, NULL, '2024-07-24 19:28:19', '2024-07-24 19:28:19', '2024-09-05 23:34:27', NULL, 6, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (39, 'Patient', 'Inactive', 'Gil', '', 'Gunderson', 'gil.gunderson@example.com', NULL, NULL, '2024-06-03 02:07:10', '2024-06-03 02:07:10', '2024-06-26 16:41:17', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (40, 'Patient', 'Active', 'Miss', '', 'Hoover', 'miss.hoover@example.com', NULL, NULL, '2024-06-30 07:53:29', '2024-06-30 07:53:29', '2024-08-14 00:14:11', NULL, 10, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (41, 'Patient', 'Active', 'Disco', '', 'Stu', 'disco.stu@example.com', NULL, NULL, '2024-07-30 17:59:01', '2024-07-30 17:59:01', '2024-08-23 10:28:24', NULL, 13, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (42, 'Patient', 'Active', 'Troy', '', 'McClure', 'troy.mcclure@example.com', NULL, NULL, '2024-08-07 10:32:20', '2024-08-07 10:32:20', '2024-11-05 15:34:40', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (43, 'Patient', 'Active', 'Lionel', '', 'Hutz', 'lionel.hutz@example.com', NULL, NULL, '2024-07-16 09:33:23', '2024-07-16 09:33:23', '2024-08-18 16:52:02', NULL, 7, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (44, 'Patient', 'Active', 'Jimbo', '', 'Jones', 'jimbo.jones@example.com', NULL, NULL, '2024-07-22 03:45:54', '2024-07-22 03:45:54', '2024-07-25 21:56:25', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (45, 'Patient', 'Active', 'Bumblebee', '', 'Man', 'bumblebee.man@example.com', NULL, NULL, '2024-07-28 13:46:50', '2024-07-28 13:46:50', '2024-09-18 21:43:16', NULL, 6, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (46, 'Patient', 'Active', 'Hans', '', 'Moleman', 'hans.moleman@example.com', NULL, NULL, '2024-08-15 01:15:12', '2024-08-15 01:15:12', '2024-10-12 12:48:15', NULL, 6, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (47, 'Patient', 'Active', 'Helen', '', 'Lovejoy', 'helen.lovejoy@example.com', NULL, NULL, '2024-08-12 12:02:44', '2024-08-12 12:02:44', '2024-09-14 05:57:54', NULL, 3, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (48, 'Patient', 'Active', 'Jasper', '', 'Beardly', 'jasper.beardly@example.com', NULL, NULL, '2023-07-22 12:57:40', '2023-07-22 12:57:40', '2024-10-09 11:41:55', NULL, 2, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (55, 'Patient', 'Active', 'Charles', NULL, 'Chadwick', 'charles@example.com', '$2y$12$DtSL/8G6IVja.TE00xR0mOFrApWEumdTGfnhgPYNWsHca/C9xmd46', NULL, NULL, '2025-02-18 02:36:29', '2025-02-18 02:36:29', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (56, 'Patient', 'Active', 'Charles', NULL, 'Chadwick', 'charles@example.com', '$2y$12$Yr4EcxfhGAennmRV/hOJduNS0/dzFuC8wShHT.ZAmABE5iRItZl/G', NULL, NULL, '2025-02-18 02:36:45', '2025-02-18 02:36:45', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (57, 'Patient', 'Active', 'Charles', NULL, 'Chadwick', 'charles@example.com', '$2y$12$rVMAysb7Dcyl.uTrdmZQheNNBtsGiY6n/bkv0wnbwZPs1lE0rGlpO', NULL, NULL, '2025-02-18 02:37:25', '2025-02-18 02:37:25', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (58, 'Patient', 'Active', 'Charles', NULL, 'Chadwick', 'charles@example.com', '$2y$12$ZKTVP6SR3Ghau/gpfksiTeQMNAkAnwW3BILhe3Wj0rR7jpW4mmcuO', NULL, NULL, '2025-02-18 02:37:50', '2025-02-18 02:37:50', NULL, 1, NULL, NULL);
INSERT INTO `users` (`id`, `role`, `status`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES (59, 'Patient', 'Active', 'Captain', NULL, 'Caveman', 'captain.caveman@example.com', '$2y$12$VwHW30BChxrh1JJtIBQwR.OhbcL7suPMEg0ZNW6TYNl2BMrMEwXsC', NULL, NULL, '2025-02-18 11:21:24', '2025-02-18 11:21:24', NULL, 1, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
