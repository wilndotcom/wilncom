-- Add online user tracking widgets to the database
-- These widgets will be positioned after the existing top widgets

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

-- Hotspot Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(109, 3, 2, 'Sales', 1, 'Hotspot Online Users', 'online_hotspot_users', '');

-- PPPoE Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(110, 4, 2, 'Sales', 1, 'PPPoE Online Users', 'online_pppoe_users', '');

-- Static IP Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(111, 5, 2, 'Sales', 1, 'Static IP Online Users', 'online_static_users', '');

-- Total Online Users for Sales
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(112, 6, 2, 'Sales', 1, 'Total Online Users', 'online_total_users', '');

-- Hotspot Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(113, 3, 2, 'Report', 1, 'Hotspot Online Users', 'online_hotspot_users', '');

-- PPPoE Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(114, 4, 2, 'Report', 1, 'PPPoE Online Users', 'online_pppoe_users', '');

-- Static IP Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(115, 5, 2, 'Report', 1, 'Static IP Online Users', 'online_static_users', '');

-- Total Online Users for Report
INSERT INTO `tbl_widgets` (`id`, `orders`, `position`, `user`, `enabled`, `title`, `widget`, `content`) VALUES
(116, 6, 2, 'Report', 1, 'Total Online Users', 'online_total_users', '');