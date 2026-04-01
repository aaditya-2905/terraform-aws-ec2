module "ec2" {
  source = "./modules/ec2"

  for_each = var.create_instances ? toset(var.instance_names) : []

  name                        = "${var.environment}-${each.value}"
  ami                         = local.ami
  instance_type               = local.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true

  tags = local.common_tags
}
