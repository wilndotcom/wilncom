#!/bin/bash

# PHPNuxBill Database Installation Script
# This script helps install the database with widgets

echo "PHPNuxBill Database Installation"
echo "================================"
echo ""

# Check if MySQL is available
if ! command -v mysql &> /dev/null; then
    echo "Error: MySQL client not found. Please install MySQL."
    exit 1
fi

# Get database credentials
read -p "MySQL Username: " username
read -s -p "MySQL Password: " password
echo ""
read -p "Database Name: " database
echo ""

# Test database connection
echo "Testing database connection..."
if ! mysql -u "$username" -p"$password" -e "USE $database;" 2>/dev/null; then
    echo "Error: Cannot connect to database '$database' with provided credentials."
    exit 1
fi

echo "Database connection successful!"
echo ""

# Installation options
echo "Choose installation option:"
echo "1) Complete installation with online user widgets (Recommended)"
echo "2) Radius database installation"
echo ""
read -p "Enter your choice (1-2): " choice

case $choice in
    1)
        echo "Installing complete database with online user widgets..."
        mysql -u "$username" -p"$password" "$database" < install/phpnuxbill.sql
        echo "Complete installation finished!"
        ;;
    2)
        echo "Installing Radius database..."
        if [ -f "install/radius.sql" ]; then
            mysql -u "$username" -p"$password" "$database" < install/radius.sql
            echo "Radius installation finished!"
        else
            echo "Error: install/radius.sql not found."
            echo "Please download the full installation package from releases."
        fi
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "Installation completed successfully!"
echo "You can now access your PHPNuxBill dashboard."
echo ""
echo "Next steps:"
echo "1. Configure your Mikrotik routers in the admin panel"
echo "2. Ensure 'check_customer_online' is enabled in settings"
echo "3. Visit your dashboard to see the online user widgets"
