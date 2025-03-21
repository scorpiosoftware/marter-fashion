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

 Date: 21/03/2025 13:47:49
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
INSERT INTO `brands` VALUES (4, 'FLAMINGO', 'فلامنغو', 'brands//NyFFlM7UAIyS7h0tEw3PsFwQgiAhqLYdNvsxgYKL.jpg', '2025-03-17 11:03:37', '2025-03-20 08:42:02');

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
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of color_product
-- ----------------------------
INSERT INTO `color_product` VALUES (24, 2, 4, NULL, NULL);
INSERT INTO `color_product` VALUES (25, 1, 1, NULL, NULL);
INSERT INTO `color_product` VALUES (23, 3, 3, NULL, NULL);
INSERT INTO `color_product` VALUES (22, 4, 2, NULL, NULL);
INSERT INTO `color_product` VALUES (26, 5, 4, NULL, NULL);
INSERT INTO `color_product` VALUES (19, 6, 2, NULL, NULL);
INSERT INTO `color_product` VALUES (20, 7, 3, NULL, NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'PINK', '#ffc2c2', '2025-03-17 08:10:49', '2025-03-20 08:46:17');
INSERT INTO `colors` VALUES (2, 'RED', '#ff4747', '2025-03-18 07:23:55', '2025-03-18 07:23:55');
INSERT INTO `colors` VALUES (3, 'BLUE', '#2eafff', '2025-03-18 07:24:07', '2025-03-18 07:24:07');
INSERT INTO `colors` VALUES (4, 'BLACK', '#000000', '2025-03-20 08:45:52', '2025-03-20 08:45:52');

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
INSERT INTO `sessions` VALUES ('Kd3y67E9H0NDYWoXh7nPfHvSe5n6ZbaQN6rOcS5o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibm1HblFZQ1Vla284YVg2V2t6OXg2ZEN4OHNESWxvMTVkQWk5RFFvQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NDoiY2FydCI7YTowOnt9czo4OiJjYXRlZ29yeSI7YToxOntpOjA7czoxOiIyIjt9czo0OiJsYW5nIjtzOjI6ImFyIjt9', 1742547796);
INSERT INTO `sessions` VALUES ('SS4S8WYWdI7veJibqh1z1XXFbGRILYCg7DrDY9OU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS2h4enNHSk15YmRQRlJnY3Q1c21HUktISklRRlZnRnR1VEh5Rkx0dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NDoibGFuZyI7czoyOiJhciI7fQ==', 1742557625);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1552 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `visitors` VALUES (470, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 09:18:20', '2025-03-19 09:18:20');
INSERT INTO `visitors` VALUES (471, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:18:55', '2025-03-19 09:18:55');
INSERT INTO `visitors` VALUES (472, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:19:14', '2025-03-19 09:19:14');
INSERT INTO `visitors` VALUES (473, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:19:22', '2025-03-19 09:19:22');
INSERT INTO `visitors` VALUES (474, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:19:31', '2025-03-19 09:19:31');
INSERT INTO `visitors` VALUES (475, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:20:06', '2025-03-19 09:20:06');
INSERT INTO `visitors` VALUES (476, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:20:56', '2025-03-19 09:20:56');
INSERT INTO `visitors` VALUES (477, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:21:13', '2025-03-19 09:21:13');
INSERT INTO `visitors` VALUES (478, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-19 09:21:21', '2025-03-19 09:21:21');
INSERT INTO `visitors` VALUES (479, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 09:31:23', '2025-03-19 09:31:23');
INSERT INTO `visitors` VALUES (480, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:10', '2025-03-19 11:11:10');
INSERT INTO `visitors` VALUES (481, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:27', '2025-03-19 11:11:27');
INSERT INTO `visitors` VALUES (482, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:31', '2025-03-19 11:11:31');
INSERT INTO `visitors` VALUES (483, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:33', '2025-03-19 11:11:33');
INSERT INTO `visitors` VALUES (484, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:39', '2025-03-19 11:11:39');
INSERT INTO `visitors` VALUES (485, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:42', '2025-03-19 11:11:42');
INSERT INTO `visitors` VALUES (486, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:44', '2025-03-19 11:11:44');
INSERT INTO `visitors` VALUES (487, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:45', '2025-03-19 11:11:45');
INSERT INTO `visitors` VALUES (488, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:51', '2025-03-19 11:11:51');
INSERT INTO `visitors` VALUES (489, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:56', '2025-03-19 11:11:56');
INSERT INTO `visitors` VALUES (490, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:11:57', '2025-03-19 11:11:57');
INSERT INTO `visitors` VALUES (491, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:08', '2025-03-19 11:12:08');
INSERT INTO `visitors` VALUES (492, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:16', '2025-03-19 11:12:16');
INSERT INTO `visitors` VALUES (493, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:19', '2025-03-19 11:12:19');
INSERT INTO `visitors` VALUES (494, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:21', '2025-03-19 11:12:21');
INSERT INTO `visitors` VALUES (495, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:22', '2025-03-19 11:12:22');
INSERT INTO `visitors` VALUES (496, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:29', '2025-03-19 11:12:29');
INSERT INTO `visitors` VALUES (497, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:39', '2025-03-19 11:12:39');
INSERT INTO `visitors` VALUES (498, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:12:44', '2025-03-19 11:12:44');
INSERT INTO `visitors` VALUES (499, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:16:53', '2025-03-19 11:16:53');
INSERT INTO `visitors` VALUES (500, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:16:55', '2025-03-19 11:16:55');
INSERT INTO `visitors` VALUES (501, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:16:59', '2025-03-19 11:16:59');
INSERT INTO `visitors` VALUES (502, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:09', '2025-03-19 11:17:09');
INSERT INTO `visitors` VALUES (503, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:11', '2025-03-19 11:17:11');
INSERT INTO `visitors` VALUES (504, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:18', '2025-03-19 11:17:18');
INSERT INTO `visitors` VALUES (505, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:26', '2025-03-19 11:17:26');
INSERT INTO `visitors` VALUES (506, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:31', '2025-03-19 11:17:31');
INSERT INTO `visitors` VALUES (507, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:33', '2025-03-19 11:17:33');
INSERT INTO `visitors` VALUES (508, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:35', '2025-03-19 11:17:35');
INSERT INTO `visitors` VALUES (509, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:41', '2025-03-19 11:17:41');
INSERT INTO `visitors` VALUES (510, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:17:44', '2025-03-19 11:17:44');
INSERT INTO `visitors` VALUES (511, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:18:55', '2025-03-19 11:18:55');
INSERT INTO `visitors` VALUES (512, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:18:57', '2025-03-19 11:18:57');
INSERT INTO `visitors` VALUES (513, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:02', '2025-03-19 11:19:02');
INSERT INTO `visitors` VALUES (514, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:04', '2025-03-19 11:19:04');
INSERT INTO `visitors` VALUES (515, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:08', '2025-03-19 11:19:08');
INSERT INTO `visitors` VALUES (516, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:16', '2025-03-19 11:19:16');
INSERT INTO `visitors` VALUES (517, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:20', '2025-03-19 11:19:20');
INSERT INTO `visitors` VALUES (518, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:32', '2025-03-19 11:19:32');
INSERT INTO `visitors` VALUES (519, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:37', '2025-03-19 11:19:37');
INSERT INTO `visitors` VALUES (520, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:40', '2025-03-19 11:19:40');
INSERT INTO `visitors` VALUES (521, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:44', '2025-03-19 11:19:44');
INSERT INTO `visitors` VALUES (522, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:19:49', '2025-03-19 11:19:49');
INSERT INTO `visitors` VALUES (523, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:09', '2025-03-19 11:20:09');
INSERT INTO `visitors` VALUES (524, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:11', '2025-03-19 11:20:11');
INSERT INTO `visitors` VALUES (525, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:17', '2025-03-19 11:20:17');
INSERT INTO `visitors` VALUES (526, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:18', '2025-03-19 11:20:18');
INSERT INTO `visitors` VALUES (527, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:22', '2025-03-19 11:20:22');
INSERT INTO `visitors` VALUES (528, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:31', '2025-03-19 11:20:31');
INSERT INTO `visitors` VALUES (529, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:32', '2025-03-19 11:20:32');
INSERT INTO `visitors` VALUES (530, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:37', '2025-03-19 11:20:37');
INSERT INTO `visitors` VALUES (531, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:43', '2025-03-19 11:20:43');
INSERT INTO `visitors` VALUES (532, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:44', '2025-03-19 11:20:44');
INSERT INTO `visitors` VALUES (533, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:52', '2025-03-19 11:20:52');
INSERT INTO `visitors` VALUES (534, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:52', '2025-03-19 11:20:52');
INSERT INTO `visitors` VALUES (535, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:20:58', '2025-03-19 11:20:58');
INSERT INTO `visitors` VALUES (536, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:21:07', '2025-03-19 11:21:07');
INSERT INTO `visitors` VALUES (537, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:21:26', '2025-03-19 11:21:26');
INSERT INTO `visitors` VALUES (538, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:21:31', '2025-03-19 11:21:31');
INSERT INTO `visitors` VALUES (539, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:21:50', '2025-03-19 11:21:50');
INSERT INTO `visitors` VALUES (540, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:21:56', '2025-03-19 11:21:56');
INSERT INTO `visitors` VALUES (541, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:22:06', '2025-03-19 11:22:06');
INSERT INTO `visitors` VALUES (542, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:22:07', '2025-03-19 11:22:07');
INSERT INTO `visitors` VALUES (543, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:22:18', '2025-03-19 11:22:18');
INSERT INTO `visitors` VALUES (544, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:37:13', '2025-03-19 11:37:13');
INSERT INTO `visitors` VALUES (545, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:44:10', '2025-03-19 11:44:10');
INSERT INTO `visitors` VALUES (546, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:44:14', '2025-03-19 11:44:14');
INSERT INTO `visitors` VALUES (547, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:44:15', '2025-03-19 11:44:15');
INSERT INTO `visitors` VALUES (548, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:44:21', '2025-03-19 11:44:21');
INSERT INTO `visitors` VALUES (549, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:44:56', '2025-03-19 11:44:56');
INSERT INTO `visitors` VALUES (550, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:45:39', '2025-03-19 11:45:39');
INSERT INTO `visitors` VALUES (551, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:46:31', '2025-03-19 11:46:31');
INSERT INTO `visitors` VALUES (552, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:46:42', '2025-03-19 11:46:42');
INSERT INTO `visitors` VALUES (553, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:46:47', '2025-03-19 11:46:47');
INSERT INTO `visitors` VALUES (554, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:46:54', '2025-03-19 11:46:54');
INSERT INTO `visitors` VALUES (555, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:11', '2025-03-19 11:47:11');
INSERT INTO `visitors` VALUES (556, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:22', '2025-03-19 11:47:22');
INSERT INTO `visitors` VALUES (557, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:26', '2025-03-19 11:47:26');
INSERT INTO `visitors` VALUES (558, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:31', '2025-03-19 11:47:31');
INSERT INTO `visitors` VALUES (559, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:33', '2025-03-19 11:47:33');
INSERT INTO `visitors` VALUES (560, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:49', '2025-03-19 11:47:49');
INSERT INTO `visitors` VALUES (561, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:47:56', '2025-03-19 11:47:56');
INSERT INTO `visitors` VALUES (562, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:03', '2025-03-19 11:48:03');
INSERT INTO `visitors` VALUES (563, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:09', '2025-03-19 11:48:09');
INSERT INTO `visitors` VALUES (564, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:13', '2025-03-19 11:48:13');
INSERT INTO `visitors` VALUES (565, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:17', '2025-03-19 11:48:17');
INSERT INTO `visitors` VALUES (566, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:20', '2025-03-19 11:48:20');
INSERT INTO `visitors` VALUES (567, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:25', '2025-03-19 11:48:25');
INSERT INTO `visitors` VALUES (568, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:30', '2025-03-19 11:48:30');
INSERT INTO `visitors` VALUES (569, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:34', '2025-03-19 11:48:34');
INSERT INTO `visitors` VALUES (570, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:48:47', '2025-03-19 11:48:47');
INSERT INTO `visitors` VALUES (571, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:49:32', '2025-03-19 11:49:32');
INSERT INTO `visitors` VALUES (572, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:49:47', '2025-03-19 11:49:47');
INSERT INTO `visitors` VALUES (573, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:17', '2025-03-19 11:53:17');
INSERT INTO `visitors` VALUES (574, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:19', '2025-03-19 11:53:19');
INSERT INTO `visitors` VALUES (575, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:22', '2025-03-19 11:53:22');
INSERT INTO `visitors` VALUES (576, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:26', '2025-03-19 11:53:26');
INSERT INTO `visitors` VALUES (577, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:27', '2025-03-19 11:53:27');
INSERT INTO `visitors` VALUES (578, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:29', '2025-03-19 11:53:29');
INSERT INTO `visitors` VALUES (579, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:31', '2025-03-19 11:53:31');
INSERT INTO `visitors` VALUES (580, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:33', '2025-03-19 11:53:33');
INSERT INTO `visitors` VALUES (581, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:41', '2025-03-19 11:53:41');
INSERT INTO `visitors` VALUES (582, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:42', '2025-03-19 11:53:42');
INSERT INTO `visitors` VALUES (583, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:51', '2025-03-19 11:53:51');
INSERT INTO `visitors` VALUES (584, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:56', '2025-03-19 11:53:56');
INSERT INTO `visitors` VALUES (585, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:53:58', '2025-03-19 11:53:58');
INSERT INTO `visitors` VALUES (586, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:00', '2025-03-19 11:54:00');
INSERT INTO `visitors` VALUES (587, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:07', '2025-03-19 11:54:07');
INSERT INTO `visitors` VALUES (588, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:16', '2025-03-19 11:54:16');
INSERT INTO `visitors` VALUES (589, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:17', '2025-03-19 11:54:17');
INSERT INTO `visitors` VALUES (590, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:35', '2025-03-19 11:54:35');
INSERT INTO `visitors` VALUES (591, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:38', '2025-03-19 11:54:38');
INSERT INTO `visitors` VALUES (592, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:41', '2025-03-19 11:54:41');
INSERT INTO `visitors` VALUES (593, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:43', '2025-03-19 11:54:43');
INSERT INTO `visitors` VALUES (594, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:47', '2025-03-19 11:54:47');
INSERT INTO `visitors` VALUES (595, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:49', '2025-03-19 11:54:49');
INSERT INTO `visitors` VALUES (596, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:53', '2025-03-19 11:54:53');
INSERT INTO `visitors` VALUES (597, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:54:57', '2025-03-19 11:54:57');
INSERT INTO `visitors` VALUES (598, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:00', '2025-03-19 11:55:00');
INSERT INTO `visitors` VALUES (599, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:08', '2025-03-19 11:55:08');
INSERT INTO `visitors` VALUES (600, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:10', '2025-03-19 11:55:10');
INSERT INTO `visitors` VALUES (601, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:35', '2025-03-19 11:55:35');
INSERT INTO `visitors` VALUES (602, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:40', '2025-03-19 11:55:40');
INSERT INTO `visitors` VALUES (603, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:40', '2025-03-19 11:55:40');
INSERT INTO `visitors` VALUES (604, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:47', '2025-03-19 11:55:47');
INSERT INTO `visitors` VALUES (605, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:55:56', '2025-03-19 11:55:56');
INSERT INTO `visitors` VALUES (606, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:00', '2025-03-19 11:56:00');
INSERT INTO `visitors` VALUES (607, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:10', '2025-03-19 11:56:10');
INSERT INTO `visitors` VALUES (608, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:16', '2025-03-19 11:56:16');
INSERT INTO `visitors` VALUES (609, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:18', '2025-03-19 11:56:18');
INSERT INTO `visitors` VALUES (610, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:41', '2025-03-19 11:56:41');
INSERT INTO `visitors` VALUES (611, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:46', '2025-03-19 11:56:46');
INSERT INTO `visitors` VALUES (612, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:48', '2025-03-19 11:56:48');
INSERT INTO `visitors` VALUES (613, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:53', '2025-03-19 11:56:53');
INSERT INTO `visitors` VALUES (614, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:56:59', '2025-03-19 11:56:59');
INSERT INTO `visitors` VALUES (615, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:38', '2025-03-19 11:57:38');
INSERT INTO `visitors` VALUES (616, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:40', '2025-03-19 11:57:40');
INSERT INTO `visitors` VALUES (617, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:45', '2025-03-19 11:57:45');
INSERT INTO `visitors` VALUES (618, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:48', '2025-03-19 11:57:48');
INSERT INTO `visitors` VALUES (619, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:50', '2025-03-19 11:57:50');
INSERT INTO `visitors` VALUES (620, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:53', '2025-03-19 11:57:53');
INSERT INTO `visitors` VALUES (621, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:57', '2025-03-19 11:57:57');
INSERT INTO `visitors` VALUES (622, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:57:59', '2025-03-19 11:57:59');
INSERT INTO `visitors` VALUES (623, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:03', '2025-03-19 11:58:03');
INSERT INTO `visitors` VALUES (624, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:07', '2025-03-19 11:58:07');
INSERT INTO `visitors` VALUES (625, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:13', '2025-03-19 11:58:13');
INSERT INTO `visitors` VALUES (626, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:17', '2025-03-19 11:58:17');
INSERT INTO `visitors` VALUES (627, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:34', '2025-03-19 11:58:34');
INSERT INTO `visitors` VALUES (628, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:43', '2025-03-19 11:58:43');
INSERT INTO `visitors` VALUES (629, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:46', '2025-03-19 11:58:46');
INSERT INTO `visitors` VALUES (630, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:58:49', '2025-03-19 11:58:49');
INSERT INTO `visitors` VALUES (631, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:59:12', '2025-03-19 11:59:12');
INSERT INTO `visitors` VALUES (632, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:59:17', '2025-03-19 11:59:17');
INSERT INTO `visitors` VALUES (633, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:59:23', '2025-03-19 11:59:23');
INSERT INTO `visitors` VALUES (634, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 11:59:27', '2025-03-19 11:59:27');
INSERT INTO `visitors` VALUES (635, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:16', '2025-03-19 12:01:16');
INSERT INTO `visitors` VALUES (636, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:20', '2025-03-19 12:01:20');
INSERT INTO `visitors` VALUES (637, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:23', '2025-03-19 12:01:23');
INSERT INTO `visitors` VALUES (638, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:26', '2025-03-19 12:01:26');
INSERT INTO `visitors` VALUES (639, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:28', '2025-03-19 12:01:28');
INSERT INTO `visitors` VALUES (640, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:29', '2025-03-19 12:01:29');
INSERT INTO `visitors` VALUES (641, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:31', '2025-03-19 12:01:31');
INSERT INTO `visitors` VALUES (642, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:41', '2025-03-19 12:01:41');
INSERT INTO `visitors` VALUES (643, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:41', '2025-03-19 12:01:41');
INSERT INTO `visitors` VALUES (644, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:47', '2025-03-19 12:01:47');
INSERT INTO `visitors` VALUES (645, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:49', '2025-03-19 12:01:49');
INSERT INTO `visitors` VALUES (646, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:55', '2025-03-19 12:01:55');
INSERT INTO `visitors` VALUES (647, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:01:57', '2025-03-19 12:01:57');
INSERT INTO `visitors` VALUES (648, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:01', '2025-03-19 12:02:01');
INSERT INTO `visitors` VALUES (649, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:09', '2025-03-19 12:02:09');
INSERT INTO `visitors` VALUES (650, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:12', '2025-03-19 12:02:12');
INSERT INTO `visitors` VALUES (651, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:16', '2025-03-19 12:02:16');
INSERT INTO `visitors` VALUES (652, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:17', '2025-03-19 12:02:17');
INSERT INTO `visitors` VALUES (653, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:20', '2025-03-19 12:02:20');
INSERT INTO `visitors` VALUES (654, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:27', '2025-03-19 12:02:27');
INSERT INTO `visitors` VALUES (655, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:28', '2025-03-19 12:02:28');
INSERT INTO `visitors` VALUES (656, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:33', '2025-03-19 12:02:33');
INSERT INTO `visitors` VALUES (657, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:37', '2025-03-19 12:02:37');
INSERT INTO `visitors` VALUES (658, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:43', '2025-03-19 12:02:43');
INSERT INTO `visitors` VALUES (659, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:02:58', '2025-03-19 12:02:58');
INSERT INTO `visitors` VALUES (660, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:02', '2025-03-19 12:03:02');
INSERT INTO `visitors` VALUES (661, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:11', '2025-03-19 12:03:11');
INSERT INTO `visitors` VALUES (662, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:11', '2025-03-19 12:03:11');
INSERT INTO `visitors` VALUES (663, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:21', '2025-03-19 12:03:21');
INSERT INTO `visitors` VALUES (664, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:25', '2025-03-19 12:03:25');
INSERT INTO `visitors` VALUES (665, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:32', '2025-03-19 12:03:32');
INSERT INTO `visitors` VALUES (666, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:33', '2025-03-19 12:03:33');
INSERT INTO `visitors` VALUES (667, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:41', '2025-03-19 12:03:41');
INSERT INTO `visitors` VALUES (668, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:43', '2025-03-19 12:03:43');
INSERT INTO `visitors` VALUES (669, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:47', '2025-03-19 12:03:47');
INSERT INTO `visitors` VALUES (670, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:03:48', '2025-03-19 12:03:48');
INSERT INTO `visitors` VALUES (671, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:04:05', '2025-03-19 12:04:05');
INSERT INTO `visitors` VALUES (672, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:04:07', '2025-03-19 12:04:07');
INSERT INTO `visitors` VALUES (673, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:04:12', '2025-03-19 12:04:12');
INSERT INTO `visitors` VALUES (674, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:04:20', '2025-03-19 12:04:20');
INSERT INTO `visitors` VALUES (675, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:04:31', '2025-03-19 12:04:31');
INSERT INTO `visitors` VALUES (676, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:04:48', '2025-03-19 12:04:48');
INSERT INTO `visitors` VALUES (677, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:01', '2025-03-19 12:05:01');
INSERT INTO `visitors` VALUES (678, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:04', '2025-03-19 12:05:04');
INSERT INTO `visitors` VALUES (679, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:09', '2025-03-19 12:05:09');
INSERT INTO `visitors` VALUES (680, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:16', '2025-03-19 12:05:16');
INSERT INTO `visitors` VALUES (681, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:20', '2025-03-19 12:05:20');
INSERT INTO `visitors` VALUES (682, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:26', '2025-03-19 12:05:26');
INSERT INTO `visitors` VALUES (683, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:32', '2025-03-19 12:05:32');
INSERT INTO `visitors` VALUES (684, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:37', '2025-03-19 12:05:37');
INSERT INTO `visitors` VALUES (685, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:41', '2025-03-19 12:05:41');
INSERT INTO `visitors` VALUES (686, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:44', '2025-03-19 12:05:44');
INSERT INTO `visitors` VALUES (687, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:46', '2025-03-19 12:05:46');
INSERT INTO `visitors` VALUES (688, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:47', '2025-03-19 12:05:47');
INSERT INTO `visitors` VALUES (689, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:53', '2025-03-19 12:05:53');
INSERT INTO `visitors` VALUES (690, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:54', '2025-03-19 12:05:54');
INSERT INTO `visitors` VALUES (691, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:05:57', '2025-03-19 12:05:57');
INSERT INTO `visitors` VALUES (692, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:05', '2025-03-19 12:06:05');
INSERT INTO `visitors` VALUES (693, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:09', '2025-03-19 12:06:09');
INSERT INTO `visitors` VALUES (694, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:14', '2025-03-19 12:06:14');
INSERT INTO `visitors` VALUES (695, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:20', '2025-03-19 12:06:20');
INSERT INTO `visitors` VALUES (696, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:24', '2025-03-19 12:06:24');
INSERT INTO `visitors` VALUES (697, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:33', '2025-03-19 12:06:33');
INSERT INTO `visitors` VALUES (698, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:34', '2025-03-19 12:06:34');
INSERT INTO `visitors` VALUES (699, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:36', '2025-03-19 12:06:36');
INSERT INTO `visitors` VALUES (700, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:06:57', '2025-03-19 12:06:57');
INSERT INTO `visitors` VALUES (701, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:07:01', '2025-03-19 12:07:01');
INSERT INTO `visitors` VALUES (702, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:07:12', '2025-03-19 12:07:12');
INSERT INTO `visitors` VALUES (703, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:07:27', '2025-03-19 12:07:27');
INSERT INTO `visitors` VALUES (704, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:07:43', '2025-03-19 12:07:43');
INSERT INTO `visitors` VALUES (705, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:07:47', '2025-03-19 12:07:47');
INSERT INTO `visitors` VALUES (706, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:07:58', '2025-03-19 12:07:58');
INSERT INTO `visitors` VALUES (707, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:00', '2025-03-19 12:08:00');
INSERT INTO `visitors` VALUES (708, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:01', '2025-03-19 12:08:01');
INSERT INTO `visitors` VALUES (709, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:09', '2025-03-19 12:08:09');
INSERT INTO `visitors` VALUES (710, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:12', '2025-03-19 12:08:12');
INSERT INTO `visitors` VALUES (711, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:29', '2025-03-19 12:08:29');
INSERT INTO `visitors` VALUES (712, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:32', '2025-03-19 12:08:32');
INSERT INTO `visitors` VALUES (713, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:33', '2025-03-19 12:08:33');
INSERT INTO `visitors` VALUES (714, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:37', '2025-03-19 12:08:37');
INSERT INTO `visitors` VALUES (715, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:40', '2025-03-19 12:08:40');
INSERT INTO `visitors` VALUES (716, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:48', '2025-03-19 12:08:48');
INSERT INTO `visitors` VALUES (717, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:52', '2025-03-19 12:08:52');
INSERT INTO `visitors` VALUES (718, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:57', '2025-03-19 12:08:57');
INSERT INTO `visitors` VALUES (719, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:08:57', '2025-03-19 12:08:57');
INSERT INTO `visitors` VALUES (720, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:11', '2025-03-19 12:09:11');
INSERT INTO `visitors` VALUES (721, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:18', '2025-03-19 12:09:18');
INSERT INTO `visitors` VALUES (722, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:26', '2025-03-19 12:09:26');
INSERT INTO `visitors` VALUES (723, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:32', '2025-03-19 12:09:32');
INSERT INTO `visitors` VALUES (724, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:36', '2025-03-19 12:09:36');
INSERT INTO `visitors` VALUES (725, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:38', '2025-03-19 12:09:38');
INSERT INTO `visitors` VALUES (726, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:41', '2025-03-19 12:09:41');
INSERT INTO `visitors` VALUES (727, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:52', '2025-03-19 12:09:52');
INSERT INTO `visitors` VALUES (728, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:55', '2025-03-19 12:09:55');
INSERT INTO `visitors` VALUES (729, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:09:56', '2025-03-19 12:09:56');
INSERT INTO `visitors` VALUES (730, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:01', '2025-03-19 12:10:01');
INSERT INTO `visitors` VALUES (731, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:04', '2025-03-19 12:10:04');
INSERT INTO `visitors` VALUES (732, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:10', '2025-03-19 12:10:10');
INSERT INTO `visitors` VALUES (733, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:20', '2025-03-19 12:10:20');
INSERT INTO `visitors` VALUES (734, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:21', '2025-03-19 12:10:21');
INSERT INTO `visitors` VALUES (735, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:25', '2025-03-19 12:10:25');
INSERT INTO `visitors` VALUES (736, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:32', '2025-03-19 12:10:32');
INSERT INTO `visitors` VALUES (737, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:39', '2025-03-19 12:10:39');
INSERT INTO `visitors` VALUES (738, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:43', '2025-03-19 12:10:43');
INSERT INTO `visitors` VALUES (739, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:44', '2025-03-19 12:10:44');
INSERT INTO `visitors` VALUES (740, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:10:58', '2025-03-19 12:10:58');
INSERT INTO `visitors` VALUES (741, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:06', '2025-03-19 12:11:06');
INSERT INTO `visitors` VALUES (742, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:17', '2025-03-19 12:11:17');
INSERT INTO `visitors` VALUES (743, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:19', '2025-03-19 12:11:19');
INSERT INTO `visitors` VALUES (744, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:20', '2025-03-19 12:11:20');
INSERT INTO `visitors` VALUES (745, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:22', '2025-03-19 12:11:22');
INSERT INTO `visitors` VALUES (746, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:27', '2025-03-19 12:11:27');
INSERT INTO `visitors` VALUES (747, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:30', '2025-03-19 12:11:30');
INSERT INTO `visitors` VALUES (748, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:33', '2025-03-19 12:11:33');
INSERT INTO `visitors` VALUES (749, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:36', '2025-03-19 12:11:36');
INSERT INTO `visitors` VALUES (750, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:37', '2025-03-19 12:11:37');
INSERT INTO `visitors` VALUES (751, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:38', '2025-03-19 12:11:38');
INSERT INTO `visitors` VALUES (752, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:11:41', '2025-03-19 12:11:41');
INSERT INTO `visitors` VALUES (753, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:07', '2025-03-19 12:12:07');
INSERT INTO `visitors` VALUES (754, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:10', '2025-03-19 12:12:10');
INSERT INTO `visitors` VALUES (755, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:13', '2025-03-19 12:12:13');
INSERT INTO `visitors` VALUES (756, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:17', '2025-03-19 12:12:17');
INSERT INTO `visitors` VALUES (757, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:18', '2025-03-19 12:12:18');
INSERT INTO `visitors` VALUES (758, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:26', '2025-03-19 12:12:26');
INSERT INTO `visitors` VALUES (759, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:29', '2025-03-19 12:12:29');
INSERT INTO `visitors` VALUES (760, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:32', '2025-03-19 12:12:32');
INSERT INTO `visitors` VALUES (761, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:37', '2025-03-19 12:12:37');
INSERT INTO `visitors` VALUES (762, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:44', '2025-03-19 12:12:44');
INSERT INTO `visitors` VALUES (763, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:51', '2025-03-19 12:12:51');
INSERT INTO `visitors` VALUES (764, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:56', '2025-03-19 12:12:56');
INSERT INTO `visitors` VALUES (765, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:58', '2025-03-19 12:12:58');
INSERT INTO `visitors` VALUES (766, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:12:59', '2025-03-19 12:12:59');
INSERT INTO `visitors` VALUES (767, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:02', '2025-03-19 12:13:02');
INSERT INTO `visitors` VALUES (768, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:07', '2025-03-19 12:13:07');
INSERT INTO `visitors` VALUES (769, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:11', '2025-03-19 12:13:11');
INSERT INTO `visitors` VALUES (770, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:17', '2025-03-19 12:13:17');
INSERT INTO `visitors` VALUES (771, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:19', '2025-03-19 12:13:19');
INSERT INTO `visitors` VALUES (772, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:21', '2025-03-19 12:13:21');
INSERT INTO `visitors` VALUES (773, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:29', '2025-03-19 12:13:29');
INSERT INTO `visitors` VALUES (774, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:31', '2025-03-19 12:13:31');
INSERT INTO `visitors` VALUES (775, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:40', '2025-03-19 12:13:40');
INSERT INTO `visitors` VALUES (776, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:42', '2025-03-19 12:13:42');
INSERT INTO `visitors` VALUES (777, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:45', '2025-03-19 12:13:45');
INSERT INTO `visitors` VALUES (778, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:47', '2025-03-19 12:13:47');
INSERT INTO `visitors` VALUES (779, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:54', '2025-03-19 12:13:54');
INSERT INTO `visitors` VALUES (780, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:56', '2025-03-19 12:13:56');
INSERT INTO `visitors` VALUES (781, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:13:58', '2025-03-19 12:13:58');
INSERT INTO `visitors` VALUES (782, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:03', '2025-03-19 12:14:03');
INSERT INTO `visitors` VALUES (783, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:17', '2025-03-19 12:14:17');
INSERT INTO `visitors` VALUES (784, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:18', '2025-03-19 12:14:18');
INSERT INTO `visitors` VALUES (785, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:24', '2025-03-19 12:14:24');
INSERT INTO `visitors` VALUES (786, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:25', '2025-03-19 12:14:25');
INSERT INTO `visitors` VALUES (787, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:29', '2025-03-19 12:14:29');
INSERT INTO `visitors` VALUES (788, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:46', '2025-03-19 12:14:46');
INSERT INTO `visitors` VALUES (789, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:48', '2025-03-19 12:14:48');
INSERT INTO `visitors` VALUES (790, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:49', '2025-03-19 12:14:49');
INSERT INTO `visitors` VALUES (791, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:53', '2025-03-19 12:14:53');
INSERT INTO `visitors` VALUES (792, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:14:57', '2025-03-19 12:14:57');
INSERT INTO `visitors` VALUES (793, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:01', '2025-03-19 12:15:01');
INSERT INTO `visitors` VALUES (794, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:04', '2025-03-19 12:15:04');
INSERT INTO `visitors` VALUES (795, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:08', '2025-03-19 12:15:08');
INSERT INTO `visitors` VALUES (796, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:09', '2025-03-19 12:15:09');
INSERT INTO `visitors` VALUES (797, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:47', '2025-03-19 12:15:47');
INSERT INTO `visitors` VALUES (798, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:51', '2025-03-19 12:15:51');
INSERT INTO `visitors` VALUES (799, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:54', '2025-03-19 12:15:54');
INSERT INTO `visitors` VALUES (800, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:15:58', '2025-03-19 12:15:58');
INSERT INTO `visitors` VALUES (801, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:00', '2025-03-19 12:16:00');
INSERT INTO `visitors` VALUES (802, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:02', '2025-03-19 12:16:02');
INSERT INTO `visitors` VALUES (803, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:05', '2025-03-19 12:16:05');
INSERT INTO `visitors` VALUES (804, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:07', '2025-03-19 12:16:07');
INSERT INTO `visitors` VALUES (805, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:09', '2025-03-19 12:16:09');
INSERT INTO `visitors` VALUES (806, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:16', '2025-03-19 12:16:16');
INSERT INTO `visitors` VALUES (807, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:17', '2025-03-19 12:16:17');
INSERT INTO `visitors` VALUES (808, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:24', '2025-03-19 12:16:24');
INSERT INTO `visitors` VALUES (809, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:33', '2025-03-19 12:16:33');
INSERT INTO `visitors` VALUES (810, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:36', '2025-03-19 12:16:36');
INSERT INTO `visitors` VALUES (811, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:38', '2025-03-19 12:16:38');
INSERT INTO `visitors` VALUES (812, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:16:52', '2025-03-19 12:16:52');
INSERT INTO `visitors` VALUES (813, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:17:03', '2025-03-19 12:17:03');
INSERT INTO `visitors` VALUES (814, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:17:17', '2025-03-19 12:17:17');
INSERT INTO `visitors` VALUES (815, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:17:54', '2025-03-19 12:17:54');
INSERT INTO `visitors` VALUES (816, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:17:54', '2025-03-19 12:17:54');
INSERT INTO `visitors` VALUES (817, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:19:51', '2025-03-19 12:19:51');
INSERT INTO `visitors` VALUES (818, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:19:52', '2025-03-19 12:19:52');
INSERT INTO `visitors` VALUES (819, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:20:02', '2025-03-19 12:20:02');
INSERT INTO `visitors` VALUES (820, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:20:04', '2025-03-19 12:20:04');
INSERT INTO `visitors` VALUES (821, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:20:04', '2025-03-19 12:20:04');
INSERT INTO `visitors` VALUES (822, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:20:26', '2025-03-19 12:20:26');
INSERT INTO `visitors` VALUES (823, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:22:29', '2025-03-19 12:22:29');
INSERT INTO `visitors` VALUES (824, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:22:33', '2025-03-19 12:22:33');
INSERT INTO `visitors` VALUES (825, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:22:47', '2025-03-19 12:22:47');
INSERT INTO `visitors` VALUES (826, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:22:53', '2025-03-19 12:22:53');
INSERT INTO `visitors` VALUES (827, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:22:59', '2025-03-19 12:22:59');
INSERT INTO `visitors` VALUES (828, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:23:02', '2025-03-19 12:23:02');
INSERT INTO `visitors` VALUES (829, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:01', '2025-03-19 12:24:01');
INSERT INTO `visitors` VALUES (830, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:03', '2025-03-19 12:24:03');
INSERT INTO `visitors` VALUES (831, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:14', '2025-03-19 12:24:14');
INSERT INTO `visitors` VALUES (832, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:19', '2025-03-19 12:24:19');
INSERT INTO `visitors` VALUES (833, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:22', '2025-03-19 12:24:22');
INSERT INTO `visitors` VALUES (834, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:24', '2025-03-19 12:24:24');
INSERT INTO `visitors` VALUES (835, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:24:27', '2025-03-19 12:24:27');
INSERT INTO `visitors` VALUES (836, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:27:37', '2025-03-19 12:27:37');
INSERT INTO `visitors` VALUES (837, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:27:41', '2025-03-19 12:27:41');
INSERT INTO `visitors` VALUES (838, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:28:07', '2025-03-19 12:28:07');
INSERT INTO `visitors` VALUES (839, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:32:45', '2025-03-19 12:32:45');
INSERT INTO `visitors` VALUES (840, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:32:46', '2025-03-19 12:32:46');
INSERT INTO `visitors` VALUES (841, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:35:20', '2025-03-19 12:35:20');
INSERT INTO `visitors` VALUES (842, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:36:05', '2025-03-19 12:36:05');
INSERT INTO `visitors` VALUES (843, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:36:08', '2025-03-19 12:36:08');
INSERT INTO `visitors` VALUES (844, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:36:36', '2025-03-19 12:36:36');
INSERT INTO `visitors` VALUES (845, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:36:59', '2025-03-19 12:36:59');
INSERT INTO `visitors` VALUES (846, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:04', '2025-03-19 12:37:04');
INSERT INTO `visitors` VALUES (847, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:09', '2025-03-19 12:37:09');
INSERT INTO `visitors` VALUES (848, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:12', '2025-03-19 12:37:12');
INSERT INTO `visitors` VALUES (849, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:14', '2025-03-19 12:37:14');
INSERT INTO `visitors` VALUES (850, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:15', '2025-03-19 12:37:15');
INSERT INTO `visitors` VALUES (851, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:27', '2025-03-19 12:37:27');
INSERT INTO `visitors` VALUES (852, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:28', '2025-03-19 12:37:28');
INSERT INTO `visitors` VALUES (853, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:28', '2025-03-19 12:37:28');
INSERT INTO `visitors` VALUES (854, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:41', '2025-03-19 12:37:41');
INSERT INTO `visitors` VALUES (855, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:37:41', '2025-03-19 12:37:41');
INSERT INTO `visitors` VALUES (856, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:12', '2025-03-19 12:38:12');
INSERT INTO `visitors` VALUES (857, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:13', '2025-03-19 12:38:13');
INSERT INTO `visitors` VALUES (858, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:15', '2025-03-19 12:38:15');
INSERT INTO `visitors` VALUES (859, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:15', '2025-03-19 12:38:15');
INSERT INTO `visitors` VALUES (860, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:40', '2025-03-19 12:38:40');
INSERT INTO `visitors` VALUES (861, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:45', '2025-03-19 12:38:45');
INSERT INTO `visitors` VALUES (862, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:46', '2025-03-19 12:38:46');
INSERT INTO `visitors` VALUES (863, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:38:46', '2025-03-19 12:38:46');
INSERT INTO `visitors` VALUES (864, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:39:00', '2025-03-19 12:39:00');
INSERT INTO `visitors` VALUES (865, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:39:00', '2025-03-19 12:39:00');
INSERT INTO `visitors` VALUES (866, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:42:29', '2025-03-19 12:42:29');
INSERT INTO `visitors` VALUES (867, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:42:33', '2025-03-19 12:42:33');
INSERT INTO `visitors` VALUES (868, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-19 12:42:47', '2025-03-19 12:42:47');
INSERT INTO `visitors` VALUES (869, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:43:04', '2025-03-19 12:43:04');
INSERT INTO `visitors` VALUES (870, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-19 12:43:09', '2025-03-19 12:43:09');
INSERT INTO `visitors` VALUES (871, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:41:09', '2025-03-20 07:41:09');
INSERT INTO `visitors` VALUES (872, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:43:28', '2025-03-20 07:43:28');
INSERT INTO `visitors` VALUES (873, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:43:39', '2025-03-20 07:43:39');
INSERT INTO `visitors` VALUES (874, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:43:47', '2025-03-20 07:43:47');
INSERT INTO `visitors` VALUES (875, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:43:55', '2025-03-20 07:43:55');
INSERT INTO `visitors` VALUES (876, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:43:59', '2025-03-20 07:43:59');
INSERT INTO `visitors` VALUES (877, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:44:05', '2025-03-20 07:44:05');
INSERT INTO `visitors` VALUES (878, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:44:08', '2025-03-20 07:44:08');
INSERT INTO `visitors` VALUES (879, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:44:14', '2025-03-20 07:44:14');
INSERT INTO `visitors` VALUES (880, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:44:17', '2025-03-20 07:44:17');
INSERT INTO `visitors` VALUES (881, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:45:21', '2025-03-20 07:45:21');
INSERT INTO `visitors` VALUES (882, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:09', '2025-03-20 07:46:09');
INSERT INTO `visitors` VALUES (883, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:20', '2025-03-20 07:46:20');
INSERT INTO `visitors` VALUES (884, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:24', '2025-03-20 07:46:24');
INSERT INTO `visitors` VALUES (885, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:26', '2025-03-20 07:46:26');
INSERT INTO `visitors` VALUES (886, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:28', '2025-03-20 07:46:28');
INSERT INTO `visitors` VALUES (887, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:36', '2025-03-20 07:46:36');
INSERT INTO `visitors` VALUES (888, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:38', '2025-03-20 07:46:38');
INSERT INTO `visitors` VALUES (889, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:40', '2025-03-20 07:46:40');
INSERT INTO `visitors` VALUES (890, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:47', '2025-03-20 07:46:47');
INSERT INTO `visitors` VALUES (891, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:51', '2025-03-20 07:46:51');
INSERT INTO `visitors` VALUES (892, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:53', '2025-03-20 07:46:53');
INSERT INTO `visitors` VALUES (893, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:55', '2025-03-20 07:46:55');
INSERT INTO `visitors` VALUES (894, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:57', '2025-03-20 07:46:57');
INSERT INTO `visitors` VALUES (895, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:46:59', '2025-03-20 07:46:59');
INSERT INTO `visitors` VALUES (896, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:02', '2025-03-20 07:47:02');
INSERT INTO `visitors` VALUES (897, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:04', '2025-03-20 07:47:04');
INSERT INTO `visitors` VALUES (898, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:10', '2025-03-20 07:47:10');
INSERT INTO `visitors` VALUES (899, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:13', '2025-03-20 07:47:13');
INSERT INTO `visitors` VALUES (900, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:17', '2025-03-20 07:47:17');
INSERT INTO `visitors` VALUES (901, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:22', '2025-03-20 07:47:22');
INSERT INTO `visitors` VALUES (902, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:23', '2025-03-20 07:47:23');
INSERT INTO `visitors` VALUES (903, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:48', '2025-03-20 07:47:48');
INSERT INTO `visitors` VALUES (904, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:51', '2025-03-20 07:47:51');
INSERT INTO `visitors` VALUES (905, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:54', '2025-03-20 07:47:54');
INSERT INTO `visitors` VALUES (906, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:56', '2025-03-20 07:47:56');
INSERT INTO `visitors` VALUES (907, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:47:56', '2025-03-20 07:47:56');
INSERT INTO `visitors` VALUES (908, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:08', '2025-03-20 07:48:08');
INSERT INTO `visitors` VALUES (909, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:09', '2025-03-20 07:48:09');
INSERT INTO `visitors` VALUES (910, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:14', '2025-03-20 07:48:14');
INSERT INTO `visitors` VALUES (911, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:24', '2025-03-20 07:48:24');
INSERT INTO `visitors` VALUES (912, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:25', '2025-03-20 07:48:25');
INSERT INTO `visitors` VALUES (913, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:28', '2025-03-20 07:48:28');
INSERT INTO `visitors` VALUES (914, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:30', '2025-03-20 07:48:30');
INSERT INTO `visitors` VALUES (915, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:37', '2025-03-20 07:48:37');
INSERT INTO `visitors` VALUES (916, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:44', '2025-03-20 07:48:44');
INSERT INTO `visitors` VALUES (917, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:45', '2025-03-20 07:48:45');
INSERT INTO `visitors` VALUES (918, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:48:54', '2025-03-20 07:48:54');
INSERT INTO `visitors` VALUES (919, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:04', '2025-03-20 07:49:04');
INSERT INTO `visitors` VALUES (920, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:05', '2025-03-20 07:49:05');
INSERT INTO `visitors` VALUES (921, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:10', '2025-03-20 07:49:10');
INSERT INTO `visitors` VALUES (922, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:17', '2025-03-20 07:49:17');
INSERT INTO `visitors` VALUES (923, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:19', '2025-03-20 07:49:19');
INSERT INTO `visitors` VALUES (924, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:27', '2025-03-20 07:49:27');
INSERT INTO `visitors` VALUES (925, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:29', '2025-03-20 07:49:29');
INSERT INTO `visitors` VALUES (926, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:49:35', '2025-03-20 07:49:35');
INSERT INTO `visitors` VALUES (927, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:22', '2025-03-20 07:50:22');
INSERT INTO `visitors` VALUES (928, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:24', '2025-03-20 07:50:24');
INSERT INTO `visitors` VALUES (929, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:28', '2025-03-20 07:50:28');
INSERT INTO `visitors` VALUES (930, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:33', '2025-03-20 07:50:33');
INSERT INTO `visitors` VALUES (931, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:40', '2025-03-20 07:50:40');
INSERT INTO `visitors` VALUES (932, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:46', '2025-03-20 07:50:46');
INSERT INTO `visitors` VALUES (933, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:52', '2025-03-20 07:50:52');
INSERT INTO `visitors` VALUES (934, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:50:57', '2025-03-20 07:50:57');
INSERT INTO `visitors` VALUES (935, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:04', '2025-03-20 07:51:04');
INSERT INTO `visitors` VALUES (936, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:09', '2025-03-20 07:51:09');
INSERT INTO `visitors` VALUES (937, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:14', '2025-03-20 07:51:14');
INSERT INTO `visitors` VALUES (938, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:15', '2025-03-20 07:51:15');
INSERT INTO `visitors` VALUES (939, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:25', '2025-03-20 07:51:25');
INSERT INTO `visitors` VALUES (940, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:28', '2025-03-20 07:51:28');
INSERT INTO `visitors` VALUES (941, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:33', '2025-03-20 07:51:33');
INSERT INTO `visitors` VALUES (942, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:51:37', '2025-03-20 07:51:37');
INSERT INTO `visitors` VALUES (943, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:52:04', '2025-03-20 07:52:04');
INSERT INTO `visitors` VALUES (944, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:52:32', '2025-03-20 07:52:32');
INSERT INTO `visitors` VALUES (945, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:52:35', '2025-03-20 07:52:35');
INSERT INTO `visitors` VALUES (946, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:52:48', '2025-03-20 07:52:48');
INSERT INTO `visitors` VALUES (947, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:52:57', '2025-03-20 07:52:57');
INSERT INTO `visitors` VALUES (948, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:53:10', '2025-03-20 07:53:10');
INSERT INTO `visitors` VALUES (949, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:53:23', '2025-03-20 07:53:23');
INSERT INTO `visitors` VALUES (950, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:54:17', '2025-03-20 07:54:17');
INSERT INTO `visitors` VALUES (951, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:07', '2025-03-20 07:55:07');
INSERT INTO `visitors` VALUES (952, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:11', '2025-03-20 07:55:11');
INSERT INTO `visitors` VALUES (953, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:14', '2025-03-20 07:55:14');
INSERT INTO `visitors` VALUES (954, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:16', '2025-03-20 07:55:16');
INSERT INTO `visitors` VALUES (955, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:20', '2025-03-20 07:55:20');
INSERT INTO `visitors` VALUES (956, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:22', '2025-03-20 07:55:22');
INSERT INTO `visitors` VALUES (957, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:23', '2025-03-20 07:55:23');
INSERT INTO `visitors` VALUES (958, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:25', '2025-03-20 07:55:25');
INSERT INTO `visitors` VALUES (959, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:31', '2025-03-20 07:55:31');
INSERT INTO `visitors` VALUES (960, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:35', '2025-03-20 07:55:35');
INSERT INTO `visitors` VALUES (961, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:37', '2025-03-20 07:55:37');
INSERT INTO `visitors` VALUES (962, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:43', '2025-03-20 07:55:43');
INSERT INTO `visitors` VALUES (963, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:48', '2025-03-20 07:55:48');
INSERT INTO `visitors` VALUES (964, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:55:54', '2025-03-20 07:55:54');
INSERT INTO `visitors` VALUES (965, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 07:56:25', '2025-03-20 07:56:25');
INSERT INTO `visitors` VALUES (966, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:00:43', '2025-03-20 08:00:43');
INSERT INTO `visitors` VALUES (967, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:07', '2025-03-20 08:01:07');
INSERT INTO `visitors` VALUES (968, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:11', '2025-03-20 08:01:11');
INSERT INTO `visitors` VALUES (969, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:12', '2025-03-20 08:01:12');
INSERT INTO `visitors` VALUES (970, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:16', '2025-03-20 08:01:16');
INSERT INTO `visitors` VALUES (971, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:23', '2025-03-20 08:01:23');
INSERT INTO `visitors` VALUES (972, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:25', '2025-03-20 08:01:25');
INSERT INTO `visitors` VALUES (973, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:32', '2025-03-20 08:01:32');
INSERT INTO `visitors` VALUES (974, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:33', '2025-03-20 08:01:33');
INSERT INTO `visitors` VALUES (975, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:01:38', '2025-03-20 08:01:38');
INSERT INTO `visitors` VALUES (976, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:06:13', '2025-03-20 08:06:13');
INSERT INTO `visitors` VALUES (977, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:06:32', '2025-03-20 08:06:32');
INSERT INTO `visitors` VALUES (978, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:06:56', '2025-03-20 08:06:56');
INSERT INTO `visitors` VALUES (979, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:06:58', '2025-03-20 08:06:58');
INSERT INTO `visitors` VALUES (980, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:03', '2025-03-20 08:07:03');
INSERT INTO `visitors` VALUES (981, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:07', '2025-03-20 08:07:07');
INSERT INTO `visitors` VALUES (982, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:10', '2025-03-20 08:07:10');
INSERT INTO `visitors` VALUES (983, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:17', '2025-03-20 08:07:17');
INSERT INTO `visitors` VALUES (984, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:18', '2025-03-20 08:07:18');
INSERT INTO `visitors` VALUES (985, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:21', '2025-03-20 08:07:21');
INSERT INTO `visitors` VALUES (986, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:07:55', '2025-03-20 08:07:55');
INSERT INTO `visitors` VALUES (987, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:05', '2025-03-20 08:08:05');
INSERT INTO `visitors` VALUES (988, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:10', '2025-03-20 08:08:10');
INSERT INTO `visitors` VALUES (989, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:22', '2025-03-20 08:08:22');
INSERT INTO `visitors` VALUES (990, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:34', '2025-03-20 08:08:34');
INSERT INTO `visitors` VALUES (991, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:39', '2025-03-20 08:08:39');
INSERT INTO `visitors` VALUES (992, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:40', '2025-03-20 08:08:40');
INSERT INTO `visitors` VALUES (993, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:54', '2025-03-20 08:08:54');
INSERT INTO `visitors` VALUES (994, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:08:56', '2025-03-20 08:08:56');
INSERT INTO `visitors` VALUES (995, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:01', '2025-03-20 08:09:01');
INSERT INTO `visitors` VALUES (996, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:05', '2025-03-20 08:09:05');
INSERT INTO `visitors` VALUES (997, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:06', '2025-03-20 08:09:06');
INSERT INTO `visitors` VALUES (998, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:22', '2025-03-20 08:09:22');
INSERT INTO `visitors` VALUES (999, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:26', '2025-03-20 08:09:26');
INSERT INTO `visitors` VALUES (1000, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:28', '2025-03-20 08:09:28');
INSERT INTO `visitors` VALUES (1001, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:33', '2025-03-20 08:09:33');
INSERT INTO `visitors` VALUES (1002, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:09:40', '2025-03-20 08:09:40');
INSERT INTO `visitors` VALUES (1003, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:10:46', '2025-03-20 08:10:46');
INSERT INTO `visitors` VALUES (1004, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:10:50', '2025-03-20 08:10:50');
INSERT INTO `visitors` VALUES (1005, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:11:50', '2025-03-20 08:11:50');
INSERT INTO `visitors` VALUES (1006, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:11:52', '2025-03-20 08:11:52');
INSERT INTO `visitors` VALUES (1007, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:11:54', '2025-03-20 08:11:54');
INSERT INTO `visitors` VALUES (1008, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:11:55', '2025-03-20 08:11:55');
INSERT INTO `visitors` VALUES (1009, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:11:58', '2025-03-20 08:11:58');
INSERT INTO `visitors` VALUES (1010, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:13:32', '2025-03-20 08:13:32');
INSERT INTO `visitors` VALUES (1011, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:16:01', '2025-03-20 08:16:01');
INSERT INTO `visitors` VALUES (1012, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:16:03', '2025-03-20 08:16:03');
INSERT INTO `visitors` VALUES (1013, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:16:05', '2025-03-20 08:16:05');
INSERT INTO `visitors` VALUES (1014, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:16:10', '2025-03-20 08:16:10');
INSERT INTO `visitors` VALUES (1015, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:16:14', '2025-03-20 08:16:14');
INSERT INTO `visitors` VALUES (1016, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:17:19', '2025-03-20 08:17:19');
INSERT INTO `visitors` VALUES (1017, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:17:27', '2025-03-20 08:17:27');
INSERT INTO `visitors` VALUES (1018, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:18:13', '2025-03-20 08:18:13');
INSERT INTO `visitors` VALUES (1019, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:18:59', '2025-03-20 08:18:59');
INSERT INTO `visitors` VALUES (1020, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:19:00', '2025-03-20 08:19:00');
INSERT INTO `visitors` VALUES (1021, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:19:33', '2025-03-20 08:19:33');
INSERT INTO `visitors` VALUES (1022, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:19:34', '2025-03-20 08:19:34');
INSERT INTO `visitors` VALUES (1023, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:20:20', '2025-03-20 08:20:20');
INSERT INTO `visitors` VALUES (1024, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:20:34', '2025-03-20 08:20:34');
INSERT INTO `visitors` VALUES (1025, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:22:20', '2025-03-20 08:22:20');
INSERT INTO `visitors` VALUES (1026, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:22:23', '2025-03-20 08:22:23');
INSERT INTO `visitors` VALUES (1027, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:22:24', '2025-03-20 08:22:24');
INSERT INTO `visitors` VALUES (1028, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:22:32', '2025-03-20 08:22:32');
INSERT INTO `visitors` VALUES (1029, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:23:11', '2025-03-20 08:23:11');
INSERT INTO `visitors` VALUES (1030, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:23:11', '2025-03-20 08:23:11');
INSERT INTO `visitors` VALUES (1031, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:23:15', '2025-03-20 08:23:15');
INSERT INTO `visitors` VALUES (1032, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:24:06', '2025-03-20 08:24:06');
INSERT INTO `visitors` VALUES (1033, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:24:07', '2025-03-20 08:24:07');
INSERT INTO `visitors` VALUES (1034, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:24:07', '2025-03-20 08:24:07');
INSERT INTO `visitors` VALUES (1035, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:00', '2025-03-20 08:25:00');
INSERT INTO `visitors` VALUES (1036, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:00', '2025-03-20 08:25:00');
INSERT INTO `visitors` VALUES (1037, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:16', '2025-03-20 08:25:16');
INSERT INTO `visitors` VALUES (1038, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:23', '2025-03-20 08:25:23');
INSERT INTO `visitors` VALUES (1039, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:25', '2025-03-20 08:25:25');
INSERT INTO `visitors` VALUES (1040, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:25', '2025-03-20 08:25:25');
INSERT INTO `visitors` VALUES (1041, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:40', '2025-03-20 08:25:40');
INSERT INTO `visitors` VALUES (1042, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:40', '2025-03-20 08:25:40');
INSERT INTO `visitors` VALUES (1043, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:51', '2025-03-20 08:25:51');
INSERT INTO `visitors` VALUES (1044, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:51', '2025-03-20 08:25:51');
INSERT INTO `visitors` VALUES (1045, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:52', '2025-03-20 08:25:52');
INSERT INTO `visitors` VALUES (1046, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:52', '2025-03-20 08:25:52');
INSERT INTO `visitors` VALUES (1047, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:57', '2025-03-20 08:25:57');
INSERT INTO `visitors` VALUES (1048, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:25:57', '2025-03-20 08:25:57');
INSERT INTO `visitors` VALUES (1049, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:12', '2025-03-20 08:26:12');
INSERT INTO `visitors` VALUES (1050, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:15', '2025-03-20 08:26:15');
INSERT INTO `visitors` VALUES (1051, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:19', '2025-03-20 08:26:19');
INSERT INTO `visitors` VALUES (1052, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:19', '2025-03-20 08:26:19');
INSERT INTO `visitors` VALUES (1053, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:20', '2025-03-20 08:26:20');
INSERT INTO `visitors` VALUES (1054, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:20', '2025-03-20 08:26:20');
INSERT INTO `visitors` VALUES (1055, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:24', '2025-03-20 08:26:24');
INSERT INTO `visitors` VALUES (1056, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:24', '2025-03-20 08:26:24');
INSERT INTO `visitors` VALUES (1057, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:32', '2025-03-20 08:26:32');
INSERT INTO `visitors` VALUES (1058, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:33', '2025-03-20 08:26:33');
INSERT INTO `visitors` VALUES (1059, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:33', '2025-03-20 08:26:33');
INSERT INTO `visitors` VALUES (1060, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:40', '2025-03-20 08:26:40');
INSERT INTO `visitors` VALUES (1061, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:41', '2025-03-20 08:26:41');
INSERT INTO `visitors` VALUES (1062, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:41', '2025-03-20 08:26:41');
INSERT INTO `visitors` VALUES (1063, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:42', '2025-03-20 08:26:42');
INSERT INTO `visitors` VALUES (1064, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:42', '2025-03-20 08:26:42');
INSERT INTO `visitors` VALUES (1065, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:47', '2025-03-20 08:26:47');
INSERT INTO `visitors` VALUES (1066, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:47', '2025-03-20 08:26:47');
INSERT INTO `visitors` VALUES (1067, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:26:56', '2025-03-20 08:26:56');
INSERT INTO `visitors` VALUES (1068, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:27:12', '2025-03-20 08:27:12');
INSERT INTO `visitors` VALUES (1069, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:30:32', '2025-03-20 08:30:32');
INSERT INTO `visitors` VALUES (1070, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:32:08', '2025-03-20 08:32:08');
INSERT INTO `visitors` VALUES (1071, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:32:43', '2025-03-20 08:32:43');
INSERT INTO `visitors` VALUES (1072, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:32:49', '2025-03-20 08:32:49');
INSERT INTO `visitors` VALUES (1073, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:32:52', '2025-03-20 08:32:52');
INSERT INTO `visitors` VALUES (1074, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:33:00', '2025-03-20 08:33:00');
INSERT INTO `visitors` VALUES (1075, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:33:25', '2025-03-20 08:33:25');
INSERT INTO `visitors` VALUES (1076, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:33:27', '2025-03-20 08:33:27');
INSERT INTO `visitors` VALUES (1077, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:33:27', '2025-03-20 08:33:27');
INSERT INTO `visitors` VALUES (1078, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:33:32', '2025-03-20 08:33:32');
INSERT INTO `visitors` VALUES (1079, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:33:36', '2025-03-20 08:33:36');
INSERT INTO `visitors` VALUES (1080, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:36:52', '2025-03-20 08:36:52');
INSERT INTO `visitors` VALUES (1081, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:36:57', '2025-03-20 08:36:57');
INSERT INTO `visitors` VALUES (1082, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:15', '2025-03-20 08:37:15');
INSERT INTO `visitors` VALUES (1083, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:16', '2025-03-20 08:37:16');
INSERT INTO `visitors` VALUES (1084, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:17', '2025-03-20 08:37:17');
INSERT INTO `visitors` VALUES (1085, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:18', '2025-03-20 08:37:18');
INSERT INTO `visitors` VALUES (1086, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:32', '2025-03-20 08:37:32');
INSERT INTO `visitors` VALUES (1087, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:33', '2025-03-20 08:37:33');
INSERT INTO `visitors` VALUES (1088, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:36', '2025-03-20 08:37:36');
INSERT INTO `visitors` VALUES (1089, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:39', '2025-03-20 08:37:39');
INSERT INTO `visitors` VALUES (1090, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:42', '2025-03-20 08:37:42');
INSERT INTO `visitors` VALUES (1091, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:37:46', '2025-03-20 08:37:46');
INSERT INTO `visitors` VALUES (1092, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:38:42', '2025-03-20 08:38:42');
INSERT INTO `visitors` VALUES (1093, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:38:42', '2025-03-20 08:38:42');
INSERT INTO `visitors` VALUES (1094, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:38:51', '2025-03-20 08:38:51');
INSERT INTO `visitors` VALUES (1095, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:39:45', '2025-03-20 08:39:45');
INSERT INTO `visitors` VALUES (1096, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:39:57', '2025-03-20 08:39:57');
INSERT INTO `visitors` VALUES (1097, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:39:59', '2025-03-20 08:39:59');
INSERT INTO `visitors` VALUES (1098, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:00', '2025-03-20 08:40:00');
INSERT INTO `visitors` VALUES (1099, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:01', '2025-03-20 08:40:01');
INSERT INTO `visitors` VALUES (1100, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:02', '2025-03-20 08:40:02');
INSERT INTO `visitors` VALUES (1101, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:04', '2025-03-20 08:40:04');
INSERT INTO `visitors` VALUES (1102, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:15', '2025-03-20 08:40:15');
INSERT INTO `visitors` VALUES (1103, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:16', '2025-03-20 08:40:16');
INSERT INTO `visitors` VALUES (1104, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:19', '2025-03-20 08:40:19');
INSERT INTO `visitors` VALUES (1105, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:20', '2025-03-20 08:40:20');
INSERT INTO `visitors` VALUES (1106, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:22', '2025-03-20 08:40:22');
INSERT INTO `visitors` VALUES (1107, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:39', '2025-03-20 08:40:39');
INSERT INTO `visitors` VALUES (1108, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:39', '2025-03-20 08:40:39');
INSERT INTO `visitors` VALUES (1109, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:40:40', '2025-03-20 08:40:40');
INSERT INTO `visitors` VALUES (1110, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:41:25', '2025-03-20 08:41:25');
INSERT INTO `visitors` VALUES (1111, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:42:06', '2025-03-20 08:42:06');
INSERT INTO `visitors` VALUES (1112, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:10', '2025-03-20 08:42:10');
INSERT INTO `visitors` VALUES (1113, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:37', '2025-03-20 08:42:37');
INSERT INTO `visitors` VALUES (1114, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:38', '2025-03-20 08:42:38');
INSERT INTO `visitors` VALUES (1115, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:41', '2025-03-20 08:42:41');
INSERT INTO `visitors` VALUES (1116, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:42', '2025-03-20 08:42:42');
INSERT INTO `visitors` VALUES (1117, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:43', '2025-03-20 08:42:43');
INSERT INTO `visitors` VALUES (1118, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:47', '2025-03-20 08:42:47');
INSERT INTO `visitors` VALUES (1119, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:48', '2025-03-20 08:42:48');
INSERT INTO `visitors` VALUES (1120, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:49', '2025-03-20 08:42:49');
INSERT INTO `visitors` VALUES (1121, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:42:50', '2025-03-20 08:42:50');
INSERT INTO `visitors` VALUES (1122, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:43:00', '2025-03-20 08:43:00');
INSERT INTO `visitors` VALUES (1123, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:43:01', '2025-03-20 08:43:01');
INSERT INTO `visitors` VALUES (1124, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:43:22', '2025-03-20 08:43:22');
INSERT INTO `visitors` VALUES (1125, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:43:25', '2025-03-20 08:43:25');
INSERT INTO `visitors` VALUES (1126, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:43:27', '2025-03-20 08:43:27');
INSERT INTO `visitors` VALUES (1127, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:43:31', '2025-03-20 08:43:31');
INSERT INTO `visitors` VALUES (1128, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:43:35', '2025-03-20 08:43:35');
INSERT INTO `visitors` VALUES (1129, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:43:38', '2025-03-20 08:43:38');
INSERT INTO `visitors` VALUES (1130, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/dashboard/brand', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:43:43', '2025-03-20 08:43:43');
INSERT INTO `visitors` VALUES (1131, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:43:55', '2025-03-20 08:43:55');
INSERT INTO `visitors` VALUES (1132, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:44:04', '2025-03-20 08:44:04');
INSERT INTO `visitors` VALUES (1133, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:46:30', '2025-03-20 08:46:30');
INSERT INTO `visitors` VALUES (1134, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:46:42', '2025-03-20 08:46:42');
INSERT INTO `visitors` VALUES (1135, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:46:48', '2025-03-20 08:46:48');
INSERT INTO `visitors` VALUES (1136, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:46:54', '2025-03-20 08:46:54');
INSERT INTO `visitors` VALUES (1137, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:01', '2025-03-20 08:47:01');
INSERT INTO `visitors` VALUES (1138, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:27', '2025-03-20 08:47:27');
INSERT INTO `visitors` VALUES (1139, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:28', '2025-03-20 08:47:28');
INSERT INTO `visitors` VALUES (1140, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:29', '2025-03-20 08:47:29');
INSERT INTO `visitors` VALUES (1141, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:30', '2025-03-20 08:47:30');
INSERT INTO `visitors` VALUES (1142, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:51', '2025-03-20 08:47:51');
INSERT INTO `visitors` VALUES (1143, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:52', '2025-03-20 08:47:52');
INSERT INTO `visitors` VALUES (1144, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:47:53', '2025-03-20 08:47:53');
INSERT INTO `visitors` VALUES (1145, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:04', '2025-03-20 08:48:04');
INSERT INTO `visitors` VALUES (1146, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:16', '2025-03-20 08:48:16');
INSERT INTO `visitors` VALUES (1147, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:21', '2025-03-20 08:48:21');
INSERT INTO `visitors` VALUES (1148, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:30', '2025-03-20 08:48:30');
INSERT INTO `visitors` VALUES (1149, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:35', '2025-03-20 08:48:35');
INSERT INTO `visitors` VALUES (1150, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:40', '2025-03-20 08:48:40');
INSERT INTO `visitors` VALUES (1151, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:45', '2025-03-20 08:48:45');
INSERT INTO `visitors` VALUES (1152, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:52', '2025-03-20 08:48:52');
INSERT INTO `visitors` VALUES (1153, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:48:56', '2025-03-20 08:48:56');
INSERT INTO `visitors` VALUES (1154, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:49:23', '2025-03-20 08:49:23');
INSERT INTO `visitors` VALUES (1155, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:49:27', '2025-03-20 08:49:27');
INSERT INTO `visitors` VALUES (1156, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:49:32', '2025-03-20 08:49:32');
INSERT INTO `visitors` VALUES (1157, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:49:36', '2025-03-20 08:49:36');
INSERT INTO `visitors` VALUES (1158, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:49:44', '2025-03-20 08:49:44');
INSERT INTO `visitors` VALUES (1159, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 08:50:01', '2025-03-20 08:50:01');
INSERT INTO `visitors` VALUES (1160, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:50:19', '2025-03-20 08:50:19');
INSERT INTO `visitors` VALUES (1161, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:50:33', '2025-03-20 08:50:33');
INSERT INTO `visitors` VALUES (1162, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 08:50:38', '2025-03-20 08:50:38');
INSERT INTO `visitors` VALUES (1163, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:51:03', '2025-03-20 08:51:03');
INSERT INTO `visitors` VALUES (1164, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:51:08', '2025-03-20 08:51:08');
INSERT INTO `visitors` VALUES (1165, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:51:16', '2025-03-20 08:51:16');
INSERT INTO `visitors` VALUES (1166, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:51:18', '2025-03-20 08:51:18');
INSERT INTO `visitors` VALUES (1167, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:51:24', '2025-03-20 08:51:24');
INSERT INTO `visitors` VALUES (1168, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:51:29', '2025-03-20 08:51:29');
INSERT INTO `visitors` VALUES (1169, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:00', '2025-03-20 08:52:00');
INSERT INTO `visitors` VALUES (1170, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:03', '2025-03-20 08:52:03');
INSERT INTO `visitors` VALUES (1171, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:05', '2025-03-20 08:52:05');
INSERT INTO `visitors` VALUES (1172, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:07', '2025-03-20 08:52:07');
INSERT INTO `visitors` VALUES (1173, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:18', '2025-03-20 08:52:18');
INSERT INTO `visitors` VALUES (1174, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:20', '2025-03-20 08:52:20');
INSERT INTO `visitors` VALUES (1175, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:22', '2025-03-20 08:52:22');
INSERT INTO `visitors` VALUES (1176, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:28', '2025-03-20 08:52:28');
INSERT INTO `visitors` VALUES (1177, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:33', '2025-03-20 08:52:33');
INSERT INTO `visitors` VALUES (1178, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:34', '2025-03-20 08:52:34');
INSERT INTO `visitors` VALUES (1179, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:37', '2025-03-20 08:52:37');
INSERT INTO `visitors` VALUES (1180, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:44', '2025-03-20 08:52:44');
INSERT INTO `visitors` VALUES (1181, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:48', '2025-03-20 08:52:48');
INSERT INTO `visitors` VALUES (1182, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:55', '2025-03-20 08:52:55');
INSERT INTO `visitors` VALUES (1183, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:57', '2025-03-20 08:52:57');
INSERT INTO `visitors` VALUES (1184, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:52:58', '2025-03-20 08:52:58');
INSERT INTO `visitors` VALUES (1185, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:53:08', '2025-03-20 08:53:08');
INSERT INTO `visitors` VALUES (1186, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:53:12', '2025-03-20 08:53:12');
INSERT INTO `visitors` VALUES (1187, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:53:22', '2025-03-20 08:53:22');
INSERT INTO `visitors` VALUES (1188, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 08:53:46', '2025-03-20 08:53:46');
INSERT INTO `visitors` VALUES (1189, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:53:52', '2025-03-20 08:53:52');
INSERT INTO `visitors` VALUES (1190, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:54:01', '2025-03-20 08:54:01');
INSERT INTO `visitors` VALUES (1191, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 08:54:08', '2025-03-20 08:54:08');
INSERT INTO `visitors` VALUES (1192, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:00:46', '2025-03-20 09:00:46');
INSERT INTO `visitors` VALUES (1193, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:00:47', '2025-03-20 09:00:47');
INSERT INTO `visitors` VALUES (1194, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:00:48', '2025-03-20 09:00:48');
INSERT INTO `visitors` VALUES (1195, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:00:57', '2025-03-20 09:00:57');
INSERT INTO `visitors` VALUES (1196, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:00:58', '2025-03-20 09:00:58');
INSERT INTO `visitors` VALUES (1197, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:00', '2025-03-20 09:01:00');
INSERT INTO `visitors` VALUES (1198, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:01', '2025-03-20 09:01:01');
INSERT INTO `visitors` VALUES (1199, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:04', '2025-03-20 09:01:04');
INSERT INTO `visitors` VALUES (1200, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:05', '2025-03-20 09:01:05');
INSERT INTO `visitors` VALUES (1201, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:06', '2025-03-20 09:01:06');
INSERT INTO `visitors` VALUES (1202, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:18', '2025-03-20 09:01:18');
INSERT INTO `visitors` VALUES (1203, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:19', '2025-03-20 09:01:19');
INSERT INTO `visitors` VALUES (1204, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:22', '2025-03-20 09:01:22');
INSERT INTO `visitors` VALUES (1205, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:23', '2025-03-20 09:01:23');
INSERT INTO `visitors` VALUES (1206, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:28', '2025-03-20 09:01:28');
INSERT INTO `visitors` VALUES (1207, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:29', '2025-03-20 09:01:29');
INSERT INTO `visitors` VALUES (1208, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:33', '2025-03-20 09:01:33');
INSERT INTO `visitors` VALUES (1209, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:34', '2025-03-20 09:01:34');
INSERT INTO `visitors` VALUES (1210, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:01:40', '2025-03-20 09:01:40');
INSERT INTO `visitors` VALUES (1211, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:06:21', '2025-03-20 09:06:21');
INSERT INTO `visitors` VALUES (1212, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:06:27', '2025-03-20 09:06:27');
INSERT INTO `visitors` VALUES (1213, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:06:45', '2025-03-20 09:06:45');
INSERT INTO `visitors` VALUES (1214, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:06:47', '2025-03-20 09:06:47');
INSERT INTO `visitors` VALUES (1215, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:09:00', '2025-03-20 09:09:00');
INSERT INTO `visitors` VALUES (1216, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:09:04', '2025-03-20 09:09:04');
INSERT INTO `visitors` VALUES (1217, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:01', '2025-03-20 09:11:01');
INSERT INTO `visitors` VALUES (1218, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:12', '2025-03-20 09:11:12');
INSERT INTO `visitors` VALUES (1219, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:23', '2025-03-20 09:11:23');
INSERT INTO `visitors` VALUES (1220, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:24', '2025-03-20 09:11:24');
INSERT INTO `visitors` VALUES (1221, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:29', '2025-03-20 09:11:29');
INSERT INTO `visitors` VALUES (1222, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:30', '2025-03-20 09:11:30');
INSERT INTO `visitors` VALUES (1223, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:34', '2025-03-20 09:11:34');
INSERT INTO `visitors` VALUES (1224, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:35', '2025-03-20 09:11:35');
INSERT INTO `visitors` VALUES (1225, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:37', '2025-03-20 09:11:37');
INSERT INTO `visitors` VALUES (1226, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:47', '2025-03-20 09:11:47');
INSERT INTO `visitors` VALUES (1227, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:11:48', '2025-03-20 09:11:48');
INSERT INTO `visitors` VALUES (1228, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:01', '2025-03-20 09:13:01');
INSERT INTO `visitors` VALUES (1229, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:03', '2025-03-20 09:13:03');
INSERT INTO `visitors` VALUES (1230, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:05', '2025-03-20 09:13:05');
INSERT INTO `visitors` VALUES (1231, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:07', '2025-03-20 09:13:07');
INSERT INTO `visitors` VALUES (1232, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:08', '2025-03-20 09:13:08');
INSERT INTO `visitors` VALUES (1233, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:28', '2025-03-20 09:13:28');
INSERT INTO `visitors` VALUES (1234, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:29', '2025-03-20 09:13:29');
INSERT INTO `visitors` VALUES (1235, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:35', '2025-03-20 09:13:35');
INSERT INTO `visitors` VALUES (1236, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:37', '2025-03-20 09:13:37');
INSERT INTO `visitors` VALUES (1237, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:39', '2025-03-20 09:13:39');
INSERT INTO `visitors` VALUES (1238, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:41', '2025-03-20 09:13:41');
INSERT INTO `visitors` VALUES (1239, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:54', '2025-03-20 09:13:54');
INSERT INTO `visitors` VALUES (1240, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:13:55', '2025-03-20 09:13:55');
INSERT INTO `visitors` VALUES (1241, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:11', '2025-03-20 09:14:11');
INSERT INTO `visitors` VALUES (1242, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:13', '2025-03-20 09:14:13');
INSERT INTO `visitors` VALUES (1243, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:14', '2025-03-20 09:14:14');
INSERT INTO `visitors` VALUES (1244, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:20', '2025-03-20 09:14:20');
INSERT INTO `visitors` VALUES (1245, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:21', '2025-03-20 09:14:21');
INSERT INTO `visitors` VALUES (1246, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:23', '2025-03-20 09:14:23');
INSERT INTO `visitors` VALUES (1247, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:14:31', '2025-03-20 09:14:31');
INSERT INTO `visitors` VALUES (1248, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:35', '2025-03-20 09:14:35');
INSERT INTO `visitors` VALUES (1249, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:47', '2025-03-20 09:14:47');
INSERT INTO `visitors` VALUES (1250, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:49', '2025-03-20 09:14:49');
INSERT INTO `visitors` VALUES (1251, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:50', '2025-03-20 09:14:50');
INSERT INTO `visitors` VALUES (1252, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:14:59', '2025-03-20 09:14:59');
INSERT INTO `visitors` VALUES (1253, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:00', '2025-03-20 09:15:00');
INSERT INTO `visitors` VALUES (1254, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:02', '2025-03-20 09:15:02');
INSERT INTO `visitors` VALUES (1255, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:25', '2025-03-20 09:15:25');
INSERT INTO `visitors` VALUES (1256, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:26', '2025-03-20 09:15:26');
INSERT INTO `visitors` VALUES (1257, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:32', '2025-03-20 09:15:32');
INSERT INTO `visitors` VALUES (1258, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:36', '2025-03-20 09:15:36');
INSERT INTO `visitors` VALUES (1259, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:42', '2025-03-20 09:15:42');
INSERT INTO `visitors` VALUES (1260, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:44', '2025-03-20 09:15:44');
INSERT INTO `visitors` VALUES (1261, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:15:46', '2025-03-20 09:15:46');
INSERT INTO `visitors` VALUES (1262, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:17:42', '2025-03-20 09:17:42');
INSERT INTO `visitors` VALUES (1263, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:17:57', '2025-03-20 09:17:57');
INSERT INTO `visitors` VALUES (1264, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:11', '2025-03-20 09:18:11');
INSERT INTO `visitors` VALUES (1265, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:13', '2025-03-20 09:18:13');
INSERT INTO `visitors` VALUES (1266, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:15', '2025-03-20 09:18:15');
INSERT INTO `visitors` VALUES (1267, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:21', '2025-03-20 09:18:21');
INSERT INTO `visitors` VALUES (1268, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:24', '2025-03-20 09:18:24');
INSERT INTO `visitors` VALUES (1269, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:26', '2025-03-20 09:18:26');
INSERT INTO `visitors` VALUES (1270, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:18:49', '2025-03-20 09:18:49');
INSERT INTO `visitors` VALUES (1271, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:19:21', '2025-03-20 09:19:21');
INSERT INTO `visitors` VALUES (1272, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:19:23', '2025-03-20 09:19:23');
INSERT INTO `visitors` VALUES (1273, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:19:25', '2025-03-20 09:19:25');
INSERT INTO `visitors` VALUES (1274, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:19:27', '2025-03-20 09:19:27');
INSERT INTO `visitors` VALUES (1275, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:20:21', '2025-03-20 09:20:21');
INSERT INTO `visitors` VALUES (1276, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:20:29', '2025-03-20 09:20:29');
INSERT INTO `visitors` VALUES (1277, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:20:31', '2025-03-20 09:20:31');
INSERT INTO `visitors` VALUES (1278, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:20:33', '2025-03-20 09:20:33');
INSERT INTO `visitors` VALUES (1279, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:20:35', '2025-03-20 09:20:35');
INSERT INTO `visitors` VALUES (1280, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:20:37', '2025-03-20 09:20:37');
INSERT INTO `visitors` VALUES (1281, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:20:38', '2025-03-20 09:20:38');
INSERT INTO `visitors` VALUES (1282, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:20:41', '2025-03-20 09:20:41');
INSERT INTO `visitors` VALUES (1283, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:20:47', '2025-03-20 09:20:47');
INSERT INTO `visitors` VALUES (1284, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:21:37', '2025-03-20 09:21:37');
INSERT INTO `visitors` VALUES (1285, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:21:41', '2025-03-20 09:21:41');
INSERT INTO `visitors` VALUES (1286, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:21:46', '2025-03-20 09:21:46');
INSERT INTO `visitors` VALUES (1287, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:21:47', '2025-03-20 09:21:47');
INSERT INTO `visitors` VALUES (1288, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:21:51', '2025-03-20 09:21:51');
INSERT INTO `visitors` VALUES (1289, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:21:56', '2025-03-20 09:21:56');
INSERT INTO `visitors` VALUES (1290, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:22:00', '2025-03-20 09:22:00');
INSERT INTO `visitors` VALUES (1291, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:23:16', '2025-03-20 09:23:16');
INSERT INTO `visitors` VALUES (1292, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:23:22', '2025-03-20 09:23:22');
INSERT INTO `visitors` VALUES (1293, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 09:23:23', '2025-03-20 09:23:23');
INSERT INTO `visitors` VALUES (1294, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:23:26', '2025-03-20 09:23:26');
INSERT INTO `visitors` VALUES (1295, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:23:51', '2025-03-20 09:23:51');
INSERT INTO `visitors` VALUES (1296, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:23:57', '2025-03-20 09:23:57');
INSERT INTO `visitors` VALUES (1297, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:24:06', '2025-03-20 09:24:06');
INSERT INTO `visitors` VALUES (1298, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:24:13', '2025-03-20 09:24:13');
INSERT INTO `visitors` VALUES (1299, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:24:31', '2025-03-20 09:24:31');
INSERT INTO `visitors` VALUES (1300, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:24:37', '2025-03-20 09:24:37');
INSERT INTO `visitors` VALUES (1301, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:10', '2025-03-20 09:26:10');
INSERT INTO `visitors` VALUES (1302, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:15', '2025-03-20 09:26:15');
INSERT INTO `visitors` VALUES (1303, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:20', '2025-03-20 09:26:20');
INSERT INTO `visitors` VALUES (1304, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:22', '2025-03-20 09:26:22');
INSERT INTO `visitors` VALUES (1305, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:23', '2025-03-20 09:26:23');
INSERT INTO `visitors` VALUES (1306, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:28', '2025-03-20 09:26:28');
INSERT INTO `visitors` VALUES (1307, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:38', '2025-03-20 09:26:38');
INSERT INTO `visitors` VALUES (1308, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:44', '2025-03-20 09:26:44');
INSERT INTO `visitors` VALUES (1309, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:50', '2025-03-20 09:26:50');
INSERT INTO `visitors` VALUES (1310, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:26:52', '2025-03-20 09:26:52');
INSERT INTO `visitors` VALUES (1311, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:04', '2025-03-20 09:27:04');
INSERT INTO `visitors` VALUES (1312, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:06', '2025-03-20 09:27:06');
INSERT INTO `visitors` VALUES (1313, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:08', '2025-03-20 09:27:08');
INSERT INTO `visitors` VALUES (1314, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:12', '2025-03-20 09:27:12');
INSERT INTO `visitors` VALUES (1315, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:14', '2025-03-20 09:27:14');
INSERT INTO `visitors` VALUES (1316, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:17', '2025-03-20 09:27:17');
INSERT INTO `visitors` VALUES (1317, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:27:57', '2025-03-20 09:27:57');
INSERT INTO `visitors` VALUES (1318, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:28:00', '2025-03-20 09:28:00');
INSERT INTO `visitors` VALUES (1319, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:28:03', '2025-03-20 09:28:03');
INSERT INTO `visitors` VALUES (1320, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 09:28:09', '2025-03-20 09:28:09');
INSERT INTO `visitors` VALUES (1321, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 11:53:51', '2025-03-20 11:53:51');
INSERT INTO `visitors` VALUES (1322, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 11:53:59', '2025-03-20 11:53:59');
INSERT INTO `visitors` VALUES (1323, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 11:54:34', '2025-03-20 11:54:34');
INSERT INTO `visitors` VALUES (1324, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 11:54:42', '2025-03-20 11:54:42');
INSERT INTO `visitors` VALUES (1325, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 11:55:07', '2025-03-20 11:55:07');
INSERT INTO `visitors` VALUES (1326, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:55:23', '2025-03-20 11:55:23');
INSERT INTO `visitors` VALUES (1327, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:07', '2025-03-20 11:56:07');
INSERT INTO `visitors` VALUES (1328, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:15', '2025-03-20 11:56:15');
INSERT INTO `visitors` VALUES (1329, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:19', '2025-03-20 11:56:19');
INSERT INTO `visitors` VALUES (1330, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:21', '2025-03-20 11:56:21');
INSERT INTO `visitors` VALUES (1331, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:24', '2025-03-20 11:56:24');
INSERT INTO `visitors` VALUES (1332, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:29', '2025-03-20 11:56:29');
INSERT INTO `visitors` VALUES (1333, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:32', '2025-03-20 11:56:32');
INSERT INTO `visitors` VALUES (1334, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:33', '2025-03-20 11:56:33');
INSERT INTO `visitors` VALUES (1335, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:56:46', '2025-03-20 11:56:46');
INSERT INTO `visitors` VALUES (1336, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:10', '2025-03-20 11:57:10');
INSERT INTO `visitors` VALUES (1337, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:17', '2025-03-20 11:57:17');
INSERT INTO `visitors` VALUES (1338, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:20', '2025-03-20 11:57:20');
INSERT INTO `visitors` VALUES (1339, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:28', '2025-03-20 11:57:28');
INSERT INTO `visitors` VALUES (1340, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:29', '2025-03-20 11:57:29');
INSERT INTO `visitors` VALUES (1341, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:32', '2025-03-20 11:57:32');
INSERT INTO `visitors` VALUES (1342, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:48', '2025-03-20 11:57:48');
INSERT INTO `visitors` VALUES (1343, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:52', '2025-03-20 11:57:52');
INSERT INTO `visitors` VALUES (1344, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:57:58', '2025-03-20 11:57:58');
INSERT INTO `visitors` VALUES (1345, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:58:00', '2025-03-20 11:58:00');
INSERT INTO `visitors` VALUES (1346, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:58:03', '2025-03-20 11:58:03');
INSERT INTO `visitors` VALUES (1347, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:58:06', '2025-03-20 11:58:06');
INSERT INTO `visitors` VALUES (1348, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 11:58:10', '2025-03-20 11:58:10');
INSERT INTO `visitors` VALUES (1349, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-20 11:58:13', '2025-03-20 11:58:13');
INSERT INTO `visitors` VALUES (1350, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'shop', '2025-03-20 11:58:25', '2025-03-20 11:58:25');
INSERT INTO `visitors` VALUES (1351, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 11:58:55', '2025-03-20 11:58:55');
INSERT INTO `visitors` VALUES (1352, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-20 11:59:06', '2025-03-20 11:59:06');
INSERT INTO `visitors` VALUES (1353, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop?page=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 11:59:13', '2025-03-20 11:59:13');
INSERT INTO `visitors` VALUES (1354, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop?page=1', 'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 11:59:54', '2025-03-20 11:59:54');
INSERT INTO `visitors` VALUES (1355, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop?page=1', 'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '/', '2025-03-20 12:00:09', '2025-03-20 12:00:09');
INSERT INTO `visitors` VALUES (1356, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 12:00:16', '2025-03-20 12:00:16');
INSERT INTO `visitors` VALUES (1357, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'shop', '2025-03-20 12:00:31', '2025-03-20 12:00:31');
INSERT INTO `visitors` VALUES (1358, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:20:11', '2025-03-20 12:20:11');
INSERT INTO `visitors` VALUES (1359, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:20:39', '2025-03-20 12:20:39');
INSERT INTO `visitors` VALUES (1360, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:20:47', '2025-03-20 12:20:47');
INSERT INTO `visitors` VALUES (1361, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:21:00', '2025-03-20 12:21:00');
INSERT INTO `visitors` VALUES (1362, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:21:29', '2025-03-20 12:21:29');
INSERT INTO `visitors` VALUES (1363, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:22:26', '2025-03-20 12:22:26');
INSERT INTO `visitors` VALUES (1364, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:22:32', '2025-03-20 12:22:32');
INSERT INTO `visitors` VALUES (1365, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:22:35', '2025-03-20 12:22:35');
INSERT INTO `visitors` VALUES (1366, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:22:37', '2025-03-20 12:22:37');
INSERT INTO `visitors` VALUES (1367, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:22:40', '2025-03-20 12:22:40');
INSERT INTO `visitors` VALUES (1368, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:22:43', '2025-03-20 12:22:43');
INSERT INTO `visitors` VALUES (1369, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:23:24', '2025-03-20 12:23:24');
INSERT INTO `visitors` VALUES (1370, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:23:36', '2025-03-20 12:23:36');
INSERT INTO `visitors` VALUES (1371, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:23:59', '2025-03-20 12:23:59');
INSERT INTO `visitors` VALUES (1372, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:02', '2025-03-20 12:24:02');
INSERT INTO `visitors` VALUES (1373, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:05', '2025-03-20 12:24:05');
INSERT INTO `visitors` VALUES (1374, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:18', '2025-03-20 12:24:18');
INSERT INTO `visitors` VALUES (1375, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:20', '2025-03-20 12:24:20');
INSERT INTO `visitors` VALUES (1376, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:28', '2025-03-20 12:24:28');
INSERT INTO `visitors` VALUES (1377, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:33', '2025-03-20 12:24:33');
INSERT INTO `visitors` VALUES (1378, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:36', '2025-03-20 12:24:36');
INSERT INTO `visitors` VALUES (1379, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:39', '2025-03-20 12:24:39');
INSERT INTO `visitors` VALUES (1380, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:40', '2025-03-20 12:24:40');
INSERT INTO `visitors` VALUES (1381, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:52', '2025-03-20 12:24:52');
INSERT INTO `visitors` VALUES (1382, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:24:57', '2025-03-20 12:24:57');
INSERT INTO `visitors` VALUES (1383, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:04', '2025-03-20 12:25:04');
INSERT INTO `visitors` VALUES (1384, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:24', '2025-03-20 12:25:24');
INSERT INTO `visitors` VALUES (1385, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:29', '2025-03-20 12:25:29');
INSERT INTO `visitors` VALUES (1386, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:31', '2025-03-20 12:25:31');
INSERT INTO `visitors` VALUES (1387, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:36', '2025-03-20 12:25:36');
INSERT INTO `visitors` VALUES (1388, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:38', '2025-03-20 12:25:38');
INSERT INTO `visitors` VALUES (1389, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:42', '2025-03-20 12:25:42');
INSERT INTO `visitors` VALUES (1390, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:45', '2025-03-20 12:25:45');
INSERT INTO `visitors` VALUES (1391, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:46', '2025-03-20 12:25:46');
INSERT INTO `visitors` VALUES (1392, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:48', '2025-03-20 12:25:48');
INSERT INTO `visitors` VALUES (1393, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:49', '2025-03-20 12:25:49');
INSERT INTO `visitors` VALUES (1394, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:54', '2025-03-20 12:25:54');
INSERT INTO `visitors` VALUES (1395, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:25:59', '2025-03-20 12:25:59');
INSERT INTO `visitors` VALUES (1396, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:02', '2025-03-20 12:26:02');
INSERT INTO `visitors` VALUES (1397, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:11', '2025-03-20 12:26:11');
INSERT INTO `visitors` VALUES (1398, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:18', '2025-03-20 12:26:18');
INSERT INTO `visitors` VALUES (1399, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:21', '2025-03-20 12:26:21');
INSERT INTO `visitors` VALUES (1400, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:36', '2025-03-20 12:26:36');
INSERT INTO `visitors` VALUES (1401, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:37', '2025-03-20 12:26:37');
INSERT INTO `visitors` VALUES (1402, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:40', '2025-03-20 12:26:40');
INSERT INTO `visitors` VALUES (1403, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:47', '2025-03-20 12:26:47');
INSERT INTO `visitors` VALUES (1404, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:26:54', '2025-03-20 12:26:54');
INSERT INTO `visitors` VALUES (1405, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:27:29', '2025-03-20 12:27:29');
INSERT INTO `visitors` VALUES (1406, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:27:33', '2025-03-20 12:27:33');
INSERT INTO `visitors` VALUES (1407, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:27:34', '2025-03-20 12:27:34');
INSERT INTO `visitors` VALUES (1408, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:12', '2025-03-20 12:28:12');
INSERT INTO `visitors` VALUES (1409, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:14', '2025-03-20 12:28:14');
INSERT INTO `visitors` VALUES (1410, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:19', '2025-03-20 12:28:19');
INSERT INTO `visitors` VALUES (1411, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:22', '2025-03-20 12:28:22');
INSERT INTO `visitors` VALUES (1412, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:38', '2025-03-20 12:28:38');
INSERT INTO `visitors` VALUES (1413, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:47', '2025-03-20 12:28:47');
INSERT INTO `visitors` VALUES (1414, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:49', '2025-03-20 12:28:49');
INSERT INTO `visitors` VALUES (1415, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:51', '2025-03-20 12:28:51');
INSERT INTO `visitors` VALUES (1416, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:52', '2025-03-20 12:28:52');
INSERT INTO `visitors` VALUES (1417, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:54', '2025-03-20 12:28:54');
INSERT INTO `visitors` VALUES (1418, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:28:57', '2025-03-20 12:28:57');
INSERT INTO `visitors` VALUES (1419, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:13', '2025-03-20 12:29:13');
INSERT INTO `visitors` VALUES (1420, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:20', '2025-03-20 12:29:20');
INSERT INTO `visitors` VALUES (1421, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:22', '2025-03-20 12:29:22');
INSERT INTO `visitors` VALUES (1422, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:25', '2025-03-20 12:29:25');
INSERT INTO `visitors` VALUES (1423, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:27', '2025-03-20 12:29:27');
INSERT INTO `visitors` VALUES (1424, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:30', '2025-03-20 12:29:30');
INSERT INTO `visitors` VALUES (1425, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:29:40', '2025-03-20 12:29:40');
INSERT INTO `visitors` VALUES (1426, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:10', '2025-03-20 12:30:10');
INSERT INTO `visitors` VALUES (1427, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:39', '2025-03-20 12:30:39');
INSERT INTO `visitors` VALUES (1428, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:46', '2025-03-20 12:30:46');
INSERT INTO `visitors` VALUES (1429, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:52', '2025-03-20 12:30:52');
INSERT INTO `visitors` VALUES (1430, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:54', '2025-03-20 12:30:54');
INSERT INTO `visitors` VALUES (1431, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:57', '2025-03-20 12:30:57');
INSERT INTO `visitors` VALUES (1432, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:30:59', '2025-03-20 12:30:59');
INSERT INTO `visitors` VALUES (1433, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:31:42', '2025-03-20 12:31:42');
INSERT INTO `visitors` VALUES (1434, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:31:54', '2025-03-20 12:31:54');
INSERT INTO `visitors` VALUES (1435, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:32:15', '2025-03-20 12:32:15');
INSERT INTO `visitors` VALUES (1436, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/show-cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:32:19', '2025-03-20 12:32:19');
INSERT INTO `visitors` VALUES (1437, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/shop/1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:34:03', '2025-03-20 12:34:03');
INSERT INTO `visitors` VALUES (1438, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', 'show-cart', '2025-03-20 12:35:08', '2025-03-20 12:35:08');
INSERT INTO `visitors` VALUES (1439, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:35:17', '2025-03-20 12:35:17');
INSERT INTO `visitors` VALUES (1440, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/show-cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:35:20', '2025-03-20 12:35:20');
INSERT INTO `visitors` VALUES (1441, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:35:43', '2025-03-20 12:35:43');
INSERT INTO `visitors` VALUES (1442, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:35:47', '2025-03-20 12:35:47');
INSERT INTO `visitors` VALUES (1443, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:39:11', '2025-03-20 12:39:11');
INSERT INTO `visitors` VALUES (1444, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:39:34', '2025-03-20 12:39:34');
INSERT INTO `visitors` VALUES (1445, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/show-cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:39:44', '2025-03-20 12:39:44');
INSERT INTO `visitors` VALUES (1446, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:39:52', '2025-03-20 12:39:52');
INSERT INTO `visitors` VALUES (1447, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:11', '2025-03-20 12:40:11');
INSERT INTO `visitors` VALUES (1448, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:16', '2025-03-20 12:40:16');
INSERT INTO `visitors` VALUES (1449, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:30', '2025-03-20 12:40:30');
INSERT INTO `visitors` VALUES (1450, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:35', '2025-03-20 12:40:35');
INSERT INTO `visitors` VALUES (1451, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:36', '2025-03-20 12:40:36');
INSERT INTO `visitors` VALUES (1452, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:37', '2025-03-20 12:40:37');
INSERT INTO `visitors` VALUES (1453, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:37', '2025-03-20 12:40:37');
INSERT INTO `visitors` VALUES (1454, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:41', '2025-03-20 12:40:41');
INSERT INTO `visitors` VALUES (1455, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:40:51', '2025-03-20 12:40:51');
INSERT INTO `visitors` VALUES (1456, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:41:02', '2025-03-20 12:41:02');
INSERT INTO `visitors` VALUES (1457, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:41:21', '2025-03-20 12:41:21');
INSERT INTO `visitors` VALUES (1458, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:42:40', '2025-03-20 12:42:40');
INSERT INTO `visitors` VALUES (1459, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:42:48', '2025-03-20 12:42:48');
INSERT INTO `visitors` VALUES (1460, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:42:56', '2025-03-20 12:42:56');
INSERT INTO `visitors` VALUES (1461, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:42:59', '2025-03-20 12:42:59');
INSERT INTO `visitors` VALUES (1462, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:43:08', '2025-03-20 12:43:08');
INSERT INTO `visitors` VALUES (1463, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 12:43:17', '2025-03-20 12:43:17');
INSERT INTO `visitors` VALUES (1464, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-20 12:43:25', '2025-03-20 12:43:25');
INSERT INTO `visitors` VALUES (1465, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/show-cart/address', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 13:00:16', '2025-03-20 13:00:16');
INSERT INTO `visitors` VALUES (1466, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-20 13:00:48', '2025-03-20 13:00:48');
INSERT INTO `visitors` VALUES (1467, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-20 13:00:59', '2025-03-20 13:00:59');
INSERT INTO `visitors` VALUES (1468, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-20 13:01:05', '2025-03-20 13:01:05');
INSERT INTO `visitors` VALUES (1469, NULL, NULL, '1', '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-20 13:01:23', '2025-03-20 13:01:23');
INSERT INTO `visitors` VALUES (1470, NULL, NULL, '1', '127.0.0.1', 'http://127.0.0.1:8000/show-cart', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '/', '2025-03-20 13:01:28', '2025-03-20 13:01:28');
INSERT INTO `visitors` VALUES (1471, NULL, NULL, '1', '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-20 13:03:48', '2025-03-20 13:03:48');
INSERT INTO `visitors` VALUES (1472, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:26:26', '2025-03-21 08:26:26');
INSERT INTO `visitors` VALUES (1473, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:26:50', '2025-03-21 08:26:50');
INSERT INTO `visitors` VALUES (1474, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:26:57', '2025-03-21 08:26:57');
INSERT INTO `visitors` VALUES (1475, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:27:00', '2025-03-21 08:27:00');
INSERT INTO `visitors` VALUES (1476, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:27:06', '2025-03-21 08:27:06');
INSERT INTO `visitors` VALUES (1477, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:29:36', '2025-03-21 08:29:36');
INSERT INTO `visitors` VALUES (1478, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:29:47', '2025-03-21 08:29:47');
INSERT INTO `visitors` VALUES (1479, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:30:01', '2025-03-21 08:30:01');
INSERT INTO `visitors` VALUES (1480, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/show-cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 08:30:06', '2025-03-21 08:30:06');
INSERT INTO `visitors` VALUES (1481, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:38:00', '2025-03-21 08:38:00');
INSERT INTO `visitors` VALUES (1482, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:39:18', '2025-03-21 08:39:18');
INSERT INTO `visitors` VALUES (1483, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:40:04', '2025-03-21 08:40:04');
INSERT INTO `visitors` VALUES (1484, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:40:16', '2025-03-21 08:40:16');
INSERT INTO `visitors` VALUES (1485, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:43:38', '2025-03-21 08:43:38');
INSERT INTO `visitors` VALUES (1486, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:53:53', '2025-03-21 08:53:53');
INSERT INTO `visitors` VALUES (1487, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'shop', '2025-03-21 08:53:56', '2025-03-21 08:53:56');
INSERT INTO `visitors` VALUES (1488, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:54:19', '2025-03-21 08:54:19');
INSERT INTO `visitors` VALUES (1489, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:55:28', '2025-03-21 08:55:28');
INSERT INTO `visitors` VALUES (1490, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:55:33', '2025-03-21 08:55:33');
INSERT INTO `visitors` VALUES (1491, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:15', '2025-03-21 08:56:15');
INSERT INTO `visitors` VALUES (1492, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:19', '2025-03-21 08:56:19');
INSERT INTO `visitors` VALUES (1493, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:28', '2025-03-21 08:56:28');
INSERT INTO `visitors` VALUES (1494, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:30', '2025-03-21 08:56:30');
INSERT INTO `visitors` VALUES (1495, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:33', '2025-03-21 08:56:33');
INSERT INTO `visitors` VALUES (1496, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:35', '2025-03-21 08:56:35');
INSERT INTO `visitors` VALUES (1497, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:40', '2025-03-21 08:56:40');
INSERT INTO `visitors` VALUES (1498, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:43', '2025-03-21 08:56:43');
INSERT INTO `visitors` VALUES (1499, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:45', '2025-03-21 08:56:45');
INSERT INTO `visitors` VALUES (1500, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:49', '2025-03-21 08:56:49');
INSERT INTO `visitors` VALUES (1501, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:54', '2025-03-21 08:56:54');
INSERT INTO `visitors` VALUES (1502, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:56:57', '2025-03-21 08:56:57');
INSERT INTO `visitors` VALUES (1503, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:05', '2025-03-21 08:57:05');
INSERT INTO `visitors` VALUES (1504, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:07', '2025-03-21 08:57:07');
INSERT INTO `visitors` VALUES (1505, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:09', '2025-03-21 08:57:09');
INSERT INTO `visitors` VALUES (1506, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:23', '2025-03-21 08:57:23');
INSERT INTO `visitors` VALUES (1507, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:26', '2025-03-21 08:57:26');
INSERT INTO `visitors` VALUES (1508, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:36', '2025-03-21 08:57:36');
INSERT INTO `visitors` VALUES (1509, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:39', '2025-03-21 08:57:39');
INSERT INTO `visitors` VALUES (1510, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:41', '2025-03-21 08:57:41');
INSERT INTO `visitors` VALUES (1511, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:44', '2025-03-21 08:57:44');
INSERT INTO `visitors` VALUES (1512, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:47', '2025-03-21 08:57:47');
INSERT INTO `visitors` VALUES (1513, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:51', '2025-03-21 08:57:51');
INSERT INTO `visitors` VALUES (1514, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:54', '2025-03-21 08:57:54');
INSERT INTO `visitors` VALUES (1515, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:57:57', '2025-03-21 08:57:57');
INSERT INTO `visitors` VALUES (1516, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:00', '2025-03-21 08:58:00');
INSERT INTO `visitors` VALUES (1517, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:03', '2025-03-21 08:58:03');
INSERT INTO `visitors` VALUES (1518, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:06', '2025-03-21 08:58:06');
INSERT INTO `visitors` VALUES (1519, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:08', '2025-03-21 08:58:08');
INSERT INTO `visitors` VALUES (1520, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:11', '2025-03-21 08:58:11');
INSERT INTO `visitors` VALUES (1521, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:14', '2025-03-21 08:58:14');
INSERT INTO `visitors` VALUES (1522, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:16', '2025-03-21 08:58:16');
INSERT INTO `visitors` VALUES (1523, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:33', '2025-03-21 08:58:33');
INSERT INTO `visitors` VALUES (1524, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:36', '2025-03-21 08:58:36');
INSERT INTO `visitors` VALUES (1525, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:48', '2025-03-21 08:58:48');
INSERT INTO `visitors` VALUES (1526, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:58:59', '2025-03-21 08:58:59');
INSERT INTO `visitors` VALUES (1527, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:59:02', '2025-03-21 08:59:02');
INSERT INTO `visitors` VALUES (1528, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 08:59:06', '2025-03-21 08:59:06');
INSERT INTO `visitors` VALUES (1529, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:00:37', '2025-03-21 09:00:37');
INSERT INTO `visitors` VALUES (1530, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:00:40', '2025-03-21 09:00:40');
INSERT INTO `visitors` VALUES (1531, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:00', '2025-03-21 09:01:00');
INSERT INTO `visitors` VALUES (1532, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:13', '2025-03-21 09:01:13');
INSERT INTO `visitors` VALUES (1533, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:16', '2025-03-21 09:01:16');
INSERT INTO `visitors` VALUES (1534, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:18', '2025-03-21 09:01:18');
INSERT INTO `visitors` VALUES (1535, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:21', '2025-03-21 09:01:21');
INSERT INTO `visitors` VALUES (1536, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:23', '2025-03-21 09:01:23');
INSERT INTO `visitors` VALUES (1537, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:26', '2025-03-21 09:01:26');
INSERT INTO `visitors` VALUES (1538, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:29', '2025-03-21 09:01:29');
INSERT INTO `visitors` VALUES (1539, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:31', '2025-03-21 09:01:31');
INSERT INTO `visitors` VALUES (1540, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:42', '2025-03-21 09:01:42');
INSERT INTO `visitors` VALUES (1541, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:45', '2025-03-21 09:01:45');
INSERT INTO `visitors` VALUES (1542, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:01:52', '2025-03-21 09:01:52');
INSERT INTO `visitors` VALUES (1543, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:02:07', '2025-03-21 09:02:07');
INSERT INTO `visitors` VALUES (1544, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:02:19', '2025-03-21 09:02:19');
INSERT INTO `visitors` VALUES (1545, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:02:21', '2025-03-21 09:02:21');
INSERT INTO `visitors` VALUES (1546, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'show-cart', '2025-03-21 09:02:30', '2025-03-21 09:02:30');
INSERT INTO `visitors` VALUES (1547, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:03:07', '2025-03-21 09:03:07');
INSERT INTO `visitors` VALUES (1548, NULL, NULL, NULL, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'show-cart', '2025-03-21 09:03:07', '2025-03-21 09:03:07');
INSERT INTO `visitors` VALUES (1549, NULL, NULL, NULL, '127.0.0.1', 'http://127.0.0.1:8000/show-cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 09:03:10', '2025-03-21 09:03:10');
INSERT INTO `visitors` VALUES (1550, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 11:46:51', '2025-03-21 11:46:51');
INSERT INTO `visitors` VALUES (1551, NULL, NULL, NULL, '127.0.0.1', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '/', '2025-03-21 11:47:02', '2025-03-21 11:47:02');

SET FOREIGN_KEY_CHECKS = 1;
