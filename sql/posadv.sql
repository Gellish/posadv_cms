-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2018 at 06:28 PM
-- Server version: 5.6.38
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tameasy_posadv`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`) VALUES
(1, 'C1', 'Category 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL),
(4, 3, 'customer', 1, 'General', 'abc', 'ABc', '', 'cjjcbdbcdjcdc . jhc hd cjd cjd c hj csd cds c', 'pune', 'Maharashtra', '411013', 'India', '987654321234', 'abc@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(5, 4, 'supplier', NULL, NULL, 'RENO iNDIA', 'RENO', '', 'fufyt fyfyt gudtrw io9y7856', 'JSJS', '', '', '', '0123456789', 'RENO@RRENO.COM', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2018-04-28', 2147483647, 1, 1, NULL, '0.0000', '0.0000', '0.0000', '36.3636', '40.0000', NULL, NULL, 0, NULL),
(2, '2018-05-04', 1, 4, 3, 3, '1.0000', '90.0000', '90.0000', '150.0000', '150.0000', '0.0000', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0),
(2, 'ERU', 'EURO', '0.7340', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 06:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 2, 1, 2, 1, 3, 1, 3, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2018-04-28 11:31:31', 2, NULL, NULL, 'IPAY/2018/04/0001', NULL, 'cash', '', '', '', '', '', '', '1128.0000', NULL, 1, NULL, 'received', '', '1128.0000', '0.0000', NULL),
(2, '2018-05-04 10:34:57', 3, NULL, NULL, 'IPAY/2018/05/0002', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 1, NULL, 'received', '', '150.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2017-12-16 02:31:15', 1, '500.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.2.24',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.0.2.24', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`) VALUES
(1, 'RED0012', 'RED', 1, '90.0000', '100.0000', '10.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '30.0000', 1, 1, '', NULL, 'code128', '', '<p>RED Product</p>', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 1, 'RED25', '90.0000', '50.0000', '10.0000'),
(2, 1, 'RED50', NULL, '100.0000', '20.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`) VALUES
(1, 'PO/2018/05/0001', '2018-05-04 10:17:00', 5, 'RENO', 2, '', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 3, '5.4000', '5.4000', '0.0000', '95.4000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, NULL, NULL, 1, 'RED0012', 'RED', 1, '90.0000', '10.0000', 0, '0.0000', 1, '0.0000', NULL, NULL, NULL, '900.0000', '10.0000', '2018-05-04', 'received', '90.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(2, NULL, NULL, 1, 'RED0012', 'RED', 2, '90.0000', '20.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1800.0000', '20.0000', '2018-05-04', 'received', '90.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(3, 1, NULL, 1, 'RED0012', 'RED', 1, '90.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '90.0000', '0.0000', '2018-05-04', 'received', '90.0000', '90.0000', '1.0000', NULL, NULL, 1, 'UN1', '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`) VALUES
(1, '2018-04-28 09:16:00', 'SALE/2018/04/0001', 4, 'ABc', 3, 'Test Biller', 1, '', '', '363.6360', '0.0000', NULL, '0.0000', '0.0000', '36.3640', 1, '0.0000', '36.3640', '0.0000', '400.0000', 'completed', 'pending', 0, NULL, 1, NULL, NULL, 10, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL),
(2, '2018-04-28 11:31:31', 'SALE/POS/2018/04/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 2, '', '', '1041.6360', '52.0000', NULL, '52.0000', '0.0000', '86.3640', 1, '0.0000', '86.3640', '0.0000', '1128.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 11, 1, '1128.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL),
(3, '2018-05-04 10:34:57', 'SALE/POS/2018/05/0002', 1, 'Walk-in Customer', 3, 'Test Biller', 2, '', '', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '150.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '150.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`) VALUES
(1, 1, 4294967295, '12', 'Test Product', 'manual', 0, '36.3636', '40.0000', '0.0000', 1, '36.3640', 2, '10.0000%', '0', '0.0000', '400.0000', '', '40.0000', NULL, 0, NULL, '10.0000', NULL),
(2, 2, 4294967295, '1233', 'abc', 'manual', 0, '178.0000', '178.0000', '0.0000', 2, '0.0000', 0, '', '2', '2.0000', '178.0000', '', '180.0000', NULL, 0, NULL, '1.0000', ''),
(3, 2, 4294967295, '1223', 'Test', 'manual', 0, '86.3636', '95.0000', '0.0000', 2, '86.3640', 2, '10.0000%', '5', '50.0000', '950.0000', '', '100.0000', NULL, 0, NULL, '10.0000', ''),
(4, 3, 1, 'RED0012', 'RED', 'standard', 1, '150.0000', '150.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '150.0000', '', '100.0000', NULL, 1, 'UN1', '1.0000', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('09k7lc0q1arjcrq2ulkmt8cr43os84mf', '49.35.62.154', 1525428482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353432383136373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235343232393937223b6c6173745f69707c733a31333a223131362e37322e32382e323030223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532353432383332363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('0b1k0h70ha4ch56a6qnnr3j4qrmu5jfn', '103.1.94.253', 1513938049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333933383034383b7265717565737465645f706167657c733a303a22223b),
('0clpvtcn1g3n50qongv0p2u2oltia4gv', '::1', 1518289869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383238393538333b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353138323839353734223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0g1f5hbvi3dlct0cmo7fa6rh29n8ldb7', '103.82.210.48', 1525068999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353036383938323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393832333030223b6c6173745f69707c733a31343a223130362e3139332e3232392e3334223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('13l2j70u4hmr4qmuit30jjdhlm8ddhlv', '117.205.211.10', 1525189656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353138393635343b7265717565737465645f706167657c733a303a22223b),
('156cbclfebrl5d0gn3gs120lmvt0nsfg', '103.240.10.60', 1524236840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343233363834303b),
('18vpijedeqs41fm3cg8q9apuu8e0v2dh', '110.225.59.59', 1525001251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353030313235313b7265717565737465645f706167657c733a303a22223b),
('1hooaeolklji99ca6tv7c0b9j031b3ab', '103.207.11.30', 1524914221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931333933313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393036383836223b6c6173745f69707c733a31333a223130332e3230372e31312e3330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343931343231303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('201rk20jlnjjij1r7spq518e7hf23jja', '64.233.173.46', 1524930338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343933303333353b7265717565737465645f706167657c733a373a2277656c636f6d65223b),
('23lblrch1igrc7qob29mt7ocm3jhgoem', '107.170.96.6', 1524907216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930373231363b7265717565737465645f706167657c733a31393a2273616c65732f67657444656c69766572696573223b),
('27iitt6kcnltphohcoc1u1vk0kshj3r2', '103.207.11.30', 1524907265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930373139333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234383938363330223b6c6173745f69707c733a31323a2234372e3234372e34362e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343930373139353b),
('299ibj0djg8sgal6hsrbebq8mvors01h', '103.207.11.30', 1524920425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343932303432343b7265717565737465645f706167657c733a303a22223b),
('2f6dhe2d3h6c4h5qbl0m86d4k0abd51v', '42.111.194.106', 1518273026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383237333032363b),
('35blplcn59r8bgvlge4bf9ca6l6qccqi', '37.145.123.9', 1513665288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333636353237353b7265717565737465645f706167657c733a303a22223b),
('3a53jbsclu5gll9q19hiqnedjk9m375e', '66.220.148.24', 1524935484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343933353438343b),
('4608ndc3a5m40m83um33gp93g2kijfj0', '103.1.94.253', 1513937941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333933373739333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353133393337393030223b6c6173745f69707c733a31323a2232372e33342e35302e323534223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531333933373934313b),
('461u8ss3r3ko66ao6s09loj0ikoj1bj5', '178.140.119.228', 1514867189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343836373138393b),
('4la8dpvsnn5ci1cqr8090oqrksn6noi0', '197.210.45.207', 1525088910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353038383931303b),
('5372vpdt0o23lj46mh84rt4gsk639pu6', '27.34.48.197', 1513371112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333337313131323b),
('53ll23ac4cm0bpqtc4umnml24uqeodmf', '103.82.210.48', 1525081866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353038313836363b7265717565737465645f706167657c733a373a2277656c636f6d65223b),
('5701ela751el5k0mo80t8o08rra9hdnq', '::1', 1518290348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383239303239303b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353138323839353734223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531383239303334303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b637372666b65797c733a383a225a62464f376b4b61223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a2246496f47653279714b5a774c62746956736c4431223b),
('5bgv1gkfq4j0f989v6at61o3ncvgsphi', '178.140.119.228', 1514867186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531343836373138363b7265717565737465645f706167657c733a303a22223b),
('5l56tanbvgmqs6qm4s5kunuvk7emdosc', '36.255.158.137', 1525155425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353135353432353b),
('5vohtp1rdojqbn5lb5o3i4skg3q12ta6', '159.203.42.143', 1524982560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343938323536303b7761726e696e677c733a3132363a224163636573732044656e6965642120596f7520646f6e2774206861766520726967687420746f20616363657373207468652072657175657374656420706167652e20496620796f75207468696e6b2c2069742773206279206d697374616b652c20706c6561736520636f6e746163742061646d696e6973747261746f722e223b5f5f63695f766172737c613a313a7b733a373a227761726e696e67223b733a333a226e6577223b7d),
('695hp3615ccfdmo5cqg8kb99j6abii54', '45.114.195.184', 1525200208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353230303230383b7265717565737465645f706167657c733a303a22223b),
('6b8esfff0918q8ncv5t7jkkiiqit5oam', '103.240.10.60', 1524236540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343233363534303b7265717565737465645f706167657c733a303a22223b),
('6cjnbnp2hprvujgmqisvcf7pc38shcdu', '117.221.216.200', 1519797767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393739373736373b7265717565737465645f706167657c733a303a22223b),
('6jsh1i4r7do6sp6f6p1b4r9ut1do36c8', '157.33.105.39', 1525155437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353135353433373b),
('6tgi0mihjrd9a1jkc9c46ujuqrhm4fgi', '103.207.11.30', 1524908251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930383235313b),
('76hk9htgjpoiq99k3m81eo535iai5pp1', '142.234.162.5', 1518277277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383237373237343b7265717565737465645f706167657c733a303a22223b),
('7u7v5hkmelropogl8hh9tb8e41qb9a61', '159.203.42.143', 1524982511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343938323531313b7761726e696e677c733a3132363a224163636573732044656e6965642120596f7520646f6e2774206861766520726967687420746f20616363657373207468652072657175657374656420706167652e20496620796f75207468696e6b2c2069742773206279206d697374616b652c20706c6561736520636f6e746163742061646d696e6973747261746f722e223b5f5f63695f766172737c613a313a7b733a373a227761726e696e67223b733a333a226e6577223b7d),
('84psh1bnakce5r0cdcegbt4j2kngp3a6', '64.233.173.42', 1525164924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353136343932343b),
('8m2aqma3fl16ejv1pnaspc24t0cungsa', '27.34.48.197', 1513371999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333337313831373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353133333730363535223b6c6173745f69707c733a31323a2232372e33342e34382e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531333337313939393b637372666b65797c733a383a22454146706a4d3634223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a22576f477743686d4a3872496b4f34647930366545223b),
('8oji33tegodt0f3i0o7g1f6qar3qg09u', '49.35.62.154', 1525428608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353432383531303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235343232393937223b6c6173745f69707c733a31333a223131362e37322e32382e323030223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532353432383332363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('8rg8duo1q6cs0rq3f1ipscmrvmgof4c4', '173.252.100.210', 1524935437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343933353433373b7265717565737465645f706167657c733a303a22223b),
('96d42445pesbuekudbrt6m049h7euiej', '173.239.53.9', 1525183659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353138333635393b7265717565737465645f706167657c733a303a22223b),
('99k396fscc1akf6toj7psc3urhbeftmi', '103.207.11.30', 1524910023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931303031383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393036383836223b6c6173745f69707c733a31333a223130332e3230372e31312e3330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('99m5buqdfjovl2a0j4vt64dr6j1t9mib', '107.170.96.6', 1524236809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343233363830393b7265717565737465645f706167657c733a31323a22706f732f73657474696e6773223b),
('a1qa6hlfb32ufblff7kppl24g0j93grf', '::1', 1518291005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383239313030353b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353138323839353734223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531383239303334303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b637372666b65797c733a383a226c50544f47715a45223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22615163523465677a5a57594456697473684f3755223b),
('afg620645i15p06fqudtg4t82gg44lih', '159.203.81.93', 1524908130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930383133303b7265717565737465645f706167657c733a32383a2273797374656d5f73657474696e67732f70726963655f67726f757073223b),
('am8nq6ra4drtqdcs4c2sukgbq8oc51ai', '116.72.28.200', 1525423113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353432323937343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235333235323338223b6c6173745f69707c733a31343a223230322e3134322e38362e323233223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532353432333033323b),
('arred5cp9hqh1et84nagqdam359h130b', '162.243.69.215', 1524909270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930393237303b7265717565737465645f706167657c733a373a2277656c636f6d65223b),
('bi2desdnp70benhdnqk8tbl9944rhv9a', '150.107.205.157', 1518240386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383234303338363b),
('bo12ic881mvjd7d9ut39ekrk3qggthu9', '183.82.231.176', 1518240359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383234303335393b),
('bpk70q7rfpgf28p57lpvuvb8fc2lbbru', '107.170.96.6', 1524982486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343938323438363b),
('bqr6t2l24cuovt6o577v2fsa04s251i5', '197.237.118.81', 1524647009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343634373030393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234353836363430223b6c6173745f69707c733a31323a2234392e3231332e36302e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343634363730343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('cde4u9p62h0ol00l6jj137pujdfavhdp', '45.114.195.181', 1525088831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353038383833303b7265717565737465645f706167657c733a303a22223b),
('cei07tf9n7ge1lqi46d612h78cjr2oad', '159.203.42.143', 1524914351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931343335313b),
('cohl1h325ljfe0dbgr7fonvbl4qndo3v', '197.237.0.78', 1524657500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343635373430373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234363436363634223b6c6173745f69707c733a31343a223139372e3233372e3131382e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343635373530303b),
('ddr6ups0ei5jjn1vk95j5590kjll0efu', '183.82.139.36', 1518156610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383135363631303b),
('di7l0j62gonvmkts186ek5gk8k0hm512', '162.243.69.215', 1524909450, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930393435303b7265717565737465645f706167657c733a383a2270726f6475637473223b),
('dksbgtgb2stoa6inmk4pe3qn95tlijrm', '162.243.69.215', 1524908191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930383139313b7265717565737465645f706167657c733a31353a2273797374656d5f73657474696e6773223b),
('ejfaeeve80oge7o3tpf67li4rf8vje5d', '113.193.172.204', 1524890846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343839303834353b7265717565737465645f706167657c733a303a22223b),
('f63rbtfkal3kfsm8lkrr8fje39utsd55', '64.233.173.42', 1524982534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343938323235333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393335353039223b6c6173745f69707c733a31343a223139372e3231302e3137322e3433223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fa0cdrcpaadaqcjgonpfski0g396rhdj', '64.233.173.46', 1525164924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353136343932343b),
('farotalsa2liouhfhqbr7g1betlea27p', '138.197.202.197', 1524982360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343938323336303b7265717565737465645f706167657c733a32303a2270726f64756374732f67657450726f6475637473223b),
('fm4t68qj4l73qnevc73d3ppqnia4umjr', '202.142.86.223', 1525325239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353332353231333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235313930303035223b6c6173745f69707c733a31343a223131372e3230352e3231312e3130223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('gaisc4nnlkea3e8j2pqq7dqicqq7kkn6', '183.82.231.176', 1518240346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383234303334363b),
('h8s328r3sugiosu61osnn4ujk4iaeum7', '49.236.214.53', 1513415474, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333431353437333b7265717565737465645f706167657c733a31353a22706f732f6164645f7072696e746572223b),
('hf2sdkhlbmmk5q532fqk9a5rq7sfe8em', '66.220.152.187', 1513937712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333933373731323b7265717565737465645f706167657c733a303a22223b),
('hn0jcqqjrltp8j3le10g9ka988n950e8', '197.237.118.81', 1524646857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343634363538393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234353836363430223b6c6173745f69707c733a31323a2234392e3231332e36302e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343634363730343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('hn5narmacgmfs6gsqpsi0bsa8qntiseu', '123.136.253.139', 1525164499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353136343439383b7265717565737465645f706167657c733a303a22223b),
('hqcfvcai302r5dfqabolihpmv1hchn24', '106.219.112.196', 1524998843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343939383834333b7265717565737465645f706167657c733a303a22223b),
('htsmk034t2qug3a9ehvn30lmjo1tdu4r', '117.221.216.200', 1519797812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393739373737303b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353138323839383533223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('i0ahscqcqcldf1d9th6mgm9opeskkp74', '103.205.244.123', 1524554369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343535343331313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234323336353635223b6c6173745f69707c733a31333a223130332e3234302e31302e3630223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('ic72p0qd4lchcjthjqlubln2uhql88cr', '159.89.37.43', 1524652275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343635323237353b7265717565737465645f706167657c733a303a22223b),
('iic6putratoqiu9bpkda7tcbdqqdne0l', '197.237.0.78', 1524657875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343635373835313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234363436363634223b6c6173745f69707c733a31343a223139372e3233372e3131382e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343635373835313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('isoee31l4g9a8mpd0ltmb8qaej4q17vk', '103.207.54.211', 1525437762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353433373736323b),
('itce8cmifvsl81rhoe7agk51qm8btk1v', '150.107.205.157', 1518280941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383238303730313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353133393337393133223b6c6173745f69707c733a31323a223130332e312e39342e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a227749536578595744223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2241767a466f596367487266534c39473161653855223b),
('ivehg91e4uavvob3t4806v2qmtdk2v02', '162.243.69.215', 1524913966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931333936363b7265717565737465645f706167657c733a31373a2273616c65732f73756767657374696f6e73223b),
('j0m77jitflkjfregjt6vv660tubsmo64', '103.207.11.30', 1524909466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930393234383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393036383836223b6c6173745f69707c733a31333a223130332e3230372e31312e3330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jqe34fmp0no79s5i7i74cnf5kgddmc6l', '49.213.60.58', 1524586682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343538363631353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234353534333638223b6c6173745f69707c733a31353a223130332e3230352e3234342e313233223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('k1m76u5kc3a43bd9ft6g7muc7lira0l7', '150.107.205.157', 1518156595, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383135363539333b7265717565737465645f706167657c733a303a22223b),
('kcudr8qkstr26p19c0chg9ruhpcga5gt', '27.34.50.254', 1513938029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333933383032393b),
('kkjmg0nne61cs4hq05724lhcfibc85hr', '27.34.48.197', 1513370810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333337303536313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343236363138343932223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531333337303737353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030323a33313a3135223b),
('mijmgp2371ii584jm6pglu6as3t41c1i', '47.247.46.82', 1524898751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343839383537383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234363537343731223b6c6173745f69707c733a31323a223139372e3233372e302e3738223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('n6tbdld01hbdp5fk231fo3fp1fkv62of', '103.207.11.30', 1524907176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930363837353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234383938363330223b6c6173745f69707c733a31323a2234372e3234372e34362e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('o417c9l4fqkob9k2bbnbmhqpnu6j4bs4', '159.203.81.93', 1524916072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931363037323b),
('ors6otcchs3e721to13ce4jh662qmnk3', '150.107.205.157', 1518281013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383238313031333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353133393337393133223b6c6173745f69707c733a31323a223130332e312e39342e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('orvc1kq4jca5e8vopatbfdk2j35d88rr', '117.205.211.10', 1525190134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353139303030353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235313535333833223b6c6173745f69707c733a31343a2233362e3235352e3135382e313337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532353139303036333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b),
('ovdjes4qo1334gu4jjfuvqve3nivoc0b', '139.167.204.123', 1519230457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393233303435373b),
('p9hjits19n0e53l9q3vj2p4kju1f76i0', '171.79.238.179', 1525255846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353235353834363b7265717565737465645f706167657c733a303a22223b),
('pvodrb57eakhta5uodgj1pur6kmbfa92', '49.35.62.154', 1525428122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353432373835383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235343232393937223b6c6173745f69707c733a31333a223131362e37322e32382e323030223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('q6rledg2bvg0jbo79qn8uadv1b1ksjbi', '64.233.173.44', 1524982610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343938323630343b7761726e696e677c733a3132363a224163636573732044656e6965642120596f7520646f6e2774206861766520726967687420746f20616363657373207468652072657175657374656420706167652e20496620796f75207468696e6b2c2069742773206279206d697374616b652c20706c6561736520636f6e746163742061646d696e6973747261746f722e223b5f5f63695f766172737c613a313a7b733a373a227761726e696e67223b733a333a226f6c64223b7d7265717565737465645f706167657c733a303a22223b),
('q9mjae79cbl01rkjpvmnqr4mkbcbfti7', '159.203.196.79', 1524914211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931343231313b7265717565737465645f706167657c733a333a22706f73223b),
('qdbom4viquspk3hssd628u0ll4aghk60', '197.210.172.43', 1524935509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343933353432333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393136303732223b6c6173745f69707c733a31333a223130332e3230372e31312e3330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('qg61ftf1528hjdrid1svg42ess6nd74v', '103.207.11.30', 1524913894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931333632343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393036383836223b6c6173745f69707c733a31333a223130332e3230372e31312e3330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343931333735363b),
('qoocuaqti9stecc920nb0r2rsbhkh73n', '49.35.62.154', 1525429199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353432383933383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235343232393937223b6c6173745f69707c733a31333a223131362e37322e32382e323030223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532353432393139393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b757365725f637372667c733a32303a223770656d454e736a397a4f6164326b7158475736223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('rip71pmm99ss75qpj8lfpuuittjqinr3', '202.51.86.233', 1524975979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343937353937373b7265717565737465645f706167657c733a303a22223b),
('s0c280d3et5hl56aeoan9mubmnd0841g', '27.34.50.254', 1513937602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333933373532333b7265717565737465645f706167657c733a303a22223b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('s94q8dc022pvjfc8s3t496kbc0mp8hv1', '183.82.229.69', 1525437301, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353433373330303b7265717565737465645f706167657c733a303a22223b),
('slad7s95nshakjt2vde4nje5nkc66qb2', '173.252.99.54', 1524935480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343933353438303b),
('t2c4dqf8e6s12m60e9is7e6j1q0p6e74', '103.207.11.30', 1524916128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931363037323b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353234393039323639223b6c6173745f69707c733a31333a223130332e3230372e31312e3330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532343931363131333b),
('t8ujj6alc7tmlna65mevgjmjs68ok1e6', '123.201.118.242', 1525407918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353430373931383b),
('tc4ihtaae9rbdnh6blbghkaf1of7iag5', '197.210.45.207', 1525089565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353038393535313b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('tfm22oeh2lldn7v27mih8n3ekchqunn3', '27.34.48.197', 1513371347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333337313334363b7265717565737465645f706167657c733a303a22223b),
('ti9934sokmgs111g5sg2n77g8392jvrh', '150.107.205.157', 1518156606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383135363630363b),
('tt5lkl78r3g1ve3o58f4bhv04ejh6plt', '117.205.211.10', 1525190738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532353139303637353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353235313535333833223b6c6173745f69707c733a31343a2233362e3235352e3135382e313337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313532353139303036333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d31322d31362030383a30313a3135223b6572726f727c4e3b),
('ugk1dcm1pbvevohagcg4m621lm1i7u0q', '::1', 1518290237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383238393934333b6964656e746974797c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32303a227072616b61726b68617240676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353138323839353734223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531383239303030313b637372666b65797c733a383a2271456a587a747242223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a2263703952513271594530444237553643696c6a53223b),
('us1i7kn6tckor833kfrqqonkla5m76ns', '139.167.204.123', 1519230455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393233303435353b7265717565737465645f706167657c733a303a22223b),
('v3bm7nk9bce9oah8b5g7u6baj2s045gp', '103.207.11.30', 1524914350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343931343335303b),
('v6hopqs3ehfdm2sj19qf86ivjav9hs13', '159.203.81.93', 1524906916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343930363931363b7265717565737465645f706167657c733a393a2273616c65732f616464223b),
('vuhkumrtv45bdpqc5hpgitffv4iv7cp4', '162.243.69.215', 1524236625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343233363632353b7265717565737465645f706167657c733a31393a2270726f64756374732f696d706f72745f637376223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`) VALUES
(1, 'logo2.png', 'logo3.png', 'Advance POS', 'english', 1, 0, 'USD', 1, 10, '3.0.2.26', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Kathmandu', 800, 800, 60, 60, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'admin@admin.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, '#', '#', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '_', 0, 1, 1, 'POP', 90, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'UN1', 'NO', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3130332e3230372e35342e323131, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'admin@admin.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1525437643, 1, 'Amrit', 'Das', 'Advance Pos', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x32372e33342e34382e313937, 'owner@tecdiary.com', '2017-12-15 20:44:15'),
(2, 1, NULL, 0x32372e33342e34382e313937, 'owner@tecdiary.com', '2017-12-15 21:04:18'),
(3, 1, NULL, 0x32372e33342e35302e323534, 'owner@tecdiary.com', '2017-12-22 10:17:16'),
(4, 1, NULL, 0x32372e33342e35302e323534, 'prakarkhar@gmail.com', '2017-12-22 10:18:20'),
(5, 1, NULL, 0x3130332e312e39342e323533, 'prakarkhar@gmail.com', '2017-12-22 10:18:33'),
(6, 1, NULL, 0x3135302e3130372e3230352e313537, 'prakarkhar@gmail.com', '2018-02-10 16:40:48'),
(7, 1, NULL, 0x3a3a31, 'prakarkhar@gmail.com', '2018-02-10 19:06:14'),
(8, 1, NULL, 0x3a3a31, 'prakarkhar@gmail.com', '2018-02-10 19:10:53'),
(9, 1, NULL, 0x3131372e3232312e3231362e323030, 'admin@admin.com', '2018-02-28 06:03:15'),
(10, 1, NULL, 0x3130332e3234302e31302e3630, 'admin@admin.com', '2018-04-20 15:02:45'),
(11, 1, NULL, 0x3130332e3230352e3234342e313233, 'admin@admin.com', '2018-04-24 07:19:28'),
(12, 1, NULL, 0x34392e3231332e36302e3538, 'Admin@admin.com', '2018-04-24 16:17:21'),
(13, 1, NULL, 0x3139372e3233372e3131382e3831, 'admin@admin.com', '2018-04-25 08:57:44'),
(14, 1, NULL, 0x3139372e3233372e302e3738, 'admin@admin.com', '2018-04-25 11:57:51'),
(15, 1, NULL, 0x34372e3234372e34362e3832, 'Admin@admin.com', '2018-04-28 06:57:10'),
(16, 1, NULL, 0x3130332e3230372e31312e3330, 'admin@admin.com', '2018-04-28 09:14:46'),
(17, 1, NULL, 0x3130332e3230372e31312e3330, 'admin@admin.com', '2018-04-28 09:54:29'),
(18, 1, NULL, 0x3130332e3230372e31312e3330, 'admin@admin.com', '2018-04-28 11:47:52'),
(19, 1, NULL, 0x3139372e3231302e3137322e3433, 'admin@admin.com', '2018-04-28 17:11:49'),
(20, 1, NULL, 0x3130362e3139332e3232392e3334, 'admin@admin.com', '2018-04-29 06:11:40'),
(21, 1, NULL, 0x3130332e38322e3231302e3438, 'admin@admin.com', '2018-04-30 06:16:38'),
(22, 1, NULL, 0x3135372e33332e33352e3136, 'admin@admin.com', '2018-05-01 06:14:04'),
(23, 1, NULL, 0x33362e3235352e3135382e313337, 'admin@admin.com', '2018-05-01 06:16:24'),
(24, 1, NULL, 0x3131372e3230352e3231312e3130, 'admin@admin.com', '2018-05-01 15:53:26'),
(25, 1, NULL, 0x3230322e3134322e38362e323233, 'admin@admin.com', '2018-05-03 05:27:18'),
(26, 1, NULL, 0x3131362e37322e32382e323030, 'admin@admin.com', '2018-05-04 08:36:37'),
(27, 1, NULL, 0x34392e33352e36322e313534, 'admin@admin.com', '2018-05-04 09:58:09'),
(28, 1, NULL, 0x3130332e3230372e35342e323131, 'admin@admin.com', '2018-05-04 12:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 2, '20.0000', NULL, '90.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

INSERT INTO `sma_warehouses_products_variants` (`id`, `option_id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(1, 1, 1, 0, '10.0000', NULL),
(2, 2, 1, 2, '20.0000', NULL),
(3, 1, 1, 2, '0.0000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
