-- --------------------------------------------------------
-- Host:                         movepe-mysql-server.mysql.database.azure.com
-- Server version:               8.0.42-azure - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table movepe-database.addon_services
CREATE TABLE IF NOT EXISTS `addon_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_addon_services_name` (`name`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.addon_services: ~2 rows (approximately)
INSERT INTO `addon_services` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Insurance', 'Goods insurance coverage available as an add-on', 1, '2025-07-09 10:31:17', '2025-07-09 10:31:17'),
	(2, 'Storage', 'Short-term storage facility available', 1, '2025-07-09 10:31:17', '2025-07-09 10:31:17');

-- Dumping structure for table movepe-database.affiliate_programs
CREATE TABLE IF NOT EXISTS `affiliate_programs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `referral_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_rate` decimal(5,2) NOT NULL DEFAULT '5.00',
  `total_referrals` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`),
  UNIQUE KEY `uk_referral_code` (`referral_code`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_referral_code` (`referral_code`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.affiliate_programs: ~2 rows (approximately)
INSERT INTO `affiliate_programs` (`id`, `user_id`, `referral_code`, `commission_rate`, `total_referrals`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ZPY6K2UV', 5.00, 0, 1, '2025-09-15 08:39:24', '2025-09-15 08:39:24'),
	(3, 10, 'Z751FNIA', 5.00, 0, 1, '2025-09-15 19:48:02', '2025-09-15 19:48:02');

-- Dumping structure for table movepe-database.affiliate_referrals
CREATE TABLE IF NOT EXISTS `affiliate_referrals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `referred_user_id` int NOT NULL,
  `referral_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','active','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_referred_user` (`referred_user_id`),
  KEY `idx_affiliate_id` (`affiliate_id`),
  KEY `idx_referral_code` (`referral_code`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.affiliate_referrals: ~0 rows (approximately)

-- Dumping structure for table movepe-database.app_settings
CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `uk_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.app_settings: ~8 rows (approximately)
INSERT INTO `app_settings` (`id`, `key`, `value`, `updated_at`, `created_at`) VALUES
	(1, 'vendor:2:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 10:10:44', '2025-09-15 10:10:44'),
	(2, 'vendor:3:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 11:34:02', '2025-09-15 11:34:02'),
	(3, 'vendor:4:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 11:35:24', '2025-09-15 11:35:24'),
	(4, 'vendor:5:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 11:40:23', '2025-09-15 11:40:23'),
	(5, 'vendor:6:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 11:49:44', '2025-09-15 11:49:44'),
	(6, 'vendor:7:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 11:55:14', '2025-09-15 11:55:14'),
	(7, 'vendor:8:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 11:59:39', '2025-09-15 11:59:39'),
	(8, 'vendor:9:distance_multipliers', '{"25": 1, "50": 1.1, "100": 1.2, "500": 1.3, "MAX": 1.8, "1000": 1.4, "1500": 1.5, "2000": 1.7}', '2025-09-15 12:03:22', '2025-09-15 12:03:22');

-- Dumping structure for table movepe-database.coupons
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `discount_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_value` decimal(10,2) DEFAULT NULL,
  `max_discount` decimal(10,2) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `usage_limit` int DEFAULT NULL,
  `usage_count` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vendor_code` (`vendor_id`,`code`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_start_date` (`start_date`),
  KEY `idx_end_date` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.coupons: ~0 rows (approximately)

-- Dumping structure for table movepe-database.coupon_usage
CREATE TABLE IF NOT EXISTS `coupon_usage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_coupon_user_order` (`coupon_id`,`user_id`,`order_id`),
  KEY `idx_coupon_id` (`coupon_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.coupon_usage: ~0 rows (approximately)

-- Dumping structure for table movepe-database.guides
CREATE TABLE IF NOT EXISTS `guides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_guides_slug` (`slug`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `fk_guides_created_by` (`created_by`),
  KEY `fk_guides_updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.guides: ~0 rows (approximately)

-- Dumping structure for table movepe-database.guide_categories
CREATE TABLE IF NOT EXISTS `guide_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_guide_categories_slug` (`slug`),
  UNIQUE KEY `uk_guide_categories_name` (`name`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.guide_categories: ~0 rows (approximately)

-- Dumping structure for table movepe-database.leads
CREATE TABLE IF NOT EXISTS `leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `move_date` datetime NOT NULL,
  `group_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('unassigned','assigned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unassigned',
  `assigned_vendor_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_move_date` (`move_date`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `fk_leads_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.leads: ~0 rows (approximately)

-- Dumping structure for table movepe-database.notification_settings
CREATE TABLE IF NOT EXISTS `notification_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg91_base_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg91_auth_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg91_sender_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'MSGIND',
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `otp` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_booked` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_cancelled` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_rejected` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.notification_settings: ~1 rows (approximately)
INSERT INTO `notification_settings` (`id`, `msg91_base_url`, `msg91_auth_key`, `msg91_sender_id`, `sms_enabled`, `otp`, `order_booked`, `order_cancelled`, `vendor_rejected`, `created_at`, `updated_at`) VALUES
	(1, 'https://control.msg91.com', '455009ApXFZFvxp1x6848edeeP1', 'MOVEPE', 0, '68ad91bd284dca78fb3a8002', '', '68ca913615cba52bc4246814', '68ca91c7a9b5aa37a52ce064', '2025-08-17 22:28:34', '2025-09-17 10:48:23');

-- Dumping structure for table movepe-database.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance_km` decimal(10,2) NOT NULL,
  `move_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `truck_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truck_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truck_quantity` int DEFAULT '1',
  `pickup_floor` enum('Ground Floor','1st Floor','2nd Floor','3rd Floor','4th Floor','5th Floor+') COLLATE utf8mb4_unicode_ci DEFAULT 'Ground Floor',
  `destination_floor` enum('Ground Floor','1st Floor','2nd Floor','3rd Floor','4th Floor','5th Floor+') COLLATE utf8mb4_unicode_ci DEFAULT 'Ground Floor',
  `labourers` int DEFAULT '0',
  `labour_cost_breakdown` longtext COLLATE utf8mb4_unicode_ci,
  `included_services` longtext COLLATE utf8mb4_unicode_ci,
  `extra_services` longtext COLLATE utf8mb4_unicode_ci,
  `move_date` datetime DEFAULT NULL,
  `selected_floor` enum('Ground Floor','1st Floor','2nd Floor','3rd Floor','4th Floor','5th Floor+') COLLATE utf8mb4_unicode_ci DEFAULT 'Ground Floor',
  `special_item_description` text COLLATE utf8mb4_unicode_ci,
  `original_cost` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `addon_services` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `razorpay_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('success','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('accepted','rejected','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'accepted',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancellation_reason` text COLLATE utf8mb4_unicode_ci,
  `driver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_truck_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_razorpay_order_id` (`razorpay_order_id`),
  UNIQUE KEY `uk_razorpay_payment_id` (`razorpay_payment_id`),
  KEY `idx_coupon_code` (`coupon_code`),
  KEY `idx_coupon_id` (`coupon_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `idx_status` (`status`),
  KEY `idx_truck_id` (`truck_id`),
  KEY `idx_selected_floor` (`selected_floor`),
  KEY `idx_driver_truck_number` (`driver_truck_number`),
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_orders_move_type` CHECK ((`move_type` in (_utf8mb4'1 BHK',_utf8mb4'2 BHK',_utf8mb4'3 BHK',_utf8mb4'4 BHK',_utf8mb4'Villa',_utf8mb4'Office',_utf8mb4'Vehicle',_utf8mb4'Car',_utf8mb4'Bike',_utf8mb4'Special Item',_utf8mb4'Pet Relocation',_utf8mb4'Commercial',_utf8mb4'local',_utf8mb4'domestic',_utf8mb4'international',_utf8mb4'office',_utf8mb4'household',_utf8mb4'vehicle'))),
  CONSTRAINT `chk_orders_non_negative_costs` CHECK (((`distance_km` >= 0) and (`original_cost` >= 0) and (`cost` >= 0))),
  CONSTRAINT `orders_chk_1` CHECK (json_valid(`labour_cost_breakdown`)),
  CONSTRAINT `orders_chk_2` CHECK (json_valid(`included_services`)),
  CONSTRAINT `orders_chk_3` CHECK (json_valid(`extra_services`))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.orders: ~1 rows (approximately)
INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `vendor_name`, `pickup_location`, `destination`, `distance_km`, `move_type`, `truck_id`, `truck_name`, `truck_quantity`, `pickup_floor`, `destination_floor`, `labourers`, `labour_cost_breakdown`, `included_services`, `extra_services`, `move_date`, `selected_floor`, `special_item_description`, `original_cost`, `cost`, `addon_services`, `coupon_id`, `coupon_code`, `discount_amount`, `razorpay_order_id`, `razorpay_payment_id`, `payment_status`, `status`, `created_at`, `updated_at`, `cancelled_at`, `cancellation_reason`, `driver_name`, `driver_mobile`, `driver_truck_number`) VALUES
	(1, 1, 7, 'Ram Packers and Movers', 'C93C+RW3, Sri Laxmi Nagar Colony, Manikonda, Hyderabad, Telangana 500089, India', 'Tanuku, Andhra Pradesh, India', 444.78, '1 BHK', '1bhk_opt_2', 'Ashok Leyland Dost', 1, 'Ground Floor', 'Ground Floor', 3, '{"baseRate":0,"pickupFloorCost":0,"destinationFloorCost":0,"totalFloorCost":0,"baseLabourCost":0,"totalLabourCost":0}', '[{"name":"Bubble Wrap","included":true},{"name":"Stretch Film & HDPE Sheets","included":true},{"name":"Packing Tape","included":true},{"name":"Foam Padding","included":true},{"name":"Fragile Item Packing","included":true}]', '[]', '2025-09-18 18:30:00', 'Ground Floor', NULL, 9750.00, 9750.00, '[]', NULL, NULL, 0.00, 'order_RIKJxt7Sb9ZjZO', NULL, 'failed', 'cancelled', '2025-09-16 15:43:43', '2025-09-16 16:15:42', NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table movepe-database.order_tracking
CREATE TABLE IF NOT EXISTS `order_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `idx_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.order_tracking: ~0 rows (approximately)

-- Dumping structure for table movepe-database.order_tracking_points
CREATE TABLE IF NOT EXISTS `order_tracking_points` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tracking_id` int NOT NULL,
  `order_id` int NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `lng` decimal(10,7) NOT NULL,
  `recorded_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_tracking_time` (`tracking_id`,`recorded_at`),
  KEY `idx_order_time` (`order_id`,`recorded_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.order_tracking_points: ~0 rows (approximately)

-- Dumping structure for table movepe-database.packing_services
CREATE TABLE IF NOT EXISTS `packing_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_packing_services_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.packing_services: ~14 rows (approximately)
INSERT INTO `packing_services` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Bubble Wrap', 'Protective bubble wrap for fragile goods', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(2, 'Packing Paper', 'Wrapping paper for dishware and delicate items', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(3, 'Corrugated Boxes', 'Sturdy corrugated boxes of various sizes', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(4, 'Stretch Film & HDPE Sheets', 'Stretch film and HDPE sheets for moisture and dust protection', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(5, 'Packing Tape', 'Strong packing tape for sealing boxes', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(6, 'Cora Cloth Blankets', 'Reusable cloth blankets for furniture protection', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(7, 'Foam Padding', 'Foam sheets and corners for impact protection', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(8, 'Plastic Wrap', 'Plastic wrap for securing items and bundles', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(9, 'Moving Blankets', 'Thick blankets for cushioning large items', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(10, 'Cardboard Dividers', 'Dividers for organizing and protecting contents', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(11, 'Fragile Item Packing', 'Specialized packing for fragile items', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(12, 'Wardrobe Boxes', 'Tall boxes with hanger bars for clothing', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(13, 'Dish Pack Boxes', 'Double-walled boxes for dishes and glassware', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14'),
	(14, 'Mirror Boxes', 'Telescoping boxes for mirrors and frames', 1, '2025-09-15 07:00:14', '2025-09-15 07:00:14');

-- Dumping structure for table movepe-database.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `report_type` enum('order_issue','service_quality','payment_issue','vendor_issue','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('pending','acknowledged','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_status` (`status`),
  KEY `idx_report_type` (`report_type`),
  KEY `idx_priority` (`priority`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `reports_chk_1` CHECK (json_valid(`attachments`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.reports: ~0 rows (approximately)

-- Dumping structure for table movepe-database.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `rating` int NOT NULL,
  `review_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_order` (`user_id`,`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `idx_rating` (`rating`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_vendor_public_status` (`vendor_id`,`is_public`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.reviews: ~0 rows (approximately)

-- Dumping structure for table movepe-database.schema_templates
CREATE TABLE IF NOT EXISTS `schema_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_template_name_content_type` (`template_name`,`content_type`),
  KEY `idx_content_type` (`content_type`),
  KEY `idx_is_active` (`is_active`),
  CONSTRAINT `schema_templates_chk_1` CHECK (json_valid(`schema_json`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.schema_templates: ~0 rows (approximately)

-- Dumping structure for table movepe-database.seo_settings
CREATE TABLE IF NOT EXISTS `seo_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `canonical_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text COLLATE utf8mb4_unicode_ci,
  `og_image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_card` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_site` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robots` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'index, follow',
  `structured_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_seo_settings_route_path` (`route_path`),
  KEY `idx_route_path` (`route_path`),
  CONSTRAINT `seo_settings_chk_1` CHECK (json_valid(`structured_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.seo_settings: ~0 rows (approximately)

-- Dumping structure for table movepe-database.subscription_plans
CREATE TABLE IF NOT EXISTS `subscription_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `monthly_leads` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_plan_code` (`code`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.subscription_plans: ~3 rows (approximately)
INSERT INTO `subscription_plans` (`id`, `code`, `name`, `price`, `monthly_leads`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'silver', 'Silver', 499.00, 2, 1, '2025-08-17 22:28:34', '2025-08-17 22:28:34'),
	(2, 'gold', 'Gold', 799.00, 5, 1, '2025-08-17 22:28:34', '2025-08-17 22:28:34'),
	(3, 'diamond', 'Diamond', 999.00, 10, 1, '2025-08-17 22:28:34', '2025-08-17 22:28:34');

-- Dumping structure for table movepe-database.truck_pricing
CREATE TABLE IF NOT EXISTS `truck_pricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `truck_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `truck_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `move_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance_km` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `dynamic_pricing_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `min_price` decimal(10,2) DEFAULT NULL,
  `max_price` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_vendor_truck` (`vendor_id`,`truck_id`),
  KEY `idx_truck_move_type` (`truck_id`,`move_type`),
  KEY `idx_distance` (`distance_km`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.truck_pricing: ~72 rows (approximately)
INSERT INTO `truck_pricing` (`id`, `vendor_id`, `truck_id`, `truck_name`, `move_type`, `distance_km`, `price`, `dynamic_pricing_enabled`, `min_price`, `max_price`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 2, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6200.00, 0, NULL, NULL, 1, '2025-09-15 10:03:20', '2025-09-16 16:24:23'),
	(2, 2, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7850.00, 0, NULL, NULL, 1, '2025-09-15 10:04:07', '2025-09-16 16:27:17'),
	(3, 2, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8930.00, 0, NULL, NULL, 1, '2025-09-15 10:04:49', '2025-09-16 16:36:32'),
	(4, 2, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 9548.00, 0, NULL, NULL, 1, '2025-09-15 10:05:14', '2025-09-16 16:57:35'),
	(5, 2, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10736.00, 0, NULL, NULL, 1, '2025-09-15 10:05:53', '2025-09-17 06:20:42'),
	(6, 2, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14837.00, 0, NULL, NULL, 1, '2025-09-15 10:06:20', '2025-09-16 17:02:39'),
	(7, 2, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 16341.00, 0, NULL, NULL, 1, '2025-09-15 10:07:45', '2025-09-16 17:04:33'),
	(8, 2, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19395.00, 0, NULL, NULL, 1, '2025-09-15 10:08:12', '2025-09-16 17:06:13'),
	(10, 2, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22596.00, 0, NULL, NULL, 1, '2025-09-15 10:56:36', '2025-09-16 17:08:24'),
	(11, 3, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6528.00, 0, NULL, NULL, 1, '2025-09-15 11:33:22', '2025-09-16 16:34:36'),
	(12, 3, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7900.00, 0, NULL, NULL, 1, '2025-09-15 11:33:22', '2025-09-16 16:27:08'),
	(13, 3, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8611.00, 0, NULL, NULL, 1, '2025-09-15 11:33:22', '2025-09-16 16:36:21'),
	(14, 3, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22375.00, 0, NULL, NULL, 1, '2025-09-15 11:33:22', '2025-09-16 17:08:17'),
	(15, 3, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 9879.00, 0, NULL, NULL, 1, '2025-09-15 11:33:22', '2025-09-16 16:57:20'),
	(16, 3, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14046.00, 0, NULL, NULL, 1, '2025-09-15 11:33:22', '2025-09-16 17:02:30'),
	(20, 4, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7525.00, 0, NULL, NULL, 1, '2025-09-15 11:38:44', '2025-09-16 16:27:00'),
	(21, 4, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6193.00, 0, NULL, NULL, 1, '2025-09-15 11:38:44', '2025-09-16 16:34:02'),
	(22, 4, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 10164.00, 0, NULL, NULL, 1, '2025-09-15 11:38:44', '2025-09-16 16:57:05'),
	(23, 4, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14588.00, 0, NULL, NULL, 1, '2025-09-15 11:38:44', '2025-09-16 17:02:18'),
	(24, 4, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8874.00, 0, NULL, NULL, 1, '2025-09-15 11:38:44', '2025-09-16 16:36:15'),
	(27, 4, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22842.00, 0, NULL, NULL, 1, '2025-09-15 11:38:44', '2025-09-16 17:08:10'),
	(29, 5, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10192.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-17 06:20:55'),
	(30, 5, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6131.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 16:33:49'),
	(32, 5, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8984.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 16:37:10'),
	(33, 5, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14309.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 17:02:07'),
	(34, 5, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 9523.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 16:56:53'),
	(35, 5, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19172.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 17:06:07'),
	(36, 5, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 15572.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 17:04:21'),
	(37, 5, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22189.00, 0, NULL, NULL, 1, '2025-09-15 11:43:24', '2025-09-16 17:08:04'),
	(38, 3, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19856.00, 0, NULL, NULL, 1, '2025-09-15 11:46:09', '2025-09-16 17:06:00'),
	(39, 3, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 16287.00, 0, NULL, NULL, 1, '2025-09-15 11:46:09', '2025-09-16 17:04:13'),
	(40, 3, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10412.00, 0, NULL, NULL, 1, '2025-09-15 11:46:09', '2025-09-17 06:21:47'),
	(41, 4, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 15915.00, 0, NULL, NULL, 1, '2025-09-15 11:48:34', '2025-09-16 17:04:05'),
	(42, 4, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19534.00, 0, NULL, NULL, 1, '2025-09-15 11:48:34', '2025-09-16 17:05:53'),
	(43, 4, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10958.00, 0, NULL, NULL, 1, '2025-09-15 11:48:34', '2025-09-17 06:21:07'),
	(44, 6, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7600.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 16:26:28'),
	(45, 6, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6305.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 16:33:35'),
	(46, 6, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8923.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 16:37:03'),
	(47, 6, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14763.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 17:01:56'),
	(50, 6, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 16428.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 17:03:57'),
	(51, 6, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19087.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 17:05:48'),
	(52, 6, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22603.00, 0, NULL, NULL, 1, '2025-09-15 11:54:00', '2025-09-16 17:07:56'),
	(53, 7, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6615.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 16:33:14'),
	(55, 7, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 9598.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 16:54:09'),
	(56, 7, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7550.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 16:26:23'),
	(57, 7, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10341.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-17 06:21:16'),
	(58, 7, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22937.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 17:07:35'),
	(59, 7, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 15634.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 17:03:48'),
	(60, 7, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14175.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 17:01:47'),
	(61, 7, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19912.00, 0, NULL, NULL, 1, '2025-09-15 11:58:26', '2025-09-16 17:05:45'),
	(63, 8, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14912.00, 0, NULL, NULL, 1, '2025-09-15 12:02:08', '2025-09-16 17:01:36'),
	(64, 8, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10824.00, 0, NULL, NULL, 1, '2025-09-15 12:02:08', '2025-09-17 06:21:27'),
	(65, 8, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22451.00, 0, NULL, NULL, 1, '2025-09-15 12:02:08', '2025-09-16 17:07:46'),
	(66, 8, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19248.00, 0, NULL, NULL, 1, '2025-09-15 12:02:08', '2025-09-16 17:05:31'),
	(67, 8, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6250.00, 0, NULL, NULL, 1, '2025-09-15 12:02:09', '2025-09-16 16:22:02'),
	(68, 8, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 16179.00, 0, NULL, NULL, 1, '2025-09-15 12:02:09', '2025-09-16 17:03:42'),
	(69, 8, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7750.00, 0, NULL, NULL, 1, '2025-09-15 12:02:09', '2025-09-16 16:26:16'),
	(70, 8, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8539.00, 0, NULL, NULL, 1, '2025-09-15 12:02:09', '2025-09-16 16:36:55'),
	(71, 9, '2bhk_opt_3', 'Eicher 14ft', '2 BHK', 0, 14428.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 17:01:27'),
	(72, 9, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8108.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 16:36:49'),
	(73, 9, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 10410.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 16:56:40'),
	(74, 9, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10087.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-17 06:21:35'),
	(75, 9, '1bhk_opt_1', 'Tata Ace', '1 BHK', 0, 6770.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 16:33:01'),
	(76, 9, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7800.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 16:26:05'),
	(77, 9, '3bhk_opt_2', 'Eicher 19ft', '3 BHK', 0, 19763.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 17:05:19'),
	(78, 9, '3bhk_opt_1', 'Eicher 17ft', '3 BHK', 0, 15842.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 17:03:33'),
	(79, 9, '4bhk_opt_1', 'Container Truck 20ft', '4 BHK', 0, 22718.00, 0, NULL, NULL, 1, '2025-09-15 12:05:17', '2025-09-16 17:07:21'),
	(80, 8, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 9746.00, 0, NULL, NULL, 1, '2025-09-15 12:11:02', '2025-09-16 16:54:56'),
	(81, 7, '1bhk_opt_3', 'Mahindra Bolero Pickup', '1 BHK', 0, 8553.00, 0, NULL, NULL, 1, '2025-09-15 12:12:23', '2025-09-16 16:36:42'),
	(82, 6, '2bhk_opt_1', 'Ashok Leyland Bada Dost', '2 BHK', 0, 10072.00, 0, NULL, NULL, 1, '2025-09-15 12:14:16', '2025-09-16 16:54:40'),
	(83, 6, '2bhk_opt_2', 'Tata 407', '2 BHK', 0, 10683.00, 0, NULL, NULL, 1, '2025-09-15 12:14:16', '2025-09-17 06:22:14'),
	(84, 5, '1bhk_opt_2', 'Ashok Leyland Dost', '1 BHK', 0, 7600.00, 0, NULL, NULL, 1, '2025-09-15 12:16:33', '2025-09-16 16:25:56');

-- Dumping structure for table movepe-database.url_redirects
CREATE TABLE IF NOT EXISTS `url_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` enum('301','302') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '301',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_source_url` (`source_url`),
  UNIQUE KEY `uk_url_redirects_source_url` (`source_url`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.url_redirects: ~0 rows (approximately)

-- Dumping structure for table movepe-database.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pricing` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_states` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_updates` int NOT NULL DEFAULT '0',
  `promotions` int NOT NULL DEFAULT '0',
  `security_alerts` int NOT NULL DEFAULT '0',
  `available_status` tinyint(1) NOT NULL DEFAULT '1',
  `otp` int NOT NULL,
  `role` enum('user','vendor','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `base_location_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_location_lat` decimal(10,8) DEFAULT NULL,
  `base_location_lng` decimal(11,8) DEFAULT NULL,
  `service_radius_km` int DEFAULT '50',
  `service_area_type` enum('states','radius','custom') COLLATE utf8mb4_unicode_ci DEFAULT 'states',
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_years` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `affiliate_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `referral_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` int DEFAULT NULL,
  `eta_config` text COLLATE utf8mb4_unicode_ci COMMENT 'JSON configuration for delivery ETA parameters (vendor-specific)',
  `city_tier_multipliers` text COLLATE utf8mb4_unicode_ci COMMENT 'JSON configuration for city tier multipliers (vendor-specific)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.users: ~15 rows (approximately)
INSERT INTO `users` (`id`, `mobile_number`, `email`, `name`, `location`, `pricing`, `service_states`, `order_updates`, `promotions`, `security_alerts`, `available_status`, `otp`, `role`, `created_at`, `updated_at`, `deleted_at`, `base_location_name`, `base_location_lat`, `base_location_lng`, `service_radius_km`, `service_area_type`, `company_name`, `business_type`, `experience_years`, `about`, `affiliate_enabled`, `referral_code`, `referred_by`, `eta_config`, `city_tier_multipliers`) VALUES
	(1, '918074733489', 'support@movepe.com', 'Admin', 'C93C+RW3, Sri Laxmi Nagar Colony, Manikonda, Hyderabad, Telangana 500089, India', '{}', '[]', 0, 0, 0, 0, 0, 'admin', '2025-09-15 08:26:31', '2025-09-17 06:09:43', NULL, NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 1, 'ZPY6K2UV', NULL, NULL, NULL),
	(2, '919966898444', '', 'Mukesh Kumar', 'Devi Krupa, 8-7-178/50/10, Military Dairy Farm Road, Ramraj Nagar Colony, Swarnadhama Nagar, Old Bowenpally, Secunderabad, Telangana 500011, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:11:13', '2025-09-16 11:37:25', NULL, NULL, NULL, NULL, 50, 'states', 'Kubera Logistics Packers and Movers', 'Packers and Movers', '5-10 years', '', 0, NULL, NULL, NULL, NULL),
	(3, '919989591027', '', 'Rahul', 'Balaji Swarnapuri Colony Rd, BSP Colony, Erragadda, Hyderabad, Telangana 500114, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:16:06', '2025-09-16 11:35:23', NULL, NULL, NULL, NULL, 50, 'states', 'Skywing Packers and Movers', 'Packers and Movers', '5-10 years', '', 0, NULL, NULL, NULL, NULL),
	(4, '917981598582', '', 'Chennaiah Palleni', 'Raja Reddy Colony, Maithri Vanam, Old Bowenpally, Secunderabad, Telangana 500011, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:19:06', '2025-09-16 11:38:59', NULL, NULL, NULL, NULL, 50, 'states', 'Dev Professional Packers and Movers', 'Packers and Movers', '10+ years', '', 0, NULL, NULL, NULL, NULL),
	(5, '918074212325', '', 'Kondeti Durga Bhavani', 'H.NO 08/161/E/1, Prasuna Nagar, Chinthal, Quthbullapur, Hyderabad, Telangana 500054, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:20:52', '2025-09-16 11:31:39', NULL, NULL, NULL, NULL, 50, 'states', 'Sri Durga Packers and Movers', 'Packers and Movers', '5-10 years', '', 0, NULL, NULL, NULL, NULL),
	(6, '918790553336', '', 'Subhash', 'Old Bowenpally, Secunderabad, Telangana, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:22:50', '2025-09-16 11:29:53', NULL, NULL, NULL, NULL, 50, 'states', 'Aradhya Relocation Packers and Movers', 'Packers and Movers', '3-5 years', '', 0, NULL, NULL, NULL, NULL),
	(7, '919912993084', '', 'Ramu', 'Chinthal, Hyderabad, Telangana, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:27:28', '2025-09-16 11:27:41', NULL, NULL, NULL, NULL, 50, 'states', 'Ram Packers and Movers', 'Packers and Movers', '5-10 years', '', 0, NULL, NULL, NULL, NULL),
	(8, '919431027514', '', 'Sujeet Kumar', 'H No 8-7-95/3, Krushi Residency, Anand Nagar Colony, Old Bowenpally, Hyderabad, Secunderabad, Telangana 500011, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:30:43', '2025-09-16 11:39:29', NULL, NULL, NULL, NULL, 50, 'states', 'Starlink Packers & Movers', 'Packers and Movers', '5-10 years', '', 0, NULL, NULL, NULL, NULL),
	(9, '919390891355', 'classicpackershyd@gmail.com', 'Sunil', 'House No. 7-99, 2, Devender Colony, Kompally, Hyderabad, Telangana 500014, India', '{}', '[]', 0, 0, 0, 1, 0, 'vendor', '2025-09-15 09:35:29', '2025-09-16 11:12:08', NULL, NULL, NULL, NULL, 50, 'states', 'Classic Packers & Movers', 'Packers and Movers', '5-10 years', '', 0, NULL, NULL, NULL, NULL),
	(10, '918688474613', '', '', '', '{}', '[]', 0, 0, 0, 0, 0, 'user', '2025-09-15 10:57:38', '2025-09-15 19:48:34', '2025-09-15 19:48:35', NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 1, 'Z751FNIA', NULL, NULL, NULL),
	(11, '918688474613', '', '', '', '{}', '[]', 0, 0, 0, 0, 773572, 'user', '2025-09-16 15:44:20', '2025-09-16 15:44:20', NULL, NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
	(12, '919121451813', '', '', '', '{}', '[]', 0, 0, 0, 0, 0, 'user', '2025-09-16 15:45:11', '2025-09-16 15:45:21', NULL, NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
	(13, '916301847289', '', '', '', '{}', '[]', 0, 0, 0, 0, 0, 'user', '2025-09-17 01:45:22', '2025-09-17 01:45:55', NULL, NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
	(14, '916305778775', '', '', '', '{}', '[]', 0, 0, 0, 0, 0, 'user', '2025-09-17 05:45:24', '2025-09-17 05:45:37', NULL, NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
	(15, '916301019935', '', '', '', '{}', '[]', 0, 0, 0, 0, 0, 'user', '2025-09-17 06:02:55', '2025-09-17 06:03:11', NULL, NULL, NULL, NULL, 50, 'states', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- Dumping structure for table movepe-database.user_addresses
CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `place_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_city` (`city`),
  KEY `idx_state` (`state`),
  KEY `idx_zip` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.user_addresses: ~0 rows (approximately)

-- Dumping structure for table movepe-database.user_bank_details
CREATE TABLE IF NOT EXISTS `user_bank_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_type` enum('user','vendor','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifsc_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.user_bank_details: ~0 rows (approximately)

-- Dumping structure for table movepe-database.vendor_addon_services
CREATE TABLE IF NOT EXISTS `vendor_addon_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `service_id` int NOT NULL,
  `availability` enum('included','extra','not_available') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_available',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vendor_addon_service` (`vendor_id`,`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_addon_services: ~16 rows (approximately)
INSERT INTO `vendor_addon_services` (`id`, `vendor_id`, `service_id`, `availability`, `description`, `created_at`, `updated_at`) VALUES
	(15, 9, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:24:51', '2025-09-16 11:24:51'),
	(16, 9, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:24:51', '2025-09-16 11:24:51'),
	(27, 7, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:28:42', '2025-09-16 11:28:42'),
	(28, 7, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:28:42', '2025-09-16 11:28:42'),
	(33, 6, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(34, 6, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(39, 5, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(40, 5, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(45, 4, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:34:23', '2025-09-16 11:34:23'),
	(46, 4, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:34:23', '2025-09-16 11:34:23'),
	(53, 3, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:37:04', '2025-09-16 11:37:04'),
	(54, 3, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:37:04', '2025-09-16 11:37:04'),
	(61, 2, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 11:38:33', '2025-09-16 11:38:33'),
	(62, 2, 2, 'extra', 'Short-term storage facility available', '2025-09-16 11:38:33', '2025-09-16 11:38:33'),
	(63, 8, 1, 'extra', 'Goods insurance coverage available as an add-on', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(64, 8, 2, 'extra', 'Short-term storage facility available', '2025-09-16 14:08:17', '2025-09-16 14:08:17');

-- Dumping structure for table movepe-database.vendor_applications
CREATE TABLE IF NOT EXISTS `vendor_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `kyc_data` longtext COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_applications: ~0 rows (approximately)

-- Dumping structure for table movepe-database.vendor_floor_pricing
CREATE TABLE IF NOT EXISTS `vendor_floor_pricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `floor_level` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Floor level: 1st, 2nd, 3rd, 4th, 5th_plus',
  `floor_label` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Display label: 1st Floor, 2nd Floor, etc.',
  `cost_per_floor` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Cost per floor for this floor level',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_floor_pricing: ~40 rows (approximately)
INSERT INTO `vendor_floor_pricing` (`id`, `vendor_id`, `floor_level`, `floor_label`, `cost_per_floor`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 2, '1st', '1st Floor', 0.00, 1, '2025-09-15 10:57:53', '2025-09-16 11:38:15'),
	(2, 2, '2nd', '2nd Floor', 0.00, 1, '2025-09-15 10:57:53', '2025-09-16 11:38:15'),
	(3, 2, '3rd', '3rd Floor', 1000.00, 1, '2025-09-15 10:57:53', '2025-09-16 11:38:15'),
	(4, 2, '4th', '4th Floor', 2000.00, 1, '2025-09-15 10:57:53', '2025-09-16 11:38:15'),
	(5, 2, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-15 10:57:53', '2025-09-16 11:38:15'),
	(6, 9, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:21:29', '2025-09-16 11:25:07'),
	(7, 9, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:21:29', '2025-09-16 11:25:07'),
	(8, 9, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:21:29', '2025-09-16 11:25:07'),
	(9, 9, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:21:29', '2025-09-16 11:25:07'),
	(10, 9, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:21:29', '2025-09-16 11:25:07'),
	(11, 8, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:27:01', '2025-09-16 11:27:01'),
	(12, 8, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:27:01', '2025-09-16 11:27:01'),
	(13, 8, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:27:01', '2025-09-16 11:27:01'),
	(14, 8, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:27:01', '2025-09-16 11:27:01'),
	(15, 8, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:27:01', '2025-09-16 11:27:01'),
	(16, 7, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:29:10', '2025-09-16 11:29:10'),
	(17, 7, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:29:10', '2025-09-16 11:29:10'),
	(18, 7, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:29:10', '2025-09-16 11:29:10'),
	(19, 7, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:29:10', '2025-09-16 11:29:10'),
	(20, 7, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:29:10', '2025-09-16 11:29:10'),
	(21, 6, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:31:08', '2025-09-16 11:31:08'),
	(22, 6, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:31:08', '2025-09-16 11:31:08'),
	(23, 6, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:31:08', '2025-09-16 11:31:08'),
	(24, 6, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:31:08', '2025-09-16 11:31:08'),
	(25, 6, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:31:08', '2025-09-16 11:31:08'),
	(26, 5, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:32:58', '2025-09-16 11:32:58'),
	(27, 5, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:32:58', '2025-09-16 11:32:58'),
	(28, 5, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:32:58', '2025-09-16 11:32:58'),
	(29, 5, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:32:58', '2025-09-16 11:32:58'),
	(30, 5, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:32:58', '2025-09-16 11:32:58'),
	(31, 4, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:34:49', '2025-09-16 11:34:49'),
	(32, 4, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:34:49', '2025-09-16 11:34:49'),
	(33, 4, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:34:49', '2025-09-16 11:34:49'),
	(34, 4, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:34:49', '2025-09-16 11:34:49'),
	(35, 4, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:34:49', '2025-09-16 11:34:49'),
	(36, 3, '1st', '1st Floor', 0.00, 1, '2025-09-16 11:36:47', '2025-09-16 11:36:53'),
	(37, 3, '2nd', '2nd Floor', 0.00, 1, '2025-09-16 11:36:47', '2025-09-16 11:36:53'),
	(38, 3, '3rd', '3rd Floor', 1000.00, 1, '2025-09-16 11:36:47', '2025-09-16 11:36:53'),
	(39, 3, '4th', '4th Floor', 2000.00, 1, '2025-09-16 11:36:47', '2025-09-16 11:36:53'),
	(40, 3, '5th_plus', '5th Floor+', 2000.00, 1, '2025-09-16 11:36:47', '2025-09-16 11:36:53');

-- Dumping structure for table movepe-database.vendor_labour_services
CREATE TABLE IF NOT EXISTS `vendor_labour_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Labour Services',
  `rate_per_person` decimal(10,2) NOT NULL DEFAULT '0.00',
  `move_type_members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vendor_labour` (`vendor_id`),
  CONSTRAINT `vendor_labour_services_chk_1` CHECK (json_valid(`move_type_members`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_labour_services: ~8 rows (approximately)
INSERT INTO `vendor_labour_services` (`id`, `vendor_id`, `name`, `rate_per_person`, `move_type_members`, `created_at`, `updated_at`) VALUES
	(1, 2, 'Labour Services', 1000.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-15 10:17:16', '2025-09-16 11:38:22'),
	(2, 9, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:20:03', '2025-09-16 11:20:38'),
	(3, 8, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":3,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:25:56', '2025-09-16 11:26:29'),
	(4, 7, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:28:00', '2025-09-16 11:28:42'),
	(5, 6, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:30:09', '2025-09-16 11:30:38'),
	(6, 5, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:31:54', '2025-09-16 11:32:31'),
	(7, 4, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:33:55', '2025-09-16 11:34:23'),
	(8, 3, 'Labour Services', 0.00, '{"1 BHK":3,"2 BHK":4,"3 BHK":4,"4 BHK":5,"Villa":6,"Office":6}', '2025-09-16 11:35:49', '2025-09-16 11:36:17');

-- Dumping structure for table movepe-database.vendor_packing_services
CREATE TABLE IF NOT EXISTS `vendor_packing_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `service_id` int NOT NULL,
  `availability` enum('included','extra','not_available') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_available',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vendor_service` (`vendor_id`,`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_packing_services: ~112 rows (approximately)
INSERT INTO `vendor_packing_services` (`id`, `vendor_id`, `service_id`, `availability`, `description`, `created_at`, `updated_at`) VALUES
	(99, 9, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(100, 9, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(101, 9, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(102, 9, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(103, 9, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(104, 9, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(105, 9, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(106, 9, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(107, 9, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(108, 9, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(109, 9, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(110, 9, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(111, 9, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(112, 9, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:24:50', '2025-09-16 11:24:50'),
	(183, 7, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(184, 7, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(185, 7, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(186, 7, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(187, 7, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(188, 7, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(189, 7, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(190, 7, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(191, 7, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(192, 7, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(193, 7, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(194, 7, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(195, 7, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(196, 7, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:28:41', '2025-09-16 11:28:41'),
	(225, 6, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(226, 6, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(227, 6, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(228, 6, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(229, 6, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(230, 6, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(231, 6, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(232, 6, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(233, 6, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(234, 6, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(235, 6, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(236, 6, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(237, 6, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(238, 6, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:30:38', '2025-09-16 11:30:38'),
	(267, 5, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(268, 5, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(269, 5, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(270, 5, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(271, 5, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(272, 5, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(273, 5, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(274, 5, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(275, 5, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(276, 5, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(277, 5, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(278, 5, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(279, 5, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(280, 5, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:32:31', '2025-09-16 11:32:31'),
	(309, 4, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(310, 4, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(311, 4, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(312, 4, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(313, 4, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(314, 4, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(315, 4, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(316, 4, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(317, 4, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(318, 4, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(319, 4, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(320, 4, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(321, 4, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(322, 4, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:34:22', '2025-09-16 11:34:22'),
	(365, 3, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(366, 3, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(367, 3, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(368, 3, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(369, 3, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(370, 3, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(371, 3, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(372, 3, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(373, 3, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(374, 3, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(375, 3, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(376, 3, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(377, 3, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(378, 3, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:37:03', '2025-09-16 11:37:03'),
	(421, 2, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(422, 2, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(423, 2, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(424, 2, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(425, 2, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(426, 2, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(427, 2, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(428, 2, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(429, 2, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(430, 2, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(431, 2, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(432, 2, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 11:38:32', '2025-09-16 11:38:32'),
	(433, 2, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 11:38:33', '2025-09-16 11:38:33'),
	(434, 2, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 11:38:33', '2025-09-16 11:38:33'),
	(435, 8, 1, 'included', 'Protective bubble wrap for fragile goods', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(436, 8, 2, 'not_available', 'Wrapping paper for dishware and delicate items', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(437, 8, 3, 'not_available', 'Sturdy corrugated boxes of various sizes', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(438, 8, 4, 'included', 'Stretch film and HDPE sheets for moisture and dust protection', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(439, 8, 5, 'included', 'Strong packing tape for sealing boxes', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(440, 8, 6, 'not_available', 'Reusable cloth blankets for furniture protection', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(441, 8, 7, 'included', 'Foam sheets and corners for impact protection', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(442, 8, 8, 'not_available', 'Plastic wrap for securing items and bundles', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(443, 8, 9, 'not_available', 'Thick blankets for cushioning large items', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(444, 8, 10, 'not_available', 'Dividers for organizing and protecting contents', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(445, 8, 11, 'included', 'Specialized packing for fragile items', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(446, 8, 12, 'not_available', 'Tall boxes with hanger bars for clothing', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(447, 8, 13, 'not_available', 'Double-walled boxes for dishes and glassware', '2025-09-16 14:08:17', '2025-09-16 14:08:17'),
	(448, 8, 14, 'not_available', 'Telescoping boxes for mirrors and frames', '2025-09-16 14:08:17', '2025-09-16 14:08:17');

-- Dumping structure for table movepe-database.vendor_service_areas
CREATE TABLE IF NOT EXISTS `vendor_service_areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `service_mode` enum('inclusion','exclusion') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inclusion',
  `applies_to` enum('origin','destination','both') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'destination',
  `area_type` enum('specific_location','city','state','region') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'specific_location',
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_address` text COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `radius_km` int DEFAULT '30',
  `place_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_service_areas: ~0 rows (approximately)

-- Dumping structure for table movepe-database.vendor_service_config
CREATE TABLE IF NOT EXISTS `vendor_service_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `service_strategy` enum('limited_areas','all_india_with_exclusions') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'limited_areas',
  `default_radius_km` int DEFAULT '30',
  `max_areas_limit` int DEFAULT '10',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_service_config: ~8 rows (approximately)
INSERT INTO `vendor_service_config` (`id`, `vendor_id`, `service_strategy`, `default_radius_km`, `max_areas_limit`, `notes`, `created_at`, `updated_at`) VALUES
	(1, 2, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-15 10:12:51', '2025-09-16 07:32:49'),
	(2, 3, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:24:05', '2025-09-16 07:24:05'),
	(3, 9, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:28:28', '2025-09-16 07:28:28'),
	(4, 8, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:29:11', '2025-09-16 07:29:11'),
	(5, 7, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:29:48', '2025-09-16 07:29:48'),
	(6, 6, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:30:24', '2025-09-16 07:30:24'),
	(7, 5, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:31:00', '2025-09-16 07:31:00'),
	(8, 4, 'all_india_with_exclusions', 30, 10, NULL, '2025-09-16 07:31:38', '2025-09-16 07:31:38');

-- Dumping structure for table movepe-database.vendor_subscriptions
CREATE TABLE IF NOT EXISTS `vendor_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `plan_code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_price` decimal(10,2) NOT NULL,
  `monthly_quota` int NOT NULL,
  `leads_delivered` int NOT NULL DEFAULT '0',
  `status` enum('pending','active','expired','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cycle_start` date NOT NULL,
  `cycle_end` date NOT NULL,
  `razorpay_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vendor_cycle` (`vendor_id`,`cycle_start`,`cycle_end`),
  KEY `idx_vendor_status` (`vendor_id`,`status`),
  KEY `idx_vendor_cycle` (`vendor_id`,`cycle_start`,`cycle_end`),
  KEY `idx_cycle_end` (`cycle_end`),
  KEY `idx_razorpay_order_id` (`razorpay_order_id`),
  CONSTRAINT `vendor_subscriptions_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.vendor_subscriptions: ~0 rows (approximately)

-- Dumping structure for table movepe-database.wallet_accounts
CREATE TABLE IF NOT EXISTS `wallet_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wallet_user` (`user_id`),
  KEY `idx_wallet_balance` (`balance`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.wallet_accounts: ~11 rows (approximately)
INSERT INTO `wallet_accounts` (`id`, `user_id`, `balance`, `created_at`, `updated_at`) VALUES
	(1, 1, 0.00, '2025-09-15 08:26:51', '2025-09-15 08:26:51'),
	(2, 2, 0.00, '2025-09-15 09:11:21', '2025-09-15 09:11:21'),
	(3, 3, 0.00, '2025-09-15 09:16:17', '2025-09-15 09:16:17'),
	(4, 4, 0.00, '2025-09-15 09:19:14', '2025-09-15 09:19:14'),
	(5, 5, 0.00, '2025-09-15 09:20:59', '2025-09-15 09:20:59'),
	(6, 6, 0.00, '2025-09-15 09:23:04', '2025-09-15 09:23:04'),
	(7, 7, 0.00, '2025-09-15 09:27:53', '2025-09-15 09:27:53'),
	(8, 8, 0.00, '2025-09-15 09:31:05', '2025-09-15 09:31:05'),
	(9, 9, 0.00, '2025-09-15 09:35:44', '2025-09-15 09:35:44'),
	(10, 10, 0.00, '2025-09-15 10:57:44', '2025-09-15 10:57:44'),
	(11, 14, 0.00, '2025-09-17 05:45:38', '2025-09-17 05:45:38');

-- Dumping structure for table movepe-database.wallet_transactions
CREATE TABLE IF NOT EXISTS `wallet_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` enum('credit','debit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` enum('affiliate','refund','withdrawal','withdrawal_reversal','adjustment','subscription_refund') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'adjustment',
  `amount` decimal(12,2) NOT NULL,
  `reference_id` int DEFAULT NULL COMMENT 'Order ID for affiliate commissions, withdrawal ID for other sources',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'JSON metadata: commission_rate, order_id, etc.',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_wt_user_created` (`user_id`,`created_at`),
  KEY `idx_wt_source_type_ref` (`source`,`type`,`reference_id`),
  KEY `idx_wt_user_source` (`user_id`,`source`),
  CONSTRAINT `wallet_transactions_chk_1` CHECK (json_valid(`meta`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.wallet_transactions: ~0 rows (approximately)

-- Dumping structure for table movepe-database.wallet_withdrawals
CREATE TABLE IF NOT EXISTS `wallet_withdrawals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` enum('pending','processing','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `processed_at` timestamp NULL DEFAULT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bank transfer reference or payment gateway transaction ID',
  `notes` text COLLATE utf8mb4_unicode_ci COMMENT 'Admin notes for processing',
  PRIMARY KEY (`id`),
  KEY `idx_ww_user_status` (`user_id`,`status`),
  KEY `idx_ww_requested_at` (`requested_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movepe-database.wallet_withdrawals: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
