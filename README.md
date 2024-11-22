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
```

---

### Step 2: Prepare the Virtual Machine
Install Oracle VirtualBox
Steps:

Download Oracle VirtualBox from here.
Install it on your system.
Create a Virtual Machine

Steps:
-Open VirtualBox.
-Create a new virtual machine with the following settings:
   -OS Type: Linux > Ubuntu (64-bit).
   -Resources: Allocate RAM and storage as per your requirements.
   -Attach the Ubuntu Server ISO image to the VM.
-Install Ubuntu Server
# Steps:
   -Boot the VM using the attached Ubuntu Server ISO.
   -Follow the Ubuntu Server 22.04 installation process.
   -During the setup, ensure SSH is enabled.

---

### Step 3: Install Required Software
Steps:

Make the installation script executable.
Run the script to install and configure required software.

```bash  
chmod +x install.sh  
sudo ./install.sh  
```  

The script performs the following:  
- Updates the system.  
- Installs Nextcloud and its dependencies.  
- Configures WireGuard VPN.  
- Sets up SSL certificates using Let's Encrypt.  

---

### **Step 4: Configure WireGuard VPN**  

#### **Edit Configuration**  
Modify `wg0.conf` with your network settings:  

```bash  
nano /etc/wireguard/wg0.conf  
```  

#### **Enable WireGuard**  
Start and enable the WireGuard service:  

```bash  
sudo systemctl enable wg-quick@wg0  
sudo systemctl start wg-quick@wg0  
```  

#### **Add VPN Clients**  
Use the `add-client.sh` script to create VPN profiles:  

```bash  
./add-client.sh client-name  
```  

---

### **Step 5: Configure Nextcloud**  

#### **Access Nextcloud**  
Open your browser and visit:  

```text  
https://<server-ip>/nextcloud  
```  

#### **Set Up Admin Account**  
Follow the on-screen instructions to create the admin account and complete the initial configuration.  

#### **Enable SSL**  
SSL certificates are automatically managed by Let's Encrypt during the installation.  

---
