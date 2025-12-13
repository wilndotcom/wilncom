# wilncom
all about trying but this is phpnuxbill % ibnux developer

[![ReadMeSupportPalestine](https://raw.githubusercontent.com/Safouene1/support-palestine-banner/master/banner-project.svg)](https://s.id/standwithpalestine)

# PHPNuxBill - PHP Mikrotik Billing

![PHPNuxBill](install/img/logo.png)

## Feature

- Voucher Generator and Print
- [Freeradius](https://github.com/hotspotbilling/phpnuxbill/wiki/FreeRadius)
- Self registration
- User Balance
- Auto Renewal Package using Balance
- Multi Router Mikrotik
- Hotspot & PPPOE
- Easy Installation
- Multi Language
- Payment Gateway
- SMS validation for login
- Whatsapp Notification to Consumer
- Telegram Notification for Admin
- **Real-time Online User Tracking Widgets** - Dashboard widgets for monitoring connected users across all connection types

See [How it Works / Cara Kerja](https://github.com/hotspotbilling/phpnuxbill/wiki/How-It-Works---Cara-kerja)

## Payment Gateway And Plugin

- [Payment Gateway List](https://github.com/orgs/hotspotbilling/repositories?q=payment+gateway)
- [Plugin List](https://github.com/orgs/hotspotbilling/repositories?q=plugin)

You can download payment gateway and Plugin from Plugin Manager

## System Requirements

Most current web servers with PHP & MySQL installed will be capable of running PHPNuxBill

Minimum Requirements

- Linux or Windows OS
- Minimum PHP Version 8.2
- Both PDO & MySQLi Support
- PHP-GD2 Image Library
- PHP-CURL
- PHP-ZIP
- PHP-Mbstring
- MySQL Version 4.1.x and above

can be Installed in Raspberry Pi Device.

The problem with windows is hard to set cronjob, better Linux

## Changelog

[CHANGELOG.md](CHANGELOG.md)

## Installation

### Quick Installation
[Installation instructions](https://github.com/hotspotbilling/phpnuxbill/wiki)

### Database Setup (Required)

**Option 1: Complete Installation with Widgets**
```bash
mysql -u your_username -p your_database_name < phpnuxbill_with_widgets.sql
```

**Option 2: Basic Installation**
```bash
mysql -u your_username -p your_database_name < install/phpnuxbill.sql
```

**Option 3: Add Widgets to Existing Installation**
```bash
mysql -u your_username -p your_database_name < add_online_user_widgets.sql
```

### Important Notes
- SQL files must be imported manually after cloning the repository
- The `phpnuxbill_with_widgets.sql` includes both the base database and online user widgets
- Files in `install/` directory are gitignored and must be downloaded from releases

## Freeradius

Support [Freeradius with Database](https://github.com/hotspotbilling/phpnuxbill/wiki/FreeRadius)

## Online User Tracking Widgets

This implementation adds real-time dashboard widgets to monitor connected users across all connection types:

### Features
- **Hotspot Online Users** - Shows count of currently connected hotspot users
- **PPPoE Online Users** - Shows count of currently connected PPPoE users  
- **Static IP Online Users** - Shows count of currently connected static IP users
- **Total Online Users** - Shows combined count of all online users

### Technical Implementation
- Real-time user counting via Mikrotik device queries
- Color-coded responsive UI design
- Multi-user support (Admin, Agent, Sales, Report)
- Graceful error handling for device connection failures
- Performance optimized with device caching

### Installation
See [ONLINE_USER_WIDGETS_INSTALLATION.md](ONLINE_USER_WIDGETS_INSTALLATION.md) for complete setup instructions.

### Community Contribution
This feature was developed to enhance PHPNuxBill's monitoring capabilities and is open for community review and improvement. See the [pull request](https://github.com/wilndotcom/wilncom/pull/new/feature/online-user-widgets) for technical details and code review.

## Community Support

- [Github Discussion](https://github.com/hotspotbilling/phpnuxbill/discussions)
- [Telegram Group](https://t.me/phpmixbill)

## Technical Support

This Software is Free and Open Source, Without any Warranty.

Even if the software is free, but Technical Support is not,
Technical Support Start from Rp 500.000 or $50

If you chat me for any technical support,
you need to pay,

ask anything for free in the [discussion](/hotspotbilling/phpnuxbill/discussions) page or [Telegram Group](https://t.me/phpnuxbill)

Contact me at [Telegram](https://t.me/ibnux)

## License

GNU General Public License version 2 or later

see [LICENSE](LICENSE) file


## Donate to ibnux

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/ibnux)

BCA: 5410454825

Mandiri: 163-000-1855-793

a.n Ibnu Maksum

## SPONSORS

- [mixradius.com](https://mixradius.com/) Paid Services Billing Radius
- [mlink.id](https://mlink.id)
- [https://github.com/sonyinside](https://github.com/sonyinside)

## Thanks
We appreciate all people who are participating in this project.

<a href="https://github.com/hotspotbilling/phpnuxbill/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=hotspotbilling/phpnuxbill" />
</a>
