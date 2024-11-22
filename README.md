# CCA

# Secure Private Cloud Server

A secure, cost-effective private cloud solution for small businesses using Oracle VirtualBox, Ubuntu Server, Nextcloud, and WireGuard VPN. This setup enables secure file storage, sharing, and remote access, tailored for small businesses to deploy either on-premises or in the cloud.

---

## Features

- **Nextcloud Integration**: A robust platform for secure file storage, sharing, and collaboration.
- **WireGuard VPN**: Provides encrypted remote access to the private cloud server.
- **Cost-Effective**: Ideal for small businesses with limited resources.
- **Flexible Hosting**: Can be hosted on-premises or in a public/private cloud environment.
- **SSL Encryption**: Secures all communications with Let's Encrypt certificates.

---

## Requirements

- **Software:**
  - Oracle VirtualBox
  - Ubuntu Server 22.04 LTS
  - Nextcloud (latest stable release)
  - WireGuard VPN
- **Hardware:**
  - Minimum: 2 GB RAM, 100 GB storage.
  - Recommended: 4 GB RAM, 100 GB storage (or more, based on usage).
- **Networking:**
  - Public or private static IP for the VPN server.

---

## Setup Instructions

### Step 1: Clone the Repository
Clone the repository to your local system:
```bash
git clone https://github.com/Aaryan-0/secure-private-cloud.git
cd secure-private-cloud/scripts

**### Step 2: Prepare the Virtual Machine**
Install Oracle VirtualBox:
Download and install VirtualBox from here.

Create a VM:

OS Type: Linux > Ubuntu (64-bit).
Allocate RAM and storage as per requirements.
Attach the Ubuntu Server ISO image to the VM.
Install Ubuntu Server:
Follow the Ubuntu Server 22.04 installation process. Ensure SSH is enabled during setup.

**###  Step 3: Install Required Software**
Run the installation script provided in the repository:

bash
Copy code
chmod +x install.sh
sudo ./install.sh
The script performs:

System updates.
Installation of Nextcloud and its dependencies.
WireGuard VPN configuration.
SSL certificate setup using Let's Encrypt.

**### Step 4: Configure WireGuard VPN**
Edit Configuration:
Modify wg0.conf with your network settings:

bash
Copy code
nano /etc/wireguard/wg0.conf
Enable WireGuard:
Start and enable the WireGuard service:

bash
Copy code
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0
Add VPN Clients:
Use the add-client.sh script to create VPN profiles:

bash
Copy code
./add-client.sh client-name

**### Step 5: Configure Nextcloud**
Access Nextcloud:
Open your browser and visit https://<server-ip>/nextcloud.

Set Up Admin Account:
Follow the on-screen instructions to set up the admin account and complete the initial configuration.

Enable SSL:
SSL certificates are automatically handled by Let's Encrypt during installation.

