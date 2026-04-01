locals {
  # Default AMI if not provided (Amazon Linux 2023 in Mumbai as an example)
  default_ami = "ami-0ec10929233384c7f"
  ami         = coalesce(var.ami, local.default_ami)

  common_tags = merge(
    {
      Environment = var.environment
      Project     = "ec2-wrapper"
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}
