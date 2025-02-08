#!/bin/bash

# Create Linux VM (Run this manually if needed)
# az vm create --resource-group myResourceGroup --name ImageProcessorVM --image Ubuntu2204 --admin-username SEARCH4AKASH --generate-ssh-keys

# Update package lists
sudo apt update -y

# Install ImageMagick for image processing
sudo apt install imagemagick -y

# Install Python3 and Pip
sudo apt install python3 python3-pip -y

# Install Flask for API
pip3 install flask

echo "VM setup completed successfully! Akash Majumdar 🎉"
