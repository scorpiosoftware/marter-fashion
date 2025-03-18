/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : marter_fashion_db

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 18/03/2025 15:04:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for branches
-- ----------------------------
DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `branches_section_id_foreign`(`section_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of branches
-- ----------------------------
INSERT INTO `branches` VALUES (1, 'KAFTAN ABAYA', 1, '2025-03-17 08:06:29', '2025-03-17 08:06:29');
INSERT INTO `branches` VALUES (2, 'WOMEN BAGS', 2, '2025-03-17 08:07:47', '2025-03-17 08:07:47');
INSERT INTO `branches` VALUES (3, 'WOMEN ACCESSORIES', 3, '2025-03-17 08:09:05', '2025-03-17 08:09:05');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_name_en_unique`(`name_en`) USING BTREE,
  UNIQUE INDEX `brands_name_ar_unique`(`name_ar`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (6, 'SECOND HAND FASHION', 'أزياء مستعملة', 'brands//xxAmyzBdSZvOlWcMlcpxeGqdZx4TvksiuXWSKlak.jpg', '2025-03-18 07:43:05', '2025-03-18 07:43:05');
INSERT INTO `brands` VALUES (5, 'FLORIANNE ROSE', 'فلوريان روز', 'brands//YEBEHLMX7GfapBIxmxxXqd7reLXJRtYNAJoTN2Rm.jpg', '2025-03-18 07:41:32', '2025-03-18 07:41:32');
INSERT INTO `brands` VALUES (4, 'FLAMINGO', NULL, 'brands//NyFFlM7UAIyS7h0tEw3PsFwQgiAhqLYdNvsxgYKL.jpg', '2025-03-17 11:03:37', '2025-03-18 07:39:47');

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for carousel_images
-- ----------------------------
DROP TABLE IF EXISTS `carousel_images`;
CREATE TABLE `carousel_images`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `carousel_id` bigint UNSIGNED NULL DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carousel_images_carousel_id_foreign`(`carousel_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel_images
-- ----------------------------
INSERT INTO `carousel_images` VALUES (5, 1, 'carousel/1/5S6ZbQ0tKPn1aUY7Zzw9LtV4A2Azf2vYE16YR6Vn.jpg', '2025-03-18 07:27:45', '2025-03-18 07:27:45');

-- ----------------------------
-- Table structure for carousels
-- ----------------------------
DROP TABLE IF EXISTS `carousels`;
CREATE TABLE `carousels`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `logo_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousels
-- ----------------------------
INSERT INTO `carousels` VALUES (1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Dresses', 'فساتين سهرة', 'categories//sSMbKwcSxo971ztXsMVniFC6X2C1rgEbPS8AqBzO.jpg', 2, NULL, '2025-03-18 07:55:30');
INSERT INTO `categories` VALUES (2, 'All Clothing', 'الكل', 'categories//dUBr1VzkZKGnS0SmmrYmnjVVuTjw1KKbJ61xFDu2.jpg', NULL, NULL, '2025-03-18 07:55:10');

-- ----------------------------
-- Table structure for color_product
-- ----------------------------
DROP TABLE IF EXISTS `color_product`;
CREATE TABLE `color_product`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NULL DEFAULT NULL,
  `color_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `color_product_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `color_product_color_id_foreign`(`color_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of color_product
-- ----------------------------
INSERT INTO `color_product` VALUES (4, 1, 1, NULL, NULL);
INSERT INTO `color_product` VALUES (6, 2, 1, NULL, NULL);
INSERT INTO `color_product` VALUES (5, 1, 3, NULL, NULL);
INSERT INTO `color_product` VALUES (7, 3, 1, NULL, NULL);
INSERT INTO `color_product` VALUES (8, 3, 2, NULL, NULL);
INSERT INTO `color_product` VALUES (9, 3, 3, NULL, NULL);
INSERT INTO `color_product` VALUES (10, 4, 1, NULL, NULL);
INSERT INTO `color_product` VALUES (11, 4, 3, NULL, NULL);
INSERT INTO `color_product` VALUES (12, 5, 2, NULL, NULL);
INSERT INTO `color_product` VALUES (13, 5, 3, NULL, NULL);
INSERT INTO `color_product` VALUES (14, 6, 1, NULL, NULL);
INSERT INTO `color_product` VALUES (15, 6, 2, NULL, NULL);
INSERT INTO `color_product` VALUES (16, 6, 3, NULL, NULL);
INSERT INTO `color_product` VALUES (17, 7, 2, NULL, NULL);
INSERT INTO `color_product` VALUES (18, 7, 3, NULL, NULL);

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'PINK ABAYA', '#ffc2c2', '2025-03-17 08:10:49', '2025-03-17 08:10:49');
INSERT INTO `colors` VALUES (2, 'RED', '#ff4747', '2025-03-18 07:23:55', '2025-03-18 07:23:55');
INSERT INTO `colors` VALUES (3, 'BLUE', '#2eafff', '2025-03-18 07:24:07', '2025-03-18 07:24:07');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for inboxes
-- ----------------------------
DROP TABLE IF EXISTS `inboxes`;
CREATE TABLE `inboxes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inboxes
-- ----------------------------

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `qty` int NULL DEFAULT NULL,
  `totale_price` decimal(10, 2) NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `items_product_id_foreign`(`product_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2023_09_20_192335_create_visitors_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_06_27_060638_create_brands_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_06_27_060639_create_categories_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_06_27_060731_create_products_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_06_27_061131_create_product_category_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_06_27_061925_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_06_27_063205_create_roles_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_06_27_063215_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_06_27_064520_create_items_table', 1);
INSERT INTO `migrations` VALUES (13, '2024_06_27_064714_create_orders_table', 1);
INSERT INTO `migrations` VALUES (14, '2024_06_27_065023_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (15, '2024_07_09_194342_create_options_table', 1);
INSERT INTO `migrations` VALUES (16, '2024_07_11_060257_add_role_id_to_users_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_07_11_062706_create_product_views_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_07_11_110946_create_carousels_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_07_13_182025_create_carousel_images_table', 1);
INSERT INTO `migrations` VALUES (20, '2024_07_14_192027_create_inboxes_table', 1);
INSERT INTO `migrations` VALUES (21, '2024_07_15_165335_create_product_comments_table', 1);
INSERT INTO `migrations` VALUES (22, '2024_07_18_173922_add_rate_column_to_product_comments_table', 1);
INSERT INTO `migrations` VALUES (23, '2024_07_18_185012_add_max_qty_to_products_table', 1);
INSERT INTO `migrations` VALUES (24, '2025_02_27_082016_create_store_sections_table', 1);
INSERT INTO `migrations` VALUES (25, '2025_02_27_082839_add_store_section_id_to_products_table', 1);
INSERT INTO `migrations` VALUES (26, '2025_02_27_120520_create_branches_table', 1);
INSERT INTO `migrations` VALUES (27, '2025_02_28_131649_add_branch_id_to_products_table', 1);
INSERT INTO `migrations` VALUES (28, '2025_03_10_174455_add_section_branch_foreign_to_product_views_table', 1);
INSERT INTO `migrations` VALUES (29, '2025_03_16_190210_create_colors_table', 1);
INSERT INTO `migrations` VALUES (30, '2025_03_16_190755_create_color_product_table', 1);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `starter_number` int NOT NULL DEFAULT 1000000,
  `order_letter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'PO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 1, 1, 68.00, '2025-03-17 11:09:33', '2025-03-17 11:09:33');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `auto_nb` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `starter_nb` int NULL DEFAULT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `street` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `apartment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','shipped','delivered','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_auto_nb_unique`(`auto_nb`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, NULL, NULL, 'CLIENT 1', 'none email', 68.00, '71003355', 'BAGHDAD', 'TOM', 'IRAQ', 'BAGHDAD', NULL, '2025-03-17 13:09:33', 'delivered', '2025-03-17 11:09:33', '2025-03-17 11:09:54');

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `product_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`, `category_id`) USING BTREE,
  INDEX `product_category_category_id_foreign`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (1, 1, NULL, NULL);
INSERT INTO `product_category` VALUES (2, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (2, 1, NULL, NULL);
INSERT INTO `product_category` VALUES (3, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (3, 1, NULL, NULL);
INSERT INTO `product_category` VALUES (4, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (4, 1, NULL, NULL);
INSERT INTO `product_category` VALUES (5, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (5, 1, NULL, NULL);
INSERT INTO `product_category` VALUES (6, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (6, 1, NULL, NULL);
INSERT INTO `product_category` VALUES (7, 2, NULL, NULL);
INSERT INTO `product_category` VALUES (7, 1, NULL, NULL);

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NULL DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rate` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_comments_product_id_foreign`(`product_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_comments
-- ----------------------------

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NULL DEFAULT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_images_product_id_foreign`(`product_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (30, 3, 'product/3/BAbdF7h9QNbsSWYDw0TBGCym8ztNai9ZnmCUFfSK.jpg', '2025-03-18 07:29:37', '2025-03-18 07:29:37');
INSERT INTO `product_images` VALUES (29, 2, 'product/2/OQxkF5Cd5y1oA5QyiIz6wvTEPWfvgUEymk72pw1K.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (28, 2, 'product/2/O9l7zrXJikcr6psUxC6lkn1jpUwoR8HJFPXkxWql.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (27, 2, 'product/2/CisWVBaSuW1BZpNRoIVZ5io46jyaILuAwVKrBUnJ.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (26, 2, 'product/2/MWvDxHk6a8T2lcuxjKInYg03YK7ZzqweobZhBouV.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (25, 2, 'product/2/X8f5bGp2K70xpUyMhM92rtIr7iMDLJABKSZd2FoK.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (23, 2, 'product/2/VUpVIZhx0VtEk4KfvjcSQtEVo150vcbd6whrdulS.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (24, 2, 'product/2/f23LegSimjgoR7M1LejPJhkXb1W10bFIEO6lI8Kk.jpg', '2025-03-18 07:27:08', '2025-03-18 07:27:08');
INSERT INTO `product_images` VALUES (22, 1, 'product/1/EdfYX1gvwKXcP8vldPs0JYlQgbrndNFBJlo206Sa.jpg', '2025-03-18 07:25:57', '2025-03-18 07:25:57');
INSERT INTO `product_images` VALUES (21, 1, 'product/1/0F5LdB1gAlocZRMh95tZ4Qw80k53J60V3gltL67d.jpg', '2025-03-18 07:25:57', '2025-03-18 07:25:57');
INSERT INTO `product_images` VALUES (20, 1, 'product/1/rbIRpfxkrCKtjeA6el2gwoCFzsYPbQIZDOs6UQtz.jpg', '2025-03-18 07:25:57', '2025-03-18 07:25:57');
INSERT INTO `product_images` VALUES (19, 1, 'product/1/yC5ux2WUFWQXK0a7MAKgKmcsBS957qHanaWuBB8m.jpg', '2025-03-18 07:25:57', '2025-03-18 07:25:57');
INSERT INTO `product_images` VALUES (18, 1, 'product/1/Hh2tIIK2JJlp53KZQI8IxGDz8pjSXLPiLpPzufky.jpg', '2025-03-18 07:25:57', '2025-03-18 07:25:57');
INSERT INTO `product_images` VALUES (31, 3, 'product/3/WlbbQuuDyvDWimP2cyhO4y3EWcpJN7rkmmy6L53g.jpg', '2025-03-18 07:29:37', '2025-03-18 07:29:37');
INSERT INTO `product_images` VALUES (32, 3, 'product/3/yITGqsKyEJTNTBpoEwNOsDaoDAEV3T0tVDzPW0NF.jpg', '2025-03-18 07:29:37', '2025-03-18 07:29:37');
INSERT INTO `product_images` VALUES (33, 3, 'product/3/t1NLUbxNcapcQ8ZVCEsWyhaqJoEhaPH6T7UBsKQf.jpg', '2025-03-18 07:29:37', '2025-03-18 07:29:37');
INSERT INTO `product_images` VALUES (34, 4, 'product/4/HqryA7SESpm2O7Pz8sinKHtCrmyjEZU2r8Im3Kui.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (35, 4, 'product/4/bOA4Q87AuS9n4NNqeBQRfw3XKY3nO3XR88jBVbrg.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (36, 4, 'product/4/TsuzaqBkscGdv71uNHCbUKHWuoYILMUHCnGyxTBY.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (37, 4, 'product/4/sdBqTgmv0Q9IkWgvJRbuMLSb65dOrGyyZCI6q7sk.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (38, 4, 'product/4/gRshHPaLFhRuCyQIfmk2tLnqpGmDoLvuzIsGihsX.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (39, 4, 'product/4/7NXmqrZ3kAMKYdVC9OZWGfB8rK0LaozKhK5Z3a0v.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (40, 4, 'product/4/GO9MKz5akizVXAXkg3V5b6uH9PGcS7OTJU4WQ5Jh.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (41, 4, 'product/4/XyHzsuFaFfB3iTDUvD6haKgCDL2SGBZO9UuWzPBT.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (42, 4, 'product/4/BxaYPUxLNwRqrnwKiOOtGpPgZq3m6FJMbytieiOJ.jpg', '2025-03-18 07:31:14', '2025-03-18 07:31:14');
INSERT INTO `product_images` VALUES (43, 5, 'product/5/2JmDeM4TtWsHkN2aoWUztlPQR9bMYX4ouUAAvb2V.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (44, 5, 'product/5/RB5UkH6r7mcJ8u5dTVOlWwDe2aRU50cWEb7SgrnB.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (45, 5, 'product/5/wyEIiubJEWp7FjhUD90cvDIykxeROEH8zMyrNzmY.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (46, 5, 'product/5/8ElqEj4uPST6AsbiXcTrZfiq61mg1LP85Viq33aS.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (47, 5, 'product/5/MftI3RXoxE4I17Bg53u6P7Y0pGuzW9B3F1SZ6HOA.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (48, 5, 'product/5/2XqbEt9TInog7YCqr5Uw97hWkJddRUmMLZwyHgOl.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (49, 5, 'product/5/lg4GNM47BSQ990NUBGACJQT3OPdtro4nzvy5QNNo.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (50, 5, 'product/5/91rAaZnxqb8LpnavZ53ALUhQoj8KX4S8fc31el9r.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (51, 5, 'product/5/2HfqeEqQUGRwKESPe5T29YACHmmejzu3MjSICO0u.jpg', '2025-03-18 07:32:38', '2025-03-18 07:32:38');
INSERT INTO `product_images` VALUES (52, 6, 'product/6/GHtQ5app5qwfMHZMPEM0H0Rnbtg6gnnRKlRZ9v7s.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (53, 6, 'product/6/hx95OSMhn7oOPocG101t2iyHKrFmI83Wn8vHzzDp.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (54, 6, 'product/6/y6By8bfaTO1JsnSK6UlBJuC9etKqQJKcnv21Iqp9.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (55, 6, 'product/6/5rnNKY3B5UO82p41EMS9yDNVoQA9rgmXhHJJ1fIQ.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (56, 6, 'product/6/EJPZf5ayIky9RgE1ByBMJGMI4GaJHbCME0LtCfny.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (57, 6, 'product/6/Y0kYPqkFJKepi7Sc0DT753gzlDvUv4yTbBCFAnwr.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (58, 6, 'product/6/0kFXhK3D8VuGjdOWy3VRn9yczMK3ihyhIBMWXsmQ.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (59, 6, 'product/6/GDyx2sfe7smm4foyntZ1JSS0b27IMaHIFP1Y3S5T.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (60, 6, 'product/6/AYuYnhY89kLoHvpZayfBrAHm0eRb6xvoT5rdqeKu.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (61, 6, 'product/6/araiUrw4sNnmuUu4TtqT8DbFoitUFDnWSrtn7JjX.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (62, 6, 'product/6/rCPchBTkY5X83txv5bqqB6VQVvZ1uFcI99bXCr9N.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (63, 6, 'product/6/FuEtnFTazZzBFaSdQrJKTXmEWtiHiZE8y7BABHf1.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (64, 6, 'product/6/8k3sevko4j7HGQp55lRQsaYPEXzTaUT3iPGQBMnt.jpg', '2025-03-18 07:34:08', '2025-03-18 07:34:08');
INSERT INTO `product_images` VALUES (65, 7, 'product/7/gkBUbnNJBgzQDxmREo3riqzdpsePuJxrKLuA5SIb.jpg', '2025-03-18 07:45:26', '2025-03-18 07:45:26');
INSERT INTO `product_images` VALUES (66, 7, 'product/7/9wDm6znWaLw6ZobT8SqxjoUZLXwaSN6ZOr3hxCfA.jpg', '2025-03-18 07:45:26', '2025-03-18 07:45:26');
INSERT INTO `product_images` VALUES (67, 7, 'product/7/MRFoLacEoIPA9SB4TGtqN4D7DC0D7jAVoMKpsIoS.jpg', '2025-03-18 07:45:26', '2025-03-18 07:45:26');
INSERT INTO `product_images` VALUES (68, 7, 'product/7/RPViQHq9upZrqrszlBJgHweGCz7eMIZHlu4irtvb.jpg', '2025-03-18 07:45:26', '2025-03-18 07:45:26');
INSERT INTO `product_images` VALUES (69, 7, 'product/7/THVoF7pVIIfyCuZA8f99VH25CmLXAgN5EAbuGqIy.jpg', '2025-03-18 07:45:26', '2025-03-18 07:45:26');

-- ----------------------------
-- Table structure for product_views
-- ----------------------------
DROP TABLE IF EXISTS `product_views`;
CREATE TABLE `product_views`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NULL DEFAULT NULL,
  `selected` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `section_id` bigint UNSIGNED NULL DEFAULT NULL,
  `branch_id` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_views_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `product_views_section_id_foreign`(`section_id`) USING BTREE,
  INDEX `product_views_branch_id_foreign`(`branch_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_views
-- ----------------------------
INSERT INTO `product_views` VALUES (1, 'ABAYAS COLLECTION', 1, 1, '2025-03-17 08:21:53', '2025-03-17 08:21:53', 1, 1);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `offer_price` decimal(10, 2) NULL DEFAULT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `stock_quantity` int NULL DEFAULT NULL,
  `minimum_quantity` int NOT NULL DEFAULT 1,
  `main_image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maximum_quantity` int NOT NULL DEFAULT 1,
  `section_id` bigint UNSIGNED NULL DEFAULT NULL,
  `branch_id` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_code_unique`(`code`) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id`) USING BTREE,
  INDEX `products_section_id_foreign`(`section_id`) USING BTREE,
  INDEX `products_branch_id_foreign`(`branch_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'BYSARIAH-013', 'Luxury Three Piece Celestial Stardust Open Abaya Set - Powdered Rose', 'فستان نسائي طويل بلمسة براقة', 440.00, 320.00, '<p>Luxury Three Piece Celestial Stardust Open Abaya Set - Powdered Rose</p>', '<p>فستان نسائي طويل بلمسة براقة مصنوع من نسيج خفيف منسدل لأطلالة كلاسيكية مسائية مبهرة&nbsp;</p>\r\n\r\n<p>فستان طويل واسع</p>\r\n\r\n<p>أكمام طويلة شيفون شفافة</p>\r\n\r\n<p>رقبة علي شكل V عميقة بشكل أنثوي ناعم</p>\r\n\r\n<p>كسرات بدوران الخصر كله&nbsp;</p>\r\n\r\n<p>ستراس لامع يزين الخصر</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 10, 1, 'product/1/main/ZmCZE8ef4J3ScyjWa8RE1hEfEyeSzCDoGziMPiyV.jpg', 'in_stock', 4, '2025-03-17 08:21:19', '2025-03-18 07:25:57', 2, 1, 1);
INSERT INTO `products` VALUES (2, 'DS-001', 'Danias Studio Hob Kaftan', 'فستان نسائي لامع بأطلالة أنيقة', 430.00, 300.00, '<p>Introducing our exquisite Kaftan, beautifully embroidered with the Arabic word &ldquo;Hob&rdquo;, which means &ldquo;Love&rdquo;. This elegant and timeless piece showcases intricate embroidery, blending traditional craftsmanship with a contemporary design. The Kaftan is made from soft, breathable fabric, ensuring maximum comfort while making a statement. Perfect for special occasions, the Lavishly embroidered word &ldquo;Hob&rdquo; adds a touch of romance and sophistication to this beautiful garment. Express your love and embrace the art of Arabic calligraphy with this stunning Kaftan.</p>', '<p>فستان نسائي براق و لامع مصنوع من نسيج مميز يضفي لمسة من الفخامة و الجاذبية لأطلالة مسائية لا مثيل لها</p>\r\n\r\n<p>فستان نسائي لامع بأطلالة أنيقة</p>\r\n\r\n<p>فستان طويل بقصة مستقيمة ضيقة</p>\r\n\r\n<p>أكمام طويلة&nbsp;</p>\r\n\r\n<p>رقبة دائرية ضيقة</p>\r\n\r\n<p>خرز لامع يزين التصميم بشكل متناثر يعكس الضوء بشكل ساحر</p>\r\n\r\n<p>خصر محدد بشكل أنثوي ملفت</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 10, 1, 'product/2/main/7OrXlXt5emVYkpi3WgnZ44rj67JdbR66KEiIa3No.jpg', 'in_stock', 4, '2025-03-17 08:53:56', '2025-03-18 07:27:08', 5, 1, 1);
INSERT INTO `products` VALUES (3, 'KS0462', 'Dress 3', 'فستان نسائي بقصة أنسيابية أنيقة', 375.00, NULL, '<p>فستان طويل وفخم مصمم بأسلوب كلاسيكي راقٍ. يتميز الفستان بقصته المنسدلة التي تضفي أناقة وجاذبية&nbsp;فستان نسائي بقصة أنسيابية أنيقة&nbsp;</p>\r\n\r\n<p>مع أكمام منفوخة تضيف لمسة من الفخامة</p>\r\n\r\n<p>الخصر مشدود بحزام عريض لإبراز القوام</p>\r\n\r\n<p>ويزين العنق بطوق مزخرف بلمسة لامعة</p>\r\n\r\n<p>تصميم مثالي للمناسبات الرسمية والسهرات، يجمع بين البساطة والرقي بأسلوب عصري</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', '<p>فستان طويل وفخم مصمم بأسلوب كلاسيكي راقٍ. يتميز الفستان بقصته المنسدلة التي تضفي أناقة وجاذبية&nbsp;فستان نسائي بقصة أنسيابية أنيقة&nbsp;</p>\r\n\r\n<p>مع أكمام منفوخة تضيف لمسة من الفخامة</p>\r\n\r\n<p>الخصر مشدود بحزام عريض لإبراز القوام</p>\r\n\r\n<p>ويزين العنق بطوق مزخرف بلمسة لامعة</p>\r\n\r\n<p>تصميم مثالي للمناسبات الرسمية والسهرات، يجمع بين البساطة والرقي بأسلوب عصري</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 100, 1, 'product/3/main/zkpgdvFylKBfftg1lo4fooRY20Nyo9M55bxwMRAB.jpg', 'in_stock', 4, '2025-03-18 07:29:37', '2025-03-18 07:29:37', 5, 1, 1);
INSERT INTO `products` VALUES (4, 'T2134', 'Dress 4', 'فستان طويل نسائي مطرز', 420.00, 235.00, '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 10, 1, 'product/4/main/wCKRMIMWl9QkjASPho96IHeiMiJy5zgbGQNOUJm4.jpg', 'in_stock', 4, '2025-03-18 07:31:14', '2025-03-18 07:31:14', 5, 1, 1);
INSERT INTO `products` VALUES (5, '241130A', 'Dress 5', 'فستان سهره مزين بالترتر', 390.00, NULL, '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 55, 1, 'product/5/main/imChmGMEZwqvikiIdp2Thdi6yPFhNSEvGy3H63Zn.jpg', 'in_stock', 4, '2025-03-18 07:32:38', '2025-03-18 07:32:38', 5, 1, 1);
INSERT INTO `products` VALUES (6, 'KS0469', 'Dress 6', 'فستان سهره مخملي', 480.00, 325.00, '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 10, 1, 'product/6/main/Xw9npBsLtWtD4GWHDm2yOFhs46WGb1wN9bGErb4w.jpg', 'in_stock', 4, '2025-03-18 07:34:08', '2025-03-18 07:34:08', 5, 1, 1);
INSERT INTO `products` VALUES (7, '23142', 'Dress 7', 'فستان سهرة ميدي بأكمام مروحة', 330.00, 99.00, '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', '<p>فستان طويل نسائي مطرز , تصميم راقي و محتشم لطلة مميزة سيكون أختيار موفق في مناسبتك القادمة&nbsp;</p>\r\n\r\n<p>فستان طويلة و واسع مصنوع من نسيج الشيفون و الروزالين القطني</p>\r\n\r\n<p>أكمام طويلة مطرزة&nbsp;</p>\r\n\r\n<p>تطريز بسيط يزين الجزء العلوي من التصميم</p>\r\n\r\n<p>رقبة دائرية مع ياقة عالية&nbsp;</p>\r\n\r\n<p>حزام متصل للتضييق</p>\r\n\r\n<p>سحاب خلفي مخفي&nbsp;</p>\r\n\r\n<p>العارضة ترتدي مقاس S</p>', 12, 1, 'product/7/main/khXmi02K565PISoXBMbKdUsv3pP0b3sj1cKCjuNp.jpg', 'in_stock', 4, '2025-03-18 07:45:26', '2025-03-18 07:45:26', 5, 1, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', NULL, NULL);
INSERT INTO `roles` VALUES (2, 'user', NULL, NULL);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('iEWybbFggBUg2TgqtCQz7yp2qrfoojDhkCpPLVgg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZE1OOUJzVm5ZVmc4WkZyYVRxbnJlOVVjd3k2SU9Na29KUlRCYjY5ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG93LWNhcnQiO31zOjg6ImNhdGVnb3J5IjthOjE6e2k6MDtzOjE6IjEiO31zOjQ6ImxhbmciO3M6MjoiYXIiO3M6NDoiY2FydCI7YTowOnt9fQ==', 1742302922);

-- ----------------------------
-- Table structure for store_sections
-- ----------------------------
DROP TABLE IF EXISTS `store_sections`;
CREATE TABLE `store_sections`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `store_sections_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_sections
-- ----------------------------
INSERT INTO `store_sections` VALUES (1, 'ABAYAS SECTION', '2025-03-17 08:05:56', '2025-03-17 08:05:56');
INSERT INTO `store_sections` VALUES (2, 'BAGS SECTION', '2025-03-17 08:07:35', '2025-03-17 08:07:35');
INSERT INTO `store_sections` VALUES (3, 'ACCESSORIES SECTION', '2025-03-17 08:08:21', '2025-03-17 08:08:21');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@admin.com', NULL, '$2y$12$4fdFK6Yqyje4ZVcmmdihMOwVP6Q.6KhmEUwv8.DmiiolF1iB.uUla', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for visitors
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `visitable` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `visitable_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `auth_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `referer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `visitors_ip_index`(`ip`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 470 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitors
-- ----------------------------
INSERT INTO `visitors` VALUES (1, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 07:59:48', '2025-03-17 07:59:48');
INSERT INTO `visitors` VALUES (2, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:00:12', '2025-03-17 08:00:12');
INSERT INTO `visitors` VALUES (3, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:00:15', '2025-03-17 08:00:15');
INSERT INTO `visitors` VALUES (4, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:00:18', '2025-03-17 08:00:18');
INSERT INTO `visitors` VALUES (5, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:00:22', '2025-03-17 08:00:22');
INSERT INTO `visitors` VALUES (6, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:00:37', '2025-03-17 08:00:37');
INSERT INTO `visitors` VALUES (7, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/carousel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:03:00', '2025-03-17 08:03:00');
INSERT INTO `visitors` VALUES (8, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/carousel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:03:17', '2025-03-17 08:03:17');
INSERT INTO `visitors` VALUES (9, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:03:44', '2025-03-17 08:03:44');
INSERT INTO `visitors` VALUES (10, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:03:52', '2025-03-17 08:03:52');
INSERT INTO `visitors` VALUES (11, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:04:00', '2025-03-17 08:04:00');
INSERT INTO `visitors` VALUES (12, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:04:02', '2025-03-17 08:04:02');
INSERT INTO `visitors` VALUES (13, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:04:16', '2025-03-17 08:04:16');
INSERT INTO `visitors` VALUES (14, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:04:29', '2025-03-17 08:04:29');
INSERT INTO `visitors` VALUES (15, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:04:39', '2025-03-17 08:04:39');
INSERT INTO `visitors` VALUES (16, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:04:46', '2025-03-17 08:04:46');
INSERT INTO `visitors` VALUES (17, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:06:54', '2025-03-17 08:06:54');
INSERT INTO `visitors` VALUES (18, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:09:20', '2025-03-17 08:09:20');
INSERT INTO `visitors` VALUES (19, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:09:24', '2025-03-17 08:09:24');
INSERT INTO `visitors` VALUES (20, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:11:22', '2025-03-17 08:11:22');
INSERT INTO `visitors` VALUES (21, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:11:26', '2025-03-17 08:11:26');
INSERT INTO `visitors` VALUES (22, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:21:27', '2025-03-17 08:21:27');
INSERT INTO `visitors` VALUES (23, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:21:57', '2025-03-17 08:21:57');
INSERT INTO `visitors` VALUES (24, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:26:14', '2025-03-17 08:26:14');
INSERT INTO `visitors` VALUES (25, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:26:19', '2025-03-17 08:26:19');
INSERT INTO `visitors` VALUES (26, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:26:36', '2025-03-17 08:26:36');
INSERT INTO `visitors` VALUES (27, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:26:52', '2025-03-17 08:26:52');
INSERT INTO `visitors` VALUES (28, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:26:54', '2025-03-17 08:26:54');
INSERT INTO `visitors` VALUES (29, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:26:57', '2025-03-17 08:26:57');
INSERT INTO `visitors` VALUES (30, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:27:07', '2025-03-17 08:27:07');
INSERT INTO `visitors` VALUES (31, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:27:37', '2025-03-17 08:27:37');
INSERT INTO `visitors` VALUES (32, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:27:44', '2025-03-17 08:27:44');
INSERT INTO `visitors` VALUES (33, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:27:50', '2025-03-17 08:27:50');
INSERT INTO `visitors` VALUES (34, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:27:51', '2025-03-17 08:27:51');
INSERT INTO `visitors` VALUES (35, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:27:55', '2025-03-17 08:27:55');
INSERT INTO `visitors` VALUES (36, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:28:13', '2025-03-17 08:28:13');
INSERT INTO `visitors` VALUES (37, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:28:18', '2025-03-17 08:28:18');
INSERT INTO `visitors` VALUES (38, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:28:23', '2025-03-17 08:28:23');
INSERT INTO `visitors` VALUES (39, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:28:29', '2025-03-17 08:28:29');
INSERT INTO `visitors` VALUES (40, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:28:31', '2025-03-17 08:28:31');
INSERT INTO `visitors` VALUES (41, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:28:44', '2025-03-17 08:28:44');
INSERT INTO `visitors` VALUES (42, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:02', '2025-03-17 08:29:02');
INSERT INTO `visitors` VALUES (43, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:06', '2025-03-17 08:29:06');
INSERT INTO `visitors` VALUES (44, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:18', '2025-03-17 08:29:18');
INSERT INTO `visitors` VALUES (45, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:23', '2025-03-17 08:29:23');
INSERT INTO `visitors` VALUES (46, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:28', '2025-03-17 08:29:28');
INSERT INTO `visitors` VALUES (47, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:35', '2025-03-17 08:29:35');
INSERT INTO `visitors` VALUES (48, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:29:37', '2025-03-17 08:29:37');
INSERT INTO `visitors` VALUES (49, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:34:51', '2025-03-17 08:34:51');
INSERT INTO `visitors` VALUES (50, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:01', '2025-03-17 08:35:01');
INSERT INTO `visitors` VALUES (51, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:02', '2025-03-17 08:35:02');
INSERT INTO `visitors` VALUES (52, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:08', '2025-03-17 08:35:08');
INSERT INTO `visitors` VALUES (53, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:14', '2025-03-17 08:35:14');
INSERT INTO `visitors` VALUES (54, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:23', '2025-03-17 08:35:23');
INSERT INTO `visitors` VALUES (55, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:27', '2025-03-17 08:35:27');
INSERT INTO `visitors` VALUES (56, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:31', '2025-03-17 08:35:31');
INSERT INTO `visitors` VALUES (57, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:35:40', '2025-03-17 08:35:40');
INSERT INTO `visitors` VALUES (58, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:36:40', '2025-03-17 08:36:40');
INSERT INTO `visitors` VALUES (59, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:39:47', '2025-03-17 08:39:47');
INSERT INTO `visitors` VALUES (60, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:40:05', '2025-03-17 08:40:05');
INSERT INTO `visitors` VALUES (61, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:40:13', '2025-03-17 08:40:13');
INSERT INTO `visitors` VALUES (62, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:40:22', '2025-03-17 08:40:22');
INSERT INTO `visitors` VALUES (63, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:45:22', '2025-03-17 08:45:22');
INSERT INTO `visitors` VALUES (64, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:45:26', '2025-03-17 08:45:26');
INSERT INTO `visitors` VALUES (65, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:45:41', '2025-03-17 08:45:41');
INSERT INTO `visitors` VALUES (66, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:45:55', '2025-03-17 08:45:55');
INSERT INTO `visitors` VALUES (67, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:46:14', '2025-03-17 08:46:14');
INSERT INTO `visitors` VALUES (68, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:48:00', '2025-03-17 08:48:00');
INSERT INTO `visitors` VALUES (69, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:48:19', '2025-03-17 08:48:19');
INSERT INTO `visitors` VALUES (70, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:48:22', '2025-03-17 08:48:22');
INSERT INTO `visitors` VALUES (71, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:48:24', '2025-03-17 08:48:24');
INSERT INTO `visitors` VALUES (72, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:48:42', '2025-03-17 08:48:42');
INSERT INTO `visitors` VALUES (73, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:50:08', '2025-03-17 08:50:08');
INSERT INTO `visitors` VALUES (74, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:50:14', '2025-03-17 08:50:14');
INSERT INTO `visitors` VALUES (75, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:50:28', '2025-03-17 08:50:28');
INSERT INTO `visitors` VALUES (76, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:50:33', '2025-03-17 08:50:33');
INSERT INTO `visitors` VALUES (77, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:50:47', '2025-03-17 08:50:47');
INSERT INTO `visitors` VALUES (78, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:50:52', '2025-03-17 08:50:52');
INSERT INTO `visitors` VALUES (79, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 08:50:52', '2025-03-17 08:50:52');
INSERT INTO `visitors` VALUES (80, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:50:55', '2025-03-17 08:50:55');
INSERT INTO `visitors` VALUES (81, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:54:01', '2025-03-17 08:54:01');
INSERT INTO `visitors` VALUES (82, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:55:33', '2025-03-17 08:55:33');
INSERT INTO `visitors` VALUES (83, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:55:37', '2025-03-17 08:55:37');
INSERT INTO `visitors` VALUES (84, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:55:48', '2025-03-17 08:55:48');
INSERT INTO `visitors` VALUES (85, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:55:51', '2025-03-17 08:55:51');
INSERT INTO `visitors` VALUES (86, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:55:59', '2025-03-17 08:55:59');
INSERT INTO `visitors` VALUES (87, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:02', '2025-03-17 08:56:02');
INSERT INTO `visitors` VALUES (88, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:12', '2025-03-17 08:56:12');
INSERT INTO `visitors` VALUES (89, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:16', '2025-03-17 08:56:16');
INSERT INTO `visitors` VALUES (90, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:25', '2025-03-17 08:56:25');
INSERT INTO `visitors` VALUES (91, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:29', '2025-03-17 08:56:29');
INSERT INTO `visitors` VALUES (92, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:38', '2025-03-17 08:56:38');
INSERT INTO `visitors` VALUES (93, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:49', '2025-03-17 08:56:49');
INSERT INTO `visitors` VALUES (94, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:57', '2025-03-17 08:56:57');
INSERT INTO `visitors` VALUES (95, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:56:59', '2025-03-17 08:56:59');
INSERT INTO `visitors` VALUES (96, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:57:04', '2025-03-17 08:57:04');
INSERT INTO `visitors` VALUES (97, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:57:10', '2025-03-17 08:57:10');
INSERT INTO `visitors` VALUES (98, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:57:20', '2025-03-17 08:57:20');
INSERT INTO `visitors` VALUES (99, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:57:29', '2025-03-17 08:57:29');
INSERT INTO `visitors` VALUES (100, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:57:30', '2025-03-17 08:57:30');
INSERT INTO `visitors` VALUES (101, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 08:57:33', '2025-03-17 08:57:33');
INSERT INTO `visitors` VALUES (102, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 09:07:52', '2025-03-17 09:07:52');
INSERT INTO `visitors` VALUES (103, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop/1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 10:03:58', '2025-03-17 10:03:58');
INSERT INTO `visitors` VALUES (104, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop/1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 10:10:50', '2025-03-17 10:10:50');
INSERT INTO `visitors` VALUES (105, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 10:16:36', '2025-03-17 10:16:36');
INSERT INTO `visitors` VALUES (106, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 10:17:05', '2025-03-17 10:17:05');
INSERT INTO `visitors` VALUES (107, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 10:17:40', '2025-03-17 10:17:40');
INSERT INTO `visitors` VALUES (108, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:17:58', '2025-03-17 10:17:58');
INSERT INTO `visitors` VALUES (109, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:01', '2025-03-17 10:18:01');
INSERT INTO `visitors` VALUES (110, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:07', '2025-03-17 10:18:07');
INSERT INTO `visitors` VALUES (111, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:29', '2025-03-17 10:18:29');
INSERT INTO `visitors` VALUES (112, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:30', '2025-03-17 10:18:30');
INSERT INTO `visitors` VALUES (113, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:36', '2025-03-17 10:18:36');
INSERT INTO `visitors` VALUES (114, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:38', '2025-03-17 10:18:38');
INSERT INTO `visitors` VALUES (115, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:38', '2025-03-17 10:18:38');
INSERT INTO `visitors` VALUES (116, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 10:18:45', '2025-03-17 10:18:45');
INSERT INTO `visitors` VALUES (117, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 10:18:47', '2025-03-17 10:18:47');
INSERT INTO `visitors` VALUES (118, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:01:15', '2025-03-17 11:01:15');
INSERT INTO `visitors` VALUES (119, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:03:43', '2025-03-17 11:03:43');
INSERT INTO `visitors` VALUES (120, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:06:03', '2025-03-17 11:06:03');
INSERT INTO `visitors` VALUES (121, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:06:39', '2025-03-17 11:06:39');
INSERT INTO `visitors` VALUES (122, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:06:56', '2025-03-17 11:06:56');
INSERT INTO `visitors` VALUES (123, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:07:22', '2025-03-17 11:07:22');
INSERT INTO `visitors` VALUES (124, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:07:46', '2025-03-17 11:07:46');
INSERT INTO `visitors` VALUES (125, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-17 11:08:47', '2025-03-17 11:08:47');
INSERT INTO `visitors` VALUES (126, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/show-cart/address', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:09:33', '2025-03-17 11:09:33');
INSERT INTO `visitors` VALUES (127, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/show-cart/address', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:10:19', '2025-03-17 11:10:19');
INSERT INTO `visitors` VALUES (128, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/show-cart/address', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-17 11:11:21', '2025-03-17 11:11:21');
INSERT INTO `visitors` VALUES (129, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-17 11:11:38', '2025-03-17 11:11:38');
INSERT INTO `visitors` VALUES (130, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-17 11:11:58', '2025-03-17 11:11:58');
INSERT INTO `visitors` VALUES (131, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-17 11:12:05', '2025-03-17 11:12:05');
INSERT INTO `visitors` VALUES (132, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-17 11:56:06', '2025-03-17 11:56:06');
INSERT INTO `visitors` VALUES (133, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-17 11:56:09', '2025-03-17 11:56:09');
INSERT INTO `visitors` VALUES (134, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:22:55', '2025-03-18 07:22:55');
INSERT INTO `visitors` VALUES (135, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:23:12', '2025-03-18 07:23:12');
INSERT INTO `visitors` VALUES (136, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:27:12', '2025-03-18 07:27:12');
INSERT INTO `visitors` VALUES (137, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:27:48', '2025-03-18 07:27:48');
INSERT INTO `visitors` VALUES (138, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:29:52', '2025-03-18 07:29:52');
INSERT INTO `visitors` VALUES (139, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:31:20', '2025-03-18 07:31:20');
INSERT INTO `visitors` VALUES (140, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:34:49', '2025-03-18 07:34:49');
INSERT INTO `visitors` VALUES (141, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:35:19', '2025-03-18 07:35:19');
INSERT INTO `visitors` VALUES (142, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:39:52', '2025-03-18 07:39:52');
INSERT INTO `visitors` VALUES (143, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:41:36', '2025-03-18 07:41:36');
INSERT INTO `visitors` VALUES (144, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:43:08', '2025-03-18 07:43:08');
INSERT INTO `visitors` VALUES (145, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:45:30', '2025-03-18 07:45:30');
INSERT INTO `visitors` VALUES (146, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:10', '2025-03-18 07:47:10');
INSERT INTO `visitors` VALUES (147, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:25', '2025-03-18 07:47:25');
INSERT INTO `visitors` VALUES (148, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:32', '2025-03-18 07:47:32');
INSERT INTO `visitors` VALUES (149, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:36', '2025-03-18 07:47:36');
INSERT INTO `visitors` VALUES (150, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:39', '2025-03-18 07:47:39');
INSERT INTO `visitors` VALUES (151, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:46', '2025-03-18 07:47:46');
INSERT INTO `visitors` VALUES (152, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:49', '2025-03-18 07:47:49');
INSERT INTO `visitors` VALUES (153, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:52', '2025-03-18 07:47:52');
INSERT INTO `visitors` VALUES (154, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:55', '2025-03-18 07:47:55');
INSERT INTO `visitors` VALUES (155, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:47:57', '2025-03-18 07:47:57');
INSERT INTO `visitors` VALUES (156, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:00', '2025-03-18 07:48:00');
INSERT INTO `visitors` VALUES (157, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:01', '2025-03-18 07:48:01');
INSERT INTO `visitors` VALUES (158, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:04', '2025-03-18 07:48:04');
INSERT INTO `visitors` VALUES (159, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:06', '2025-03-18 07:48:06');
INSERT INTO `visitors` VALUES (160, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:14', '2025-03-18 07:48:14');
INSERT INTO `visitors` VALUES (161, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:22', '2025-03-18 07:48:22');
INSERT INTO `visitors` VALUES (162, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:41', '2025-03-18 07:48:41');
INSERT INTO `visitors` VALUES (163, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:43', '2025-03-18 07:48:43');
INSERT INTO `visitors` VALUES (164, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:47', '2025-03-18 07:48:47');
INSERT INTO `visitors` VALUES (165, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:54', '2025-03-18 07:48:54');
INSERT INTO `visitors` VALUES (166, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:48:57', '2025-03-18 07:48:57');
INSERT INTO `visitors` VALUES (167, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:01', '2025-03-18 07:49:01');
INSERT INTO `visitors` VALUES (168, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:04', '2025-03-18 07:49:04');
INSERT INTO `visitors` VALUES (169, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:05', '2025-03-18 07:49:05');
INSERT INTO `visitors` VALUES (170, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:06', '2025-03-18 07:49:06');
INSERT INTO `visitors` VALUES (171, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:11', '2025-03-18 07:49:11');
INSERT INTO `visitors` VALUES (172, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:13', '2025-03-18 07:49:13');
INSERT INTO `visitors` VALUES (173, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:16', '2025-03-18 07:49:16');
INSERT INTO `visitors` VALUES (174, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:19', '2025-03-18 07:49:19');
INSERT INTO `visitors` VALUES (175, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:22', '2025-03-18 07:49:22');
INSERT INTO `visitors` VALUES (176, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:27', '2025-03-18 07:49:27');
INSERT INTO `visitors` VALUES (177, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:28', '2025-03-18 07:49:28');
INSERT INTO `visitors` VALUES (178, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:49:58', '2025-03-18 07:49:58');
INSERT INTO `visitors` VALUES (179, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:50:35', '2025-03-18 07:50:35');
INSERT INTO `visitors` VALUES (180, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:50:44', '2025-03-18 07:50:44');
INSERT INTO `visitors` VALUES (181, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:50:45', '2025-03-18 07:50:45');
INSERT INTO `visitors` VALUES (182, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:51:35', '2025-03-18 07:51:35');
INSERT INTO `visitors` VALUES (183, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:51:37', '2025-03-18 07:51:37');
INSERT INTO `visitors` VALUES (184, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:51:40', '2025-03-18 07:51:40');
INSERT INTO `visitors` VALUES (185, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:20', '2025-03-18 07:52:20');
INSERT INTO `visitors` VALUES (186, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:23', '2025-03-18 07:52:23');
INSERT INTO `visitors` VALUES (187, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:24', '2025-03-18 07:52:24');
INSERT INTO `visitors` VALUES (188, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:27', '2025-03-18 07:52:27');
INSERT INTO `visitors` VALUES (189, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:28', '2025-03-18 07:52:28');
INSERT INTO `visitors` VALUES (190, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:40', '2025-03-18 07:52:40');
INSERT INTO `visitors` VALUES (191, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:43', '2025-03-18 07:52:43');
INSERT INTO `visitors` VALUES (192, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:46', '2025-03-18 07:52:46');
INSERT INTO `visitors` VALUES (193, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:52', '2025-03-18 07:52:52');
INSERT INTO `visitors` VALUES (194, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:52:55', '2025-03-18 07:52:55');
INSERT INTO `visitors` VALUES (195, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:02', '2025-03-18 07:53:02');
INSERT INTO `visitors` VALUES (196, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:05', '2025-03-18 07:53:05');
INSERT INTO `visitors` VALUES (197, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:09', '2025-03-18 07:53:09');
INSERT INTO `visitors` VALUES (198, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:12', '2025-03-18 07:53:12');
INSERT INTO `visitors` VALUES (199, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:13', '2025-03-18 07:53:13');
INSERT INTO `visitors` VALUES (200, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:15', '2025-03-18 07:53:15');
INSERT INTO `visitors` VALUES (201, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:17', '2025-03-18 07:53:17');
INSERT INTO `visitors` VALUES (202, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:25', '2025-03-18 07:53:25');
INSERT INTO `visitors` VALUES (203, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:29', '2025-03-18 07:53:29');
INSERT INTO `visitors` VALUES (204, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:33', '2025-03-18 07:53:33');
INSERT INTO `visitors` VALUES (205, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:47', '2025-03-18 07:53:47');
INSERT INTO `visitors` VALUES (206, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:51', '2025-03-18 07:53:51');
INSERT INTO `visitors` VALUES (207, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:53:52', '2025-03-18 07:53:52');
INSERT INTO `visitors` VALUES (208, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:54:05', '2025-03-18 07:54:05');
INSERT INTO `visitors` VALUES (209, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:54:09', '2025-03-18 07:54:09');
INSERT INTO `visitors` VALUES (210, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:54:37', '2025-03-18 07:54:37');
INSERT INTO `visitors` VALUES (211, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:54:45', '2025-03-18 07:54:45');
INSERT INTO `visitors` VALUES (212, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 07:55:34', '2025-03-18 07:55:34');
INSERT INTO `visitors` VALUES (213, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:55:40', '2025-03-18 07:55:40');
INSERT INTO `visitors` VALUES (214, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:27', '2025-03-18 07:56:27');
INSERT INTO `visitors` VALUES (215, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:35', '2025-03-18 07:56:35');
INSERT INTO `visitors` VALUES (216, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:37', '2025-03-18 07:56:37');
INSERT INTO `visitors` VALUES (217, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:42', '2025-03-18 07:56:42');
INSERT INTO `visitors` VALUES (218, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:43', '2025-03-18 07:56:43');
INSERT INTO `visitors` VALUES (219, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:45', '2025-03-18 07:56:45');
INSERT INTO `visitors` VALUES (220, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:48', '2025-03-18 07:56:48');
INSERT INTO `visitors` VALUES (221, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:51', '2025-03-18 07:56:51');
INSERT INTO `visitors` VALUES (222, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:52', '2025-03-18 07:56:52');
INSERT INTO `visitors` VALUES (223, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:54', '2025-03-18 07:56:54');
INSERT INTO `visitors` VALUES (224, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:56:58', '2025-03-18 07:56:58');
INSERT INTO `visitors` VALUES (225, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:57:00', '2025-03-18 07:57:00');
INSERT INTO `visitors` VALUES (226, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:57:20', '2025-03-18 07:57:20');
INSERT INTO `visitors` VALUES (227, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:57:22', '2025-03-18 07:57:22');
INSERT INTO `visitors` VALUES (228, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:57:38', '2025-03-18 07:57:38');
INSERT INTO `visitors` VALUES (229, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:57:54', '2025-03-18 07:57:54');
INSERT INTO `visitors` VALUES (230, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:57:58', '2025-03-18 07:57:58');
INSERT INTO `visitors` VALUES (231, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:03', '2025-03-18 07:58:03');
INSERT INTO `visitors` VALUES (232, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:17', '2025-03-18 07:58:17');
INSERT INTO `visitors` VALUES (233, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:27', '2025-03-18 07:58:27');
INSERT INTO `visitors` VALUES (234, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:29', '2025-03-18 07:58:29');
INSERT INTO `visitors` VALUES (235, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:35', '2025-03-18 07:58:35');
INSERT INTO `visitors` VALUES (236, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:37', '2025-03-18 07:58:37');
INSERT INTO `visitors` VALUES (237, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:45', '2025-03-18 07:58:45');
INSERT INTO `visitors` VALUES (238, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:51', '2025-03-18 07:58:51');
INSERT INTO `visitors` VALUES (239, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:52', '2025-03-18 07:58:52');
INSERT INTO `visitors` VALUES (240, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:58', '2025-03-18 07:58:58');
INSERT INTO `visitors` VALUES (241, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:58:59', '2025-03-18 07:58:59');
INSERT INTO `visitors` VALUES (242, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:03', '2025-03-18 07:59:03');
INSERT INTO `visitors` VALUES (243, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:07', '2025-03-18 07:59:07');
INSERT INTO `visitors` VALUES (244, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:11', '2025-03-18 07:59:11');
INSERT INTO `visitors` VALUES (245, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:13', '2025-03-18 07:59:13');
INSERT INTO `visitors` VALUES (246, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:18', '2025-03-18 07:59:18');
INSERT INTO `visitors` VALUES (247, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:23', '2025-03-18 07:59:23');
INSERT INTO `visitors` VALUES (248, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:26', '2025-03-18 07:59:26');
INSERT INTO `visitors` VALUES (249, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:30', '2025-03-18 07:59:30');
INSERT INTO `visitors` VALUES (250, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:32', '2025-03-18 07:59:32');
INSERT INTO `visitors` VALUES (251, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:34', '2025-03-18 07:59:34');
INSERT INTO `visitors` VALUES (252, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:46', '2025-03-18 07:59:46');
INSERT INTO `visitors` VALUES (253, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 07:59:53', '2025-03-18 07:59:53');
INSERT INTO `visitors` VALUES (254, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:02', '2025-03-18 08:00:02');
INSERT INTO `visitors` VALUES (255, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:16', '2025-03-18 08:00:16');
INSERT INTO `visitors` VALUES (256, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:24', '2025-03-18 08:00:24');
INSERT INTO `visitors` VALUES (257, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:33', '2025-03-18 08:00:33');
INSERT INTO `visitors` VALUES (258, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:38', '2025-03-18 08:00:38');
INSERT INTO `visitors` VALUES (259, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:42', '2025-03-18 08:00:42');
INSERT INTO `visitors` VALUES (260, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:47', '2025-03-18 08:00:47');
INSERT INTO `visitors` VALUES (261, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:00:58', '2025-03-18 08:00:58');
INSERT INTO `visitors` VALUES (262, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:01', '2025-03-18 08:01:01');
INSERT INTO `visitors` VALUES (263, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:09', '2025-03-18 08:01:09');
INSERT INTO `visitors` VALUES (264, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:41', '2025-03-18 08:01:41');
INSERT INTO `visitors` VALUES (265, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:44', '2025-03-18 08:01:44');
INSERT INTO `visitors` VALUES (266, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:49', '2025-03-18 08:01:49');
INSERT INTO `visitors` VALUES (267, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:55', '2025-03-18 08:01:55');
INSERT INTO `visitors` VALUES (268, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:01:56', '2025-03-18 08:01:56');
INSERT INTO `visitors` VALUES (269, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:02:01', '2025-03-18 08:02:01');
INSERT INTO `visitors` VALUES (270, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:02:06', '2025-03-18 08:02:06');
INSERT INTO `visitors` VALUES (271, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:03:31', '2025-03-18 08:03:31');
INSERT INTO `visitors` VALUES (272, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:03:31', '2025-03-18 08:03:31');
INSERT INTO `visitors` VALUES (273, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:03:56', '2025-03-18 08:03:56');
INSERT INTO `visitors` VALUES (274, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:03:58', '2025-03-18 08:03:58');
INSERT INTO `visitors` VALUES (275, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:45', '2025-03-18 08:04:45');
INSERT INTO `visitors` VALUES (276, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:45', '2025-03-18 08:04:45');
INSERT INTO `visitors` VALUES (277, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:45', '2025-03-18 08:04:45');
INSERT INTO `visitors` VALUES (278, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:45', '2025-03-18 08:04:45');
INSERT INTO `visitors` VALUES (279, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:45', '2025-03-18 08:04:45');
INSERT INTO `visitors` VALUES (280, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:46', '2025-03-18 08:04:46');
INSERT INTO `visitors` VALUES (281, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:46', '2025-03-18 08:04:46');
INSERT INTO `visitors` VALUES (282, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:04:52', '2025-03-18 08:04:52');
INSERT INTO `visitors` VALUES (283, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:11', '2025-03-18 08:05:11');
INSERT INTO `visitors` VALUES (284, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:11', '2025-03-18 08:05:11');
INSERT INTO `visitors` VALUES (285, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:13', '2025-03-18 08:05:13');
INSERT INTO `visitors` VALUES (286, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:36', '2025-03-18 08:05:36');
INSERT INTO `visitors` VALUES (287, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:37', '2025-03-18 08:05:37');
INSERT INTO `visitors` VALUES (288, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:37', '2025-03-18 08:05:37');
INSERT INTO `visitors` VALUES (289, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:05:41', '2025-03-18 08:05:41');
INSERT INTO `visitors` VALUES (290, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:05:56', '2025-03-18 08:05:56');
INSERT INTO `visitors` VALUES (291, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:24', '2025-03-18 08:07:24');
INSERT INTO `visitors` VALUES (292, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:27', '2025-03-18 08:07:27');
INSERT INTO `visitors` VALUES (293, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:30', '2025-03-18 08:07:30');
INSERT INTO `visitors` VALUES (294, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:31', '2025-03-18 08:07:31');
INSERT INTO `visitors` VALUES (295, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:36', '2025-03-18 08:07:36');
INSERT INTO `visitors` VALUES (296, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:45', '2025-03-18 08:07:45');
INSERT INTO `visitors` VALUES (297, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:46', '2025-03-18 08:07:46');
INSERT INTO `visitors` VALUES (298, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:54', '2025-03-18 08:07:54');
INSERT INTO `visitors` VALUES (299, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:56', '2025-03-18 08:07:56');
INSERT INTO `visitors` VALUES (300, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:07:58', '2025-03-18 08:07:58');
INSERT INTO `visitors` VALUES (301, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:08:00', '2025-03-18 08:08:00');
INSERT INTO `visitors` VALUES (302, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:08:02', '2025-03-18 08:08:02');
INSERT INTO `visitors` VALUES (303, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:08:04', '2025-03-18 08:08:04');
INSERT INTO `visitors` VALUES (304, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:08:39', '2025-03-18 08:08:39');
INSERT INTO `visitors` VALUES (305, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:10', '2025-03-18 08:09:10');
INSERT INTO `visitors` VALUES (306, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:14', '2025-03-18 08:09:14');
INSERT INTO `visitors` VALUES (307, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:17', '2025-03-18 08:09:17');
INSERT INTO `visitors` VALUES (308, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:20', '2025-03-18 08:09:20');
INSERT INTO `visitors` VALUES (309, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:22', '2025-03-18 08:09:22');
INSERT INTO `visitors` VALUES (310, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:29', '2025-03-18 08:09:29');
INSERT INTO `visitors` VALUES (311, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:32', '2025-03-18 08:09:32');
INSERT INTO `visitors` VALUES (312, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:09:47', '2025-03-18 08:09:47');
INSERT INTO `visitors` VALUES (313, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:10:12', '2025-03-18 08:10:12');
INSERT INTO `visitors` VALUES (314, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:10:20', '2025-03-18 08:10:20');
INSERT INTO `visitors` VALUES (315, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:11:43', '2025-03-18 08:11:43');
INSERT INTO `visitors` VALUES (316, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:11:47', '2025-03-18 08:11:47');
INSERT INTO `visitors` VALUES (317, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:11:49', '2025-03-18 08:11:49');
INSERT INTO `visitors` VALUES (318, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:14', '2025-03-18 08:12:14');
INSERT INTO `visitors` VALUES (319, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:21', '2025-03-18 08:12:21');
INSERT INTO `visitors` VALUES (320, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:23', '2025-03-18 08:12:23');
INSERT INTO `visitors` VALUES (321, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:28', '2025-03-18 08:12:28');
INSERT INTO `visitors` VALUES (322, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:36', '2025-03-18 08:12:36');
INSERT INTO `visitors` VALUES (323, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:53', '2025-03-18 08:12:53');
INSERT INTO `visitors` VALUES (324, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:55', '2025-03-18 08:12:55');
INSERT INTO `visitors` VALUES (325, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:57', '2025-03-18 08:12:57');
INSERT INTO `visitors` VALUES (326, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:12:59', '2025-03-18 08:12:59');
INSERT INTO `visitors` VALUES (327, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:13:10', '2025-03-18 08:13:10');
INSERT INTO `visitors` VALUES (328, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:13:15', '2025-03-18 08:13:15');
INSERT INTO `visitors` VALUES (329, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:13:18', '2025-03-18 08:13:18');
INSERT INTO `visitors` VALUES (330, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:13:26', '2025-03-18 08:13:26');
INSERT INTO `visitors` VALUES (331, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:13:42', '2025-03-18 08:13:42');
INSERT INTO `visitors` VALUES (332, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:13:43', '2025-03-18 08:13:43');
INSERT INTO `visitors` VALUES (333, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop?page=2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:15:44', '2025-03-18 08:15:44');
INSERT INTO `visitors` VALUES (334, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:15:49', '2025-03-18 08:15:49');
INSERT INTO `visitors` VALUES (335, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:15:54', '2025-03-18 08:15:54');
INSERT INTO `visitors` VALUES (336, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:16:12', '2025-03-18 08:16:12');
INSERT INTO `visitors` VALUES (337, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:16:17', '2025-03-18 08:16:17');
INSERT INTO `visitors` VALUES (338, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:16:57', '2025-03-18 08:16:57');
INSERT INTO `visitors` VALUES (339, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:14', '2025-03-18 08:17:14');
INSERT INTO `visitors` VALUES (340, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:29', '2025-03-18 08:17:29');
INSERT INTO `visitors` VALUES (341, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:39', '2025-03-18 08:17:39');
INSERT INTO `visitors` VALUES (342, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:46', '2025-03-18 08:17:46');
INSERT INTO `visitors` VALUES (343, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:50', '2025-03-18 08:17:50');
INSERT INTO `visitors` VALUES (344, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:56', '2025-03-18 08:17:56');
INSERT INTO `visitors` VALUES (345, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:17:56', '2025-03-18 08:17:56');
INSERT INTO `visitors` VALUES (346, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:18:00', '2025-03-18 08:18:00');
INSERT INTO `visitors` VALUES (347, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:18:01', '2025-03-18 08:18:01');
INSERT INTO `visitors` VALUES (348, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:18:08', '2025-03-18 08:18:08');
INSERT INTO `visitors` VALUES (349, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:19:19', '2025-03-18 08:19:19');
INSERT INTO `visitors` VALUES (350, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:20:32', '2025-03-18 08:20:32');
INSERT INTO `visitors` VALUES (351, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:20:58', '2025-03-18 08:20:58');
INSERT INTO `visitors` VALUES (352, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:21:01', '2025-03-18 08:21:01');
INSERT INTO `visitors` VALUES (353, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:03', '2025-03-18 08:22:03');
INSERT INTO `visitors` VALUES (354, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:19', '2025-03-18 08:22:19');
INSERT INTO `visitors` VALUES (355, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:31', '2025-03-18 08:22:31');
INSERT INTO `visitors` VALUES (356, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:32', '2025-03-18 08:22:32');
INSERT INTO `visitors` VALUES (357, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:32', '2025-03-18 08:22:32');
INSERT INTO `visitors` VALUES (358, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:48', '2025-03-18 08:22:48');
INSERT INTO `visitors` VALUES (359, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:22:51', '2025-03-18 08:22:51');
INSERT INTO `visitors` VALUES (360, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop?page=1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:22:56', '2025-03-18 08:22:56');
INSERT INTO `visitors` VALUES (361, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop?page=1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:23:12', '2025-03-18 08:23:12');
INSERT INTO `visitors` VALUES (362, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:23:33', '2025-03-18 08:23:33');
INSERT INTO `visitors` VALUES (363, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:23:40', '2025-03-18 08:23:40');
INSERT INTO `visitors` VALUES (364, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:23:43', '2025-03-18 08:23:43');
INSERT INTO `visitors` VALUES (365, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop/7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:24:52', '2025-03-18 08:24:52');
INSERT INTO `visitors` VALUES (366, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop/7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 08:25:07', '2025-03-18 08:25:07');
INSERT INTO `visitors` VALUES (367, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 08:25:26', '2025-03-18 08:25:26');
INSERT INTO `visitors` VALUES (368, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop/6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:26:46', '2025-03-18 08:26:46');
INSERT INTO `visitors` VALUES (369, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop/6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:27:54', '2025-03-18 08:27:54');
INSERT INTO `visitors` VALUES (370, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:28:21', '2025-03-18 08:28:21');
INSERT INTO `visitors` VALUES (371, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 08:28:25', '2025-03-18 08:28:25');
INSERT INTO `visitors` VALUES (372, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-18 08:30:17', '2025-03-18 08:30:17');
INSERT INTO `visitors` VALUES (373, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-18 08:30:31', '2025-03-18 08:30:31');
INSERT INTO `visitors` VALUES (374, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-18 08:31:06', '2025-03-18 08:31:06');
INSERT INTO `visitors` VALUES (375, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:45:07', '2025-03-18 08:45:07');
INSERT INTO `visitors` VALUES (376, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 08:45:12', '2025-03-18 08:45:13');
INSERT INTO `visitors` VALUES (377, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:05:58', '2025-03-18 09:05:58');
INSERT INTO `visitors` VALUES (378, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:06:32', '2025-03-18 09:06:32');
INSERT INTO `visitors` VALUES (379, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:06:57', '2025-03-18 09:06:57');
INSERT INTO `visitors` VALUES (380, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:07:04', '2025-03-18 09:07:04');
INSERT INTO `visitors` VALUES (381, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:08:42', '2025-03-18 09:08:42');
INSERT INTO `visitors` VALUES (382, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:08:44', '2025-03-18 09:08:44');
INSERT INTO `visitors` VALUES (383, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:11:27', '2025-03-18 09:11:27');
INSERT INTO `visitors` VALUES (384, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:11:31', '2025-03-18 09:11:31');
INSERT INTO `visitors` VALUES (385, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:11:49', '2025-03-18 09:11:49');
INSERT INTO `visitors` VALUES (386, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:11:55', '2025-03-18 09:11:55');
INSERT INTO `visitors` VALUES (387, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:12:00', '2025-03-18 09:12:00');
INSERT INTO `visitors` VALUES (388, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:12:03', '2025-03-18 09:12:03');
INSERT INTO `visitors` VALUES (389, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:12:05', '2025-03-18 09:12:05');
INSERT INTO `visitors` VALUES (390, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:15:13', '2025-03-18 09:15:13');
INSERT INTO `visitors` VALUES (391, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:15:14', '2025-03-18 09:15:14');
INSERT INTO `visitors` VALUES (392, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 09:15:58', '2025-03-18 09:15:58');
INSERT INTO `visitors` VALUES (393, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:17:34', '2025-03-18 09:17:34');
INSERT INTO `visitors` VALUES (394, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:17:35', '2025-03-18 09:17:35');
INSERT INTO `visitors` VALUES (395, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:17:43', '2025-03-18 09:17:43');
INSERT INTO `visitors` VALUES (396, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:18:34', '2025-03-18 09:18:34');
INSERT INTO `visitors` VALUES (397, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:18:39', '2025-03-18 09:18:39');
INSERT INTO `visitors` VALUES (398, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:18:46', '2025-03-18 09:18:46');
INSERT INTO `visitors` VALUES (399, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:18:52', '2025-03-18 09:18:52');
INSERT INTO `visitors` VALUES (400, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:18:57', '2025-03-18 09:18:57');
INSERT INTO `visitors` VALUES (401, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:10', '2025-03-18 09:19:10');
INSERT INTO `visitors` VALUES (402, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:29', '2025-03-18 09:19:29');
INSERT INTO `visitors` VALUES (403, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:34', '2025-03-18 09:19:34');
INSERT INTO `visitors` VALUES (404, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:37', '2025-03-18 09:19:37');
INSERT INTO `visitors` VALUES (405, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:39', '2025-03-18 09:19:39');
INSERT INTO `visitors` VALUES (406, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:41', '2025-03-18 09:19:41');
INSERT INTO `visitors` VALUES (407, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:49', '2025-03-18 09:19:49');
INSERT INTO `visitors` VALUES (408, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:19:55', '2025-03-18 09:19:55');
INSERT INTO `visitors` VALUES (409, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:20:03', '2025-03-18 09:20:03');
INSERT INTO `visitors` VALUES (410, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:20:16', '2025-03-18 09:20:16');
INSERT INTO `visitors` VALUES (411, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:20:28', '2025-03-18 09:20:28');
INSERT INTO `visitors` VALUES (412, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:20:45', '2025-03-18 09:20:45');
INSERT INTO `visitors` VALUES (413, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:20:48', '2025-03-18 09:20:48');
INSERT INTO `visitors` VALUES (414, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 09:20:53', '2025-03-18 09:20:53');
INSERT INTO `visitors` VALUES (415, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:45:33', '2025-03-18 12:45:33');
INSERT INTO `visitors` VALUES (416, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:46:34', '2025-03-18 12:46:34');
INSERT INTO `visitors` VALUES (417, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:46:43', '2025-03-18 12:46:43');
INSERT INTO `visitors` VALUES (418, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:48:53', '2025-03-18 12:48:53');
INSERT INTO `visitors` VALUES (419, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:48:54', '2025-03-18 12:48:54');
INSERT INTO `visitors` VALUES (420, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:48:59', '2025-03-18 12:48:59');
INSERT INTO `visitors` VALUES (421, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:09', '2025-03-18 12:49:09');
INSERT INTO `visitors` VALUES (422, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:22', '2025-03-18 12:49:22');
INSERT INTO `visitors` VALUES (423, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:28', '2025-03-18 12:49:28');
INSERT INTO `visitors` VALUES (424, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:33', '2025-03-18 12:49:33');
INSERT INTO `visitors` VALUES (425, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:36', '2025-03-18 12:49:36');
INSERT INTO `visitors` VALUES (426, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:39', '2025-03-18 12:49:39');
INSERT INTO `visitors` VALUES (427, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:45', '2025-03-18 12:49:45');
INSERT INTO `visitors` VALUES (428, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:51', '2025-03-18 12:49:51');
INSERT INTO `visitors` VALUES (429, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:49:52', '2025-03-18 12:49:52');
INSERT INTO `visitors` VALUES (430, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:50:02', '2025-03-18 12:50:02');
INSERT INTO `visitors` VALUES (431, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:50:09', '2025-03-18 12:50:09');
INSERT INTO `visitors` VALUES (432, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:50:36', '2025-03-18 12:50:36');
INSERT INTO `visitors` VALUES (433, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:50:59', '2025-03-18 12:50:59');
INSERT INTO `visitors` VALUES (434, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:51:00', '2025-03-18 12:51:00');
INSERT INTO `visitors` VALUES (435, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:51:20', '2025-03-18 12:51:20');
INSERT INTO `visitors` VALUES (436, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:51:21', '2025-03-18 12:51:21');
INSERT INTO `visitors` VALUES (437, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:51:24', '2025-03-18 12:51:24');
INSERT INTO `visitors` VALUES (438, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:52:01', '2025-03-18 12:52:01');
INSERT INTO `visitors` VALUES (439, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:52:05', '2025-03-18 12:52:05');
INSERT INTO `visitors` VALUES (440, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:52:07', '2025-03-18 12:52:07');
INSERT INTO `visitors` VALUES (441, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:52:23', '2025-03-18 12:52:23');
INSERT INTO `visitors` VALUES (442, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:52:24', '2025-03-18 12:52:24');
INSERT INTO `visitors` VALUES (443, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:52:56', '2025-03-18 12:52:56');
INSERT INTO `visitors` VALUES (444, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:53:00', '2025-03-18 12:53:00');
INSERT INTO `visitors` VALUES (445, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:53:05', '2025-03-18 12:53:05');
INSERT INTO `visitors` VALUES (446, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:53:26', '2025-03-18 12:53:26');
INSERT INTO `visitors` VALUES (447, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 12:53:55', '2025-03-18 12:53:55');
INSERT INTO `visitors` VALUES (448, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-18 12:54:49', '2025-03-18 12:54:49');
INSERT INTO `visitors` VALUES (449, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 12:55:14', '2025-03-18 12:55:14');
INSERT INTO `visitors` VALUES (450, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 12:55:21', '2025-03-18 12:55:21');
INSERT INTO `visitors` VALUES (451, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-18 12:55:47', '2025-03-18 12:55:47');
INSERT INTO `visitors` VALUES (452, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 12:56:01', '2025-03-18 12:56:01');
INSERT INTO `visitors` VALUES (453, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 12:56:41', '2025-03-18 12:56:41');
INSERT INTO `visitors` VALUES (454, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-18 13:00:09', '2025-03-18 13:00:09');
INSERT INTO `visitors` VALUES (455, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-18 13:00:17', '2025-03-18 13:00:17');
INSERT INTO `visitors` VALUES (456, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-18 13:00:22', '2025-03-18 13:00:22');
INSERT INTO `visitors` VALUES (457, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-18 13:00:25', '2025-03-18 13:00:25');
INSERT INTO `visitors` VALUES (458, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:28', '2025-03-18 13:01:28');
INSERT INTO `visitors` VALUES (459, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:30', '2025-03-18 13:01:30');
INSERT INTO `visitors` VALUES (460, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:31', '2025-03-18 13:01:31');
INSERT INTO `visitors` VALUES (461, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:31', '2025-03-18 13:01:31');
INSERT INTO `visitors` VALUES (462, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:32', '2025-03-18 13:01:32');
INSERT INTO `visitors` VALUES (463, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:35', '2025-03-18 13:01:35');
INSERT INTO `visitors` VALUES (464, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:42', '2025-03-18 13:01:42');
INSERT INTO `visitors` VALUES (465, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:01:46', '2025-03-18 13:01:46');
INSERT INTO `visitors` VALUES (466, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-18 13:01:54', '2025-03-18 13:01:54');
INSERT INTO `visitors` VALUES (467, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-18 13:01:58', '2025-03-18 13:01:58');
INSERT INTO `visitors` VALUES (468, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-18 13:01:59', '2025-03-18 13:01:59');
INSERT INTO `visitors` VALUES (469, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-18 13:02:02', '2025-03-18 13:02:02');

SET FOREIGN_KEY_CHECKS = 1;
