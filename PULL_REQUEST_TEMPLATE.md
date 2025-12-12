# Online User Tracking Widgets - Pull Request

## Summary
This PR adds 4 new dashboard widgets to PHPNuxBill for real-time online user tracking:

1. **Hotspot Online Users** - Shows count of currently connected hotspot users
2. **PPPoE Online Users** - Shows count of currently connected PPPoE users  
3. **Static IP Online Users** - Shows count of currently connected static IP users
4. **Total Online Users** - Shows combined count of all online users

## Implementation Details

### Backend Components
- **PHP Classes**: `system/widgets/online_*.php` - Widget logic and Mikrotik device querying
- **Database Integration**: SQL script to add widget entries for all user types
- **Device Communication**: Uses existing device framework for online status checking

### Frontend Components  
- **Templates**: `ui/ui/widget/online_*.tpl` - Responsive UI with color-coded design
- **Dashboard Layout**: Updated to 4-column layout for widget row
- **Multi-language Support**: Uses Lang::T() for internationalization

### Key Features
- Real-time online user counting via Mikrotik device queries
- Graceful error handling for device connection failures
- Performance optimized with device caching
- Available for Admin, Agent, Sales, and Report user types
- Mobile responsive design

## Files Added/Modified

### New Files
- `system/widgets/online_hotspot_users.php`
- `system/widgets/online_pppoe_users.php` 
- `system/widgets/online_static_users.php`
- `system/widgets/online_total_users.php`
- `ui/ui/widget/online_hotspot_users.tpl`
- `ui/ui/widget/online_pppoe_users.tpl`
- `ui/ui/widget/online_static_users.tpl`
- `ui/ui/widget/online_total_users.tpl`
- `add_online_user_widgets.sql`
- `ONLINE_USER_WIDGETS_INSTALLATION.md`

### Database Changes
- Added 16 widget entries (4 widgets × 4 user types)
- Updated dashboard layout configurations
- Set proper widget positions and ordering

## Installation Requirements
- PHPNuxBill v2.0+
- `check_customer_online` setting enabled
- Properly configured Mikrotik devices
- Valid router credentials

## Testing Checklist
- [ ] Widgets appear on dashboard for all user types
- [ ] Online counts update correctly when users connect/disconnect
- [ ] Widgets handle device connection failures gracefully
- [ ] Mobile responsiveness works properly
- [ ] Multi-language support functions correctly
- [ ] Performance impact is minimal

## Potential Issues for Review
1. **Device Path References**: Fixed `$WIDGET_PATH` to use `__DIR__` for proper file inclusion
2. **Database Performance**: Consider indexing for user_recharges queries
3. **Error Handling**: Review exception handling for device communications
4. **Security**: Verify no SQL injection vulnerabilities in widget queries
5. **Caching**: Consider adding widget result caching for better performance

## Request for Review
@hotspotbilling/ibnux @hotspotbilling/core-developers 

Please review:
- Code quality and best practices
- Security implications
- Performance considerations  
- Integration with existing PHPNuxBill architecture
- Database schema changes
- UI/UX consistency

## Testing Environment
- PHPNuxBill v2.0+
- XAMPP on Windows
- MySQL database
- Multiple Mikrotik devices configured

## Notes
This implementation follows PHPNuxBill coding standards and widget patterns. The widgets are designed to be non-intrusive and work alongside existing dashboard components.
