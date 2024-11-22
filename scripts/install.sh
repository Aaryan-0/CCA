#!/bin/bash

# Update the system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies
echo "Installing dependencies..."
sudo apt install -y apache2 mysql-server libapache2-mod-php php-gd php-json php-mbstring php-curl php-xml php-zip php-bz2 unzip wget curl sudo ufw

# Install Nextcloud
echo "Installing Nextcloud..."
wget https://download.nextcloud.com/server/releases/nextcloud-25.0.0.zip -P /tmp
unzip /tmp/nextcloud-25.0.0.zip -d /var/www/
sudo chown -R www-data:www-data /var/www/nextcloud/
sudo chmod -R 755 /var/www/nextcloud/

# Set up Apache for Nextcloud
echo "Configuring Apache for Nextcloud..."
sudo cp /var/www/nextcloud/nextcloud.conf /etc/apache2/sites-available/nextcloud.conf
sudo a2ensite nextcloud.conf
sudo a2enmod rewrite headers env dir mime
sudo systemctl restart apache2

# Install WireGuard VPN
echo "Installing WireGuard VPN..."
sudo apt install -y wireguard wireguard-tools

# Enable and start WireGuard service
echo "Starting WireGuard service..."
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0

# Install Certbot for SSL (Let's Encrypt)
echo "Installing Certbot for SSL certificates..."
sudo apt install -y certbot python3-certbot-apache

# Obtain SSL certificates for Nextcloud
echo "Obtaining SSL certificates..."
sudo certbot --apache -d <your-server-domain> --agree-tos --no-eff-email --email <your-email>

# Configure UFW (Firewall)
echo "Configuring firewall rules..."
sudo ufw allow 80,443,51820/tcp
sudo ufw enable

# Enable services to start on boot
echo "Enabling services to start on boot..."
sudo systemctl enable apache2
sudo systemctl enable mysql

echo "Installation complete! Please configure your Nextcloud instance by visiting https://<your-server-ip>/nextcloud"
