# Serverless Image Processing with Azure Logic Apps & Shell Scripting

## 📂 Table of Contents
- [Project Overview](#project-overview)
- [Setup Instructions](#setup-instructions)
  - [Step 1: Set Up Azure Blob Storage](#step-1-set-up-azure-blob-storage)
  - [Step 2: Deploy a Linux VM](#step-2-deploy-a-linux-vm)
  - [Step 3: Write the Image Processing Shell Script](#step-3-write-the-image-processing-shell-script)
  - [Step 4: Set Up Azure Logic Apps](#step-4-set-up-azure-logic-apps)
  - [Step 5: Set Up an API to Run the Script](#step-5-set-up-an-api-to-run-the-script)
  - [Step 6: Test the System](#step-6-test-the-system)
  - [Step 7: Automate with a Cron Job](#step-7-automate-with-a-cron-job)
- [File Structure](#file-structure)
- [License](#license)

---

## 🔹 Project Overview

This project automates image processing using Azure Logic Apps and Linux shell scripting. The workflow includes:

✅ Uploading images to **Azure Blob Storage**.

✅ A **Logic App** triggers a shell script when a new image is uploaded.

✅ A **Linux-based script** processes the images (resize, watermark, etc.).

✅ The processed images are stored in another Blob container.

---

## 🔹 Setup Instructions

### Step 1: Set Up Azure Blob Storage

1. Create an **Azure Storage Account** with two containers:
   - **raw-images** → Stores the original images.
   - **processed-images** → Stores the processed images.

### Step 2: Deploy a Linux VM

1. Deploy a Linux VM using your preferred method.
2. Ensure that you have the necessary packages installed (ImageMagick).

### Step 3: Write the Image Processing Shell Script

- You can find the script in the `scripts` folder:
  - [`process_images.sh`](./scripts/process_images.sh)

### Step 4: Set Up Azure Logic Apps

- Create a Logic App that triggers the processing when a new image is uploaded to the `raw-images` container.

### Step 5: Set Up an API to Run the Script

- The API is implemented in:
  - [`app.py`](./api/app.py)

### Step 6: Test the System

1. Upload an image to the `raw-images` container.
2. The Logic App will trigger the HTTP request to the API, executing the script.

### Step 7: Automate with a Cron Job

- Schedule the script to run periodically using a cron job.

---

## 🔹 File Structure

```plaintext
📂 serverless-image-processing  
│── 📂 scripts  
│   ├── process_images.sh       # Shell script for image processing  
│── 📂 api  
│   ├── app.py                  # Flask API to trigger processing  
│── 📂 infrastructure  
│   ├── storage_setup.sh        # Script to create Azure Blob Storage  
│   ├── vm_setup.sh             # Script to create Azure VM  
│── 📂 docs  
│   ├── README.md               # Project documentation  
│   ├── architecture.png        # Architecture diagram (optional)  
│── 📂 samples  
│   ├── sample.jpg              # Sample image for testing  
│── .gitignore                  # Ignore unnecessary files  
│── requirements.txt            # Dependencies for the API  
│── LICENSE                     # License file (optional)  
