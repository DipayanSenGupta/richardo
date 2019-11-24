-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2019 at 03:16 AM
-- Server version: 5.6.44-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sswarehousesPos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` enum('saving_current','capital') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'edited', 6, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-21 23:12:01', '2019-11-21 23:12:01'),
(2, 'default', 'edited', 7, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-21 23:15:15', '2019-11-21 23:15:15'),
(3, 'default', 'edited', 7, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-21 23:17:58', '2019-11-21 23:17:58'),
(4, 'default', 'edited', 6, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:21:31', '2019-11-22 00:21:31'),
(5, 'default', 'edited', 10, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:30:54', '2019-11-22 00:30:54'),
(6, 'default', 'edited', 10, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:31:43', '2019-11-22 00:31:43'),
(7, 'default', 'edited', 10, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:33:00', '2019-11-22 00:33:00'),
(8, 'default', 'edited', 6, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:36:28', '2019-11-22 00:36:28'),
(9, 'default', 'edited', 6, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:38:07', '2019-11-22 00:38:07'),
(10, 'default', 'edited', 13, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-22 00:53:08', '2019-11-22 00:53:08'),
(11, 'default', 'edited', 20, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-23 21:07:00', '2019-11-23 21:07:00'),
(12, 'default', 'edited', 22, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(13, 'default', 'edited', 8, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-23 23:51:43', '2019-11-23 23:51:43'),
(14, 'default', 'edited', 8, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(15, 'default', 'edited', 9, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(16, 'default', 'edited', 24, 'App\\Transaction', 1, 'App\\User', '[]', '2019-11-24 19:28:51', '2019-11-24 19:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.7500, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.1562, 2, 0, 0, 20, NULL, '2017-12-18 13:13:44', '2017-12-18 13:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.2198, 0.0000, 0.1400, 3, 0, 0, 30, NULL, '2017-12-18 13:04:39', '2017-12-18 13:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 12:55:40', '2017-12-18 12:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 12:58:40', '2017-12-18 12:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 12:51:10', '2017-12-18 12:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 12:51:10', '2017-12-18 12:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Brand 1', 'Brand 1', 1, NULL, '2019-11-21 22:28:55', '2019-11-21 22:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'sswarehouse', 134, '2019-11-21', NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Dhaka', 1, 'fifo', '0.00', 'includes', '1574318915_13770518_653212391499359_2924854886557270332_n.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', NULL, 'd-m-Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null}}', 1, '2019-11-21 19:18:35', '2019-11-24 22:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'sswarehouse', 'Banani', 'Bangladesh', 'Dhaka', 'Dhaka', '1212', 1, 1, 1, 'browser', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2019-11-21 19:18:36', '2019-11-21 19:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `cache_items`
--

CREATE TABLE `cache_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Category one', 1, 'cat-one', 0, 1, NULL, '2019-11-21 22:26:02', '2019-11-21 22:26:02'),
(2, 'Category two', 1, 'cat-two', 0, 1, NULL, '2019-11-21 22:26:30', '2019-11-21 22:27:03'),
(3, 'Category three', 1, 'cat-three', 0, 1, NULL, '2019-11-21 22:26:45', '2019-11-21 22:27:15'),
(4, 'Subcategory one', 1, 'sub-one', 1, 1, NULL, '2019-11-21 22:27:45', '2019-11-21 22:27:56'),
(5, 'Subcategory two', 1, 'sub-two', 2, 1, NULL, '2019-11-21 22:28:19', '2019-11-21 22:28:19'),
(6, 'Subcategory three', 1, 'sub-three', 3, 1, NULL, '2019-11-21 22:28:37', '2019-11-21 22:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('supplier','customer','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `email`, `contact_id`, `tax_number`, `city`, `state`, `country`, `landmark`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, 'CO0001', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 19:18:35', '2019-11-21 19:18:35'),
(2, 1, 'customer', NULL, 'himel', NULL, 'CO0002', NULL, NULL, NULL, NULL, NULL, '01680037057', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 22:37:07', '2019-11-21 22:37:07'),
(3, 1, 'customer', NULL, 'Rahul', NULL, 'CO0003', NULL, NULL, NULL, NULL, NULL, '01680037059', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 23:46:04', '2019-11-21 23:46:04'),
(4, 1, 'customer', NULL, 'dip', NULL, 'CO0004', NULL, NULL, NULL, NULL, NULL, '01680037089', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-22 00:30:40', '2019-11-22 00:30:40'),
(5, 1, 'customer', NULL, 'Emon', NULL, 'CO0005', NULL, NULL, NULL, NULL, NULL, '01680037078', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-22 00:50:22', '2019-11-22 00:50:22'),
(6, 1, 'customer', NULL, 'Jahan', NULL, 'CO0006', NULL, NULL, NULL, NULL, NULL, '01680037047', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 20:34:56', '2019-11-23 20:34:56'),
(7, 1, 'customer', NULL, 'Nurjanan', NULL, 'CO0007', NULL, NULL, NULL, NULL, NULL, '01680037067', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 20:43:44', '2019-11-23 20:43:44'),
(8, 1, 'customer', NULL, 'Karun', NULL, 'CO0008', NULL, NULL, NULL, NULL, NULL, '01680037099', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 20:54:08', '2019-11-23 20:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', 'Tk', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MX', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_bookings`
--

CREATE TABLE `event_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_menu_id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `booking_time` datetime NOT NULL,
  `event_time` datetime NOT NULL,
  `booking_status` enum('Proposed','Final','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_bookings`
--

INSERT INTO `event_bookings` (`id`, `event_menu_id`, `business_id`, `booking_time`, `event_time`, `booking_status`, `booking_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-11-24 09:45:43', '2019-11-24 09:46:00', 'Completed', NULL, '2019-11-24 03:47:10', '2019-11-24 03:47:10'),
(3, 17, 1, '2019-11-24 12:16:00', '2019-11-30 12:16:00', 'Proposed', 'Keyamots wedding Celberation', '2019-11-24 19:28:51', '2019-11-24 19:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `event_menus`
--

CREATE TABLE `event_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendences` int(11) NOT NULL,
  `booking_time` datetime NOT NULL,
  `event_time` datetime NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_menus`
--

INSERT INTO `event_menus` (`id`, `name`, `type`, `venue`, `attendences`, `booking_time`, `event_time`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 'Rahats wedding', 'wedding', 'PSC', 300, '2019-11-21 15:33:00', '2019-11-21 15:34:00', 6, '2019-11-21 22:36:27', '2019-11-21 22:36:27'),
(3, 'Rahats reception', 'Rahats Holud', 'ICCB', 700, '2019-11-21 15:38:00', '2019-11-23 15:38:00', 8, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(4, 'Farahs wedding', 'Holud', 'sd', 700, '2019-11-21 16:45:00', '2019-11-23 16:46:00', 9, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(5, 'fateh alis wedding', 'Wedding', 'Rawa', 700, '2019-11-21 17:28:00', '2019-11-23 17:29:00', 11, '2019-11-22 00:29:49', '2019-11-22 00:29:49'),
(6, 'fateh alis wedding', 'Wedding', 'Rawa', 700, '2019-11-21 17:28:00', '2019-11-23 17:29:00', 10, '2019-11-22 00:29:49', '2019-11-22 00:29:49'),
(7, 'tasnias holud', 'Holud', 'ICCB', 700, '2019-11-21 17:40:00', '2019-11-22 17:40:00', 12, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(8, 'Farahs wedding', 'Farahs wedding', 'BCCI', 900, '2019-11-21 17:49:00', '2019-11-22 17:50:00', 13, '2019-11-22 00:51:18', '2019-11-22 00:51:18'),
(9, 'fateh alis wedding', 'Wedding', 'Emanuels', 900, '2019-11-21 17:51:00', '2019-11-23 17:51:00', 14, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(10, 'rahats reception', 'reception', 'Sena Maloncho', 500, '2019-11-21 17:59:00', '2019-11-28 17:59:00', 15, '2019-11-22 01:00:45', '2019-11-22 01:00:45'),
(11, 'Himels holud', 'holud', 'Herman', 500, '2019-11-21 18:01:00', '2019-11-30 18:02:00', 16, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(12, 'Dip\'s Wedding', 'Wedding', 'Rawa Convention, Mohakhali, Dhaka', 300, '2019-11-21 18:16:00', '2019-11-22 20:16:00', 17, '2019-11-22 01:21:09', '2019-11-22 01:21:09'),
(13, 'Jahan\'s Reception', 'Reception', 'ShenaKunjo', 500, '2019-11-23 13:34:00', '2019-11-25 13:35:00', 19, '2019-11-23 20:37:04', '2019-11-23 20:37:04'),
(14, 'Jahan\'s Reception', 'Reception', 'ShenaKunjo', 500, '2019-11-23 13:34:00', '2019-11-25 13:35:00', 20, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(15, 'Nurjahans holud', 'Holud', 'Emanuels', 500, '2019-11-23 13:43:00', '2019-11-28 13:43:00', 21, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(16, 'Karuns Reception', 'Reception', 'Jatrabi Biye Ghor', 500, '2019-11-23 13:53:00', '2019-11-27 13:54:00', 22, '2019-11-23 20:55:20', '2019-11-23 20:55:20'),
(17, 'Keyamots wedding', 'Wedding', 'PSC', 700, '2019-11-24 12:16:00', '2019-11-30 12:16:00', 24, '2019-11-24 19:19:00', '2019-11-24 19:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `event_menu_items`
--

CREATE TABLE `event_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_menu_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_menu_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groceries`
--

INSERT INTO `groceries` (`id`, `name`, `quantity`, `event_menu_id`, `created_at`, `updated_at`) VALUES
(1999, 'Eggs', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2000, 'Margarine', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2001, 'Uncooked ground beef', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2002, 'Shelf stable fish and seafood', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2003, 'Rice, pasta, cornmeal\n', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2004, 'Frankfurters\n', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2005, 'Bread', '5', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2006, 'Oranges, including tangerines', '12', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2007, 'Apples', '14', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2008, 'Prescription drugs', '14', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2009, 'Canned vegetables', '12', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2010, 'Pet food', '12', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2011, 'Roasted coffee', '2', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2012, 'Potatoes', '2', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2013, 'Bakery products', '53', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2014, 'Propane, kerosene and firewood', '12', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2015, 'Flour and prepared flour mixes', '12', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2016, 'Bacon and related products', '12', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2017, 'Fresh, whole chicken', '32', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2018, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2019, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2020, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2021, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2022, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2023, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2024, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2025, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2026, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2027, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2028, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2029, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2030, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2031, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2032, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2033, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2034, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2035, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2036, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2037, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2038, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2039, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2040, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2041, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2042, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2043, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2044, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2045, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2046, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2047, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2048, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2049, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2050, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2051, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2052, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2053, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2054, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2055, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2056, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2057, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2058, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2059, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2060, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2061, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2062, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2063, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2064, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2065, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2066, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2067, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2068, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2069, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2070, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2071, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2072, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2073, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2074, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2075, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2076, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2077, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2078, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2079, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2080, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2081, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2082, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2083, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2084, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2085, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2086, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2087, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2088, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2089, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2090, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2091, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2092, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2093, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2094, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2095, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2096, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2097, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2098, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2099, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2100, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2101, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2102, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2103, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2104, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2105, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2106, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2107, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2108, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2109, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2110, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2111, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2112, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2113, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2114, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2115, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2116, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2117, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2118, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2119, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2120, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2121, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2122, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2123, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2124, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2125, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2126, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2127, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2128, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2129, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2130, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2131, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2132, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2133, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2134, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2135, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2136, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2137, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2138, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2139, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2140, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2141, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2142, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2143, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2144, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2145, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2146, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2147, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2148, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2149, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2150, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2151, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2152, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2153, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2154, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2155, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2156, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2157, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2158, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2159, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2160, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2161, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2162, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2163, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2164, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2165, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2166, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2167, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2168, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2169, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2170, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2171, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2172, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2173, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2174, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2175, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2176, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2177, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2178, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2179, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2180, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2181, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2182, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2183, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2184, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2185, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2186, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2187, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2188, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2189, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2190, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2191, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2192, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2193, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2194, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2195, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2196, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2197, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2198, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2199, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2200, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2201, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2202, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2203, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2204, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2205, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2206, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2207, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2208, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2209, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2210, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2211, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2212, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2213, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2214, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2215, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2216, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2217, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2218, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2219, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2220, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2221, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2222, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2223, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2224, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2225, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2226, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2227, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2228, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2229, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2230, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2231, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2232, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2233, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2234, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2235, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2236, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2237, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2238, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2239, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2240, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2241, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2242, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2243, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2244, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2245, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2246, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2247, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2248, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2249, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2250, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2251, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2252, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2253, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2254, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2255, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2256, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2257, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2258, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2259, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2260, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2261, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2262, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2263, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2264, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2265, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2266, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2267, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2268, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2269, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2270, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2271, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2272, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2273, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2274, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2275, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2276, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2277, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2278, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2279, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2280, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2281, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2282, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2283, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2284, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2285, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2286, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2287, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2288, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2289, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2290, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2291, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2292, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2293, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2294, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2295, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2296, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2297, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2298, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2299, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2300, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2301, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2302, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2303, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2304, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2305, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2306, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2307, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2308, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2309, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2310, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2311, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2312, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2313, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2314, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2315, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2316, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2317, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2318, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2319, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2320, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2321, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2322, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2323, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2324, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2325, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2326, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2327, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2328, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2329, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2330, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2331, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2332, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2333, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2334, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2335, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2336, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2337, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2338, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2339, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2340, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2341, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2342, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2343, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2344, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2345, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2346, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2347, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2348, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2349, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2350, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2351, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2352, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2353, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2354, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2355, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2356, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2357, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2358, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2359, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2360, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2361, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2362, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2363, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2364, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2365, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2366, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2367, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2368, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2369, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2370, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2371, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2372, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2373, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2374, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2375, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2376, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2377, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2378, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2379, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2380, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2381, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2382, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2383, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2384, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2385, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2386, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2387, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2388, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2389, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2390, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2391, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2392, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2393, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2394, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2395, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2396, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2397, 'n.a', '0', 3, '2019-11-21 22:39:39', '2019-11-21 22:39:39'),
(2398, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2399, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2400, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2401, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2402, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2403, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2404, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2405, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2406, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2407, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2408, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2409, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2410, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2411, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2412, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2413, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2414, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2415, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2416, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2417, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2418, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2419, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2420, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2421, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2422, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2423, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2424, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2425, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2426, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2427, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2428, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2429, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2430, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2431, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2432, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2433, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2434, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2435, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2436, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2437, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2438, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2439, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2440, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2441, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2442, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2443, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2444, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2445, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2446, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2447, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2448, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2449, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2450, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2451, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2452, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2453, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2454, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2455, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2456, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2457, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2458, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2459, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2460, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2461, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2462, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2463, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2464, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2465, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2466, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2467, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2468, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2469, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2470, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2471, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2472, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2473, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2474, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2475, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2476, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2477, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2478, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2479, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2480, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2481, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2482, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2483, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2484, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2485, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2486, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2487, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2488, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2489, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2490, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2491, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2492, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2493, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2494, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2495, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2496, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2497, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2498, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2499, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2500, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2501, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2502, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2503, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2504, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2505, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2506, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2507, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2508, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2509, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2510, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2511, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2512, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2513, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2514, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2515, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2516, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2517, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2518, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2519, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2520, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2521, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2522, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2523, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2524, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2525, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2526, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2527, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2528, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2529, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2530, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2531, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2532, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2533, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2534, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2535, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2536, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2537, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2538, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2539, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2540, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2541, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2542, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2543, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2544, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2545, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2546, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2547, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2548, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2549, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2550, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2551, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2552, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2553, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2554, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2555, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2556, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2557, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2558, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2559, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2560, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2561, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2562, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2563, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2564, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2565, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2566, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2567, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2568, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2569, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2570, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2571, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2572, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2573, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2574, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2575, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2576, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2577, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2578, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2579, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2580, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2581, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2582, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2583, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2584, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2585, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2586, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2587, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2588, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2589, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2590, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2591, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2592, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2593, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2594, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2595, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2596, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2597, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2598, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2599, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2600, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2601, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2602, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2603, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2604, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2605, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2606, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2607, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2608, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2609, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2610, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2611, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2612, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2613, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2614, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2615, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2616, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2617, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2618, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2619, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2620, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2621, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2622, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2623, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2624, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2625, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2626, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2627, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2628, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2629, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2630, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2631, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2632, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2633, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2634, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2635, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2636, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2637, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2638, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2639, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2640, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2641, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2642, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2643, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2644, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2645, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2646, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2647, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2648, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2649, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2650, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2651, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2652, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2653, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2654, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2655, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2656, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2657, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2658, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2659, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2660, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2661, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2662, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2663, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2664, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2665, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2666, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2667, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2668, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2669, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2670, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2671, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2672, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2673, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2674, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2675, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2676, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2677, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2678, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2679, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2680, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2681, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2682, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2683, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2684, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2685, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2686, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2687, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2688, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2689, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2690, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2691, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2692, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2693, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2694, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2695, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2696, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2697, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2698, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2699, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2700, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2701, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2702, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2703, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2704, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2705, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2706, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2707, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2708, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2709, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2710, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2711, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2712, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2713, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2714, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2715, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2716, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2717, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2718, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2719, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2720, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2721, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2722, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2723, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2724, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2725, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2726, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2727, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2728, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2729, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2730, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2731, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2732, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2733, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2734, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2735, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2736, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2737, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2738, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40');
INSERT INTO `groceries` (`id`, `name`, `quantity`, `event_menu_id`, `created_at`, `updated_at`) VALUES
(2739, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2740, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2741, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2742, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2743, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2744, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2745, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2746, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2747, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2748, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2749, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2750, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2751, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2752, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2753, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2754, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2755, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2756, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2757, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2758, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2759, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2760, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2761, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2762, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2763, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2764, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2765, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2766, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2767, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2768, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2769, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2770, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2771, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2772, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2773, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2774, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2775, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2776, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2777, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2778, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2779, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2780, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2781, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2782, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2783, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2784, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2785, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2786, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2787, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2788, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2789, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2790, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2791, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2792, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2793, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2794, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2795, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2796, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2797, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2798, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2799, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2800, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2801, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2802, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2803, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2804, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2805, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2806, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2807, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2808, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2809, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2810, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2811, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2812, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2813, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2814, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2815, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2816, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2817, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2818, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2819, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2820, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2821, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2822, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2823, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2824, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2825, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2826, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2827, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2828, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2829, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2830, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2831, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2832, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2833, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2834, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2835, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2836, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2837, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2838, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2839, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2840, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2841, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2842, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2843, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2844, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2845, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2846, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2847, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2848, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2849, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2850, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2851, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2852, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2853, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2854, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2855, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2856, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2857, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2858, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2859, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2860, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2861, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2862, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2863, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2864, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2865, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2866, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2867, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2868, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2869, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2870, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2871, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2872, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2873, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2874, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2875, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2876, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2877, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2878, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2879, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2880, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2881, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2882, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2883, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2884, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2885, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2886, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2887, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2888, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2889, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2890, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2891, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2892, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2893, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2894, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2895, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2896, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2897, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2898, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2899, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2900, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2901, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2902, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2903, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2904, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2905, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2906, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2907, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2908, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2909, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2910, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2911, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2912, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2913, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2914, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2915, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2916, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2917, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2918, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2919, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2920, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2921, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2922, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2923, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2924, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2925, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2926, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2927, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2928, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2929, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2930, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2931, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2932, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2933, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2934, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2935, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2936, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2937, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2938, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2939, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2940, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2941, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2942, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2943, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2944, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2945, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2946, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2947, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2948, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2949, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2950, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2951, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2952, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2953, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2954, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2955, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2956, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2957, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2958, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2959, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2960, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2961, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2962, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2963, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2964, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2965, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2966, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2967, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2968, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2969, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2970, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2971, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2972, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2973, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2974, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2975, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2976, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2977, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2978, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2979, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2980, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2981, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2982, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2983, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2984, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2985, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2986, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2987, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2988, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2989, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2990, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2991, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2992, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2993, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2994, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2995, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2996, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(2997, 'n.a', '0', 3, '2019-11-21 22:39:40', '2019-11-21 22:39:40'),
(3015, 'Eg', '5', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3016, 'Shelf stable fish and seafood', '5', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3017, 'Rice, pasta, cornmeal\n', '5', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3018, 'Frankfurters\n', '5', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3019, 'Bread', '5', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3020, 'Oranges, including tangerines', '12', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3021, 'Apples', '14', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3022, 'Prescription drugs', '14', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3023, 'Canned vegetables', '12', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3024, 'Pet food', '12', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3025, 'Roasted coffee', '2', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3026, 'Potatoes', '2', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3027, 'Bakery products', '53', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3028, 'Propane, kerosene and firewood', '12', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3029, 'Flour and prepared flour mixes', '12', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3030, 'Bacon and related products', '12', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3031, 'Fresh, whole chicken', '32', 4, '2019-11-21 23:46:39', '2019-11-21 23:46:39'),
(3050, 'Eg', '5', 5, '2019-11-22 00:29:49', '2019-11-22 00:29:49'),
(3054, 'Shelf stable fish and seafood', '5', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3055, 'Rice, pasta, cornmeal\n', '5', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3057, 'Frankfurters\n', '5', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3059, 'Bread', '5', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3061, 'Oranges, including tangerines', '12', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3063, 'Apples', '14', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3065, 'Prescription drugs', '14', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3067, 'Canned vegetables', '12', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3069, 'Pet food', '12', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3071, 'Roasted coffee', '2', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3073, 'Potatoes', '2', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3075, 'Bakery products', '53', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3077, 'Propane, kerosene and firewood', '12', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3079, 'Flour and prepared flour mixes', '12', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3081, 'Bacon and related products', '12', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3082, 'Fresh, whole chicken', '32', 5, '2019-11-22 00:29:50', '2019-11-22 00:29:50'),
(3117, 'Eg', '5', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3118, 'Shelf stable fish and seafood', '5', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3119, 'Rice, pasta, cornmeal\n', '5', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3120, 'Frankfurters\n', '5', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3121, 'Bread', '5', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3122, 'Oranges, including tangerines', '12', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3123, 'Apples', '14', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3124, 'Prescription drugs', '14', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3125, 'Canned vegetables', '12', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3126, 'Pet food', '12', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3127, 'Roasted coffee', '2', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3128, 'Potatoes', '2', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3129, 'Bakery products', '53', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3130, 'Propane, kerosene and firewood', '12', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3131, 'Flour and prepared flour mixes', '12', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3132, 'Bacon and related products', '12', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3133, 'Fresh, whole chicken', '32', 7, '2019-11-22 00:41:17', '2019-11-22 00:41:17'),
(3151, 'Eg', '5', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3152, 'Shelf stable fish and seafood', '5', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3153, 'Rice, pasta, cornmeal\n', '5', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3154, 'Frankfurters\n', '5', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3155, 'Bread', '5', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3156, 'Oranges, including tangerines', '12', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3157, 'Apples', '14', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3158, 'Prescription drugs', '14', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3159, 'Canned vegetables', '12', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3160, 'Pet food', '12', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3161, 'Roasted coffee', '2', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3162, 'Potatoes', '2', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3163, 'Bakery products', '53', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3164, 'Propane, kerosene and firewood', '12', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3165, 'Flour and prepared flour mixes', '12', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3166, 'Bacon and related products', '12', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3167, 'Fresh, whole chicken', '32', 9, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(3168, 'Eg', '5', 10, '2019-11-22 01:00:46', '2019-11-22 01:00:46'),
(3169, 'Shelf stable fish and seafood', '5', 10, '2019-11-22 01:00:46', '2019-11-22 01:00:46'),
(3170, 'Rice, pasta, cornmeal\n', '5', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3171, 'Frankfurters\n', '5', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3172, 'Bread', '5', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3173, 'Oranges, including tangerines', '12', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3174, 'Apples', '14', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3175, 'Prescription drugs', '14', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3176, 'Canned vegetables', '12', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3177, 'Pet food', '12', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3178, 'Roasted coffee', '2', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3179, 'Potatoes', '2', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3180, 'Bakery products', '53', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3181, 'Propane, kerosene and firewood', '12', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3182, 'Flour and prepared flour mixes', '12', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3183, 'Bacon and related products', '12', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3184, 'Fresh, whole chicken', '32', 10, '2019-11-22 01:00:48', '2019-11-22 01:00:48'),
(3185, 'Eg', '5', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3186, 'Shelf stable fish and seafood', '5', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3187, 'Rice, pasta, cornmeal\n', '5', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3188, 'Frankfurters\n', '5', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3189, 'Bread', '5', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3190, 'Oranges, including tangerines', '12', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3191, 'Apples', '14', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3192, 'Prescription drugs', '14', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3193, 'Canned vegetables', '12', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3194, 'Pet food', '12', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3195, 'Roasted coffee', '2', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3196, 'Potatoes', '2', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3197, 'Bakery products', '53', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3198, 'Propane, kerosene and firewood', '12', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3199, 'Flour and prepared flour mixes', '12', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3200, 'Bacon and related products', '12', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3201, 'Fresh, whole chicken', '32', 11, '2019-11-22 01:02:45', '2019-11-22 01:02:45'),
(3202, 'n.a', '0', 12, '2019-11-22 01:21:09', '2019-11-22 01:21:09'),
(3203, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3204, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3205, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3206, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3207, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3208, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3209, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3210, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3211, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3212, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3213, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3214, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3215, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3216, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3217, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3218, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3219, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3220, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3221, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3222, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3223, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3224, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3225, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3226, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3227, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3228, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3229, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3230, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3231, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3232, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3233, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3234, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3235, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3236, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3237, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3238, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3239, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3240, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3241, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3242, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3243, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3244, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3245, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3246, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3247, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3248, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3249, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3250, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3251, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3252, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3253, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3254, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3255, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3256, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3257, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3258, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3259, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3260, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3261, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3262, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3263, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3264, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3265, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3266, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3267, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3268, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3269, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3270, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3271, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3272, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3273, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3274, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3275, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3276, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3277, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3278, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3279, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3280, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3281, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3282, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3283, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3284, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3285, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3286, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3287, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3288, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3289, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3290, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3291, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3292, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3293, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3294, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3295, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3296, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3297, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3298, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3299, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3300, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3301, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3302, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3303, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3304, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3305, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3306, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3307, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3308, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3309, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3310, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3311, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3312, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3313, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3314, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3315, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3316, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3317, 'n.a', 'W', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3318, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3319, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3320, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3321, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3322, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3323, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3324, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3325, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3326, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3327, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3328, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3329, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3330, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3331, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3332, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3333, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3334, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3335, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3336, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3337, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3338, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3339, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3340, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3341, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3342, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3343, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3344, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3345, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3346, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3347, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3348, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3349, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3350, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3351, 'n.a', 'uV', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3352, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3353, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3354, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3355, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3356, ' ', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3357, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3358, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3359, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3360, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3361, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3362, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3363, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3364, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3365, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3366, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3367, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3368, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3369, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3370, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3371, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3372, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3373, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3374, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3375, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3376, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3377, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3378, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3379, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3380, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3381, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3382, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3383, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3384, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3385, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3386, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3387, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3388, 'X\0', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3389, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3390, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3391, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3392, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3393, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3394, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3395, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3396, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3397, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3398, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3399, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3400, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3401, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3402, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3403, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3404, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3405, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3406, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3407, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3408, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3409, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3410, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3411, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3412, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3413, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3414, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3415, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3416, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3417, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3418, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3419, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3420, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3421, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3422, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3423, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3424, 'n.a', '0', 12, '2019-11-22 01:21:10', '2019-11-22 01:21:10'),
(3425, 'Eg', '5', 13, '2019-11-23 20:37:04', '2019-11-23 20:37:04'),
(3426, 'Shelf stable fish and seafood', '5', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3427, 'Rice, pasta, cornmeal\n', '5', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3428, 'Frankfurters\n', '5', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3429, 'Bread', '5', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3430, 'Oranges, including tangerines', '12', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3431, 'Apples', '14', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3432, 'Prescription drugs', '14', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3433, 'Canned vegetables', '12', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3434, 'Pet food', '12', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3435, 'Roasted coffee', '2', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3436, 'Potatoes', '2', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3437, 'Bakery products', '53', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3438, 'Propane, kerosene and firewood', '12', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3439, 'Flour and prepared flour mixes', '12', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3440, 'Bacon and related products', '12', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3441, 'Fresh, whole chicken', '32', 13, '2019-11-23 20:37:05', '2019-11-23 20:37:05'),
(3442, 'Eg', '5', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3443, 'Shelf stable fish and seafood', '5', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3444, 'Rice, pasta, cornmeal\n', '5', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3445, 'Frankfurters\n', '5', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3446, 'Bread', '5', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3447, 'Oranges, including tangerines', '12', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3448, 'Apples', '14', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3449, 'Prescription drugs', '14', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3450, 'Canned vegetables', '12', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3451, 'Pet food', '12', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3452, 'Roasted coffee', '2', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3453, 'Potatoes', '2', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3454, 'Bakery products', '53', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3455, 'Propane, kerosene and firewood', '12', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3456, 'Flour and prepared flour mixes', '12', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3457, 'Bacon and related products', '12', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3458, 'Fresh, whole chicken', '32', 14, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(3459, 'Eg', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3460, 'Shelf stable fish and seafood', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3461, 'Rice, pasta, cornmeal\n', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3462, 'Frankfurters\n', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3463, 'Bread', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3464, 'Oranges, including tangerines', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3465, 'Apples', '14', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3466, 'Prescription drugs', '14', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3467, 'Canned vegetables', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3468, 'Pet food', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3469, 'Roasted coffee', '2', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3470, 'Potatoes', '2', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3471, 'Bakery products', '53', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3472, 'Propane, kerosene and firewood', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3473, 'Flour and prepared flour mixes', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3474, 'Bacon and related products', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3475, 'Fresh, whole chicken', '32', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3476, 'Eg', '5', 16, '2019-11-23 20:55:20', '2019-11-23 20:55:20'),
(3477, 'Shelf stable fish and seafood', '5', 16, '2019-11-23 20:55:20', '2019-11-23 20:55:20'),
(3478, 'Rice, pasta, cornmeal\n', '5', 16, '2019-11-23 20:55:20', '2019-11-23 20:55:20'),
(3479, 'Frankfurters\n', '5', 16, '2019-11-23 20:55:20', '2019-11-23 20:55:20'),
(3480, 'Bread', '5', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3481, 'Oranges, including tangerines', '12', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3482, 'Apples', '14', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3483, 'Prescription drugs', '14', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3484, 'Canned vegetables', '12', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3485, 'Pet food', '12', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3486, 'Roasted coffee', '2', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3487, 'Potatoes', '2', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3488, 'Bakery products', '53', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3489, 'Propane, kerosene and firewood', '12', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3490, 'Flour and prepared flour mixes', '12', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3491, 'Bacon and related products', '12', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3492, 'Fresh, whole chicken', '32', 16, '2019-11-23 20:55:21', '2019-11-23 20:55:21'),
(3493, 'Eg', '5', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3494, 'Shelf stable fish and seafood', '5', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3495, 'Rice, pasta, cornmeal\n', '5', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3496, 'Frankfurters\n', '5', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3497, 'Bread', '5', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3498, 'Oranges, including tangerines', '12', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3499, 'Apples', '14', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3500, 'Prescription drugs', '14', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3501, 'Canned vegetables', '12', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3502, 'Pet food', '12', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3503, 'Roasted coffee', '2', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3504, 'Potatoes', '2', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3505, 'Bakery products', '53', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3506, 'Propane, kerosene and firewood', '12', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3507, 'Flour and prepared flour mixes', '12', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3508, 'Bacon and related products', '12', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(3509, 'Fresh, whole chicken', '32', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, 1, 1, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2019-11-21 19:18:36', '2019-11-21 19:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 13, 4, 1, '2019-11-21 19:18:36', '2019-11-24 19:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_menu_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `quantity`, `event_menu_id`, `created_at`, `updated_at`) VALUES
(2, 'Eg', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(3, 'Shelf stable fish and seafood', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(4, 'Rice, pasta, cornmeal\n', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(5, 'Frankfurters\n', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(6, 'Bread', '5', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(7, 'Oranges, including tangerines', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(8, 'Apples', '14', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(9, 'Prescription drugs', '14', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(10, 'Canned vegetables', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(11, 'Pet food', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(12, 'Roasted coffee', '2', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(13, 'Potatoes', '2', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(14, 'Bakery products', '53', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(15, 'Propane, kerosene and firewood', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(16, 'Flour and prepared flour mixes', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(17, 'Bacon and related products', '12', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(18, 'Fresh, whole chicken', '32', 15, '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(36, 'Bhuna Khichuri', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(37, 'Bread', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(38, 'Rice with Curry', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(39, 'Vorta', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(40, 'Daal', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(41, 'Grilled Chicken with Naan Roti', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(42, 'Haleem', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(43, 'Sheek Kabab', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(44, 'Fuchka', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(45, 'Misti Doi', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(46, 'Doi Chira', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(47, 'Rasmalai', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(48, 'Borhani', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(49, 'Sweet Lassi', '15kg', 16, '2019-11-23 21:09:31', '2019-11-23 21:09:31'),
(50, 'Bhuna Khichuri', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(51, 'Bread', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(52, 'Rice with Curry', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(53, 'Vorta', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(54, 'Daal', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(55, 'Grilled Chicken with Naan Roti', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(56, 'Haleem', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(57, 'Sheek Kabab', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(58, 'Fuchka', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(59, 'Misti Doi', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(60, 'Doi Chira', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(61, 'Rasmalai', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(62, 'Borhani', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(63, 'Sweet Lassi', '15kg', 3, '2019-11-23 23:52:45', '2019-11-23 23:52:45'),
(64, 'Paratha', '15 kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(65, 'Kachchi Biryani', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(66, 'Bhuna Khichuri', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(67, 'Bread', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(68, 'Morog Polao', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(69, 'Rice with Curry', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(70, 'Vorta', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(71, 'Vaji', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(72, 'Daal', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(73, 'Grilled Chicken with Naan Roti', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(74, 'Haleem', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(75, 'Sheek Kabab', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(76, 'Fuchka', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(77, 'Misti Doi', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(78, 'Doi Chira', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(79, 'Rasmalai', '15kg', 4, '2019-11-23 23:53:08', '2019-11-23 23:53:08'),
(80, 'Borhani', '15kg', 4, '2019-11-23 23:53:09', '2019-11-23 23:53:09'),
(81, 'Sweet Lassi', '15kg', 4, '2019-11-23 23:53:09', '2019-11-23 23:53:09'),
(82, 'Bhuna Khichuri', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(83, 'Bread', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(84, 'Rice with Curry', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(85, 'Vorta', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(86, 'Daal', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(87, 'Grilled Chicken with Naan Roti', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(88, 'Haleem', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(89, 'Sheek Kabab', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(90, 'Fuchka', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(91, 'Misti Doi', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(92, 'Doi Chira', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(93, 'Rasmalai', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(94, 'Borhani', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00'),
(95, 'Sweet Lassi', '15kg', 17, '2019-11-24 19:19:00', '2019-11-24 19:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_120612_change_all_quantity_field_type_to_decimal', 1),
(113, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(114, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(115, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(116, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(117, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(118, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(119, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(120, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(121, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(122, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(123, '2018_09_04_155900_create_accounts_table', 1),
(124, '2018_09_06_114438_create_selling_price_groups_table', 1),
(125, '2018_09_06_154057_create_variation_group_prices_table', 1),
(126, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(127, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(128, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(129, '2018_09_10_152703_create_account_transactions_table', 1),
(130, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(131, '2018_09_19_123914_create_notification_templates_table', 1),
(132, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(133, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(134, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(135, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(136, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(137, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(138, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(139, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(140, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(141, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(142, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(143, '2018_10_22_134428_modify_variable_product_data', 1),
(144, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(145, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(146, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(147, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(148, '2018_10_31_175627_add_user_contact_access', 1),
(149, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(150, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(151, '2018_11_08_105621_add_role_permissions', 1),
(152, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(153, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(154, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(155, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(156, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(157, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(158, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(159, '2018_12_14_103307_modify_system_table', 1),
(160, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(161, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(162, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(163, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(164, '2018_12_24_154933_create_notifications_table', 1),
(165, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(166, '2019_01_10_124645_add_account_permission', 1),
(167, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(168, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(169, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(170, '2019_02_19_103118_create_discounts_table', 1),
(171, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(172, '2019_02_21_134324_add_permission_for_discount', 1),
(173, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(174, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(175, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(176, '2019_03_12_120336_create_activity_log_table', 1),
(177, '2019_03_15_132925_create_media_table', 1),
(178, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(179, '2019_05_10_132311_add_missing_column_indexing', 1),
(180, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(181, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(182, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(183, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(184, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(185, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(186, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(187, '2019_07_15_165136_add_fields_for_combo_product', 1),
(188, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(189, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(190, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(191, '2019_08_08_162302_add_sub_units_related_fields', 1),
(192, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(193, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(194, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(195, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(202, '2019_11_05_100246_create_menus_table', 2),
(203, '2019_11_05_100259_create_items_table', 2),
(204, '2019_11_10_040909_create_event_menus_table', 2),
(205, '2019_11_10_041742_create_event_menu_items_table', 2),
(206, '2019_11_10_061927_create_cache_items_table', 2),
(207, '2019_11_19_162311_create_groceries_table', 2),
(209, '2019_11_23_115712_create_menu_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {paid_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {paid_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2019-11-21 19:18:36', '2019-11-21 19:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2019-11-21 19:16:20', NULL),
(2, 'direct_sell.access', 'web', '2019-11-21 19:16:20', NULL),
(3, 'product.opening_stock', 'web', '2019-11-21 19:16:21', '2019-11-21 19:16:21'),
(4, 'crud_all_bookings', 'web', '2019-11-21 19:16:21', '2019-11-21 19:16:21'),
(5, 'crud_own_bookings', 'web', '2019-11-21 19:16:21', '2019-11-21 19:16:21'),
(6, 'access_default_selling_price', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(7, 'purchase.payments', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(8, 'sell.payments', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(9, 'edit_product_price_from_sale_screen', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(11, 'roles.view', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(12, 'roles.create', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(13, 'roles.update', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(14, 'roles.delete', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(15, 'account.access', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(16, 'discount.access', 'web', '2019-11-21 19:16:22', '2019-11-21 19:16:22'),
(17, 'view_purchase_price', 'web', '2019-11-21 19:16:23', '2019-11-21 19:16:23'),
(18, 'view_own_sell_only', 'web', '2019-11-21 19:16:23', '2019-11-21 19:16:23'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2019-11-21 19:16:23', '2019-11-21 19:16:23'),
(20, 'edit_product_price_from_pos_screen', 'web', '2019-11-21 19:16:23', '2019-11-21 19:16:23'),
(21, 'user.view', 'web', '2019-11-21 19:16:23', NULL),
(22, 'user.create', 'web', '2019-11-21 19:16:23', NULL),
(23, 'user.update', 'web', '2019-11-21 19:16:23', NULL),
(24, 'user.delete', 'web', '2019-11-21 19:16:23', NULL),
(25, 'supplier.view', 'web', '2019-11-21 19:16:23', NULL),
(26, 'supplier.create', 'web', '2019-11-21 19:16:23', NULL),
(27, 'supplier.update', 'web', '2019-11-21 19:16:23', NULL),
(28, 'supplier.delete', 'web', '2019-11-21 19:16:23', NULL),
(29, 'customer.view', 'web', '2019-11-21 19:16:23', NULL),
(30, 'customer.create', 'web', '2019-11-21 19:16:23', NULL),
(31, 'customer.update', 'web', '2019-11-21 19:16:23', NULL),
(32, 'customer.delete', 'web', '2019-11-21 19:16:23', NULL),
(33, 'product.view', 'web', '2019-11-21 19:16:23', NULL),
(34, 'product.create', 'web', '2019-11-21 19:16:23', NULL),
(35, 'product.update', 'web', '2019-11-21 19:16:23', NULL),
(36, 'product.delete', 'web', '2019-11-21 19:16:23', NULL),
(37, 'purchase.view', 'web', '2019-11-21 19:16:23', NULL),
(38, 'purchase.create', 'web', '2019-11-21 19:16:23', NULL),
(39, 'purchase.update', 'web', '2019-11-21 19:16:23', NULL),
(40, 'purchase.delete', 'web', '2019-11-21 19:16:23', NULL),
(41, 'sell.view', 'web', '2019-11-21 19:16:23', NULL),
(42, 'sell.create', 'web', '2019-11-21 19:16:23', NULL),
(43, 'sell.update', 'web', '2019-11-21 19:16:23', NULL),
(44, 'sell.delete', 'web', '2019-11-21 19:16:23', NULL),
(45, 'purchase_n_sell_report.view', 'web', '2019-11-21 19:16:23', NULL),
(46, 'contacts_report.view', 'web', '2019-11-21 19:16:23', NULL),
(47, 'stock_report.view', 'web', '2019-11-21 19:16:23', NULL),
(48, 'tax_report.view', 'web', '2019-11-21 19:16:23', NULL),
(49, 'trending_product_report.view', 'web', '2019-11-21 19:16:23', NULL),
(50, 'register_report.view', 'web', '2019-11-21 19:16:23', NULL),
(51, 'sales_representative.view', 'web', '2019-11-21 19:16:23', NULL),
(52, 'expense_report.view', 'web', '2019-11-21 19:16:23', NULL),
(53, 'business_settings.access', 'web', '2019-11-21 19:16:23', NULL),
(54, 'barcode_settings.access', 'web', '2019-11-21 19:16:23', NULL),
(55, 'invoice_settings.access', 'web', '2019-11-21 19:16:23', NULL),
(56, 'brand.view', 'web', '2019-11-21 19:16:23', NULL),
(57, 'brand.create', 'web', '2019-11-21 19:16:23', NULL),
(58, 'brand.update', 'web', '2019-11-21 19:16:23', NULL),
(59, 'brand.delete', 'web', '2019-11-21 19:16:23', NULL),
(60, 'tax_rate.view', 'web', '2019-11-21 19:16:23', NULL),
(61, 'tax_rate.create', 'web', '2019-11-21 19:16:23', NULL),
(62, 'tax_rate.update', 'web', '2019-11-21 19:16:23', NULL),
(63, 'tax_rate.delete', 'web', '2019-11-21 19:16:23', NULL),
(64, 'unit.view', 'web', '2019-11-21 19:16:23', NULL),
(65, 'unit.create', 'web', '2019-11-21 19:16:23', NULL),
(66, 'unit.update', 'web', '2019-11-21 19:16:23', NULL),
(67, 'unit.delete', 'web', '2019-11-21 19:16:23', NULL),
(68, 'category.view', 'web', '2019-11-21 19:16:23', NULL),
(69, 'category.create', 'web', '2019-11-21 19:16:23', NULL),
(70, 'category.update', 'web', '2019-11-21 19:16:23', NULL),
(71, 'category.delete', 'web', '2019-11-21 19:16:23', NULL),
(72, 'expense.access', 'web', '2019-11-21 19:16:23', NULL),
(73, 'access_all_locations', 'web', '2019-11-21 19:16:23', NULL),
(74, 'dashboard.data', 'web', '2019-11-21 19:16:23', NULL),
(75, 'location.1', 'web', '2019-11-21 19:18:36', '2019-11-21 19:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'product 1', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, 1, '111', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-11-21 22:29:47', '2019-11-21 22:29:47'),
(2, 'product2', 1, 'single', 1, NULL, 1, 2, NULL, NULL, 'exclusive', 1, 1, '112', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-11-21 22:30:52', '2019-11-21 22:30:52'),
(3, 'product3', 1, 'single', 1, NULL, NULL, 3, 6, NULL, 'exclusive', 1, 1, '113', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-11-21 22:31:53', '2019-11-21 22:31:53'),
(4, 'product4', 1, 'single', 1, NULL, 1, 1, 4, NULL, 'exclusive', 1, 1, '114', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-11-21 22:32:48', '2019-11-21 22:32:48'),
(5, 'product5', 1, 'single', 1, NULL, 1, 2, 5, NULL, 'exclusive', 1, 1, '115', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-11-21 22:33:32', '2019-11-21 22:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2019-11-21 22:29:47', '2019-11-21 22:29:47'),
(2, NULL, 'DUMMY', 2, 1, '2019-11-21 22:30:52', '2019-11-21 22:30:52'),
(3, NULL, 'DUMMY', 3, 1, '2019-11-21 22:31:53', '2019-11-21 22:31:53'),
(4, NULL, 'DUMMY', 4, 1, '2019-11-21 22:32:48', '2019-11-21 22:32:48'),
(5, NULL, 'DUMMY', 5, 1, '2019-11-21 22:33:32', '2019-11-21 22:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1000, '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '16.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 22:30:00', '2019-11-24 19:18:58'),
(2, 2, 2, 2, 1000, '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '14.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 22:31:26', '2019-11-24 19:18:59'),
(3, 3, 3, 3, 1000, '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '12.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 22:32:05', '2019-11-23 20:55:19'),
(4, 4, 4, 4, 1000, '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 22:33:02', '2019-11-24 19:17:47'),
(5, 5, 5, 5, 1000, '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '7.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 22:33:46', '2019-11-22 01:21:07'),
(6, 1, 1, 1, 100, '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-22 02:00:06', '2019-11-24 19:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 8, 1, '2019-11-21 19:18:35', '2019-11-23 20:54:08'),
(2, 'business_location', 1, 1, '2019-11-21 19:18:36', '2019-11-21 19:18:36'),
(3, 'sell_payment', 13, 1, '2019-11-21 22:36:22', '2019-11-24 19:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2019-11-21 19:18:35', '2019-11-21 19:18:35'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2019-11-21 19:18:35', '2019-11-21 19:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(73, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '2.16.3'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:30:00', '14000.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '14000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 22:30:00', '2019-11-22 02:00:06'),
(2, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:31:25', '12000.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '12000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 22:31:26', '2019-11-21 22:31:26'),
(3, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:32:05', '12000.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '12000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 22:32:05', '2019-11-21 22:32:05'),
(4, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:33:02', '12000.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '12000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 22:33:02', '2019-11-21 22:33:02'),
(5, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:33:46', '12000.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '12000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 22:33:46', '2019-11-21 22:33:46'),
(6, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'partial', NULL, 1, NULL, '0001', '', NULL, '2019-11-21 15:36:22', '75.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '75.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-21 22:36:22', '2019-11-22 00:38:06'),
(8, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 1, 'due', NULL, 1, NULL, 'bvNtG', '', NULL, '2019-11-21 15:39:38', '45.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '45.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-21 22:39:38', '2019-11-23 23:52:44'),
(9, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 1, 'due', NULL, 3, NULL, '99MUl', '', NULL, '2019-11-21 16:46:37', '15.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '15.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-21 23:46:37', '2019-11-23 23:53:08'),
(10, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 4, NULL, '0002', '', NULL, '2019-11-21 17:29:43', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '30.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 00:29:44', '2019-11-22 00:33:00'),
(11, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0003', '', NULL, '2019-11-21 17:29:47', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'good', NULL, '30.0000', NULL, NULL, NULL, '/tmp/phpVwWR3J', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 00:29:47', '2019-11-22 00:29:49'),
(12, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 4, NULL, '0004', '', NULL, '2019-11-21 17:41:14', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '30.0000', NULL, NULL, NULL, '/tmp/phpaeekKa', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 00:41:14', '2019-11-22 00:41:17'),
(13, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, 'due', NULL, 5, NULL, 'Iokoy', '', NULL, '2019-11-21 17:51:17', '15.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '15.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 00:51:17', '2019-11-22 00:53:08'),
(14, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 3, NULL, 'ndPvl', '', NULL, '2019-11-21 17:52:40', '15.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'great', NULL, '15.0000', NULL, NULL, NULL, '/tmp/phpACuEEF', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(15, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 5, NULL, '0005', '', NULL, '2019-11-21 18:00:36', '15.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'good', NULL, '15.0000', NULL, NULL, NULL, '/tmp/phpFIKIfb', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 01:00:37', '2019-11-22 01:00:44'),
(16, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 4, NULL, '0006', '', NULL, '2019-11-21 18:02:42', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'good', NULL, '30.0000', NULL, NULL, NULL, '/tmp/phpDNezQA', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 01:02:43', '2019-11-22 01:02:45'),
(17, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 4, NULL, '0007', '', NULL, '2019-11-21 18:21:06', '345.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '345.0000', NULL, NULL, NULL, '/tmp/phpZB3s2c', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 01:21:06', '2019-11-22 01:21:09'),
(18, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 4, NULL, '1mKYf', '', NULL, '2019-11-21 18:49:18', '345.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '345.0000', NULL, NULL, NULL, '/tmp/phpZB3s2c', 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-22 01:49:18', '2019-11-22 01:49:18'),
(19, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 6, NULL, '0008', '', NULL, '2019-11-23 13:37:01', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'good', NULL, '30.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-23 20:37:01', '2019-11-23 20:37:02'),
(20, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 6, NULL, '0009', '', NULL, '2019-11-23 13:37:56', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '30.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-23 20:37:56', '2019-11-23 21:07:00'),
(21, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 7, NULL, '0010', '', NULL, '2019-11-23 13:44:35', '45.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'good', NULL, '45.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-23 20:44:35', '2019-11-23 20:44:36'),
(22, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 8, NULL, '0011', '', NULL, '2019-11-23 13:55:19', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', NULL, NULL, '30.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-23 20:55:19', '2019-11-23 21:09:31'),
(23, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 7, NULL, '0012', '', NULL, '2019-11-24 12:17:46', '45.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'Keyamots wedding', NULL, '45.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-24 19:17:46', '2019-11-24 19:17:47'),
(24, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0013', '', NULL, '2019-11-24 12:18:58', '30.0000', NULL, '0.0000', 'percentage', '0', 0, '0.0000', NULL, '0.0000', 'Keyamots wedding Celberation', NULL, '30.0000', NULL, NULL, NULL, NULL, 1, 0, '1.000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-24 19:18:58', '2019-11-24 19:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 0, '15.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 15:36:22', 1, 1, NULL, NULL, NULL, 'SP2019/0001', NULL, '2019-11-21 22:36:22', '2019-11-21 22:36:22'),
(2, 10, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 17:29:44', 1, 2, NULL, NULL, NULL, 'SP2019/0002', NULL, '2019-11-22 00:29:44', '2019-11-22 00:29:44'),
(3, 11, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 17:29:48', 1, 2, NULL, NULL, NULL, 'SP2019/0003', NULL, '2019-11-22 00:29:48', '2019-11-22 00:29:48'),
(4, 12, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 17:41:14', 1, 4, NULL, NULL, NULL, 'SP2019/0004', NULL, '2019-11-22 00:41:14', '2019-11-22 00:41:14'),
(5, 15, 1, 0, '15.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 18:00:39', 1, 5, NULL, NULL, NULL, 'SP2019/0005', NULL, '2019-11-22 01:00:39', '2019-11-22 01:00:39'),
(6, 16, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 18:02:43', 1, 4, NULL, NULL, NULL, 'SP2019/0006', NULL, '2019-11-22 01:02:43', '2019-11-22 01:02:43'),
(7, 17, 1, 0, '345.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 18:21:07', 1, 4, NULL, NULL, NULL, 'SP2019/0007', NULL, '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(8, 19, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 13:37:02', 1, 6, NULL, NULL, NULL, 'SP2019/0008', NULL, '2019-11-23 20:37:02', '2019-11-23 20:37:02'),
(9, 20, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 13:37:57', 1, 6, NULL, NULL, NULL, 'SP2019/0009', NULL, '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(10, 21, 1, 0, '45.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 13:44:35', 1, 7, NULL, NULL, NULL, 'SP2019/0010', NULL, '2019-11-23 20:44:35', '2019-11-23 20:44:35'),
(11, 22, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 13:55:19', 1, 8, NULL, NULL, NULL, 'SP2019/0011', NULL, '2019-11-23 20:55:19', '2019-11-23 20:55:19'),
(12, 23, 1, 0, '45.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-24 12:17:47', 1, 7, NULL, NULL, NULL, 'SP2019/0012', NULL, '2019-11-24 19:17:47', '2019-11-24 19:17:47'),
(13, 24, 1, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-24 12:18:58', 1, 1, NULL, NULL, NULL, 'SP2019/0013', NULL, '2019-11-24 19:18:58', '2019-11-24 19:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, 5, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-21 22:36:22', '2019-11-22 00:38:06'),
(4, 8, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-21 22:39:38', '2019-11-23 23:52:44'),
(5, 8, 5, 5, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-21 22:39:38', '2019-11-23 23:52:44'),
(6, 8, 3, 3, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-21 22:39:38', '2019-11-23 23:52:44'),
(9, 9, 5, 5, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-21 23:46:37', '2019-11-23 23:53:08'),
(10, 10, 5, 5, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:29:44', '2019-11-22 00:33:00'),
(11, 10, 3, 3, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:29:44', '2019-11-22 00:33:00'),
(12, 11, 5, 5, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:29:47', '2019-11-22 00:29:47'),
(13, 11, 3, 3, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:29:48', '2019-11-22 00:29:48'),
(14, 12, 5, 5, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:41:14', '2019-11-22 00:41:14'),
(15, 12, 3, 3, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:41:14', '2019-11-22 00:41:14'),
(16, 13, 1, 1, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:51:17', '2019-11-22 00:53:08'),
(18, 14, 4, 4, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 00:52:40', '2019-11-22 00:52:40'),
(19, 15, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:00:37', '2019-11-22 01:00:37'),
(20, 16, 5, 5, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:02:43', '2019-11-22 01:02:43'),
(21, 16, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:02:43', '2019-11-22 01:02:43'),
(22, 17, 1, 1, 8, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:21:06', '2019-11-22 01:21:06'),
(23, 17, 2, 2, 7, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(24, 17, 3, 3, 5, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(25, 17, 5, 5, 3, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(26, 18, 1, 1, 8, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:49:18', '2019-11-22 01:49:18'),
(27, 18, 2, 2, 7, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:49:18', '2019-11-22 01:49:18'),
(28, 18, 3, 3, 5, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:49:18', '2019-11-22 01:49:18'),
(29, 18, 5, 5, 3, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-22 01:49:18', '2019-11-22 01:49:18'),
(30, 19, 1, 1, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:37:02', '2019-11-23 20:37:02'),
(31, 19, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:37:02', '2019-11-23 20:37:02'),
(32, 20, 1, 1, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:37:56', '2019-11-23 21:07:00'),
(33, 20, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:37:57', '2019-11-23 21:07:00'),
(34, 21, 3, 3, 3, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:44:35', '2019-11-23 20:44:35'),
(35, 22, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:55:19', '2019-11-23 21:09:31'),
(36, 22, 3, 3, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-23 20:55:19', '2019-11-23 21:09:31'),
(37, 23, 1, 1, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-24 19:17:46', '2019-11-24 19:17:46'),
(38, 23, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-24 19:17:47', '2019-11-24 19:17:47'),
(39, 23, 4, 4, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-24 19:17:47', '2019-11-24 19:17:47'),
(40, 24, 1, 1, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-24 19:18:58', '2019-11-24 19:28:51'),
(41, 24, 2, 2, 1, '0.0000', '15.0000', '15.0000', 'fixed', '0.0000', '15.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2019-11-24 19:18:58', '2019-11-24 19:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, '1.0000', '0.0000', '2019-11-21 22:36:23', '2019-11-21 22:36:23'),
(2, 1, NULL, 1, '4.0000', '0.0000', '2019-11-21 23:12:01', '2019-11-21 23:12:01'),
(3, 10, NULL, 5, '1.0000', '0.0000', '2019-11-22 00:29:45', '2019-11-22 00:29:45'),
(4, 11, NULL, 3, '1.0000', '0.0000', '2019-11-22 00:29:45', '2019-11-22 00:29:45'),
(5, 12, NULL, 5, '1.0000', '0.0000', '2019-11-22 00:29:48', '2019-11-22 00:29:48'),
(6, 13, NULL, 3, '1.0000', '0.0000', '2019-11-22 00:29:48', '2019-11-22 00:29:48'),
(7, 14, NULL, 5, '1.0000', '0.0000', '2019-11-22 00:41:14', '2019-11-22 00:41:14'),
(8, 15, NULL, 3, '1.0000', '0.0000', '2019-11-22 00:41:14', '2019-11-22 00:41:14'),
(9, 19, NULL, 2, '1.0000', '0.0000', '2019-11-22 01:00:40', '2019-11-22 01:00:40'),
(10, 20, NULL, 5, '1.0000', '0.0000', '2019-11-22 01:02:44', '2019-11-22 01:02:44'),
(11, 21, NULL, 2, '1.0000', '0.0000', '2019-11-22 01:02:44', '2019-11-22 01:02:44'),
(12, 22, NULL, 1, '8.0000', '0.0000', '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(13, 23, NULL, 2, '7.0000', '0.0000', '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(14, 24, NULL, 3, '5.0000', '0.0000', '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(15, 25, NULL, 5, '3.0000', '0.0000', '2019-11-22 01:21:07', '2019-11-22 01:21:07'),
(16, 30, NULL, 1, '1.0000', '0.0000', '2019-11-23 20:37:02', '2019-11-23 20:37:02'),
(17, 31, NULL, 2, '1.0000', '0.0000', '2019-11-23 20:37:03', '2019-11-23 20:37:03'),
(18, 32, NULL, 1, '1.0000', '0.0000', '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(19, 33, NULL, 2, '1.0000', '0.0000', '2019-11-23 20:37:57', '2019-11-23 20:37:57'),
(20, 34, NULL, 3, '3.0000', '0.0000', '2019-11-23 20:44:36', '2019-11-23 20:44:36'),
(21, 35, NULL, 2, '1.0000', '0.0000', '2019-11-23 20:55:19', '2019-11-23 20:55:19'),
(22, 36, NULL, 3, '1.0000', '0.0000', '2019-11-23 20:55:19', '2019-11-23 20:55:19'),
(23, 37, NULL, 6, '1.0000', '0.0000', '2019-11-24 19:17:47', '2019-11-24 19:17:47'),
(24, 38, NULL, 2, '1.0000', '0.0000', '2019-11-24 19:17:47', '2019-11-24 19:17:47'),
(25, 39, NULL, 4, '1.0000', '0.0000', '2019-11-24 19:17:47', '2019-11-24 19:17:47'),
(26, 40, NULL, 1, '1.0000', '0.0000', '2019-11-24 19:18:58', '2019-11-24 19:18:58'),
(27, 41, NULL, 2, '1.0000', '0.0000', '2019-11-24 19:18:59', '2019-11-24 19:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2019-11-21 19:18:36', '2019-11-21 19:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mr', 'Shiraji', 'Islam', 'sygmaz', 'info@sswarehouses.com', '$2y$10$1E4JLV.TRapNRvuirh7gouK8pnLyN9gDjY0THw0La87EAdqRzreta', 'en', NULL, NULL, 'xIeyIgY2HSCQIrCEGegLe2vBYdcsRbaedIUUEKzqCNYWWQj5hpVtpqd5HXQx', 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 19:18:35', '2019-11-21 19:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '111', 1, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2019-11-21 22:29:47', '2019-11-22 02:06:29', NULL, '[]'),
(2, 'DUMMY', 2, '112', 2, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2019-11-21 22:30:52', '2019-11-21 22:30:52', NULL, '[]'),
(3, 'DUMMY', 3, '113', 3, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2019-11-21 22:31:53', '2019-11-21 22:31:53', NULL, '[]'),
(4, 'DUMMY', 4, '114', 4, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2019-11-21 22:32:48', '2019-11-21 22:32:48', NULL, '[]'),
(5, 'DUMMY', 5, '115', 5, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2019-11-21 22:33:32', '2019-11-21 22:33:32', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '1083.0000', '2019-11-21 22:30:00', '2019-11-24 19:18:58'),
(2, 2, 2, 2, 1, '986.0000', '2019-11-21 22:31:26', '2019-11-24 19:18:58'),
(3, 3, 3, 3, 1, '988.0000', '2019-11-21 22:32:05', '2019-11-23 20:55:19'),
(4, 4, 4, 4, 1, '999.0000', '2019-11-21 22:33:02', '2019-11-24 19:17:47'),
(5, 5, 5, 5, 1, '993.0000', '2019-11-21 22:33:46', '2019-11-22 01:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cache_items`
--
ALTER TABLE `cache_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `event_bookings`
--
ALTER TABLE `event_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_bookings_event_menu_id_foreign` (`event_menu_id`),
  ADD KEY `event_bookings_business_id_foreign` (`business_id`);

--
-- Indexes for table `event_menus`
--
ALTER TABLE `event_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_menus_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `event_menu_items`
--
ALTER TABLE `event_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_menu_items_event_menu_id_foreign` (`event_menu_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groceries_event_menu_id_foreign` (`event_menu_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_event_menu_id_foreign` (`event_menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`(191)),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`(191));

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cache_items`
--
ALTER TABLE `cache_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_bookings`
--
ALTER TABLE `event_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_menus`
--
ALTER TABLE `event_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `event_menu_items`
--
ALTER TABLE `event_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groceries`
--
ALTER TABLE `groceries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3510;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_bookings`
--
ALTER TABLE `event_bookings`
  ADD CONSTRAINT `event_bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_bookings_event_menu_id_foreign` FOREIGN KEY (`event_menu_id`) REFERENCES `event_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_menus`
--
ALTER TABLE `event_menus`
  ADD CONSTRAINT `event_menus_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_menu_items`
--
ALTER TABLE `event_menu_items`
  ADD CONSTRAINT `event_menu_items_event_menu_id_foreign` FOREIGN KEY (`event_menu_id`) REFERENCES `event_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groceries`
--
ALTER TABLE `groceries`
  ADD CONSTRAINT `groceries_event_menu_id_foreign` FOREIGN KEY (`event_menu_id`) REFERENCES `event_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_event_menu_id_foreign` FOREIGN KEY (`event_menu_id`) REFERENCES `event_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
