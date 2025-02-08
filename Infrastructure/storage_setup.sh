#!/bin/bash

# Variables
RESOURCE_GROUP="rg-serverless"
LOCATION="eastus"
STORAGE_ACCOUNT_NAME="store4sreverless"
CONTAINER1="raw_images"
CONTAINER2="processed_images"

# Create a resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create a storage account with LRS replication and StorageV2 kind
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $LOCATION --sku Standard_LRS --kind StorageV2

# Create the first container
az storage container create --name $CONTAINER1 --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

# Create the second container
az storage container create --name $CONTAINER2 --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "SEARCH4AKASH! Storage account and containers created successfully."