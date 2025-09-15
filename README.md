# Terraform AWS Practice 🚀

This repository provides a structured set of **hands-on Terraform tasks** for practicing **Infrastructure as Code (IaC)** on **AWS**.
It starts from the basics of launching an EC2 instance and gradually advances to topics like modularization, remote state management, multi-environment deployments, and CI/CD automation with GitHub Actions.

The goal is to help learners and professionals **build real-world Terraform skills step by step**.

---

## 📂 Repository Overview

* **Task-1-EC2-NGINX** → Provision an EC2 instance and install Nginx
* **Task-2-EC2-Math-API** → Deploy a Dockerized API on EC2 using Terraform
* **Task-3-Terraform-Modules** → Organize code using reusable modules
* **Task4-Remote-State** → Store state in S3 with DynamoDB locking
* **Task5-MultiEnv** → Manage dev/staging/prod with workspaces
* **Task6-CICD-Terraform** → Automate Terraform with GitHub Actions

📘 A detailed guide with **step-by-step instructions and screenshots** is available here:
➡️ [Terraform AWS GitHub Actions Guide (PDF)](./Terraform-AWS-GitHub-Actions-Guide-Insia-Farhan.pdf)

---

## 🛠️ Prerequisites

Before starting, ensure you have:

* [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) configured with IAM credentials
* An AWS account with sufficient permissions
* (Optional) Docker, for containerized workloads in Task 2

---

## 🚀 Quick Start

1. Clone the repository:

   ```bash
   git clone https://github.com/thedevopsforge/terraform-practice.git
   cd terraform-practice
   ```

2. Go to any task folder, for example:

   ```bash
   cd Task-1-EC2-NGINX
   ```

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Review and apply the configuration:

   ```bash
   terraform plan
   terraform apply
   ```

5. Follow additional steps from the [PDF Guide](./Terraform-AWS-GitHub-Actions-Guide-Insia-Farhan.pdf).

