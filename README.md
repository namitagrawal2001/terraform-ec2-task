# AWS EC2 using Manual Setup and Terraform

## Objective
This task focuses on understanding AWS core concepts and Terraform by launching an EC2 instance manually through the AWS Console and provisioning an EC2 instance using Terraform (Infrastructure as Code).

> Note: This repository was updated and verified as part of the current task submission.  
> The EC2 instance is currently running and was checked during submission.

---

## AWS Core Concepts
- AWS EC2: A virtual server used to run applications in the cloud
- Region: ap-south-1 (Mumbai)
- Availability Zone: ap-south-1b
- Instance Type: t2.micro
- AMI: Ubuntu Linux
- Security Group: Allows SSH access (port 22)
- Key Pair: Used for secure SSH login

---

## EC2 Instance – Manual Setup (AWS Console)

### Steps Followed
1. Logged in to AWS Management Console
2. Navigated to EC2 service
3. Clicked on **Launch Instance**
4. Selected Ubuntu AMI
5. Chose instance type `t2.micro`
6. Created/selected an existing key pair
7. Configured security group to allow SSH (port 22)
8. Launched the instance

### Instance Details
- **Instance Name:** terraform-ec2-task
- **Instance State:** Running
- **Public IP:** Assigned
- **Platform:** Linux/UNIX

### Screenshots
![EC2 Instance Details](screenshots/ec2-running.png)
![EC2 Instance List](screenshots/ec2-list.png)

---

## EC2 Instance – Provisioned Using Terraform

Terraform was used to automate the creation of an EC2 instance using Infrastructure as Code.

### Terraform Configuration Files
- `provider.tf` – AWS provider configuration
- `ec2.tf` – EC2 instance resource definition
- `variables.tf` – Input variables
- `outputs.tf` – Output values

### Commands Used
```bash
terraform init
terraform plan
terraform apply
Terraform successfully provisioned the EC2 instance with the tag name terraform-ec2-task.

Conclusion
Through this task, I gained hands-on experience with AWS EC2 core concepts and learned how to provision infrastructure manually as well as automate it using Terraform.


---

## 📌 Ab bas ye karo (2 min ka kaam)

```bash
git add README.md screenshots/
git commit -m "Updated README with EC2 manual and Terraform task documentation"
git push origin main
📤 Submission message (copy–paste)
Task Completed ✅  
GitHub Repo: https://github.com/namitagrawal2001/Terraform-in-one-shot
