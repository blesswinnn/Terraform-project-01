

# 🌐 Terraform Project 01 – AWS Infrastructure Automation

Welcome to **Terraform Project 01**, where we harness the power of Terraform to automate the provisioning of AWS infrastructure. This project is a comprehensive exercise in Infrastructure as Code (IaC), focusing on deploying a Virtual Private Cloud (VPC), subnets, security groups, and EC2 instances using Terraform.

---

## 🏗️ Project Architecture

![image](https://github.com/user-attachments/assets/fa46ce9b-62a5-41f0-bb11-0da1bd617642)

---

## 📚 Topics Covered

This project encompasses a wide range of AWS and Terraform concepts:

- **AWS IAM Setup**: Configuring Identity and Access Management for secure access.
- **Local Environment Setup**: Preparing the local machine for Terraform development.
- **AWS Provider Configuration**: Setting up the AWS provider in Terraform.
- **VPC Creation**: Defining a Virtual Private Cloud to host resources.
- **Terraform State Management**: Understanding and managing Terraform state files.
- **Subnet Configuration**: Creating and managing subnets within the VPC.
- **Internet Gateway (IGW)**: Establishing internet connectivity for the VPC.
- **Route Tables and Associations**: Managing network routing within the VPC.
- **Security Groups**: Defining firewall rules for EC2 instances.
- **AMI Data Source**: Utilizing Amazon Machine Images for EC2 instances.
- **Key Pair Management**: Creating key pairs for SSH access.
- **EC2 Instance Deployment**: Launching virtual servers in AWS.
- **User Data Scripts**: Automating instance initialization tasks.
- **SSH Configuration**: Setting up secure shell access to instances.
- **Provisioners**: Executing scripts on instances during provisioning.

---

## 🧰 Project Structure
Terraform-project-01/
├── .gitignore
├── .terraform.lock.hcl
├── README.md
├── datasources.tf
├── dev.tfvars
├── main.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
├── userdata.tpl
├── variables.tf
└── windows-ssh-config.tpl

- **main.tf**: Contains the primary Terraform configuration for AWS resources.
- **provider.tf**: Specifies the AWS provider and region.
- **variables.tf**: Declares input variables for the configuration.
- **dev.tfvars**: Provides variable values for the development environment.
- **datasources.tf**: Defines data sources like AMIs.
- **userdata.tpl**: Template for user data scripts to initialize EC2 instances.
- **windows-ssh-config.tpl**: Template for SSH configuration on Windows.

---

## 🚀 Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with appropriate permissions.
- AWS CLI configured with your credentials.

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/blesswinnn/Terraform-project-01.git
   cd Terraform-project-01
   ```
# 📖 Learnings and Insights
- Through this project, I have:
- Gained hands-on experience with Terraform and AWS services.
- Understood the importance of state management in Terraform.
- Learned to modularize Terraform configurations for better maintainability.
- Explored the use of data sources and provisioners in Terraform.

# 📎 Resources
- Terraform Documentation
- AWS Provider for Terraform
- Terraform Best Practices

# 👤 Author
  Blesswin

   Aspiring Cloud Engineer | DevOps Enthusiast | Lifelong Learner

# 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.







