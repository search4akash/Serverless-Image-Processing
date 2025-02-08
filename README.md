# 🌟 Serverless Image Processing with Azure Logic Apps & Shell Scripting

<div align="center">
    <h2>🔹 Project Overview</h2>
</div>

This project automates image processing using Azure Logic Apps and Linux shell scripting. The workflow includes:

✅ Uploading images to **Azure Blob Storage**.

✅ A **Logic App** triggers a shell script when a new image is uploaded.

✅ A **Linux-based script** processes the images (resize, watermark, etc.).

✅ The processed images are stored in another Blob container.

---

<div align="center">
    <h2>📚 Table of Contents</h2>
</div>

- [Step 1: Set Up Azure Blob Storage](#step-1-set-up-azure-blob-storage)
- [Step 2: Deploy a Linux VM (or Use ACI)](#step-2-deploy-a-linux-vm-or-use-aci)
- [Step 3: Write the Image Processing Shell Script](#step-3-write-the-image-processing-shell-script)
- [Step 4: Set Up Azure Logic Apps](#step-4-set-up-azure-logic-apps)
- [Step 5: Set Up an API to Run the Script](#step-5-set-up-an-api-to-run-the-script)
- [Step 6: Test the System](#step-6-test-the-system)
- [📊 Summary](#summary)
- [🎯 Learning Outcomes](#learning-outcomes)
- [📚 Official Documentation](#official-documentation)
- [📞 Contact](#contact)

---

<div align="center">
    <h2>Step 1: Set Up Azure Blob Storage</h2>
</div>

- **Storage Setup Script**: [Infrastructure/storage_setup.sh](Infrastructure/storage_setup.sh)
  - This script creates an **Azure Storage Account** with two containers:
    - **raw-images** → Stores the original images.
    - **processed-images** → Stores the processed images.

---

<div align="center">
    <h2>Step 2: Deploy a Linux VM (or Use ACI)</h2>
</div>

- **VM Setup Script**: [Infrastructure/vm_setup.sh](Infrastructure/vm_setup.sh)
  - This script creates an **Azure Linux VM** or sets up **Azure Container Instances (ACI)** for running the image processing script.

---

<div align="center">
    <h2>Step 3: Write the Image Processing Shell Script</h2>
</div>

- **Image Processing Script**: [Scripts/process_images.sh](Scripts/process_images.sh)
  - This script fetches images from **Blob Storage**, processes them, and uploads the processed images back to **Blob Storage**.

---

<div align="center">
    <h2>Step 4: Set Up Azure Logic Apps</h2>
</div>

1. **Create a Logic App**:
   - Go to the **Azure portal** and create a new Logic App.

2. **Add Trigger: When a Blob is Added or Modified**:
   - Choose the trigger **"When a blob is added or modified (V2)"**.
   - Configure it to point to your **raw-images** container in your Azure Blob Storage.
   - This trigger will activate the Logic App whenever a new image is uploaded or an existing image is updated.

3. **Add Action: HTTP Request**:
   - After the blob trigger, add a new action for the HTTP request.
   - Choose the action **"HTTP"**.
   - Set the method to **POST** and provide the URL for your Flask API endpoint (e.g., `http://<your-vm-ip>:8080/run-script`).
   - In the body, you can include any relevant data if necessary (e.g., the name of the blob or any other parameters).

4. **Add Trigger: When an HTTP Request is Received**:
   - If you want to manually trigger the processing, add a second trigger by choosing **"When an HTTP request is received"**.
   - This will allow you to invoke the Logic App via an HTTP request whenever you need to process the images.

5. **Configure the Logic App**:
   - Once you have set up both triggers, you can define the workflow further by connecting additional actions as needed, such as logging or sending notifications.

---

<div align="center">
    <h2>Step 5: Set Up an API to Run the Script</h2>
</div>

- **API Script**: [APIs/app.py](APIs/app.py)
  - This Flask API allows the Logic App to trigger the image processing script.

---

<div align="center">
    <h2>Step 6: Test the System</h2>
</div>

1. **Upload an Image** to `raw-images`:
    ```bash
    az storage blob upload --container-name raw-images --account-name myazurestorage --file sample.jpg
    ```

2. **Trigger the Logic App**:
   - This is automatically triggered by the blob upload.

3. **Test the Flask API Manually** (if needed):
    ```bash
    curl -X POST http://<your-vm-ip>:8080/run-script
    ```

4. **Execute the Image Processing Script Manually** (for testing):
    ```bash
    cd Scripts
    ./process_images.sh
    ```

5. **Check the `processed-images` Container** to see if the processed image appears.

---

<div align="center">
    <h2>📊 Summary</h2>
</div>

| Step | Task | Files |
| --- | --- | --- |
| 1️⃣ | Set up Azure Blob Storage | [storage_setup.sh](Infrastructure/storage_setup.sh) |
| 2️⃣ | Deploy Linux VM / ACI | [vm_setup.sh](Infrastructure/vm_setup.sh) |
| 3️⃣ | Write Shell Script | [process_images.sh](Scripts/process_images.sh) |
| 4️⃣ | Set Up Logic App | Azure Portal |
| 5️⃣ | Create API to Trigger Script | [app.py](APIs/app.py) |
| 6️⃣ | Test the Workflow | Azure CLI |

---

<div align="center">
    <h2>🎯 Learning Outcomes</h2>
</div>

✅ Hands-on **Azure Logic Apps** for automation.

✅ Advanced **Bash scripting** for **image processing**.

✅ Real-world **Azure Blob Storage Management**.

✅ Deployment of **serverless solutions** using **ACI or VM**.

✅ Secure **VM automation with Flask APIs & HTTP triggers**.

---

<div align="center">
    <h2>📚 Official Documentation</h2>
</div>

- [Azure Logic Apps Documentation](https://docs.microsoft.com/en-us/azure/logic-apps/) 📄
- [Azure Blob Storage Documentation](https://docs.microsoft.com/en-us/azure/storage/blobs/) 📄
- [Flask Documentation](https://flask.palletsprojects.com/) 📄
- [Bash Scripting Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/) 📄

---

<div align="center">
    <h2>📞 Contact</h2>
</div>

For any help or inquiries regarding this project, feel free to reach out to me at **your_email@example.com**!

---
