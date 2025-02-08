<<<<<<< HEAD
# Serverless-Image-Processing
=======
# 🌟 Serverless Image Processing with Azure Logic Apps & Shell Scripting

## 🚀 Project Overview

This project automates image processing using Azure Logic Apps and Linux shell scripting. The workflow includes:

- **Uploading images** to Azure Blob Storage.
- A **Logic App** triggers a shell script when a new image is uploaded.
- A **Linux-based script** processes the images (resize, watermark, etc.).
- The processed images are stored in another Blob container.

## 💡 Table of Contents
1. [Project Requirements](#requirements)
2. [Setup Instructions](#setup-instructions)
   - [Step 1: Create Azure Blob Storage](#step-1-create-azure-blob-storage)
   - [Step 2: Deploy a Linux VM (or ACI)](#step-2-deploy-a-linux-vm-or-aci)
   - [Step 3: Create the Image Processing Script](#step-3-create-the-image-processing-script)
   - [Step 4: Create the Flask App](#step-4-create-the-flask-app)
   - [Step 5: Create the Logic App in Azure](#step-5-create-the-logic-app-in-azure)
   - [Step 6: Testing the Workflow](#step-6-testing-the-workflow)
3. [License](#license)

## 🛠 Project Requirements

- **Azure Subscription**
- **Azure Storage Account**
- **Azure Logic Apps**
- **Linux VM or Azure Container Instances (ACI)**
- **ImageMagick** for image processing
- **Flask** for running the API

## 📥 Setup Instructions

### Step 1: Create Azure Blob Storage

1. **Create a Storage Account** in Azure:
   - Go to the Azure Portal.
   - Click on "Create a resource" > "Storage" > "Storage account".
   - Fill in the required details and create the account.

2. **Create Two Containers**:
   - Go to your storage account.
   - Click on "Containers" under the Data storage section.
   - Create a container named `raw-images` (for original images).
   - Create another container named `processed-images` (for processed images).

### Step 2: Deploy a Linux VM (or ACI)

1. **Create a Linux VM**:
   - In the Azure Portal, click on "Create a resource" > "Compute" > "Virtual machine".
   - Select your preferred Linux distribution and configure the VM settings.

2. **Install Required Packages**:
   - SSH into your Linux VM.
   - Run the following command to install ImageMagick:

   ```bash
   sudo apt update && sudo apt install imagemagick -y
3. **Install Flask**:

Run the following command to install Flask:
   -pip install Flask

### Step 3: Create a image processing script
>>>>>>> 04c15d91daee5b00ccab6590788a774e5607fa3d
