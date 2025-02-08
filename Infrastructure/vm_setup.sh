#!/bin/bash

# Variables
VM_NAME="SEARCH4AKASH"
RESOURCE_GROUP="rg-serverless"
LOCATION="eastus"
IMAGE="Ubuntu2204"
SIZE="Standard_B1s"

# Create a resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create a virtual machine
az vm create \
    --resource-group $RESOURCE_GROUP \
    --name $VM_NAME \
    --image $IMAGE \
    --size $SIZE \
    --admin-username $VM_NAME \
    --generate-ssh-keys

# Get the public IP address of the VM
IP_ADDRESS=$(az vm show --show-details --resource-group $RESOURCE_GROUP --name $VM_NAME --query publicIps -o tsv)

# Wait for the VM to be ready
echo "Waiting for VM to be ready..."
sleep 60

# Update the VM and install ImageMagick and Flask
ssh -o StrictHostKeyChecking=no $VM_NAME@$IP_ADDRESS << 'EOF'
sudo apt-get update
sudo apt-get install -y imagemagick
sudo apt-get install -y python3-flask
EOF

echo "SEARCH4AKASH! VM setup complete. ImageMagick and Flask have been installed."