# Terraform AWS EC2 Module Wrapper

This repository provides a production-ready wrapper for the AWS EC2 Terraform module. It allows for dynamic provisioning of multiple EC2 instances across different environments with standardized naming and tagging.

---

## 🚀 Features

* **Dynamic Instance Creation**: Provision one or many instances using `instance_names`.
* **Environment-Based Logic**: Automatically adjusts instance types and tags based on the `environment` (dev, staging, prod).
* **Flexible Naming**: Standardized naming convention: `${env}-${name}`.
* **Optional Toggle**: Enable or disable instance creation using `create_instances`.
* **Dynamic Tagging**: Combines global tags with environment-specific and resource-specific tags.

---

## 📦 Usage

```hcl
module "ec2_wrapper" {
  source = "./"

  environment    = "dev"
  subnet_id      = "subnet-xxxxxxxx"
  sg_id          = "sg-xxxxxxxx"
  instance_names = ["web-server", "app-server"]
  
  tags = {
    Owner = "platform-team"
  }
}
```

---

## 📥 Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name (dev, staging, prod) | `string` | n/a | ✅ |
| subnet_id | The VPC Subnet ID to launch in | `string` | n/a | ✅ |
| sg_id | Security group ID for the instances | `string` | n/a | ✅ |
| instance_names | List of names for the instances to create | `list(string)` | `["web-1"]` | ❌ |
| ami | The AMI to use for the instances. If not provided, a default will be used. | `string` | `null` | ❌ |
| create_instances | Whether to create the instances | `bool` | `true` | ❌ |
| tags | Additional tags for all resources | `map(string)` | `{}` | ❌ |

---

## 📤 Outputs

| Name | Description |
|------|-------------|
| instance_ids | List of IDs of the created EC2 instances |
| public_ips | List of public IP addresses assigned to the instances |

---

## 📂 Module Structure

The core logic resides in the `modules/ec2` directory, which is designed to be a standalone, registry-compatible module.

---

## 📜 License

MIT License
