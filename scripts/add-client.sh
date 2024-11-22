#!/bin/bash

# Check if client name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <client-name>"
    exit 1
fi

CLIENT_NAME=$1
WG_CONFIG_DIR="/etc/wireguard"
CLIENT_DIR="$WG_CONFIG_DIR/clients"
PRIVATE_KEY=$(wg genkey)
PUBLIC_KEY=$(echo $PRIVATE_KEY | wg pubkey)

# Create client directory if it doesn't exist
if [ ! -d "$CLIENT_DIR" ]; then
    mkdir -p "$CLIENT_DIR"
fi

# Create client configuration file
CLIENT_CONF="$CLIENT_DIR/$CLIENT_NAME.conf"
echo "[Interface]" > $CLIENT_CONF
echo "PrivateKey = $PRIVATE_KEY" >> $CLIENT_CONF
echo "Address = 10.0.0.2/24" >> $CLIENT_CONF  # Update as needed for your network
echo "" >> $CLIENT_CONF
echo "[Peer]" >> $CLIENT_CONF
echo "PublicKey = $(cat $WG_CONFIG_DIR/wg0.conf | grep 'PublicKey' | awk '{print $3}')" >> $CLIENT_CONF
echo "Endpoint = <server-ip>:51820" >> $CLIENT_CONF  # Replace with server IP
echo "AllowedIPs = 0.0.0.0/0" >> $CLIENT_CONF
echo "PersistentKeepalive = 25" >> $CLIENT_CONF

# Display the client configuration file content
echo "Client configuration created at $CLIENT_CONF. Please copy the content below to your client device:"
cat $CLIENT_CONF

# Output the public key for the server's configuration
echo "Add the following public key to the server's WireGuard config file (wg0.conf) under the [Peer] section:"
echo "PublicKey = $PUBLIC_KEY"
