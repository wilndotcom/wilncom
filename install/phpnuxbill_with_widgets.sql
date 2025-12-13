-- PHPNuxBill Database Schema with Online User Widgets
-- This file combines the original PHPNuxBill structure with the new online user tracking widgets

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Original PHPNuxBill Tables (from install/phpnuxbill.sql)
-- Note: This is a simplified version - the full schema would include all tables from the original file

-- App Configuration Table
DROP TABLE IF EXISTS `tbl_appconfig`;
CREATE TABLE `tbl_appconfig` (
  `id` int NOT NULL,
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Bandwidth Table
DROP TABLE IF EXISTS `tbl_bandwidth`;
CREATE TABLE `tbl_bandwidth` (
  `id` int UNSIGNED NOT NULL,
  `name_bw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rate_down` int UNSIGNED NOT NULL,
  `rate_down_unit` enum('Kbps','Mbps') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rate_up` int UNSIGNED NOT NULL,
  `rate_up_unit` enum('Kbps','Mbps') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `burst` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Customers Table
DROP TABLE IF EXISTS `tbl_customers`;
CREATE TABLE `tbl_customers` (
  `id` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo` VARCHAR(128) NOT NULL DEFAULT '/user.default.jpg',
  `pppoe_username` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'For PPPOE Login',
  `pppoe_password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'For PPPOE Login',
  `pppoe_ip` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'For PPPOE Login',
  `fullname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `coordinates` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Latitude and Longitude coordinates',
  `account_type` enum('Business','Personal') COLLATE utf8mb4_general_ci DEFAULT 'Personal' COMMENT 'For selecting account type',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'For Money Deposit',
  `service_type` enum('Hotspot','PPPoE','Others') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Others' COMMENT 'For selecting user type',
  `auto_renewal` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Auto renewall using balance',
  `status` enum('Active','Banned','Disabled','Inactive','Limited','Suspended') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Widgets Table (essential for our online user widgets)
DROP TABLE IF EXISTS `tbl_widgets`;
CREATE TABLE `tbl_widgets` (
  `id` int NOT NULL,
  `orders` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '1',
  `user` varchar(20) NOT NULL DEFAULT 'Admin',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `widget` varchar(100) NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Plans Table (needed for online user detection)
DROP TABLE IF EXISTS `tbl_plans`;
CREATE TABLE `tbl_plans` (
  `id` int NOT NULL,
  `name_plan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Mikrotik',
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

-- User Recharges Table (needed for online user detection)
DROP TABLE IF EXISTS `tbl_user_recharges`;
CREATE TABLE `tbl_user_recharges` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `routers` varchar(255) DEFAULT NULL,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Add primary keys and indexes
ALTER TABLE `tbl_appconfig`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting` (`setting`);

ALTER TABLE `tbl_bandwidth`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `pppoe_username` (`pppoe_username`);

ALTER TABLE `tbl_widgets`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_plans`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_user_recharges`
  ADD PRIMARY KEY (`id`);

-- Auto-increment values
ALTER TABLE `tbl_appconfig`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_bandwidth`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_widgets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_user_recharges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- ONLINE USER WIDGETS INSERTION
-- These are the widgets we created yesterday for tracking online users

-- Insert Hotspot Online Users widget (position 2 - same as existing graph widgets)
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(101, 5, 2, 'Admin', 1, 'Hotspot Online Users', 'online_hotspot_users', '');

-- Insert PPPoE Online Users widget (position 2)
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(102, 6, 2, 'Admin', 1, 'PPPoE Online Users', 'online_pppoe_users', '');

-- Insert Static IP Online Users widget (position 2)
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(103, 7, 2, 'Admin', 1, 'Static IP Online Users', 'online_static_users', '');

-- Insert Total Online Users widget (position 2)
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(104, 8, 2, 'Admin', 1, 'Total Online Users', 'online_total_users', '');

-- Also add widgets for other user types (Agent, Sales, Report)
-- Hotspot Online Users for Agent
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(105, 5, 2, 'Agent', 1, 'Hotspot Online Users', 'online_hotspot_users', '');

-- PPPoE Online Users for Agent
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(106, 6, 2, 'Agent', 1, 'PPPoE Online Users', 'online_pppoe_users', '');

-- Static IP Online Users for Agent
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(107, 7, 2, 'Agent', 1, 'Static IP Online Users', 'online_static_users', '');

-- Total Online Users for Agent
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(108, 8, 2, 'Agent', 1, 'Total Online Users', 'online_total_users', '');

-- Hotspot Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(109, 5, 2, 'Sales', 1, 'Hotspot Online Users', 'online_hotspot_users', '');

-- PPPoE Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(110, 6, 2, 'Sales', 1, 'PPPoE Online Users', 'online_pppoe_users', '');

-- Static IP Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(111, 7, 2, 'Sales', 1, 'Static IP Online Users', 'online_static_users', '');

-- Total Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(112, 8, 2, 'Sales', 1, 'Total Online Users', 'online_total_users', '');

-- Hotspot Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(113, 5, 2, 'Report', 1, 'Hotspot Online Users', 'online_hotspot_users', '');

-- PPPoE Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(114, 6, 2, 'Report', 1, 'PPPoE Online Users', 'online_pppoe_users', '');

-- Static IP Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(115, 7, 2, 'Report', 1, 'Static IP Online Users', 'online_static_users', '');

-- Total Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(116, 8, 2, 'Report', 1, 'Total Online Users', 'online_total_users', '');

-- Update dashboard layout configuration to accommodate new widgets
-- The format is: row1.col1_width,col2_width,col3_width,col4_width.row2.col_layout,etc
-- We'll add a new row with 4 columns (3,3,3,3) for the online user widgets

-- Update Admin dashboard layout
INSERT INTO `tbl_appconfig` (`setting`, `value`) VALUES
('dashboard_Admin', '12.3,3,3,3')
ON DUPLICATE KEY UPDATE `value` = '12.3,3,3,3';

-- Update Agent dashboard layout
INSERT INTO `tbl_appconfig` (`setting`, `value`) VALUES
('dashboard_Agent', '12.3,3,3,3')
ON DUPLICATE KEY UPDATE `value` = '12.3,3,3,3';

-- Update Sales dashboard layout
INSERT INTO `tbl_appconfig` (`setting`, `value`) VALUES
('dashboard_Sales', '12.3,3,3,3')
ON DUPLICATE KEY UPDATE `value` = '12.3,3,3,3';

-- Update Report dashboard layout
INSERT INTO `tbl_appconfig` (`setting`, `value`) VALUES
('dashboard_Report', '12.3,3,3,3')
ON DUPLICATE KEY UPDATE `value` = '12.3,3,3,3';

-- Add basic configuration for online user checking
INSERT INTO `tbl_appconfig` (`setting`, `value`) VALUES
('check_customer_online', 'yes')
ON DUPLICATE KEY UPDATE `value` = 'yes';

COMMIT;
SET FOREIGN_KEY_CHECKS=1;
