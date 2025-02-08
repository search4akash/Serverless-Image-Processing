#!/bin/bash

# Azure Storage details
STORAGE_ACCOUNT="store4sreverless"
SOURCE_CONTAINER="raw-images"
DEST_CONTAINER="processed-images"
CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myazurestorage;AccountKey=<your_account_key>"

# Download images from Azure Blob Storage using the connection string
mkdir -p images
az storage blob download-batch -d images --account-name $STORAGE_ACCOUNT -s $SOURCE_CONTAINER --connection-string "$CONNECTION_STRING"

# Process each image
for image in images/*.jpg; do
    filename=$(basename "$image")

    # Resize and watermark
    convert "$image" -resize 800x600 -gravity southeast -pointsize 30 -draw "text 10,10 'Search4akash'" "processed-$filename"

    # Upload processed image
    az storage blob upload --container-name $DEST_CONTAINER --account-name $STORAGE_ACCOUNT --file "processed-$filename"

    echo "SEARCH4AKASH! The image has been Processed: $filename"
done

