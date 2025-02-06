# 🌟 Serverless Image Processing 🌟

![Azure Logic Apps](https://docs.microsoft.com/en-us/azure/logic-apps/media/logic-apps-overview-architecture.png)  
*Azure Logic Apps Architecture*

## Overview
This project implements a serverless image processing solution using **Azure Logic Apps**, **Azure Blob Storage**, and a custom **Linux shell script**. The system automates the workflow of resizing and watermarking images upon upload.

## Technologies Used
- **Azure Blob Storage** ![Azure Blob Storage](https://azurecomcdn.azureedge.net/mediahandler/files/resourcefiles/storage/hero/1-storage-hero.svg) : For storing raw and processed images.
- **Azure Logic Apps** ![Azure Logic Apps](https://azurecomcdn.azureedge.net/mediahandler/files/resourcefiles/logicapps/hero/1-logic-apps-hero.svg) : To automate the image processing workflow.
- **Flask** ![Flask](https://flask.palletsprojects.com/en/2.0.x/_images/flask-logo.png) : For creating an API that triggers the image processing script.
- **ImageMagick** ![ImageMagick](https://imagemagick.org/script/images/imagemagick-logo.png) : A command-line tool for image processing tasks.
- **Linux Shell Scripting** : For writing the image processing logic.

## Features
- 🌐 **Automatic Image Processing** on upload.
- 📏 **Resize Images** to specified dimensions.
- 🌊 **Add Watermarks** to processed images.
- 🔗 **Easy Integration** with Azure services.

## Project Structure


## Getting Started

### Prerequisites
- Azure account with access to Blob Storage and Logic Apps.
- A Linux Virtual Machine (VM) with the necessary tools installed (Flask, ImageMagick, etc.).

### Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/search4akash/serverless-image-processing.git
   cd serverless-image-processing
