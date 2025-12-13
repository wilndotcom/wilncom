@echo off
REM PHPNuxBill Database Installation Script for Windows
REM This script helps install the database with widgets

echo PHPNuxBill Database Installation
echo ================================
echo.

REM Check if MySQL is available
mysql --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: MySQL client not found. Please install MySQL or add to PATH.
    pause
    exit /b 1
)

REM Get database credentials
set /p username="MySQL Username: "
set /p password="MySQL Password: "
set /p database="Database Name: "
echo.

REM Test database connection
echo Testing database connection...
mysql -u "%username%" -p"%password%" -e "USE %database%;" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Cannot connect to database '%database%' with provided credentials.
    pause
    exit /b 1
)

echo Database connection successful!
echo.

REM Installation options
echo Choose installation option:
echo 1) Complete installation with online user widgets ^(Recommended^)
echo 2) Radius database installation
echo.
set /p choice="Enter your choice (1-2): "

if "%choice%"=="1" (
    echo Installing complete database with online user widgets...
    mysql -u "%username%" -p"%password%" "%database%" < install\phpnuxbill.sql
    if %errorlevel% equ 0 (
        echo Complete installation finished!
    )
) else if "%choice%"=="2" (
    echo Installing Radius database...
    if exist "install\radius.sql" (
        mysql -u "%username%" -p"%password%" "%database%" < install\radius.sql
        if %errorlevel% equ 0 (
            echo Radius installation finished!
        )
    ) else (
        echo Error: install\radius.sql not found.
        echo Please download the full installation package from releases.
    )
) else (
    echo Invalid choice. Exiting.
    pause
    exit /b 1
)

echo.
echo Installation completed successfully!
echo You can now access your PHPNuxBill dashboard.
echo.
echo Next steps:
echo 1. Configure your Mikrotik routers in the admin panel
echo 2. Ensure 'check_customer_online' is enabled in settings
echo 3. Visit your dashboard to see the online user widgets
echo.
pause
