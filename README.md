# Terraform AWS EC2 Module

This module provisions an AWS EC2 instance with configurable networking, security groups, and tagging. It is designed to be reusable and easily integrated with VPC and security group modules.

---

## 🚀 Features

* Launch EC2 instances with customizable AMI and instance type
* Attach to specific subnet and security groups
* Optional key pair support for SSH access
* Supports public or private instance deployment
* Environment-based tagging

---

## 📦 Usage

```hcl
provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "aaditya-2905/ec2/aws"

  ami                         = "ami-xxxxxxxx"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-xxxxxxxx"
  vpc_security_group_ids      = ["sg-xxxxxxxx"]
  key_name                    = "my-key"
  associate_public_ip_address = true

  tags = {
    Environment = "dev"
  }
}
```

---

## 📥 Inputs

| Name                        | Description                | Type         | Required |
| --------------------------- | -------------------------- | ------------ | -------- |
| ami                         | AMI ID for the instance    | string       | ✅        |
| instance_type               | EC2 instance type          | string       | ✅        |
| subnet_id                   | Subnet ID                  | string       | ✅        |
| vpc_security_group_ids      | List of security group IDs | list(string) | ✅        |
| key_name                    | Key pair name              | string       | ❌        |
| associate_public_ip_address | Assign public IP           | bool         | ❌        |
| tags                        | Tags to apply to resources | map(string)  | ❌        |

---

## 📤 Outputs

| Name        | Description            |
| ----------- | ---------------------- |
| instance_id | ID of the EC2 instance |
| public_ip   | Public IP of instance  |
| private_ip  | Private IP of instance |

---

## 🧠 Notes

* Ensure the subnet and security group belong to the same VPC
* Public IP will only be assigned if subnet supports it
* Use private subnets for secure workloads

---

## 🔗 Example

See the `examples/basic` directory for a working example.

---

## 📜 License

MIT License
