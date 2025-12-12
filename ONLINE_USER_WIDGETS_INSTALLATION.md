# Online User Tracking Widgets - Installation Guide

This guide explains how to install and configure the new online user tracking widgets for PHPNuxBill.

## Overview

This implementation adds 4 new dashboard widgets to track online users:

1. **Hotspot Online Users** - Shows count of currently connected hotspot users
2. **PPPoE Online Users** - Shows count of currently connected PPPoE users
3. **Static IP Online Users** - Shows count of currently connected static IP users
4. **Total Online Users** - Shows combined count of all online users

## Installation Steps

### 1. File Installation

The following files have been created:

#### Widget Classes (PHP Backend)
- `system/widgets/online_hotspot_users.php`
- `system/widgets/online_pppoe_users.php`
- `system/widgets/online_static_users.php`
- `system/widgets/online_total_users.php`

#### Widget Templates (UI Frontend)
- `ui/ui/widget/online_hotspot_users.tpl`
- `ui/ui/widget/online_pppoe_users.tpl`
- `ui/ui/widget/online_static_users.tpl`
- `ui/ui/widget/online_total_users.tpl`

#### Database Setup
- `add_online_user_widgets.sql` - SQL script to add widgets to database

### 2. Database Setup

Run the SQL script to add the widgets to your database:

```sql
mysql -u your_username -p your_database_name < add_online_user_widgets.sql
```

This script will:
- Add 4 new widget entries for each user type (Admin, Agent, Sales, Report)
- Update dashboard layout configurations to accommodate the new widgets
- Set appropriate widget positions and ordering

### 3. Configuration Requirements

For the widgets to work properly, ensure the following configuration is set:

1. **Enable Online User Checking**:
   - In your PHPNuxBill admin panel, go to Settings
   - Ensure `check_customer_online` is set to `yes`

2. **Mikrotik Device Configuration**:
   - All your Mikrotik routers must be properly configured in the system
   - Router credentials must be valid and accessible

3. **Widget Positioning**:
   - The widgets are configured to appear in position 2 (left column)
   - They are ordered after the existing graph widgets
   - The dashboard layout has been updated to use a 4-column layout for the widget row

### 4. Widget Features

Each widget provides:

- **Real-time Online User Count**: Shows current number of connected users
- **Visual Design**: Color-coded boxes with appropriate icons
- **Quick Navigation**: Links to view related plans
- **Responsive Design**: Works on all screen sizes
- **Multi-User Support**: Available for Admin, Agent, Sales, and Report user types

### 5. Technical Details

#### Widget Structure
- Each widget follows the standard PHPNuxBill widget pattern
- Widgets extend the base widget system
- Templates use Smarty template engine
- Online status is determined by querying Mikrotik devices

#### Performance Considerations
- Widgets cache results to avoid excessive device queries
- Failed device connections are handled gracefully
- Widgets only query devices when `check_customer_online` is enabled

### 6. Customization

You can customize the widgets by:

1. **Modifying Colors**: Edit the widget template files to change colors
2. **Changing Icons**: Update the icon classes in the template files
3. **Adjusting Layout**: Modify the dashboard layout configuration
4. **Adding More Stats**: Extend the widget classes to show additional information

### 7. Troubleshooting

**Issue: Widgets show 0 users when users are actually online**

- Check that `check_customer_online` is enabled in settings
- Verify Mikrotik router credentials are correct
- Ensure routers are accessible from the server
- Check firewall settings on Mikrotik devices

**Issue: Widgets don't appear on dashboard**

- Verify the SQL script was run successfully
- Check that widget entries exist in `tbl_widgets` table
- Ensure widgets are enabled (enabled=1) in the database
- Clear cache if widgets still don't appear

**Issue: Performance is slow**

- Reduce the number of routers being queried
- Implement additional caching
- Consider running online checks less frequently

### 8. Widget Positions in Dashboard

The widgets are positioned as follows:

- **Row 1**: Top widgets (existing) - Full width (12 columns)
- **Row 2**: Online user widgets - 4 columns of 3 width each
  - Column 1: Hotspot Online Users
  - Column 2: PPPoE Online Users
  - Column 3: Static IP Online Users
  - Column 4: Total Online Users

### 9. Compatibility

- Works with PHPNuxBill v2.0+
- Compatible with all supported Mikrotik devices
- Supports all user types (Admin, Agent, Sales, Report)
- Mobile responsive design

### 10. Version Information

- **Version**: 1.0
- **Release Date**: December 2024
- **Compatibility**: PHPNuxBill v2.0+
- **Author**: wilndotcom (kennethndugi@gmail.com)
- **License**: GNU GPL v2+

### 11. Community Support

This feature is available for community review and improvement:
- **GitHub Repository**: https://github.com/wilndotcom/wilncom
- **Pull Request**: https://github.com/wilndotcom/wilncom/pull/new/feature/online-user-widgets
- **Discussion**: Join the PHPNuxBill community for feedback and suggestions

### 12. Future Enhancements

Potential improvements for future versions:
- Real-time WebSocket updates for instant user count changes
- Historical user activity graphs and analytics
- Integration with monitoring systems like Grafana
- Mobile app notifications for user count alerts
- Advanced filtering and search capabilities

### 13. License

These widgets are released under the same GNU GPL v2+ license as PHPNuxBill.