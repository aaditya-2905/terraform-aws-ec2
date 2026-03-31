locals {
  instance_type = var.environment == "prod" ? "t3.medium" : "t2.micro"

  ami = "ami-0ec10929233384c7f" # you can change accordingly later

  common_tags = {
    Environment = var.environment
    Project     = "ec2-wrapper"
  }
}
