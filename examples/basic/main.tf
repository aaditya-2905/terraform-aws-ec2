provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "../../"

  environment    = "dev"
  subnet_id      = "subnet-xxxxxxxx"
  sg_id          = "sg-xxxxxxxx"
  instance_names = ["app-1", "app-2"]
}
