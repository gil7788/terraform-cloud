 # Terraform Cloud Setup
 
 Welcome to the Terraform Cloud (TFC) workspace setup guide! This repository contains a Terraform configuration designed to help you set you work with Terraform Cloud (TFC), particularly for Google Cloud Platform (GCP) resources, wih a corresponding github repository.
 ## Prerequisites

 Before you begin, make sure you have the following:

 - A Google Cloud Platform (GCP) account.
 - A Terraform Cloud (TFC) account.
 - Basic knowledge of Terraform syntax and concepts.
 - `jq` installed on your machine (for processing JSON files).

 ## Setup

 ### Step 1: Link Terraform Cloud with GitHub Repository

 To get started, you'll need to connect your Terraform Cloud workspace to this GitHub repository:

 1. Log in to your Terraform Cloud account.
 2. Create a new workspace or use an existing one.
 3. Under "Version Control Workflow" choose GitHub and follow the prompts to connect your GitHub account.
 4. Select this repository from the list of repositories.
 5. Configure Workspace:
    a. Click "Advanced Options" and set Terraform Working Directory to "terraform".

 ### Step 2: Generate GCP Key for Terraform

 Before creating a service account, you should ensure you have a Google Cloud project set up or create a new one if needed.

[Add instruction for project selection or new project creation before Create service account]
 1. **Select or Create a Google Cloud Project:**
      - Log in to the [Google Cloud Console](https://console.cloud.google.com/).
      - On the top navigation bar, you'll see a dropdown where you can  select an existing project or create a new one.
      - If you need to create a new project, click on the "New Project" button  and follow the prompts to set up a new project. Be sure to note the project ID as you'll need it for your Terraform configurations.

 2. **Create a Service Account:**
    - Go to the [Google Cloud Console](https://console.cloud.google.com/).
    - Navigate to "IAM & Admin" > "Service Accounts".
    - Click "Create Service Account" and follow the instructions.
   **Set Service Account Details**
    - Set Service Account Name
    - Set Service Account Id
   **Grant Service Account Access to Project:**
    - From "select a role" dropdown, select "project", then "editor" or "owner".
    - To allow key enable/disable Google API 
      - Click "Add Another Role
      - From "select a role" dropdown, select "Services Usage", then "Services Usage Admin".
    - Click Done

 3. **Create and Download the JSON GCP Credential Key:**
   Once the service account is created, create a key in JSON format.
    - Click on the created service account, go to the "Keys" section, and click "Add Key" > "Create new key".
    - Choose JSON and click "Create". The key file will be downloaded to your machine.

 ### Step 3: Set GCP Credential Key Environment Variable on TFC

 1. **Prepare the JSON Key:**
    - Use `jq` to compress the JSON key into a single line. In your terminal, run:
      ```bash
      jq -c . < path/to/your-key.json > path/to/compressed-key.json
      ```
    - Open the `compressed-key.json` file and copy its content.

 2. **Configure the Environment Variable in Terraform Cloud:**
    - In your Terraform Cloud workspace, go to "Variables".
    - Under "Variables," click "Add variable".
    - Ensure you mark "Environment variable".
    - Name the variable `GOOGLE_CREDENTIALS`.
    - Paste the contents of the `compressed-key.json` file into the "Value" field.
    - Ensure you mark the variable as "Sensitive" to keep the credentials secure.
    - Click "Save variable".

 ### Step 4: Enable Version Control (VCS)
 1. **Set VCS setting**
      - In your Terraform Cloud workspace, go to "Settings" > "Version Control"
      - Under VCS Triggers, ensure you mark "Always trigger runs".
      - Set VCS branch to "prod", make sure that branch exists before.
      - Ensure you mark "Automatic speculative plans"
      - Click "Update VCS settings".


## Workflow
**Step 1: Develop and Commit Configuration**
- Write your Terraform configuration files (.tf) in the `terraform` directory of your local clone of the GitHub repository.
- Define your GCP infrastructure using Terraform's syntax.

**Step 2: Collaboration via Pull Requests**
 - Merging a pull request into `prod` branch triggers Terraform Cloud to `plan` and `apply` the infrastructure.

**Step 3: Infrastructure Monitoring and Management**
   - Monitor infrastructure states and Terraform runs via the Terraform Cloud dashboard.
   - Manage state files, and troubleshoot as needed.
## References
- Originally crafted for AWS, this guide has been adapted for GCP usage [Link](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up).
